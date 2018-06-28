package com.smj.controller.huiyuan;

import com.smj.common.dto.ResultDto;
import com.smj.entiy.goods.Leibie;
import com.smj.entiy.goods.TGoods;
import com.smj.entiy.huiyuan.Huiyuan;
import com.smj.service.huiyuan.FbGoodsService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import sun.misc.BASE64Decoder;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.OutputStream;
import java.util.List;
import java.util.UUID;

/**
 * Created by Administrator on 2018/5/19.
 */
@Controller
@RequestMapping("/fbgoods/")
public class FbGoodsController {
    @Autowired
    private FbGoodsService fbGoodsService;
    //获取二级类别
    @RequestMapping(value = "findLbie")
    @ResponseBody
    public List<Leibie> findLbie(@RequestParam String leibieid){
        List<Leibie> list = fbGoodsService.findLbie(leibieid);
        return list;
    }
    @RequestMapping(value = "updata")
    @ResponseBody
    public ResultDto updata(TGoods tGoods,HttpServletRequest request){
        ResultDto resultDto = new ResultDto();
       /* 不过需要注意的是，一般插件返回的base64编码的字符串都是有一个前缀的。

        "data:image/jpeg;base64," 解码之前这个得去掉。*/
        tGoods.setFujian(tGoods.getFujian().replace("data:image/jpeg;base64,",""));
//对Base64字符串解码并生成图片
        if (tGoods == null){
            resultDto.setCode("-1");
            resultDto.setMessage("上传失败");
            return resultDto;
        } //图像数据为空
        BASE64Decoder decoder = new BASE64Decoder();
        Huiyuan huiyuan = (Huiyuan) request.getSession().getAttribute("huiyuan");//从session获取会员信息
        tGoods.setFbid(huiyuan.getId());
        try{
            fbGoodsService.findSchool(tGoods);

            //Base64解码
            byte[] b = decoder.decodeBuffer(tGoods.getFujian());

            //异常处理
            for(int i = 0; i < b.length; ++i) {
                if (b[i] < 0) {
                   b[i] += 256;
                    }
                }
            String imgPath ="E:/static";
                File headPath = new File(imgPath);//获取文件夹路径
                if(!headPath.exists()){//判断文件夹是否创建，没有创建则创建新文件夹
                    headPath.mkdirs();
                }
                //定义图片路径
               String uuid = UUID.randomUUID().toString();
                String imgFilePath = imgPath+"/"+uuid+".jpg";
                //新生成的图片
                OutputStream out = new FileOutputStream(imgFilePath);
            out.write(b);
                out.flush();
                out.close();
            String rePath = "http://localhost:9999/fbgoods/readImage?name="+ uuid + ".jpg";
            tGoods.setFujian(rePath);//回填图片服务器地址
            //图片已经保存到本地，开始向数据库保存数据
            fbGoodsService.updata(tGoods);
            resultDto.setCode("1");
                return resultDto;
            }catch (Exception e){
            resultDto.setCode("-1");
            resultDto.setMessage(e.getMessage());
                return resultDto;
            }

    }
    @RequestMapping(value = "readImage", produces = "text/plain;charset=UTF-8")
    public void readImage(HttpServletRequest request,
                          HttpServletResponse response, String name) {

        //读取本地图片输入流
        FileInputStream inputStream = null;
        try {
            inputStream = new FileInputStream("E:/static/"+name);

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
