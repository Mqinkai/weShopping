package com.smj.dao.admin;

import com.smj.common.config.MyBatisDao;
import com.smj.entiy.huiyuan.Huiyuan;

/**
 * Created by Qinkai on 2018/5/24.
 */
@MyBatisDao
public interface AdminDao {
    Huiyuan findHuiyuan(Huiyuan huiyuan);
}
