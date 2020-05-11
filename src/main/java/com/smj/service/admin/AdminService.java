package com.smj.service.admin;

import com.smj.dao.admin.AdminDao;
import com.smj.entiy.huiyuan.Huiyuan;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 * Created by Qinkai on 2018/5/24.
 */
@Service
public class AdminService {
    @Autowired
    private AdminDao adminDao;
    public Huiyuan login(Huiyuan huiyuan) throws Exception {
        Huiyuan huiyuan1 = new Huiyuan();
        if (huiyuan.getPassword()!=null && huiyuan.getPassword()!="" && huiyuan.getUserName()!=null && huiyuan.getUserName()!=""){
            huiyuan1= adminDao.findHuiyuan(huiyuan);
            if (huiyuan1!=null){
                return huiyuan1;
            }else {
                throw new Exception("输入的用户名或密码有误！");
            }
        }else {
            throw new Exception("输入的用户名或密码有误！");
        }
    }
}
