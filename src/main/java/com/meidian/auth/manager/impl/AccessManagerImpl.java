package com.meidian.auth.manager.impl;

import com.meidian.auth.dao.AccessDao;
import com.meidian.auth.entity.Access;
import com.meidian.common.result.PageCondition;
import com.meidian.auth.manager.AccessManager;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import java.util.List;

/**
 * Title: com.meidian.auth.manager.impl<br>
 * Description: <br>
 * Copyright: Copyright (c) 2015<br>
 * Company: 北京云杉世界信息技术有限公司<br>
 *
 * @author 张中凯
 *         2017/8/3
 */
@Component
public class AccessManagerImpl implements AccessManager {

    @Autowired
    private AccessDao accessDao;

    @Override
    public List<Access> getAccessList(PageCondition pageCondition, Access access) {
        return accessDao.getAccessList(pageCondition,access);
    }
}
