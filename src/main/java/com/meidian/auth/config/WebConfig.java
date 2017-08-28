package com.meidian.auth.config;

import org.springframework.web.servlet.config.annotation.InterceptorRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurerAdapter;

/**
 * Title: com.meidian.auth.config<br>
 * Description: <br>
 * Copyright: Copyright (c) 2015<br>
 * Company: 北京云杉世界信息技术有限公司<br>
 *
 * @author 张中凯
 *         2017/8/25
 */
public class WebConfig extends WebMvcConfigurerAdapter {

    /*配置拦截器*/
    @Override
    public void addInterceptors(InterceptorRegistry registry) {
        /*registry.addInterceptor(new MyInterceptor())
                .addPathPatterns("*//**")//配置拦截的地址
                .excludePathPatterns("/adminUser/login");//配置不拦截的地址*/
        super.addInterceptors(registry);
    }
}
