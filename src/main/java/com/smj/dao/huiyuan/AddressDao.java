package com.smj.dao.huiyuan;

import com.smj.common.config.MyBatisDao;
import com.smj.entiy.Address;


/**
 * Created by Administrator on 2018/5/13.
 */
@MyBatisDao
public interface AddressDao {
    void save(Address address);

    void updata(Address address);

    void updataDel(String id);

    void updataMoren();

    void ChangeMoren(String id);

    void updateUser(String userId);
}
