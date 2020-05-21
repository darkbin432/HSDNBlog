package com.hznu.lwb.persistence;

import com.hznu.lwb.model.Notice;

import java.util.List;

public interface NoticeDao {

    Integer deleteByPrimaryKey(Integer noticeId);

    Integer insert(Notice record);

    Integer insertSelective(Notice record);

    Notice selectByPrimaryKey(Integer noticeId);

    Integer updateByPrimaryKeySelective(Notice record);

    Integer updateByPrimaryKey(Notice record);
}