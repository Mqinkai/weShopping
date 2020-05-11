package com.smj.controller.huiyuan;

import com.smj.entiy.huiyuan.Huiyuan;
import com.smj.service.huiyuan.HuiyuanLoginService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

/**
 * Created  on 2018/3/13.
 */
@Controller
@RequestMapping("/login/")
public class HuiyuanLoginController {
    @Autowired
    private HuiyuanLoginService huiyuanLoginService;
    @RequestMapping(value = "")
    public String login(HttpServletRequest request, Model model){
        return "site/userlogin/userlogin";
    }
    @RequestMapping(value = "userLogin")
    public String userLogin(Huiyuan huiyuan,HttpServletRequest request, Model model){
        try{
            //验证登录
            Huiyuan huiyuan1=  huiyuanLoginService.login(huiyuan);
            //创建session对象
            HttpSession session = request.getSession();
            //把用户数据保存在session域对象中
            session.setAttribute("huiyuan",huiyuan1);
        }catch (Exception e){
            model.addAttribute("mesgess",e.getMessage());
            return "site/userlogin/userlogin";
        }
        return "site/userreg/userToIndex";
    }
}
