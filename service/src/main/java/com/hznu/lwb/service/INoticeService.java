package com.hznu.lwb.service;

import com.hznu.lwb.model.Notice;
import com.hznu.lwb.model.UserViewNoticeKey;
import com.hznu.lwb.model.result.ApiResult;

public interface INoticeService {
    ApiResult insertNotice(Notice notice);

    ApiResult insertRelation(UserViewNoticeKey userViewNoticeKey);

    ApiResult deleteNotice(Integer noticeId);

    ApiResult updateNotice(Notice notice);

    ApiResult selectByPrimaryKey(Integer noticeId);

    ApiResult selectByAdmin(String userId);

    ApiResult selectByUser(String userId);
}
