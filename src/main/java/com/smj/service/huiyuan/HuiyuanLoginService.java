package com.smj.service.huiyuan;

import com.smj.dao.huiyuan.HuiyuanLoginDao;
import com.smj.entiy.huiyuan.Huiyuan;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

/**
 * Created  on 2018/3/14.
 */
@Service
public class HuiyuanLoginService {
    @Autowired
    private HttpSession session;

    @Autowired
    private HttpServletRequest request;
    @Autowired
    private HuiyuanLoginDao huiyuanLoginDao;
    public Huiyuan login(Huiyuan huiyuan) throws Exception {
        Huiyuan huiyuan1 = new Huiyuan();
        if (huiyuan.getPassword()!=null && huiyuan.getPassword()!="" && huiyuan.getUserName()!=null && huiyuan.getUserName()!=""){
            huiyuan1= huiyuanLoginDao.findHuiyuan(huiyuan);
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
