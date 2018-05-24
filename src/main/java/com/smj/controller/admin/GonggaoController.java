package com.smj.controller.admin;

import com.smj.entiy.admin.Gonggao;
import com.smj.service.admin.GonggaoService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletRequest;
import java.util.List;

/**
 * Created by Qinkai on 2018/5/24.
 */
@Controller
@RequestMapping("/gonggao/")
public class GonggaoController {
    @Autowired
    private GonggaoService gonggaoService;
    @RequestMapping("list")
public String list(HttpServletRequest request, Model model){
        //获取公告
        List<Gonggao> gonggaoList = gonggaoService.getList();
        model.addAttribute("gonggaoList",gonggaoList);
        return "admin/gonggao/gonggao";
    }
}
