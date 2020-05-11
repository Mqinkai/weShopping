package com.smj.controller.admin;

import com.smj.common.BaseController;
import com.smj.common.dto.ResultDto;
import com.smj.entiy.goods.Leibie;
import com.smj.entiy.huiyuan.Huiyuan;
import com.smj.service.admin.LeibieService;
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
 * Created by  on 2018/5/25.
 */
@Controller
@RequestMapping("/leibie/")
public class LeibieController extends BaseController {
    @Autowired
    private LeibieService leibieService;
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
            //String message = "找不到您的管理员信息,请重新登陆!";
            //model.addAttribute("message",message);
            //return "common/fail";
        }
    }
    @RequestMapping("list")
    public String list(HttpServletRequest request, Model model){


        List<Leibie> leibieList = leibieService.getList();
        model.addAttribute("leibieList",leibieList);
        return "admin/leibie/leibieMana";

    }
    @RequestMapping("del")
    @ResponseBody
    public ResultDto del(@RequestParam("id") String id){
        ResultDto resultDto = new ResultDto();
        leibieService.del(id);
        resultDto.setCode("1");
        return resultDto;
    }
    @RequestMapping("tuijian")
    @ResponseBody
    public ResultDto tuijian(@RequestParam("id") String id){
        ResultDto resultDto = new ResultDto();
        resultDto=leibieService.tuijian(id);
        return resultDto;
    }
    @RequestMapping("qxtj")
    @ResponseBody
    public ResultDto qxtj(@RequestParam("id") String id){
        ResultDto resultDto = new ResultDto();
        resultDto=leibieService.qxtj(id);
        return resultDto;
    }
    @RequestMapping("save")
    @ResponseBody
    public ResultDto save(Leibie leibie){
        ResultDto resultDto = new ResultDto();
        leibieService.save(leibie);
        resultDto.setCode("1");
        return resultDto;
    }
    @RequestMapping("xiaji")
    public String xiaji(HttpServletRequest request, Model model,String id){

        List<Leibie> xiajiList = leibieService.findXiaji(id);
        model.addAttribute("xiajiList",xiajiList);
        model.addAttribute("leibieId",id);
        return "admin/leibie/leibieXiaji";

    }
    @RequestMapping("delXs")
    @ResponseBody
    public ResultDto delXs(@RequestParam("id") String id){
        ResultDto resultDto = new ResultDto();
        leibieService.delXs(id);
        resultDto.setCode("1");
        return resultDto;
    }
    @RequestMapping("saveXs")
    @ResponseBody
    public ResultDto saveXs(Leibie leibie){
        ResultDto resultDto = new ResultDto();
        leibieService.saveXs(leibie);
        resultDto.setCode("1");
        return resultDto;
    }
}
