package com.smj.dao.order;

import com.smj.common.config.MyBatisDao;
import com.smj.entiy.Notice;
import org.apache.ibatis.annotations.Param;

/**
 * Created by Administrator on 2018/5/16.
 */
@MyBatisDao
public interface OrderDao {
    void qrsh(String id);

    void insert(@Param("id") String id, @Param("pj") String pj);

    void delorder(String id);

    Notice findname(String id);

    void insertNotice(Notice notice);
}
