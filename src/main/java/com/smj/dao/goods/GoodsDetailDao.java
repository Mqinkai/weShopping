package com.smj.dao.goods;

import com.smj.common.config.MyBatisDao;
import com.smj.entiy.goods.TGoods;

/**
 * Created by Qinkai on 2018/5/21.
 */
@MyBatisDao
public interface GoodsDetailDao {
    TGoods findById(String id);

    TGoods findOther(String fbid);
}
