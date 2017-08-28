package com.meidian.auth.service.impl;

import com.alibaba.fastjson.JSONObject;
import com.meidian.auth.common.ServiceResult;
import com.meidian.auth.entity.Access;
import com.meidian.auth.interceptor.PageCondition;
import com.meidian.auth.service.AccessService;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.context.junit4.SpringRunner;

import static org.junit.Assert.*;

/**
 * Title: com.meidian.auth.service.impl<br>
 * Description: <br>
 * Copyright: Copyright (c) 2015<br>
 * Company: 北京云杉世界信息技术有限公司<br>
 *
 * @author 张中凯
 *         2017/8/28
 */
@RunWith(SpringRunner.class)
@SpringBootTest
public class AccessServiceImplTest {

    @Autowired
    private AccessService accessService;

    @Test
    public void getAccessList() throws Exception {
        PageCondition pageCondition = new PageCondition(2,10);
        Access access = new Access();
        access.setId(1L);
        ServiceResult<Access> result = accessService.getAccessList(pageCondition,access);
        System.out.println(JSONObject.toJSONString(pageCondition));
        System.out.println(JSONObject.toJSONString(result));
    }
}