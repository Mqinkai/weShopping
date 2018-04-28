package com.smj.common.config;

import com.smj.entiy.huiyuan.Huiyuan;

import javax.servlet.http.HttpServletRequest;

/**
 * Created  on 2018/3/12.
 */
public class UserUtil {
    //获取用户登录信息
    public static Huiyuan getUser(HttpServletRequest request){
        Huiyuan adminUser = null;
        if(request.getSession().getAttribute("huiyuan")!=null){
            adminUser=(Huiyuan) request.getSession().getAttribute("huiyuan");
        }
        return adminUser;
    }
}
