package com.meidian.auth.interceptor;

import com.meidian.auth.common.PageCondition;
import org.apache.ibatis.executor.parameter.ParameterHandler;
import org.apache.ibatis.executor.statement.StatementHandler;
import org.apache.ibatis.mapping.BoundSql;
import org.apache.ibatis.mapping.MappedStatement;
import org.apache.ibatis.mapping.ParameterMapping;
import org.apache.ibatis.plugin.*;
import org.apache.ibatis.reflection.MetaObject;
import org.apache.ibatis.reflection.SystemMetaObject;
import org.apache.ibatis.reflection.property.PropertyTokenizer;
import org.apache.ibatis.scripting.defaults.DefaultParameterHandler;
import org.apache.ibatis.scripting.xmltags.ForEachSqlNode;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;


import java.lang.reflect.Constructor;
import java.lang.reflect.InvocationTargetException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;
import java.util.Map;
import java.util.Properties;

/**
 * Title: com.meidian.auth.interceptor<br>
 * Description: <br>
 * Copyright: Copyright (c) 2015<br>
 * Company: 北京云杉世界信息技术有限公司<br>
 *
 * @author 张中凯
 *         2017/8/27
 */
@Intercepts({ @Signature(type = StatementHandler.class, method = "prepare", args = { Connection.class,Integer.class }) })
public class PageInterceptor implements Interceptor {
    private static final Logger LOGGER = LoggerFactory.getLogger(PageInterceptor.class);

    private static final String BOUND_SQL_KEY = "delegate.boundSql.sql";
    private static final String MAPPED_STATEMENT_KEY = "delegate.mappedStatement";
    private final Properties properties = new Properties();

    public Object intercept(Invocation invocation) throws Throwable {
        LOGGER.debug("PageInterceptor intercept");
        StatementHandler statementHandler = (StatementHandler) invocation.getTarget();
        PageCondition condition = null;
        Object object = statementHandler.getBoundSql().getParameterObject();

        if (object instanceof Map) {
            Map<?, ?> parameterObject = (Map<?, ?>) object;

            for (Object obj : parameterObject.values()) {
                if (obj instanceof PageCondition) {
                    condition = (PageCondition) obj;
                    break;
                }
            }
        } else {
            if (object instanceof PageCondition) {
                condition = (PageCondition) object;
            }
        }

        // 没有page参数， 此拦截器不做处理，交给上游继续执行
        if (condition == null || condition.isDisablePagePlugin()) {
            LOGGER.debug("PageCondition parameter is null, exit");
            return invocation.proceed();
        }

        String originalSql = statementHandler.getBoundSql().getSql();
        Dialect dbDialect = getDialect();
        LOGGER.debug("origin sql: " + originalSql);
        String dbPagedSql = dbDialect.getPagedSQL(originalSql, condition);
        LOGGER.debug("paged sql: " + dbPagedSql);
        MetaObject metaObject = SystemMetaObject.forObject(statementHandler);
        //reset sql with page condition
        metaObject.setValue(BOUND_SQL_KEY, dbPagedSql);
        //set totalCount
        setTotalCount(invocation, statementHandler, metaObject, dbDialect, condition, originalSql);
        return invocation.proceed();
    }

    private void setTotalCount(Invocation invocation, StatementHandler statementHandler,
                               MetaObject metaStatementHandler, Dialect dbDialect, PageCondition condition, String originalSql)
            throws SQLException {
        String countSql = dbDialect.getCountSQL(originalSql);
        LOGGER.debug("count sql " + countSql);
        Connection connection = (Connection) invocation.getArgs()[0];
        BoundSql boundSql = statementHandler.getBoundSql();
        // 记录总记录数
        PreparedStatement countStmt = null;
        ResultSet rs = null;
        try {
            countStmt = connection.prepareStatement(countSql);

            List<ParameterMapping> parameterMappings = boundSql.getParameterMappings();

            MappedStatement mappedStatement = (MappedStatement) metaStatementHandler.getValue(MAPPED_STATEMENT_KEY);
            BoundSql countBS = new BoundSql(mappedStatement.getConfiguration(), countSql, parameterMappings, boundSql.getParameterObject());

            if (parameterMappings != null && parameterMappings.size() > 0) {
                for (ParameterMapping parameterMapping : parameterMappings) {
                    Object propertyValue;
                    String propertyName = parameterMapping.getProperty();
                    PropertyTokenizer prop = new PropertyTokenizer(propertyName);
                    if (boundSql.hasAdditionalParameter(propertyName)) {
                        propertyValue = boundSql.getAdditionalParameter(propertyName);
                        countBS.setAdditionalParameter(propertyName, propertyValue);
                    } else if (propertyName.startsWith(ForEachSqlNode.ITEM_PREFIX)
                            && boundSql.hasAdditionalParameter(prop.getName())) {
                        propertyValue = boundSql.getAdditionalParameter(prop.getName());
                        countBS.setAdditionalParameter(propertyName, propertyValue);
                    }
                }
            }
            ParameterHandler parameterHandler = new DefaultParameterHandler(mappedStatement, boundSql.getParameterObject(), boundSql);
            parameterHandler.setParameters(countStmt);
            rs = countStmt.executeQuery();
            int totalCount = 0;
            if (rs.next()) {
                totalCount = rs.getInt(1);
            }
            condition.setTotalCount(totalCount);
        } finally {
            if (rs != null) {
                rs.close();
                rs = null;
            }
            if (countStmt != null) {
                countStmt.close();
                countStmt = null;
            }
        }
    }

    private Dialect getDialect() throws ClassNotFoundException, IllegalAccessException, InvocationTargetException, InstantiationException {
        String dialectType = properties.getProperty("dialectType");
        if (dialectType == null) {
            throw new RuntimeException("can not find \"pageMybatis.dialectType\" in mybatis config file");
        }

        Class<?> dialectClass = Class.forName(dialectType);
        Constructor<?>[] ctors = dialectClass.getDeclaredConstructors();
        Constructor<?> ctor = null;
        for (int i = 0; i < ctors.length; i++) {
            ctor = ctors[i];
            if (ctor.getGenericParameterTypes().length == 0)
                break;
        }

        if (ctor == null) {
            throw new RuntimeException(dialectType + " has no default ctor");
        }

        ctor.setAccessible(true);
        return (Dialect) ctor.newInstance();
    }

    public Object plugin(Object target) {
        return Plugin.wrap(target, this);
    }

    public void setProperties(Properties propertiesArg) {
        if (propertiesArg != null) {
            for (Object key : propertiesArg.keySet()) {
                String strKey = (String) key;
                properties.put(strKey, propertiesArg.get(key));
            }
        }
    }
}
