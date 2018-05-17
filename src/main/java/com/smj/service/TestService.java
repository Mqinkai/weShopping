package com.smj.service;

import com.smj.dao.TestDao;
import com.smj.entiy.goods.TGoods;
import com.smj.entiy.huiyuan.Huiyuan;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.ArrayList;
import java.util.List;

/**
 * Created  2018/1/10.
 */
@Service
public class TestService {
    @Autowired
    private TestDao testDao;
    @Autowired
    private HttpSession session;

    @Autowired
    private HttpServletRequest request;
    public List<TGoods> find(String name, String type, String id) {
        List<TGoods> list = new ArrayList<TGoods>();
        if (type != null && !type .equals("") && id != null && !id.equals("")){
            //获取用户所在学校，用于sql查询
            if (type.equals("1")){
                String school = testDao.findSchool(id);
                if (school != null && !school .equals("")){
                    type = school;
                }else {
                    type = "";
                }
                //如果用户学校没填，查询全部
                list = testDao.findBySchool(name,type);
            }else {
                int t = Integer.valueOf(type);
                list= testDao.findByType(id,name,t);
            }
        }else {
            list= testDao.find(name);
        }

        return list;
    }
}
