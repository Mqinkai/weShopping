package com.smj.service.admin;

import com.smj.dao.admin.HuiyuanGLDao;
import com.smj.entiy.huiyuan.Huiyuan;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * Created by  on 2018/5/28.
 */
@Service
public class HuiyuanGLService {
    @Autowired
    private HuiyuanGLDao huiyuanGLDao;
    public List<Huiyuan> getList() {
        return huiyuanGLDao.getList();
    }


    public void setOpen(String id) {
        huiyuanGLDao.open(id);
    }

    public void close(String id) {
        huiyuanGLDao.close(id);
    }

    public void admin(String id) {
        huiyuanGLDao.admin(id);
    }

    public void qxadmin(String id) {
        huiyuanGLDao.qxadmin(id);
    }
}
