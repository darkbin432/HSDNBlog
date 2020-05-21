package com.hznu.lwb.service;

import com.hznu.lwb.model.Letter;
import com.hznu.lwb.model.param.LetterParam;
import com.hznu.lwb.model.result.ApiResult;

public interface ILetterService {

    ApiResult insert(Letter letter);

    ApiResult delete(Integer letterId);

    ApiResult selectRecipientBySender(String senderId);

    ApiResult selectByBoth(LetterParam letterParam);
}
