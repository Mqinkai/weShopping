package com.smj.dao.admin;

import com.smj.common.config.MyBatisDao;
import com.smj.entiy.huiyuan.Huiyuan;

import java.util.List;

/**
 * Created by Qinkai on 2018/5/28.
 */
@MyBatisDao
public interface HuiyuanGLDao {
    List<Huiyuan> getList();

    void open(String id);

    void close(String id);

    void admin(String id);

    void qxadmin(String id);
}
