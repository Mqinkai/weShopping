package com.smj.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * Created by Administrator on 2018/4/14.
 */
@Controller
public class IndexController {
    //打开首页
    @RequestMapping("/")
    public String pageIndex(){
        return  "redirect:/message/show";
    }
}
