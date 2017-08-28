package com.meidian.auth.utils;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.redis.core.RedisTemplate;
import org.springframework.stereotype.Component;

/**
 * Title: com.meidian.auth.utils<br>
 * Description: <br>
 * Copyright: Copyright (c) 2015<br>
 * Company: 北京云杉世界信息技术有限公司<br>
 *
 * @author 张中凯
 *         2017/8/25
 */
@Component
public class RedisUtil {
    @Autowired
    private RedisTemplate redisTemplate;


}
