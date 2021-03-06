package com.smj.service.goods;

import com.smj.common.dto.ResultDto;
import com.smj.dao.goods.GoodsDao;
import com.smj.entiy.goods.Leibie;
import com.smj.entiy.goods.LeibieXiashu;
import com.smj.entiy.goods.TGoods;
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

    public TGoods findGoods(String id) {
        return goodsDao.findByid(id);
    }

    public void del(String id) {
        goodsDao.del(id);
    }

    public List<TGoods> getlist() {
        return goodsDao.getList();
    }

    public ResultDto getDetail(String id) {
        return goodsDao.getDetail(id);
    }

    public void delgoods(String id) {
        //删除商品
        goodsDao.del(id);
        //若有订单，根据商品id删除订单
        goodsDao.delorder(id);
    }
}
