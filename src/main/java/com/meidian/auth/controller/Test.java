package com.meidian.auth.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * Title: com.meidian.web<br>
 * Description: <br>
 * Copyright: Copyright (c) 2015<br>
 * Company: 北京云杉世界信息技术有限公司<br>
 *
 * @author 张中凯
 *         2017/7/23
 */
@Controller("Test")
@RequestMapping(value = "/test")
public class Test {

    @RequestMapping(value = "/testPage")
    public String testPage(){
        return "test";
    }
}
