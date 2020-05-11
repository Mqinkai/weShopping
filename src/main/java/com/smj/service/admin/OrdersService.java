package com.smj.service.admin;

import com.smj.dao.order.OrderDao;
import com.smj.entiy.OrderDto;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * Created by on 2018/5/29.
 */
@Service
public class OrdersService {
@Autowired
private OrderDao orderDao;
    public List<OrderDto> findList() {
            return orderDao.findList();
    }

    public void del(String id) {
        orderDao.delorder(id);
    }
}

