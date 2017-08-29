package com.meidian.auth.utils;

import com.meidian.auth.common.ServiceResult;


/**
 * Title: 返回信息工具类<br>
 * Description: <br>
 * Copyright: Copyright (c) 2015<br>
 * Company: 北京云杉世界信息技术有限公司<br>
 *
 * @author 张中凯
 *         2017/8/29
 */
public class ReturnUtil {

    public static ServiceResult returnTrue(){
        ServiceResult result = new ServiceResult();
        result.setSuccess(true);
        return result;
    }
    public static ServiceResult returnTrueAndMessage(String message){
        ServiceResult result = new ServiceResult();
        result.setSuccess(true);
        result.setMessage(message);
        return result;
    }
    public static ServiceResult returnFalse(){
        ServiceResult result = new ServiceResult();
        result.setSuccess(false);
        return result;
    }
    public static ServiceResult returnFalseAndMessage(String message){
        ServiceResult result = new ServiceResult();
        result.setSuccess(false);
        result.setMessage(message);
        return result;
    }
    public static ServiceResult returnBody(Object body){
        ServiceResult result = new ServiceResult();
        result.setSuccess(true);
        result.setBody(body);
        return result;
    }
    public static ServiceResult returnBodyAndMessage(Object body,String message){
        ServiceResult result = new ServiceResult();
        result.setSuccess(true);
        result.setMessage(message);
        result.setBody(body);
        return result;
    }
}
