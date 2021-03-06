package com.smj.dao.order;

import com.smj.common.config.MyBatisDao;
import com.smj.entiy.Address;
import com.smj.entiy.Notice;
import com.smj.entiy.OrderDto;
import com.smj.entiy.huiyuan.Order;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * Created by Administrator on 2018/5/16.
 */
@MyBatisDao
public interface OrderDao {
    void qrsh(String id);

    void insert(@Param("id") String id, @Param("pj") String pj);

    void delorder(String id);

    Notice findname(String id);

    void insertNotice(Notice notice);

    void del(String id);

    int insertOrder(OrderDto order);

    void inserDetail(@Param("orderId") String orderId, @Param("id") String id);

    void delOrderByGoodsId(String id);

    void uptata(String id);

    String findId();

    void fahuo(String id);

    void upGoods(String id);

    OrderDto findByid(String id);

    Address findAddressId(String songhuodizhi);

    String findOrderId(String id);

    void updateGoods(String id);

    void updataOrder(String id);

    void updataGoods(String id);

    void delgoods(String id);

    List<OrderDto> findList();
}
