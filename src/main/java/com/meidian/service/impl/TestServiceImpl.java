package com.meidian.service.impl;

import com.meidian.entity.Test;
import com.meidian.manager.TestManager;
import com.meidian.service.TestService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 * Title: com.meidian.service.impl<br>
 * Description: <br>
 * Copyright: Copyright (c) 2015<br>
 * Company: 北京云杉世界信息技术有限公司<br>
 *
 * @author 张中凯
 *         2017/6/27
 */
@Service
public class TestServiceImpl implements TestService {

    @Autowired
    private TestManager testManager;

    @Override
    public Test getBy(Long id) {
        return testManager.getBy(id);
    }
}
