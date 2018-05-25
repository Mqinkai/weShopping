package com.smj.dao.admin;

import com.smj.entiy.goods.Leibie;

import java.util.List;

/**
 * Created by Qinkai on 2018/5/25.
 */
public interface LeibieDao {
    List<Leibie> getList();

    void del(String id);

    void tuijian(String id);

    int findCount();

    void qxtj(String id);

    void inset(Leibie leibie);

    List<Leibie> findLeibieXiashu(String id);

    void delXs(String id);

    void insertXs(Leibie leibie);
}
