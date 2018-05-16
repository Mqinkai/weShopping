package com.smj.service.order;

import com.smj.dao.order.OrderDao;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 * Created by Administrator on 2018/5/16.
 */
@Service
public class OrderService {
    @Autowired
    private OrderDao orderDao;
    public void qrsh(String id) {
        orderDao.qrsh(id);
    }

    public void pj(String id) {

    }
}
