package com.smj.controller.personCenter;

import com.smj.common.dto.ResultDto;
import com.smj.entiy.Address;
import com.smj.entiy.Notice;
import com.smj.entiy.OrderDto;
import com.smj.entiy.goods.Leibie;
import com.smj.entiy.goods.TGoods;
import com.smj.entiy.huiyuan.Huiyuan;
import com.smj.entiy.huiyuan.Order;
import com.smj.entiy.huiyuan.PingjiaDto;
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
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.List;
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
            //获取订单信息
            Order order = huiyuanCenterService.findOrder(huiyuan.getId());
            // 获取订单
            List<TGoods> orderList = huiyuanCenterService.findMyGoods(huiyuan.getId());
            model.addAttribute("orderList",orderList);
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
            //获取未读消息条数
            int noticeCount = huiyuanCenterService.getcount(huiyuan.getId());
            model.addAttribute("noticeCount",noticeCount);
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
        if (huiyuan1.getSr() ==null || huiyuan1.getSr().equals("")){
            huiyuan1.setSr(date);
        }
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
        String suffix= suffix1.toLowerCase(); //小写
        //保存文件
        //ServletContext application = session.getServletContext();
        //String realPath = application.getRealPath("D:\\workspace111\\ycpolice-web\\web\\static\\updownload");
        //String realPath = "E:\\my_project\\weShopping\\src\\main\\webapp\\static\\images";
        String realPath = "E:\\touxiang";
        //产生一个uuid随机文件名
        String uuid = UUID.randomUUID().toString();
        String fullPath = realPath + File.separator + uuid + suffix;//地址+文件名+后缀
        InputStream in = null;
        //文件输出，保存到本地
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

        //获取修改后头像地址  数据库
        String rePath = "http://localhost:9999/personCenter/readImage?name="+ uuid + suffix;
        //保存
        Huiyuan huiyuan = (Huiyuan) request.getSession().getAttribute("huiyuan");
        huiyuan.setTx(rePath);
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
                          HttpServletResponse response,String name) {

        //读取本地图片输入流
        FileInputStream inputStream = null;
        try {
            inputStream = new FileInputStream("E:/touxiang/"+name);

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


    //跳转到安全设置
    @RequestMapping(value = "safety")
    public String toSafety(HttpServletRequest request, Model model){
        Huiyuan huiyuan = (Huiyuan) request.getSession().getAttribute("huiyuan");
        if (huiyuan!=null){
            Huiyuan huiyuan1 = huiyuanCenterService.findUser(huiyuan.getId());
            model.addAttribute("huiyuan",huiyuan1);
            model.addAttribute("login","1");
            return "site/personalCenter/Safety";
        }else{
            String message = "找不到您的登陆信息,请重新登陆!";
            model.addAttribute("message",message);
            return "common/fail";
        }

    }

    //跳转到收货地址
    @RequestMapping(value = "address")
    public String toaddress(HttpServletRequest request, Model model){
        Huiyuan huiyuan = (Huiyuan) request.getSession().getAttribute("huiyuan");
        if (huiyuan!=null){
            Huiyuan huiyuan1 = huiyuanCenterService.findUser(huiyuan.getId());
            model.addAttribute("huiyuan",huiyuan1);
            model.addAttribute("login","1");
            //获取收货地址
            List<Address> addressList = huiyuanCenterService.findAddress(huiyuan1.getId());
            model.addAttribute("address",addressList);
            return "site/personalCenter/address";
        }else{
            String message = "找不到您的登陆信息,请重新登陆!";
            model.addAttribute("message",message);
            return "common/fail";
        }

    }

    //跳转到订单管理
    @RequestMapping(value = "order")
    public String toorder(HttpServletRequest request, Model model,String type){
        Huiyuan huiyuan = (Huiyuan) request.getSession().getAttribute("huiyuan");
        if (huiyuan!=null){
            Huiyuan huiyuan1 = huiyuanCenterService.findUser(huiyuan.getId());
            // 获取订单
           List<OrderDto> orderList = huiyuanCenterService.findOrderList(huiyuan1.getId());
            model.addAttribute("orderList",orderList);
            model.addAttribute("huiyuan",huiyuan1);
            model.addAttribute("login","1");
            if (type == null || type.equals("")){
                type="0";
            }
            model.addAttribute("type",type);
            return "site/personalCenter/order";
        }else{
            String message = "找不到您的登陆信息,请重新登陆!";
            model.addAttribute("message",message);
            return "common/fail";
        }

    }

    //跳转到评价
    @RequestMapping(value = "comment")
    public String tocomment(HttpServletRequest request, Model model){
        Huiyuan huiyuan = (Huiyuan) request.getSession().getAttribute("huiyuan");
        if (huiyuan!=null){
            Huiyuan huiyuan1 = huiyuanCenterService.findUser(huiyuan.getId());
           //获取pingjia
            List<PingjiaDto> list = huiyuanCenterService.getPingjia(huiyuan.getId());
            model.addAttribute("pjlist",list);
            model.addAttribute("huiyuan",huiyuan1);
            model.addAttribute("login","1");
            return "site/personalCenter/comment";
        }else{
            String message = "找不到您的登陆信息,请重新登陆!";
            model.addAttribute("message",message);
            return "common/fail";
        }
    }

    //跳转到消息
    @RequestMapping(value = "news")
    public String tonews(HttpServletRequest request, Model model) {
        Huiyuan huiyuan = (Huiyuan) request.getSession().getAttribute("huiyuan");
        if (huiyuan!=null){
            Huiyuan huiyuan1 = huiyuanCenterService.findUser(huiyuan.getId());
            //查询消息内容
          List<Notice> noticeList = huiyuanCenterService.getNotice(huiyuan1.getId());
            model.addAttribute("noticeList",noticeList);
            model.addAttribute("huiyuan",huiyuan1);
            model.addAttribute("login","1");
            return "site/personalCenter/news";
        }else{
            String message = "找不到您的登陆信息,请重新登陆!";
            model.addAttribute("message",message);
            return "common/fail";
        }
    }

    @RequestMapping(value = "save")
    public String save(Huiyuan huiyuan,HttpServletRequest request) throws ParseException {
        Huiyuan huiyuan1 = (Huiyuan) request.getSession().getAttribute("huiyuan");
        //拼接地址，省市区不做分开保存
        huiyuan.setAddress(huiyuan.getProvince()+huiyuan.getCity()+huiyuan.getArea());
        ResultDto resultDto = new ResultDto();
        SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd");
        huiyuan.setSr(sdf.parse(huiyuan.getSrup()));
        huiyuan1.setUserName(huiyuan.getUserName());
        huiyuan1.setXingming(huiyuan.getXingming());
        huiyuan1.setXingbie(huiyuan.getXingbie());
        huiyuan1.setSr(huiyuan.getSr());
        huiyuan1.setSchool(huiyuan.getSchool());
        //调用service保存，根据id修改
        huiyuanCenterService.save(huiyuan);
        resultDto.setCode("1");
        return  "redirect:/personCenter/PersonInformation";
    }
    //跳转到消息
    @RequestMapping(value = "fbsp")
    public String fbsp(HttpServletRequest request, Model model) {
        Huiyuan huiyuan = (Huiyuan) request.getSession().getAttribute("huiyuan");
        if (huiyuan!=null){
            Huiyuan huiyuan1 = huiyuanCenterService.findUser(huiyuan.getId());
            //获取分类
            List<Leibie> leibieList=goodsService.getLeibie();
            model.addAttribute("leibieList",leibieList);
            model.addAttribute("huiyuan",huiyuan1);
            model.addAttribute("login","1");
            return "site/personalCenter/fbsp";
        }else{
            String message = "找不到您的登陆信息,请重新登陆!";
            model.addAttribute("message",message);
            return "common/fail";
        }
    }
}