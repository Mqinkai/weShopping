package com.smj.service.huiyuan;

import com.smj.dao.goods.GoodsDao;
import com.smj.dao.order.OrderDao;
import com.smj.entiy.Address;
import com.smj.entiy.OrderDto;
import com.smj.entiy.goods.TGoods;
import com.smj.entiy.huiyuan.Huiyuan;
import com.smj.entiy.huiyuan.Order;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javax.servlet.http.HttpServletRequest;
import java.text.SimpleDateFormat;
import java.util.Date;

/**
 * Created by Administrator on 2018/5/22.
 */
@Service
public class PayService {
    @Autowired
    private OrderDao orderDao;
    @Autowired
    private GoodsDao goodsDao;
    @Autowired
    private HttpServletRequest request;
    @Autowired
    private AddressService addressService;
    public void saveOrder (String id, String addressId) throws Exception {
        Huiyuan huiyuan = (Huiyuan) request.getSession().getAttribute("huiyuan");
        //生成订单
        OrderDto order = new OrderDto();
        Date date = new Date();
        SimpleDateFormat formatter = new SimpleDateFormat("yyyyMMddHHmmss");
        String strDate = formatter.format(date);
        order.setBianhao(strDate+"000");
        SimpleDateFormat formatter2 = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        order.setXiadanshi(formatter2.format(date));
        order.setZt("待发货");
        //根据id查询收货地址
        //Address address = addressService.findById(addressId);
        //收货地址保存地址id
        order.setSonghuodizhi(addressId);
        //查询商品信息
        TGoods goods = goodsDao.findByid(id);
        order.setFukuanfangshi(goods.getFkfs());
        order.setZongjia(String.valueOf(goods.getJiage()));
        order.setHuiyuanId(huiyuan.getId());
        //插入订单
         orderDao.insertOrder(order);
        String orderId = orderDao.findId();
        //插入订单明细
        orderDao.inserDetail(String.valueOf(orderId),id);
        //修改物品状态
        goodsDao.updateGoods(id);

    }
}
