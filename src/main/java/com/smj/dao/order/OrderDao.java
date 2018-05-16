package com.smj.dao.order;

import com.smj.common.config.MyBatisDao;

/**
 * Created by Administrator on 2018/5/16.
 */
@MyBatisDao
public interface OrderDao {
    void qrsh(String id);
}
