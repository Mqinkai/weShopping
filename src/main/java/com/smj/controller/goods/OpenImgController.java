package com.smj.controller.goods;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.FileInputStream;
import java.io.OutputStream;

/**
 * Created by Administrator on 2018/5/19.
 */
@Controller
@RequestMapping(value="/upload")
public class OpenImgController {
    /**
     * 方法名称: readImage
     * 方法作用：     预览，获取图片流，上传成功后显示图片
     */
    @RequestMapping(value = "")
    public void readImage(@RequestParam String imgName, HttpServletRequest request,
                          HttpServletResponse response) {

        //读取本地图片输入流
        FileInputStream inputStream = null;
        try {
            inputStream = new FileInputStream("/Users/qinkai/Desktop/file/shop/"+imgName);

            int i = inputStream.available();
            //byte数组用于存放图片字节数据
            byte[] buff = new byte[i];
            inputStream.read(buff);
            //记得关闭输入流
            inputStream.close();
            //设置发送到客户端的响应内容类型
            response.setContentType("image/*");
            OutputStream out = response.getOutputStream();
            out.write(buff);
            //关闭响应输出流
            out.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
