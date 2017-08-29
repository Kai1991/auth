package com.meidian.auth.manager;

import com.meidian.auth.entity.Access;
import com.meidian.auth.common.PageCondition;

import java.util.List;

/**
 * Title: com.meidian.auth.manager<br>
 * Description: <br>
 * Copyright: Copyright (c) 2015<br>
 * Company: 北京云杉世界信息技术有限公司<br>
 *
 * @author 张中凯
 *         2017/8/3
 */
public interface AccessManager {

    public List<Access> getAccessList(PageCondition pageCondition, Access access);
}
