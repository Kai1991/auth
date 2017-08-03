package com.meidian.auth.manager.impl;

import com.meidian.auth.manager.TestManager;
import com.meidian.dao.TestDao;
import com.meidian.entity.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

/**
 * Title: com.meidian.manager.impl<br>
 * Description: <br>
 * Copyright: Copyright (c) 2015<br>
 * Company: 北京云杉世界信息技术有限公司<br>
 *
 * @author 张中凯
 *         2017/6/27
 */
@Component
public class TestManagerImpl implements TestManager {

    @Autowired
    private TestDao testDao;

    @Override
    public Test getBy(Long id) {
        return testDao.getBy(id);
    }
}
