package com.smj.controller.goods;

import com.smj.common.config.UserUtil;
import com.smj.entiy.goods.Leibie;
import com.smj.entiy.goods.TGoods;
import com.smj.entiy.huiyuan.Huiyuan;
import com.smj.service.TestService;
import com.smj.service.goods.GoodsService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import javax.servlet.http.HttpServletRequest;
import java.util.List;
@Controller
@RequestMapping("/message")
public class GoodsIndexController {
    @Autowired
    private TestService testService;
    @Autowired
    private GoodsService goodsService;
      /*  @Resource
        private MessageService messageService;*/
        @RequestMapping(value = "/show")
        public String helloMvc(HttpServletRequest request, Model model){
            //判断是否登录
          Huiyuan huiyuan = (Huiyuan) request.getSession().getAttribute("huiyuan");
            if (huiyuan!=null){
                //查询购物车
                String num = goodsService.findCar(huiyuan.getId());
                huiyuan.setCarNum(num);  //购物车金额
                model.addAttribute("huiyuan",huiyuan);
                model.addAttribute("login","1");
            }
            else {
                Huiyuan huiyuan1 = new Huiyuan();
                huiyuan1.setCarNum("0");
                model.addAttribute("huiyuan",huiyuan1);
                model.addAttribute("login","0"); //未登录
            }
            //获取类别list
           List<Leibie> leibieList=goodsService.getLeibie();
            List<TGoods> list=testService.find();
            model.addAttribute("goodslist",list);
            model.addAttribute("leibieList",leibieList);
            return "site/goods/newGoods";
        }

}
