package com.smj.controller.personCenter;

import com.smj.common.dto.ResultDto;
import com.smj.service.order.OrderService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

/**
 * Created by Administrator on 2018/5/15.
 */
@Controller
@RequestMapping("/order/")
public class OrderController {
    @Autowired
    private OrderService orderService;
    @RequestMapping(value = "qrsh",method = RequestMethod.GET)
    @ResponseBody
    public ResultDto qrsh(String id){
        ResultDto resultDto = new ResultDto();
       orderService.qrsh(id);
        return resultDto;
    }
    @RequestMapping(value = "pj",method = RequestMethod.GET)
    @ResponseBody
    public ResultDto pj(@RequestParam("id") String id,@RequestParam("pj") String pj){
        ResultDto resultDto = new ResultDto();
        orderService.pj(id,pj);
        resultDto.setMessage("成功");
        resultDto.setCode("1");
        return resultDto;
    }

    @RequestMapping(value = "delorder",method = RequestMethod.GET)
    @ResponseBody
    public ResultDto delorder(@RequestParam("id") String id){
        ResultDto resultDto = new ResultDto();
        orderService.delorder(id);
        resultDto.setMessage("成功");
        resultDto.setCode("1");
        return resultDto;
    }
    @RequestMapping(value = "fahuo",method = RequestMethod.GET)
    @ResponseBody
    public ResultDto fahuo(@RequestParam("id") String id){
        ResultDto resultDto = new ResultDto();
        orderService.fahuo(id);
        resultDto.setMessage("成功");
        resultDto.setCode("1");
        return resultDto;
    }
    @RequestMapping(value = "delOrderByGoodsId")
    @ResponseBody
    public ResultDto delOrderByGoodsId(@RequestParam("id") String id){
        ResultDto resultDto = new ResultDto();
        orderService.delOrderByGoodsId(id);
        resultDto.setMessage("成功");
        resultDto.setCode("1");
        return resultDto;
    }
    //关闭交易
    @RequestMapping(value = "closeOrderByGoodsId")
    @ResponseBody
    public ResultDto closeOrderByGoodsId(@RequestParam("id") String id){
        ResultDto resultDto = new ResultDto();
        orderService.closeOrderByGoodsId(id);
        resultDto.setMessage("成功");
        resultDto.setCode("1");
        return resultDto;
    }
    @RequestMapping(value = "qxdd",method = RequestMethod.GET)
    @ResponseBody
    public ResultDto qxdd(@RequestParam("id") String id){
        ResultDto resultDto = new ResultDto();
        orderService.qxdd(id);
        resultDto.setMessage("成功");
        resultDto.setCode("1");
        return resultDto;
    }
    @RequestMapping(value = "sendmessage",method = RequestMethod.GET)
    @ResponseBody
    public ResultDto sendmessage(@RequestParam("goodsId") String goodsId,@RequestParam("message") String message, @RequestParam("fbid") String fbid){
        ResultDto resultDto = new ResultDto();
        orderService.sendmessage(message,goodsId,fbid);
        resultDto.setMessage("成功");
        resultDto.setCode("1");
        return resultDto;
    }
    @RequestMapping(value = "findaddress",method = RequestMethod.GET)
    @ResponseBody
    public ResultDto findaddress(@RequestParam("id") String id){
        ResultDto resultDto = new ResultDto();
        resultDto =orderService.findaddress(id);

        return resultDto;
    }
}
