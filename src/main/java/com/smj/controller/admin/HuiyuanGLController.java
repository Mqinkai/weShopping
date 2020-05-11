package com.smj.controller.admin;

import com.smj.common.BaseController;
import com.smj.common.dto.ResultDto;
import com.smj.entiy.huiyuan.Huiyuan;
import com.smj.service.admin.HuiyuanGLService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import java.util.List;

/**
 * Created by Qinkai on 2018/5/28.
 */
@Controller
@RequestMapping("/huiyuanGL/")
public class HuiyuanGLController extends BaseController{
    @Autowired
    private HuiyuanGLService huiyuanGLService;
    private Huiyuan admin;
    @ModelAttribute
    public String get(HttpServletRequest request, Model model) throws Exception {
        //Huiyuan entity = null;
        Huiyuan huiyuan = (Huiyuan) request.getSession().getAttribute("admin");//从session获取信息
        if (huiyuan != null){
            admin = huiyuan;
            return "";
        }
        else{
            throw new Exception("找不到您的管理员信息,请重新登陆");
        }
    }
    @RequestMapping("list")
    public String huiyuan(HttpServletRequest request, Model model){
        List<Huiyuan> huiyuanList = huiyuanGLService.getList();
        model.addAttribute("huiyuanList",huiyuanList);
        return "admin/huiyuan/huiyuanMana";
    }

    @RequestMapping("open")
    @ResponseBody
    public ResultDto open(String id){
       ResultDto resultDto = new ResultDto();
        huiyuanGLService.setOpen(id);
        return resultDto;
    }
    @RequestMapping("close")
    @ResponseBody
    public ResultDto close(String id){
        ResultDto resultDto = new ResultDto();
        huiyuanGLService.close(id);
        return resultDto;
    }
    @RequestMapping("admin")
    @ResponseBody
    public ResultDto admin(String id){
        ResultDto resultDto = new ResultDto();
        huiyuanGLService.admin(id);
        resultDto.setCode("1");
        return resultDto;
    }
    @RequestMapping("qxadmin")
    @ResponseBody
    public ResultDto qxadmin(String id){
        ResultDto resultDto = new ResultDto();
        huiyuanGLService.qxadmin(id);
        resultDto.setCode("1");
        return resultDto;
    }
}
