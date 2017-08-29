package com.meidian.auth.interceptor;

import com.meidian.auth.common.PageCondition;

/**
 * Title: com.meidian.auth.interceptor<br>
 * Description: <br>
 * Copyright: Copyright (c) 2015<br>
 * Company: 北京云杉世界信息技术有限公司<br>
 *
 * @author 张中凯
 *         2017/8/27
 */
public interface Dialect {
    String SQL_END_DELIMITER = ";";
    String DISTINCT = "DISTINCT";


    String getPagedSQL(String originalSQL, PageCondition condition);

    String getCountSQL(String originalSQL);
}
