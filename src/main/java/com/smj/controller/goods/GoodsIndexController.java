package com.smj.controller.goods;

import com.smj.common.config.UserUtil;
import com.smj.common.dto.ResultDto;
import com.smj.entiy.admin.Gonggao;
import com.smj.entiy.goods.Leibie;
import com.smj.entiy.goods.TGoods;
import com.smj.entiy.huiyuan.Huiyuan;
import com.smj.service.TestService;
import com.smj.service.admin.GonggaoService;
import com.smj.service.goods.GoodsService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import java.util.ArrayList;
import java.util.List;
@Controller
@RequestMapping("/message")
public class GoodsIndexController {
    @Autowired
    private TestService testService;
    @Autowired
    private GoodsService goodsService;
    @Autowired
    private GonggaoService gonggaoService;
      /*  @Resource
        private MessageService messageService;*/
        @RequestMapping(value = "/show")
        public String helloMvc(HttpServletRequest request, Model model,String name,String type){
            String userid = "";
            //判断是否登录
          Huiyuan huiyuan = (Huiyuan) request.getSession().getAttribute("huiyuan");
            if (huiyuan!=null){
                model.addAttribute("huiyuan",huiyuan);
                model.addAttribute("login","1");
                userid = huiyuan.getId();
            }
            else {
                Huiyuan huiyuan1 = new Huiyuan();
                model.addAttribute("huiyuan",huiyuan1);
                model.addAttribute("login","0"); //未登录
            }
            //获取公告
            List<Gonggao> gonggaoList = gonggaoService.findList();
            //获取类别list
           List<Leibie> leibieList=goodsService.getLeibie();
            List<TGoods> list=testService.find(name,type,userid);
            model.addAttribute("gonggaoList",gonggaoList);
            model.addAttribute("name",name);
            model.addAttribute("goodslist",list);
            model.addAttribute("leibieList",leibieList);
            return "site/goods/newGoods";
        }
    @RequestMapping(value = "/search")
    public String search(HttpServletRequest request, Model model,String name,String type,String leibieList,String leibieXiashus){
        String userid = "";
        //判断是否登录
        Huiyuan huiyuan = (Huiyuan) request.getSession().getAttribute("huiyuan");
        if (huiyuan!=null){
            model.addAttribute("huiyuan",huiyuan);
            model.addAttribute("login","1");
            userid = huiyuan.getId();
        }
        else {
            Huiyuan huiyuan1 = new Huiyuan();
            huiyuan1.setCarNum("0");
            model.addAttribute("huiyuan",huiyuan1);
            model.addAttribute("login","0"); //未登录
        }
        List<TGoods> list = new ArrayList<TGoods>();
        //获取类别list
        List<Leibie> leibieLists=goodsService.getLeibie();
        //获取公告
        List<Gonggao> gonggaoList = gonggaoService.findList();
        if (leibieList != null && !leibieList.equals("") ) {
            list = testService.findByLeibie(leibieList);
        }else if ( leibieXiashus != null && !leibieXiashus.equals("")){
            //类别查询
            list = testService.findByleibieXiashus(leibieXiashus);
        }else {
            list=testService.find(name,type,userid);
        }
        model.addAttribute("gonggaoList",gonggaoList);
        model.addAttribute("name",name);
        model.addAttribute("goodslist",list);
        model.addAttribute("leibieList",leibieLists);
        return "site/goods/goodsDetail";
    }
    @RequestMapping(value = "delgoods")
    @ResponseBody
    public ResultDto delgoods(String id){
        ResultDto resultDto = new ResultDto();
        goodsService.del(id);
        resultDto.setCode("1");
        return resultDto;
    }

}
