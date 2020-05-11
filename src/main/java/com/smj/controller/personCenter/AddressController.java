package com.smj.controller.personCenter;

import com.smj.common.dto.ResultDto;
import com.smj.entiy.Address;
import com.smj.entiy.huiyuan.Huiyuan;
import com.smj.service.huiyuan.AddressService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;

/**
 * Created by Administrator on 2018/5/12.
 */
@RequestMapping("/address/")
@Controller
public class AddressController {
    @Autowired
    private AddressService addressService;
    //保存收货地址
    @RequestMapping("saveAddress")
    @ResponseBody
    public ResultDto saveAddress(Address address,HttpServletRequest request){
        ResultDto resultDto = new ResultDto();
        Huiyuan huiyuan = (Huiyuan) request.getSession().getAttribute("huiyuan");
        address.setUserId(huiyuan.getId());
        if (address.getId()!=null && !address.getId().equals("")){ //如果id不为空就是更改
            addressService.updataAddress(address);
        }else {
            addressService.saveAddress(address);
            //更改用户标识
            addressService.updateUser(address.getUserId());
            huiyuan.setUserBz("2");//更新session
        }

        resultDto.setCode("1");
        return resultDto;
    }
    @RequestMapping("delAddress")
    @ResponseBody
    public ResultDto delAddress(Address address,HttpServletRequest request){
        ResultDto resultDto = new ResultDto();
        addressService.del(address.getId());
        resultDto.setCode("1");
        return resultDto;
    }
    @RequestMapping("change")
    @ResponseBody
    public ResultDto change(Address address,HttpServletRequest request){
        ResultDto resultDto = new ResultDto();
        addressService.change(address.getId());
        resultDto.setCode("1");
        return resultDto;
    }
}
