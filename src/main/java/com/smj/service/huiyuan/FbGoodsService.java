package com.smj.service.huiyuan;

import com.smj.dao.huiyuan.FbGoodsDao;
import com.smj.entiy.goods.Leibie;
import com.smj.entiy.goods.TGoods;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * Created by Administrator on 2018/5/19.
 */
@Service
public class FbGoodsService {
    @Autowired
    private FbGoodsDao fbGoodsDao;
    public List<Leibie> findLbie(String leibieid) {
        return fbGoodsDao.findLbie(leibieid);
    }

    public void updata(TGoods tGoods) {
        fbGoodsDao.updata(tGoods);
    }

    public void findSchool(TGoods tGoods) throws Exception {
      String i = fbGoodsDao.findaddress(tGoods.getFbid());
        if (i!=null && !i.equals("")){

        }else {
            throw new Exception("个人信息为完善,不能发布商品！");
        }
    }
}
