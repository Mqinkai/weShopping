package com.smj.dao.huiyuan;

import com.smj.common.config.MyBatisDao;
import com.smj.common.dto.ResultDto;
import com.smj.entiy.huiyuan.Huiyuan;
import org.apache.ibatis.annotations.Param;

/**
 * Created  on 2018/2/23.
 */
@MyBatisDao
public interface HuiYuanRegDao {
    int reg(Huiyuan huiyuan);

    int findByEmail(Huiyuan huiyuan);

    int findByTel(Huiyuan huiyuan);

    String findByEorT(Huiyuan huiyuan);

    void changeP(@Param("id") String id, @Param("password") String password);
}
