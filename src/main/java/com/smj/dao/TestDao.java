package com.smj.dao;

import com.smj.common.config.MyBatisDao;
import com.smj.entiy.goods.TGoods;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * Created by Qinkai on 2018/1/10.
 */
@MyBatisDao
public interface TestDao {
    List<TGoods> find(@Param("name") String name);

    String findSchool(String id);

    List<TGoods> findBySchool(@Param("name") String name, @Param("type") String type);

    List<TGoods> findByType(@Param("id") String id, @Param("name") String name, @Param("type") int type);

    List<TGoods> findByLeibie(String leibieList);

    List<TGoods> findByleibieXiashus(String leibieXiashus);
}
