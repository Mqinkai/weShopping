package com.smj.service.goods;

import com.smj.dao.goods.GoodsDao;
import com.smj.entiy.goods.Leibie;
import com.smj.entiy.goods.LeibieXiashu;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 *  2018/1/23.
 */
@Service
public class GoodsService {
    @Autowired
    private GoodsDao goodsDao;
    public List<Leibie> getLeibie() {
      //获取所有有效类别
        List<Leibie> leibieList = goodsDao.getLeibie();
        //获取下级类别
        for (Leibie leibie:leibieList){
            List<LeibieXiashu> leibieXiashuList=goodsDao.findLeibieXshu(leibie.getId());
            leibie.setLeibieXiashus(leibieXiashuList);
        }
                return leibieList;
    }

    public String findCar(String id) {
            return goodsDao.findCar(id);
    }
}
