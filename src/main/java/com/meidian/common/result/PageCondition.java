package com.meidian.common.result;

/**
 * Title: com.meidian.auth.interceptor<br>
 * Description: <br>
 * Copyright: Copyright (c) 2015<br>
 * Company: 北京云杉世界信息技术有限公司<br>
 *
 * @author 张中凯
 *         2017/8/27
 */
public class PageCondition {
    private final int pageSize;
    private final int pageNumber;
    private int totalCount;
    private boolean disablePagePlugin;

    public PageCondition(int pageSize, int pageNumber) {
        this.pageSize = pageSize;
        this.pageNumber = pageNumber;
    }

    public int getPageSize() {
        return this.pageSize;
    }

    public int getPageNumber() {
        return this.pageNumber;
    }

    public int getTotalCount() {
        return this.totalCount;
    }

    public void setTotalCount(int totalCount) {
        this.totalCount = totalCount;
    }

    public boolean isDisablePagePlugin() {
        return this.disablePagePlugin;
    }

    public void setDisablePagePlugin(boolean disablePagePlugin) {
        this.disablePagePlugin = disablePagePlugin;
    }
}
