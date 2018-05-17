package com.smj.service.huiyuan;

//import com.smj.common.shoir.UserRealm;

import com.smj.common.dto.ResultDto;
import com.smj.dao.huiyuan.HuiYuanRegDao;
import com.smj.entiy.huiyuan.Huiyuan;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

//import org.apache.shiro.crypto.hash.SimpleHash;

/**
 * Created on 2018/2/23.
 */
@Service
public class HuiYuanRegService {
    @Autowired
    private HuiYuanRegDao huiYuanRegDao;
    /**
     * 会员注册信息保存
     * @param huiyuan
     *
     * */
    public void reg(Huiyuan huiyuan) throws Exception {
        //UserRealm.EncryptUser(huiyuan);

     int i = huiYuanRegDao.reg(huiyuan);
        if (i<0){
            throw new Exception("保存信息失败");
        }
    }

    public void findByEmail(Huiyuan huiyuan) throws Exception {
        int i = huiYuanRegDao.findByEmail(huiyuan);
        if (i>0){
            throw new Exception("邮箱已被注册！");
        }
    }

    public void findeByTel(Huiyuan huiyuan) throws Exception {
        int i = huiYuanRegDao.findByTel(huiyuan);
        if (i>0){
            throw new Exception("手机已被注册！");
        }
    }

    public ResultDto xgmm(Huiyuan huiyuan) {
        ResultDto resultDto = new ResultDto();
        //根据用户名和邮箱、手机号查询是否存在该用户
        String i = huiYuanRegDao.findByEorT(huiyuan);
        if (i != null){
            resultDto.setCode("1");
            resultDto.setMessage(i);
        }else {
            resultDto.setCode("-1");
            resultDto.setMessage("该用户不存在");
        }
                return resultDto;
    }

    public void changP(String id, String password) {
         huiYuanRegDao.changeP(id,password);
    }
}
