package com.meidian.auth.service.impl;

import com.meidian.auth.common.ServiceResult;
import com.meidian.auth.entity.Access;
import com.meidian.auth.common.PageCondition;
import com.meidian.auth.manager.AccessManager;
import com.meidian.auth.service.AccessService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * Title: 权限服务<br>
 * Description: <br>
 * Copyright: Copyright (c) 2015<br>
 * Company: 北京云杉世界信息技术有限公司<br>
 *
 * @author 张中凯
 *         2017/8/5
 */
@Service
public class AccessServiceImpl implements AccessService {

    @Autowired
    private AccessManager accessManager;

    public ServiceResult<Access> getAccessList(PageCondition pageCondition, Access access){
        List<Access> accessList = accessManager.getAccessList(pageCondition,access);

        return null;
    }
}
