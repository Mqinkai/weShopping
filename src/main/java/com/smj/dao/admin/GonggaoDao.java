package com.smj.dao.admin;

import com.smj.common.config.MyBatisDao;
import com.smj.entiy.admin.Gonggao;

import java.util.List;

/**
 * Created by Qinkai on 2018/5/24.
 */
@MyBatisDao
public interface GonggaoDao {
    List<Gonggao> getList();
}
