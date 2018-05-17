package com.smj.service.order;

import com.smj.dao.order.OrderDao;
import com.smj.entiy.Notice;
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
    }

    public void pj(String id, String pj) {
        orderDao.insert(id,pj);
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
}
