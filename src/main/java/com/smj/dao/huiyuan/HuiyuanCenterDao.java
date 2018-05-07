package com.smj.dao.huiyuan;

import com.smj.common.config.MyBatisDao;
import com.smj.entiy.huiyuan.Huiyuan;
import com.smj.entiy.huiyuan.Order;
import org.apache.ibatis.annotations.Param;

/**
 * Created by Administrator on 2018/4/7.
 */
@MyBatisDao
public interface HuiyuanCenterDao {
    Order findOrder(String id);

    void save(@Param("rePath") String rePath, @Param("id") String id);

    Huiyuan findUser(String id);
}
