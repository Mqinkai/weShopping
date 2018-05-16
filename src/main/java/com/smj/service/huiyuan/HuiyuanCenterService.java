package com.smj.service.huiyuan;

import com.smj.dao.huiyuan.HuiyuanCenterDao;
import com.smj.entiy.Address;
import com.smj.entiy.OrderDto;
import com.smj.entiy.goods.TGoods;
import com.smj.entiy.huiyuan.Huiyuan;
import com.smj.entiy.huiyuan.Order;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

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

    public String findHUser(Huiyuan huiyuan) {
        return huiyuanCenterDao.findThisUser(huiyuan);
    }

    public void savePassword(Huiyuan huiyuan) {
        huiyuanCenterDao.savePassword(huiyuan);
    }

    public void savePhone(String id, String tel) {
        huiyuanCenterDao.savePhone(id,tel);
    }

    public void saveEmail(String id, String email) {
        huiyuanCenterDao.saveEmail(id,email);

    }

    public List<Address> findAddress(String id) {
        return huiyuanCenterDao.findAddress(id);
    }

    public void save(Huiyuan huiyuan) {
        huiyuanCenterDao.saveinfo(huiyuan);
    }

    public List<OrderDto> findOrderList(String id) {
        List<OrderDto> list = huiyuanCenterDao.findOrderList(id);
        for (OrderDto order:list){
            List<TGoods> goodsList = huiyuanCenterDao.findOrderDetail(order.getId());
            order.setGoodsList(goodsList);
        }

        return list;
    }
}
