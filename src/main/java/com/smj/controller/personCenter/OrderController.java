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
    public ResultDto pj(String id){
        ResultDto resultDto = new ResultDto();
        orderService.pj(id);
        return resultDto;
    }
}
