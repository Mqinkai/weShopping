package com.smj.dao.huiyuan;

import com.smj.common.config.MyBatisDao;
import com.smj.entiy.huiyuan.Order;

/**
 * Created by Administrator on 2018/4/7.
 */
@MyBatisDao
public interface HuiyuanCenterDao {
    Order findOrder(String id);
}
