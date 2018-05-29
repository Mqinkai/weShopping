package com.smj.controller.admin;

import com.smj.common.BaseController;
import com.smj.common.dto.ResultDto;
import com.smj.entiy.OrderDto;
import com.smj.entiy.huiyuan.Order;
import com.smj.service.admin.OrdersService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import java.util.List;

/**
 * Created  on 2018/5/29.
 */
@Controller
@RequestMapping(value = "orders")
public class OrdersController extends BaseController {
    @Autowired
    private OrdersService ordersService;
    @RequestMapping(value = "list")
    public String orderlist(HttpServletRequest request, Model model){
List<OrderDto> orderList = ordersService.findList();
        model.addAttribute("orderList",orderList);
        return "admin/order/orderDetail";
    }
    @RequestMapping("del")
    @ResponseBody
    public ResultDto del(@RequestParam("id") String id){
        ResultDto resultDto = new ResultDto();
        ordersService.del(id);
        resultDto.setCode("1");
        return resultDto;
    }
}
