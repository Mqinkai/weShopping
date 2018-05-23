package com.smj.service.huiyuan;

import com.smj.dao.huiyuan.AddressDao;
import com.smj.entiy.Address;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 * Created by Administrator on 2018/5/13.
 */
@Service
public class AddressService {
    @Autowired
    private AddressDao addressDao;
    public void saveAddress(Address address) {
        addressDao.save(address);
    }

    public void updataAddress(Address address) {
        addressDao.updata(address);
    }

    public void del(String id) {
            addressDao.updataDel(id);
    }

    public void change(String id) {
        addressDao.updataMoren();
        addressDao.ChangeMoren(id);
    }

    public void updateUser(String userId) {
        addressDao.updateUser(userId);
    }

    public Address findById(String addressId) {
        return addressDao.findById(addressId);
    }
}
