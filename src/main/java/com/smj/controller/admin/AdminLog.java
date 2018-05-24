package com.smj.controller.admin;

import com.smj.common.dto.ResultDto;
import com.smj.entiy.huiyuan.Huiyuan;
import com.smj.service.admin.AdminService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

/**
 *  2018/5/24.
 */
@RequestMapping(value = "/admin/")
@Controller
public class AdminLog {
    @Autowired
    private AdminService adminService;
    @RequestMapping("adminLog")
    public String toLogin(){
        return "admin/adminLog";
    }
    @RequestMapping(value = "index")
    public String index(){
        return "admin/index";
    }
    @RequestMapping(value = "left")
    public String left(){
        return "admin/left";
    }
    @RequestMapping(value = "right")
    public String right(){
        return "admin/right";
    }
    @RequestMapping("login")
    @ResponseBody
    public ResultDto login(Huiyuan huiyuan, HttpServletRequest request, Model model){
        ResultDto resultDto = new ResultDto();
        try{
            //验证登录
            Huiyuan huiyuan1=  adminService.login(huiyuan);
            //创建session对象
            HttpSession session = request.getSession();
            //把用户数据保存在session域对象中
            session.setAttribute("admin",huiyuan1);
            resultDto.setCode("1");
        }catch (Exception e){
            model.addAttribute("mesgess",e.getMessage());
            resultDto.setCode("-1");
        }
        return resultDto;
    }
}
