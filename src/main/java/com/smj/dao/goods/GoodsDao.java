package com.smj.dao.goods;

import com.smj.common.config.MyBatisDao;
import com.smj.common.dto.ResultDto;
import com.smj.entiy.goods.Leibie;
import com.smj.entiy.goods.LeibieXiashu;
import com.smj.entiy.goods.TGoods;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 *  on 2018/1/23.
 */
@MyBatisDao
public interface GoodsDao {
    List<Leibie> getLeibie();

    List<LeibieXiashu> findLeibieXshu(@Param("id") int id);

    String findCar(String id);

    TGoods findByid(String id);

    void updateGoods(String id);

    void del(String id);

    List<TGoods> getList();

    ResultDto getDetail(String id);
}
