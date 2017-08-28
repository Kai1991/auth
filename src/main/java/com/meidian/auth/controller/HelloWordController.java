package com.meidian.auth.controller;

import com.alibaba.fastjson.JSONObject;
import com.meidian.auth.dao.AccessDao;
import com.meidian.auth.entity.Access;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

/**
 * Title: com.meidian.web<br>
 * Description: <br>
 * Copyright: Copyright (c) 2015<br>
 * Company: 北京云杉世界信息技术有限公司<br>
 *
 * @author 张中凯
 *         2017/6/27
 */
@RestController
@RequestMapping(value = "/hello")
public class HelloWordController {
    private static final Logger logger = LoggerFactory.getLogger(HelloWordController.class);

    @Autowired
    private AccessDao accessDao;

    @RequestMapping(value = "/word")
    public String index(){
        return "index";
    }

    @RequestMapping(value = "/testMybatis")
    public Access testMybatis(Access access){
        Access result = accessDao.getAccess(access);
        logger.info("result:" + JSONObject.toJSONString(result));
        return result;
    }
}
