package com.smj.controller.personCenter;

import com.smj.common.dto.ResultDto;
import com.smj.entiy.huiyuan.Huiyuan;
import com.smj.service.goods.GoodsService;
import com.smj.service.huiyuan.HuiyuanCenterService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;

/**
 * Created by Administrator on 2018/5/12.
 */

@Controller
@RequestMapping("/safety/")
public class SafetyController {
    @Autowired
    private GoodsService goodsService;//注入service
    @Autowired
    private HuiyuanCenterService huiyuanCenterService;
    //跳转到密码修改
    @RequestMapping(value = "password")
    public String topassword(HttpServletRequest request, Model model) {
        Huiyuan huiyuan = (Huiyuan) request.getSession().getAttribute("huiyuan");
        if (huiyuan!=null){
            //查询购物车
            String num = goodsService.findCar(huiyuan.getId());
            Huiyuan huiyuan1 = huiyuanCenterService.findUser(huiyuan.getId());
            huiyuan1.setCarNum(num);  //购物车金额
            model.addAttribute("huiyuan",huiyuan1);
            model.addAttribute("login","1");
            return "site/personalCenter/password";
        }else{
            String message = "找不到您的登陆信息,请重新登陆!";
            model.addAttribute("message",message);
            return "common/fail";
        }
         }
    //修改密码
    @RequestMapping(value = "save")
    @ResponseBody
    public ResultDto save(@RequestParam String ymm, @RequestParam String xmm,HttpServletRequest request){
        ResultDto resultDto = new ResultDto();
        Huiyuan huiyuan = (Huiyuan) request.getSession().getAttribute("huiyuan");
        huiyuan.setPassword(ymm);
        String i = huiyuanCenterService.findHUser(huiyuan);  //根据用户名和原密码查找该信息是否存在
        if (i != null){
            //存在该用户，密码正确，执行更改密码
            huiyuan.setPassword(xmm);
            huiyuan.setId(i);
            huiyuanCenterService.savePassword(huiyuan);
            resultDto.setCode("1");
            request.getSession().invalidate();//清除 session 中的所有信息
        }else {
            resultDto.setCode("-1");
            resultDto.setMessage("原密码输入错误！");
        }
        return resultDto;
    }

    //跳转到绑定手机
    @RequestMapping(value = "bindphone")
    public String tobindphone(HttpServletRequest request, Model model) {
        Huiyuan huiyuan = (Huiyuan) request.getSession().getAttribute("huiyuan");
        if (huiyuan!=null){
            //查询购物车
            String num = goodsService.findCar(huiyuan.getId());
            Huiyuan huiyuan1 = huiyuanCenterService.findUser(huiyuan.getId());
            huiyuan1.setCarNum(num);  //购物车金额
            model.addAttribute("huiyuan",huiyuan1);
            model.addAttribute("login","1");
            return "site/personalCenter/bindphone";
        }else{
            String message = "找不到您的登陆信息,请重新登陆!";
            model.addAttribute("message",message);
            return "common/fail";
        }
    }
    //保存手机号
    @RequestMapping(value = "savePhone")
    @ResponseBody
    public ResultDto savePhone (HttpServletRequest request,@RequestParam String id, @RequestParam String tel){
        Huiyuan huiyuan = (Huiyuan) request.getSession().getAttribute("huiyuan");
        ResultDto resultDto = new ResultDto();
        huiyuanCenterService.savePhone(id,tel);
        huiyuan.setTel(tel);
        resultDto.setCode("1");
        return resultDto;
    }
    @RequestMapping(value = "email")
    public String email(HttpServletRequest request, Model model) {
        Huiyuan huiyuan = (Huiyuan) request.getSession().getAttribute("huiyuan");
        if (huiyuan!=null){
            //查询购物车
            String num = goodsService.findCar(huiyuan.getId());
            Huiyuan huiyuan1 = huiyuanCenterService.findUser(huiyuan.getId());
            huiyuan1.setCarNum(num);  //购物车金额
            model.addAttribute("huiyuan",huiyuan1);
            model.addAttribute("login","1");
            return "site/personalCenter/email";
        }else{
            String message = "找不到您的登陆信息,请重新登陆!";
            model.addAttribute("message",message);
            return "common/fail";
        }
    }
    @RequestMapping(value = "saveEmail")
    @ResponseBody
    public ResultDto saveEmail (HttpServletRequest request,@RequestParam String id, @RequestParam String email){
        Huiyuan huiyuan = (Huiyuan) request.getSession().getAttribute("huiyuan");
        ResultDto resultDto = new ResultDto();
        huiyuanCenterService.saveEmail(id,email);
        huiyuan.setEmail(email);
        resultDto.setCode("1");
        return resultDto;
    }
}
