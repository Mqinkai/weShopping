package com.smj.dao.huiyuan;

import com.smj.common.config.MyBatisDao;
import com.smj.entiy.Notice;

/**
 * Created by Qinkai on 2018/5/22.
 */
@MyBatisDao
public interface NoticeDao {
    Notice findNotice(String id);
}
