package com.smj.service.huiyuan;

import com.smj.dao.huiyuan.NoticeDao;
import com.smj.dao.order.OrderDao;
import com.smj.entiy.Notice;
import com.smj.entiy.huiyuan.Huiyuan;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javax.servlet.http.HttpServletRequest;
import java.util.Date;

/**
 * Created by Qinkai on 2018/5/22.
 */
@Service
public class NoticeService {
    @Autowired
    private NoticeDao noticeDao;
    @Autowired
    private HttpServletRequest request;
    @Autowired
    private OrderDao orderDao;
    public void send(String id, String message) {
        //根据原消息id获得消息内容
        Notice notice = noticeDao.findNotice(id);
        Huiyuan huiyuan = (Huiyuan) request.getSession().getAttribute("huiyuan");
        String name = huiyuan.getUserName(); //发送人姓名
        notice.setBuyName(name);
        Date date = new Date();
        notice.setDate(date);
        notice.setMessage(message);
        orderDao.insertNotice(notice);
    }

    public void del(String id) {
        orderDao.del(id);
    }
}
