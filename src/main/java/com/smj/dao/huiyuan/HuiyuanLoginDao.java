package com.smj.dao.huiyuan;

import com.smj.common.config.MyBatisDao;
import com.smj.entiy.huiyuan.Huiyuan;

/**
 * Created on 2018/3/14.
 */
@MyBatisDao
public interface HuiyuanLoginDao {
    Huiyuan findHuiyuan(Huiyuan huiyuan);
}
