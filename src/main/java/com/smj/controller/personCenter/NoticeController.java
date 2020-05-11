package com.smj.controller.personCenter;

import com.smj.common.dto.ResultDto;
import com.smj.service.huiyuan.NoticeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

/**
 * Created by Qinkai on 2018/5/17.
 */
@Controller
@RequestMapping(value = "/notice/")
public class NoticeController {
    @Autowired
    private NoticeService noticeService;
    @RequestMapping(value = "hf")
    @ResponseBody
    public ResultDto hf(@RequestParam("id") String id, @RequestParam("message")String message){
        ResultDto resultDto = new ResultDto();
        noticeService.send(id,message);
        resultDto.setCode("1");
        return resultDto;
    }

    @RequestMapping(value = "del")
    @ResponseBody
    public ResultDto del(@RequestParam("id")String id){
        ResultDto resultDto = new ResultDto();
        noticeService.del(id);
        resultDto.setCode("1");
        return resultDto;
    }
}
