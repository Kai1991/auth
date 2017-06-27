package com.meidian.dao;

import com.meidian.entity.Test;
import org.apache.ibatis.annotations.Param;

/**
 * Title: com.meidian.dao<br>
 * Description: <br>
 * Copyright: Copyright (c) 2015<br>
 * Company: 北京云杉世界信息技术有限公司<br>
 *
 * @author 张中凯
 *         2017/6/27
 */
public interface TestDao {

    public Test getBy(@Param("id") Long id);
}
