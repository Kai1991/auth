package com.meidian.auth.service;

import com.meidian.auth.common.ServiceResult;
import com.meidian.auth.entity.Access;
import com.meidian.auth.common.PageCondition;

/**
 * Title: 权限服务<br>
 * Description: <br>
 * Copyright: Copyright (c) 2015<br>
 * Company: 北京云杉世界信息技术有限公司<br>
 *
 * @author 张中凯
 *         2017/8/5
 */
public interface AccessService {

    public ServiceResult<Access> getAccessList(PageCondition pageCondition, Access access);
}
