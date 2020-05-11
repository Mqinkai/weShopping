package com.smj.dao.huiyuan;

import com.smj.common.config.MyBatisDao;
import com.smj.entiy.goods.Leibie;
import com.smj.entiy.goods.TGoods;

import java.util.List;

/**
 * Created by Administrator on 2018/5/19.
 */
@MyBatisDao

public interface FbGoodsDao {
    List<Leibie> findLbie(String leibieid);

    void updata(TGoods tGoods);

    String findaddress(String fbid);
}
