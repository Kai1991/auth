package com.meidian.auth.web;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

/**
 * Title: com.meidian.web<br>
 * Description: <br>
 * Copyright: Copyright (c) 2015<br>
 * Company: 北京云杉世界信息技术有限公司<br>
 *
 * @author 张中凯
 *         2017/6/27
 */
@Controller()
@RequestMapping(value = "/hello")
public class HelloWordController {

    @RequestMapping(value = "/word")
    public ModelAndView index(){
        return new ModelAndView("index");
    }
}
