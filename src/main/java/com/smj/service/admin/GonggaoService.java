package com.smj.service.admin;

import com.smj.dao.admin.GonggaoDao;
import com.smj.entiy.admin.Gonggao;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.Date;
import java.util.List;

/**
 * Created by Qinkai on 2018/5/24.
 */
@Service
public class GonggaoService {
    @Autowired
    private GonggaoDao gonggaoDao;
    public List<Gonggao> getList() {
        return gonggaoDao.getList();
    }

    public void delgonggao(String id) {
        gonggaoDao.delgonggao(id);
    }

    public void save(Gonggao gonggao) {
        Date date = new Date();
        gonggao.setSaveDate(date);

        gonggaoDao.inset(gonggao);
    }
}
