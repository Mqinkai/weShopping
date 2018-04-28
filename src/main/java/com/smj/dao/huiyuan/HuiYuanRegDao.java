package com.smj.dao.huiyuan;

import com.smj.common.config.MyBatisDao;
import com.smj.entiy.huiyuan.Huiyuan;

/**
 * Created  on 2018/2/23.
 */
@MyBatisDao
public interface HuiYuanRegDao {
    int reg(Huiyuan huiyuan);

    int findByEmail(Huiyuan huiyuan);

    int findByTel(Huiyuan huiyuan);
}
