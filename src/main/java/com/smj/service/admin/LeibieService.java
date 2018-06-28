package com.smj.service.admin;

import com.smj.common.dto.ResultDto;
import com.smj.dao.admin.LeibieDao;
import com.smj.entiy.goods.Leibie;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * Created by  on 2018/5/25.
 */
@Service
public class LeibieService {
    @Autowired
    private LeibieDao leibieDao;
    public List<Leibie> getList() {
        return leibieDao.getList();
    }

    public void del(String id) {
        leibieDao.del(id);
    }

    public ResultDto tuijian(String id) {
        ResultDto resultDto = new ResultDto();
        leibieDao.tuijian(id);
        //查询推荐条数
        int num = leibieDao.findCount();
        if (num>4){
            resultDto.setCode("-1");
            resultDto.setMessage("推荐已大于四条，页面将根据顺序显示前四条");
        }else {
            resultDto.setCode("1");
        }

        return resultDto;
    }

    public ResultDto qxtj(String id) {
        ResultDto resultDto = new ResultDto();
        //推荐数不能低于3条
        int num = leibieDao.findCount();
        if (num<4){
            resultDto.setCode("-1");
            resultDto.setMessage("已推荐类别不能小于3条");
        }else {
            leibieDao.qxtj(id);
            resultDto.setCode("1");
        }
        return resultDto;
    }

    public void save(Leibie leibie) {
        leibieDao.inset(leibie);
    }

    public List<Leibie> findXiaji(String id) {

        return leibieDao.findLeibieXiashu(id);
    }

    public void delXs(String id) {
        leibieDao.delXs(id);
    }

    public void saveXs(Leibie leibie) {
        leibieDao.insertXs(leibie);
    }
}
