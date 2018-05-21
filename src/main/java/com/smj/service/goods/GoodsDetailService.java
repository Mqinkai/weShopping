package com.smj.service.goods;

import com.smj.dao.goods.GoodsDetailDao;
import com.smj.entiy.goods.TGoods;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 * Created by Qinkai on 2018/5/21.
 */
@Service
public class GoodsDetailService {
    @Autowired
    private GoodsDetailDao goodsDetailDao;
    public TGoods findGoodsById(String id) {
        return goodsDetailDao.findById(id);
    }

    public TGoods findOther(String fbid) {
        return goodsDetailDao.findOther(fbid);
    }
}
