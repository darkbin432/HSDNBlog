package com.hznu.lwb.persistence;

import com.hznu.lwb.model.Notice;
import com.hznu.lwb.model.UserViewNoticeKey;

import java.util.List;

public interface NoticeDao {

    Integer deleteByPrimaryKey(Integer noticeId);

    Integer insert(Notice record);

    Integer insertRelation(UserViewNoticeKey userViewNoticeKey);

    Notice selectByPrimaryKey(Integer noticeId);

    Integer updateByPrimaryKeySelective(Notice record);

    List<Notice> selectByAdmin(String userId);

    List<Notice> selectAll();
}