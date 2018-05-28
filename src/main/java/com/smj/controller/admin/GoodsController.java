package com.smj.controller.admin;

import com.smj.common.BaseController;
import com.smj.common.dto.ResultDto;
import com.smj.entiy.goods.TGoods;
import com.smj.entiy.huiyuan.Huiyuan;
import com.smj.service.goods.GoodsService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import java.util.List;

/**
 * Created by on 2018/5/25.
 */
@RequestMapping(value = "/goods/")
@Controller
public class GoodsController extends BaseController {
    @Autowired
    private GoodsService goodsService;
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
@RequestMapping("goodsList")
    public String goodsList(HttpServletRequest request, Model model){
    //获取全部物品
    List<TGoods> goodsList = goodsService.getlist();
    model.addAttribute("goodsList",goodsList);
    return "admin/goods/goodsMana";
}
    @RequestMapping("openDetail")
    @ResponseBody
    public ResultDto openDetail(String id){
        ResultDto resultDto = goodsService.getDetail(id);
        resultDto.setCode("1");
        return resultDto;
    }
}
