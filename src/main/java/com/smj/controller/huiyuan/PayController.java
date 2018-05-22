package com.smj.controller.huiyuan;

import com.smj.entiy.Address;
import com.smj.entiy.goods.TGoods;
import com.smj.entiy.huiyuan.Huiyuan;
import com.smj.service.goods.GoodsService;
import com.smj.service.huiyuan.HuiyuanCenterService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletRequest;
import java.util.List;

/**
 * Created by Qinkai on 2018/5/22.
 */
@Controller
@RequestMapping(value = "/pay/")
public class PayController {
    @Autowired
    private GoodsService goodsService;
    @Autowired
    private HuiyuanCenterService huiyuanCenterService;
    //跳转到支付页面
    @RequestMapping(value = "pay")
    public String pay(HttpServletRequest request, Model model,String id){
        Huiyuan huiyuan = (Huiyuan) request.getSession().getAttribute("huiyuan");
        if (huiyuan!=null){
            Huiyuan huiyuan1 = huiyuanCenterService.findUser(huiyuan.getId());
            model.addAttribute("huiyuan",huiyuan1);
            model.addAttribute("login","1");
            //获取收货地址
            List<Address> addressList = huiyuanCenterService.findAddress(huiyuan1.getId());
            //获取商品信息
            TGoods goods = goodsService.findGoods(id);
            model.addAttribute("goods",goods);
            model.addAttribute("address",addressList);
            return "site/goods/pay";
        }else{
            String message = "找不到您的登陆信息,请重新登陆!";
            model.addAttribute("message",message);
            return "common/fail";
        }
    }
}
