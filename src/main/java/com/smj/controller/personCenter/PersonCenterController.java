package com.smj.controller.personCenter;

import com.smj.common.dto.ResultDto;
import com.smj.entiy.huiyuan.Huiyuan;
import com.smj.entiy.huiyuan.Order;
import com.smj.service.goods.GoodsService;
import com.smj.service.huiyuan.HuiyuanCenterService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.*;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.UUID;

/**
 * Created on 2018/3/19.
 */
@Controller
@RequestMapping("/personCenter/")
public class PersonCenterController {
    @Autowired
    private GoodsService goodsService;//注入service
    @Autowired
    private HuiyuanCenterService huiyuanCenterService;
    @RequestMapping(value = "")
    public String personCenter(HttpServletRequest request, Model model) throws Exception {
        //判断是否登录
        Huiyuan huiyuan = (Huiyuan) request.getSession().getAttribute("huiyuan");
        if (huiyuan!=null){
            //查询购物车
            String num = goodsService.findCar(huiyuan.getId());
            huiyuan.setCarNum(num);  //购物车金额
            //获取订单信息
            Order order = huiyuanCenterService.findOrder(huiyuan.getId());
            //获取日历
            Date dt = new Date(); //当前时间
            String[] weekDays = {"星期日", "星期一", "星期二", "星期三", "星期四", "星期五", "星期六"};
            Calendar cal = Calendar.getInstance();
            cal.setTime(dt);
            int w = cal.get(Calendar.DAY_OF_WEEK) - 1;
            if (w < 0)
                w = 0;
            String week = weekDays[w]; //周几
            //某日
            SimpleDateFormat dateFm = new SimpleDateFormat("dd");//格式化日期 对于创建SimpleDateFormat传入的参数：EEEE代表星期，如“星期四”；MMMM代表中文月份，如“十一月”；MM代表月份，如“11”；yyyy代表年份，如“2010”；dd代表天，如“25”
            String day=dateFm.format(dt);
            //年月
            SimpleDateFormat dateny = new SimpleDateFormat("yyyy.MM");
            String ny=dateny.format(dt);
            model.addAttribute("day",day);
            model.addAttribute("ny",ny);
            model.addAttribute("week",week);
            model.addAttribute("huiyuan",huiyuan);
            model.addAttribute("login","1");
            model.addAttribute("order",order);
            return "site/personalCenter/PersonCenter";
        }else {
            String message = "找不到您的登陆信息,请重新登陆!";
            model.addAttribute("message",message);
            return "common/fail";

        }
    }
    /**
     * 个人信息修改
     * */
@RequestMapping(value = "PersonInformation")
    public String PersonInformation(HttpServletRequest request, Model model){
    Huiyuan huiyuan = (Huiyuan) request.getSession().getAttribute("huiyuan");
    if (huiyuan!=null){
        Huiyuan huiyuan1 = huiyuanCenterService.findUser(huiyuan.getId());
        Date date = new Date();
        model.addAttribute("date",date);
        model.addAttribute("huiyuan",huiyuan1);
        model.addAttribute("login","1");
        return "site/personalCenter/PersonInformation";
    }else{
        String message = "找不到您的登陆信息,请重新登陆!";
        model.addAttribute("message",message);
        return "common/fail";
    }

}
    @RequestMapping(value = "upFile")
    @ResponseBody
    public ResultDto upFile(@RequestParam MultipartFile file, HttpSession session,HttpServletRequest request){
        ResultDto resultDto = new ResultDto();
        //获得原来文件名(含后缀名)
        String originalFilename = file.getOriginalFilename();
        int pos = originalFilename.lastIndexOf(".");
        //原文件后缀名
        String suffix1 = originalFilename.substring(pos);
        String suffix= suffix1.toLowerCase();
        //保存文件
        //ServletContext application = session.getServletContext();
        //String realPath = application.getRealPath("D:\\workspace111\\ycpolice-web\\web\\static\\updownload");
        //String realPath = "E:\\my_project\\weShopping\\src\\main\\webapp\\static\\images";
        String realPath = "E:\\my_project\\weShopping\\src\\main\\webapp\\static\\images";
        //产生一个uuid随机文件名
        String uuid = UUID.randomUUID().toString();
        String fullPath = realPath + File.separator + uuid + suffix;
        InputStream in = null;
        try {
            in = file.getInputStream();
            OutputStream out = new FileOutputStream(new File(fullPath));
            int len = 0;
            byte[] buf = new byte[3 * 1024];
            while ((len = in.read(buf)) != -1) {
                out.write(buf, 0, len);
            }
            out.close();
            in.close();
        } catch (IOException e) {
            resultDto.setCode("0");

            e.printStackTrace();
        }
        //获取修改后头像地址
        String rePath = "/static/images/"+ uuid + suffix;
        //保存
        Huiyuan huiyuan = (Huiyuan) request.getSession().getAttribute("huiyuan");
        huiyuanCenterService.saveImage(rePath,huiyuan.getId());
        resultDto.setCode("1");
        return resultDto;
    }
    /**
     * 方法名称: readImage
     * 方法作用：     预览，获取图片流，上传成功后显示图片
     */
    @RequestMapping(value = "readImage", produces = "text/plain;charset=UTF-8")
    public void readImage(HttpServletRequest request,
                          HttpServletResponse response) {

        String imgUrl = request.getParameter("imgUrl");

        String imagePath = imgUrl.replace("http://localhost:9999/static/images/", "E:\\webShop\\Shopping\\weShopping\\src\\main\\webapp\\static\\images");

        try {
            File file = new File(imagePath);
            if (file.exists()) {
                DataOutputStream temps = new DataOutputStream(
                        response.getOutputStream());
                DataInputStream in = new DataInputStream(new FileInputStream(
                        imagePath));
                byte[] b = new byte[2048];
                while ((in.read(b)) != -1) {
                    temps.write(b);
                    temps.flush();
                }
                in.close();
                temps.close();
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    //跳转到个人中心
    @RequestMapping(value = "PersonalCenter")
    public String toPersonalCenter(HttpServletRequest request, Model model){
        return "site/personalCenter/PersonalCenter";
    }

    //跳转到安全设置
    @RequestMapping(value = "safety")
    public String toSafety(HttpServletRequest request, Model model){
        return "site/personalCenter/Safety";
    }

    //跳转到收货地址
    @RequestMapping(value = "address")
    public String toaddress(HttpServletRequest request, Model model){
        return "site/personalCenter/address";
    }

    //跳转到订单管理
    @RequestMapping(value = "order")
    public String toorder(HttpServletRequest request, Model model){
        return "site/personalCenter/order";
    }

    //跳转到评价
    @RequestMapping(value = "comment")
    public String tocomment(HttpServletRequest request, Model model){
        return "site/personalCenter/comment";
    }

    //跳转到消息
    @RequestMapping(value = "news")
    public String tonews(HttpServletRequest request, Model model) { return "site/personalCenter/news"; }

}