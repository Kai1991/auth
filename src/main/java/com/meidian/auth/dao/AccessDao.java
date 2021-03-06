package com.meidian.auth.dao;

import com.meidian.auth.entity.Access;
import com.meidian.common.result.PageCondition;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * Title: com.meidian.auth.dao<br>
 * Description: <br>
 * Copyright: Copyright (c) 2015<br>
 * Company: 北京云杉世界信息技术有限公司<br>
 *
 * @author 张中凯
 *         2017/8/2
 */
public interface AccessDao {

    public Access getAccess(Access access);

    public List<Access> getAccessList(PageCondition pageCondition,@Param("access") Access access);
}
