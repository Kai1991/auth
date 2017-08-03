package com.meidian.auth.manager;

import com.meidian.entity.Test;

/**
 * Title: com.meidian.manager<br>
 * Description: <br>
 * Copyright: Copyright (c) 2015<br>
 * Company: 北京云杉世界信息技术有限公司<br>
 *
 * @author 张中凯
 *         2017/6/27
 */
public interface TestManager {
    public Test getBy(Long id);
}
