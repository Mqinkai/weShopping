package com.smj.dao.goods;

import com.smj.common.config.MyBatisDao;
import com.smj.entiy.goods.Leibie;
import com.smj.entiy.goods.LeibieXiashu;
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
}
