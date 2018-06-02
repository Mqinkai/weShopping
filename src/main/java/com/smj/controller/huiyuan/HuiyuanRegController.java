package com.smj.controller.huiyuan;
import com.smj.common.config.Global;
import com.smj.common.dto.ResultDto;
import com.smj.entiy.huiyuan.Huiyuan;
import com.smj.service.huiyuan.HuiYuanRegService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.util.Random;

/**
 * Created on 2018/2/22.
 */
@RestController
@RequestMapping("/huiyuanreg")
public class HuiyuanRegController {
    @Autowired
    private HuiYuanRegService huiYuanRegService;
    @RequestMapping(value = "/tz")
    public String reg(HttpServletRequest request, Model model){
       return "site/userreg/userreg";
    }
    @RequestMapping(value = "/regForm" ,method = {RequestMethod.POST, RequestMethod.GET})
    public String regForm(Huiyuan huiyuan ,HttpServletRequest request, Model model,HttpServletResponse response){
        try {
            if (huiyuan.getEmail()!=null){//邮箱注册
               huiyuan.setUserName(huiyuan.getEmail()); //用户名默认为邮箱
               huiyuan.setUserBz("1");
               huiyuan.setCode("普通会员");//
                huiyuan.setTx("/static/images/mytx.jpg");
               //查询邮箱是否被注册
               huiYuanRegService.findByEmail(huiyuan);
             }else {
                //手机号注册
                huiyuan.setUserName(huiyuan.getTel()); //用户名默认为手机号
                huiyuan.setUserBz("1");
                huiyuan.setCode("普通会员");
                huiyuan.setTx("/static/images/mytx.jpg");
                //查询手机是否被注册
                huiYuanRegService.findeByTel(huiyuan);
            }
            huiYuanRegService.reg(huiyuan); //保存并返回ID
            //创建session对象
            HttpSession session = request.getSession();
            //把用户数据保存在session域对象中
            session.setAttribute("huiyuan",huiyuan);
        } catch (Exception e) {
            model.addAttribute("message",e.getMessage());
            return "site/userreg/userreg";
          }
        return "site/userreg/userToIndex";
    }
    //退出
    @RequestMapping(value = "/leave")
    public String leave(HttpServletRequest request){
        //request.getSession().removeAttribute("huiyuan");//清空session信息
        request.getSession().invalidate();//清除 session 中的所有信息
        return  "redirect:/message/show";
    }

    @RequestMapping(value = "/sendMobileCode",method = {RequestMethod.GET,RequestMethod.POST})
    @ResponseBody
    public ResultDto sendMobileCode(){
        ResultDto resultDto = new ResultDto();
        String str="abcdefghigklmnopqrstuvwxyzABCDEFGHIGKLMNOPQRSTUVWXYZ0123456789";
        Random r=new Random();
        String arr[]=new String [4];
        String b="";
        for(int i=0;i<4;i++)
        {
            int n=r.nextInt(62); //nextInt(n)将返回一个大于等于0小于n的随机数
            arr[i]=str.substring(n,n+1);
            b+=arr[i];
        }
        resultDto.setMessage(b);
        return resultDto;
    }
    @RequestMapping(value = "/xgmm" ,method = {RequestMethod.POST, RequestMethod.GET})
    @ResponseBody
    public ResultDto regForm(Huiyuan huiyuan ){
        ResultDto resultDto = new ResultDto();
        resultDto = huiYuanRegService.xgmm(huiyuan);
        return resultDto;
    }
    @RequestMapping(value = "/changPassword" ,method = {RequestMethod.POST, RequestMethod.GET})
    @ResponseBody
    public ResultDto changPassword(@RequestParam("id") String id, @RequestParam("password")String password ){
        ResultDto resultDto = new ResultDto();
        huiYuanRegService.changP(id,password);
        return resultDto;
    }
}
