package com.smj.dao;

import com.smj.common.config.MyBatisDao;
import com.smj.entiy.goods.TGoods;

import java.util.List;

/**
 * Created by Qinkai on 2018/1/10.
 */
@MyBatisDao
public interface TestDao {
    List<TGoods> find();
}
