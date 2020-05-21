package com.hznu.lwb.persistence;

import com.hznu.lwb.model.Notice;

import java.util.List;

public interface NoticeDao {

    int deleteByPrimaryKey(Integer noticeId);

    int insert(Notice record);

    int insertSelective(Notice record);

    Notice selectByPrimaryKey(Integer noticeId);

    int updateByPrimaryKeySelective(Notice record);

    int updateByPrimaryKey(Notice record);
}