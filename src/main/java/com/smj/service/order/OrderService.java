package com.smj.service.order;

import com.smj.common.dto.ResultDto;
import com.smj.dao.order.OrderDao;
import com.smj.entiy.Address;
import com.smj.entiy.Notice;
import com.smj.entiy.OrderDto;
import com.smj.entiy.huiyuan.Huiyuan;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.Date;

/**
 * Created by Administrator on 2018/5/16.
 */
@Service
public class OrderService {
    @Autowired
    private HttpSession session;

    @Autowired
    private HttpServletRequest request;
    @Autowired
    private OrderDao orderDao;
    public void qrsh(String id) {
        orderDao.qrsh(id);
        orderDao.updateGoods(id);

    }

    public void pj(String id, String pj) {
        orderDao.insert(id,pj);
        //修改原订单及物品状态  orderid
        orderDao.updataOrder(id);
        orderDao.updataGoods(id);
    }

    public void delorder(String id) {
        orderDao.delorder(id);
    }

    public void qxdd(String id) {
        //准备消息数据
        Huiyuan huiyuan = (Huiyuan) request.getSession().getAttribute("huiyuan");
        String name = huiyuan.getUserName(); //发送人姓名
        Notice notice = orderDao.findname(id);
        notice.setMessage("[官方]买家发起取消订单申请，请尽快与买家沟通。");
        notice.setBuyName(name);
        Date date = new Date();
        notice.setDate(date);
        notice.setCode("0");
        notice.setBuyId(huiyuan.getId());
        orderDao.insertNotice(notice);
    }

    public void sendmessage(String message, String goodId, String fbid) {
        //准备消息数据
        Huiyuan huiyuan = (Huiyuan) request.getSession().getAttribute("huiyuan");
        String name = huiyuan.getUserName(); //发送人姓名
        Notice notice = new Notice();
        notice.setSaleid(fbid);
        notice.setCode("0");
        notice.setMessage(message);
        Date date = new Date();
        notice.setDate(date);
        notice.setBuyName(name);
        notice.setBuyId(huiyuan.getId());
        notice.setGoodsId(goodId);
        orderDao.insertNotice(notice);
    }

    public void delOrderByGoodsId(String id) {
        orderDao.delOrderByGoodsId(id);
        //删除商品
        orderDao.delgoods(id);
    }

    public void closeOrderByGoodsId(String id) {
        orderDao.delOrderByGoodsId(id); //删除订单
        //恢复商品状态
        orderDao.uptata(id);
    }

    public void fahuo(String id) {
        orderDao.fahuo(id);
        orderDao.upGoods(id);
    }

    public ResultDto findaddress(String id) {
       // String ordId = orderDao.findOrderId(id);
        OrderDto orderDto = orderDao.findByid(id);
        //根据id查询地址
        Address address = orderDao.findAddressId(orderDto.getSonghuodizhi());
        String str = "姓名："+address.getShName()+"    "+"电话："+address.getShTel()+"     ";
        String str2 = "地址："+address.getSsq()+"    "+address.getXxdz();
        ResultDto resultDto = new ResultDto();
        resultDto.setCode(str);
        resultDto.setMessage(str2);
        return resultDto;
    }
}
