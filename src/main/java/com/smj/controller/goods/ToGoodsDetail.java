package com.smj.controller.goods;

import com.smj.entiy.goods.TGoods;
import com.smj.entiy.huiyuan.Huiyuan;
import com.smj.service.goods.GoodsDetailService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletRequest;

/**
 * Created by Qinkai on 2018/5/21.
 */
@Controller
@RequestMapping(value = "/GoodsDetail")
public class ToGoodsDetail {
    @Autowired
    private GoodsDetailService goodsDetailService;
    @RequestMapping(value = "/detail")
    public String toDetail(HttpServletRequest request, Model model,String id){
        Huiyuan huiyuan = (Huiyuan) request.getSession().getAttribute("huiyuan");
        if (huiyuan!=null){
            model.addAttribute("huiyuan",huiyuan);
            model.addAttribute("login","1");
        }
        else {
            Huiyuan huiyuan1 = new Huiyuan();
            model.addAttribute("huiyuan",huiyuan1);
            model.addAttribute("login","0"); //未登录
        }
        //根据id查询物品详情
        TGoods goods =goodsDetailService.findGoodsById(id);
        //查询发布地点
        TGoods tGoods = goodsDetailService.findOther(goods.getFbid());
        goods.setAddress(tGoods.getAddress());
        goods.setSchool(tGoods.getSchool());
        model.addAttribute("goods",goods);
        return "site/goods/goodsIntroduction";
    }
}
