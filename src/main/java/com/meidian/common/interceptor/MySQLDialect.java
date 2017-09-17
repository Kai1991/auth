package com.meidian.common.interceptor;

import com.meidian.common.result.PageCondition;

import java.util.regex.Pattern;

/**
 * Title: com.meidian.auth.interceptor<br>
 * Description: <br>
 * Copyright: Copyright (c) 2015<br>
 * Company: 北京云杉世界信息技术有限公司<br>
 *
 * @author 张中凯
 *         2017/8/27
 */
public class MySQLDialect implements Dialect {
    private static final Pattern isSelect = Pattern.compile("^SELECT\\s+", Pattern.CASE_INSENSITIVE);
    private static final Pattern isDistinct = Pattern.compile("^SELECT\\s+DISTINCT", Pattern.CASE_INSENSITIVE);

    @Override
    public String getPagedSQL(String originalSQL, PageCondition condition) {
        originalSQL = originalSQL.trim();
        if (originalSQL.endsWith(SQL_END_DELIMITER)) {
            originalSQL = originalSQL.substring(0, originalSQL.length() - 1);
        }
        int start = condition.getPageSize() * (condition.getPageNumber() - 1);
        originalSQL += String.format(" LIMIT %d, %d", start, condition.getPageSize());
        return originalSQL;
    }

    @Override
    public String getCountSQL(String originalSQL) {
        if (!isSelect.matcher(originalSQL).find()) {
            throw new RuntimeException("not select stmt, should not be paginated ~");
        }

        StringBuilder sbSql = new StringBuilder(originalSQL.length() + 20);
        sbSql.append("SELECT ");
        if(isDistinct.matcher(originalSQL).find()) {
            sbSql.append("DISTINCT ");
        }
        sbSql.append("count(*) FROM (");
        sbSql.append(originalSQL);
        sbSql.append(") a");
        return sbSql.toString();
    }
}
