package com.meidian.common.result;

import java.io.Serializable;
import java.util.List;

/**
 * Title: com.meidian.auth.common<br>
 * Description: <br>
 * Copyright: Copyright (c) 2015<br>
 * Company: 北京云杉世界信息技术有限公司<br>
 *
 * @author 张中凯
 *         2017/8/29
 */
public class Page<T> implements Serializable {
    private final int pageSize;
    private final int pageNumber;
    private int totalCount;
    private List<T> items;

    public Page(int pageSizeArg, int pageNumberArg) {
        this.pageSize = pageSizeArg;
        this.pageNumber = pageNumberArg;
    }

    public List<T> getItems() {
        return this.items;
    }

    public void setItems(List<T> items) {
        this.items = items;
    }

    public void setTotalCount(int totalCount) {
        this.totalCount = totalCount;
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
}
