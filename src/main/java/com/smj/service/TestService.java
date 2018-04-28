package com.smj.service;

import com.smj.dao.TestDao;
import com.smj.entiy.goods.TGoods;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * Created by Qinkai on 2018/1/10.
 */
@Service
public class TestService {
    @Autowired
    private TestDao testDao;
    public List<TGoods> find() {
         List<TGoods> list= testDao.find();
        return list;
    }
}
