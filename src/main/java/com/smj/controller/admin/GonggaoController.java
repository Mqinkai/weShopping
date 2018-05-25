package com.smj.controller.admin;

import com.smj.common.BaseController;
import com.smj.common.config.StringUtils;
import com.smj.common.dto.ResultDto;
import com.smj.entiy.admin.Gonggao;
import com.smj.entiy.huiyuan.Huiyuan;
import com.smj.service.admin.GonggaoService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import java.util.List;


/**
 * Created by Qinkai on 2018/5/24.
 */
@Controller
@RequestMapping("/gonggao/")
public class GonggaoController extends BaseController {
    @Autowired
    private GonggaoService gonggaoService;
    private Huiyuan admin;
    @ModelAttribute
    public String get(HttpServletRequest request,Model model) throws Exception {
        //Huiyuan entity = null;
        Huiyuan huiyuan = (Huiyuan) request.getSession().getAttribute("admin");//从session获取信息
        if (huiyuan != null){
            admin = huiyuan;
            return "";
        }
        else{
            throw new Exception("找不到您的管理员信息,请重新登陆");
            //String message = "找不到您的管理员信息,请重新登陆!";
            //model.addAttribute("message",message);
            //return "common/fail";
        }
    }

 @RequestMapping("list")
public String list(HttpServletRequest request, Model model){

            //获取公告
            List<Gonggao> gonggaoList = gonggaoService.getList();
            model.addAttribute("gonggaoList",gonggaoList);
            return "admin/gonggao/gonggao";

    }
    @RequestMapping("delgonggao")
    @ResponseBody
    public ResultDto delgonggao(@RequestParam("id") String id){
        ResultDto resultDto = new ResultDto();
        gonggaoService.delgonggao(id);
        resultDto.setCode("1");
        return resultDto;
    }
    @RequestMapping("save")
    @ResponseBody
    public ResultDto save(Gonggao gonggao){
        ResultDto resultDto = new ResultDto();
        gonggaoService.save(gonggao);
        resultDto.setCode("1");
        return resultDto;
    }
}
