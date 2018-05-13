package com.smj.dao.huiyuan;

import com.smj.common.config.MyBatisDao;
import com.smj.entiy.Address;
import com.smj.entiy.huiyuan.Huiyuan;
import com.smj.entiy.huiyuan.Order;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * Created by Administrator on 2018/4/7.
 */
@MyBatisDao
public interface HuiyuanCenterDao {
    Order findOrder(String id);

    void save(@Param("rePath") String rePath, @Param("id") String id);

    Huiyuan findUser(String id);

    String findThisUser(Huiyuan huiyuan);

    void savePassword(Huiyuan huiyuan);


    void savePhone(@Param("id") String id, @Param("tel") String tel);

    void saveEmail(@Param("id")String id, @Param("yx")String email);

    List<Address> findAddress(String id);

    void saveinfo(Huiyuan huiyuan);
}
