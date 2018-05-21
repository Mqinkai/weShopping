package com.smj.service.huiyuan;

import com.smj.dao.huiyuan.HuiyuanCenterDao;
import com.smj.entiy.Address;
import com.smj.entiy.Notice;
import com.smj.entiy.OrderDto;
import com.smj.entiy.goods.TGoods;
import com.smj.entiy.huiyuan.Huiyuan;
import com.smj.entiy.huiyuan.Order;
import com.smj.entiy.huiyuan.PingjiaDto;
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

    public List<TGoods> findMyGoods(String id) {
        List<TGoods> goodsList = huiyuanCenterDao.findMyGoods(id);
        return goodsList;
    }

    public List<Notice> getNotice(String id) {
        List<Notice> list = huiyuanCenterDao.getList(id);
        for (Notice notice:list){
            TGoods good = new TGoods();
            good = huiyuanCenterDao.getGoods(notice.getGoodsId());
            notice.setGood(good);
        }
        huiyuanCenterDao.updata(id); //把消息全部置已读
        return list;
    }

    public List<PingjiaDto> getPingjia(String id) {
        List<PingjiaDto> list = huiyuanCenterDao.findPingjia(id);
            return list;
    }
}
