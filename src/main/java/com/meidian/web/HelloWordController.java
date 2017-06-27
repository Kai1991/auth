package com.meidian.web;

import com.fasterxml.jackson.databind.util.JSONPObject;
import com.meidian.entity.Test;
import com.meidian.service.TestService;
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
@RestController()
@RequestMapping(value = "/hello")
public class HelloWordController {

    @Autowired
    private TestService testService;

    @RequestMapping(value = "/word")
    public String index(){
        return "Hello word!";
    }

    @RequestMapping(value = "/test")
    public String test(Long id){
        return testService.getBy(id).getTest();
    }
}
