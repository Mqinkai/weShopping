package com.smj.service.huiyuan;

import com.smj.dao.huiyuan.HuiyuanCenterDao;
import com.smj.entiy.huiyuan.Huiyuan;
import com.smj.entiy.huiyuan.Order;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 * Created by Administrator on 2018/4/7.
 */
@Service
public class HuiyuanCenterService {
    @Autowired
    private HuiyuanCenterDao huiyuanCenterDao;
    public Order findOrder(String id) {
        return huiyuanCenterDao.findOrder(id);
    }

    public void saveImage(String rePath, String id) {

        huiyuanCenterDao.save(rePath,id);
    }

    public Huiyuan findUser(String id) {
            return huiyuanCenterDao.findUser(id);
    }
}
