package com.hznu.lwb.persistence;

import java.util.List;

import com.hznu.lwb.model.Letter;
import com.hznu.lwb.model.User;
import com.hznu.lwb.model.param.LetterParam;

public interface LetterDao {

    Integer deleteByPrimaryKey(Integer letterId);

    Integer insert(Letter record);

    List<User> selectRecipientBySender(String senderId);

    List<Letter> selectByBoth(LetterParam letterParam);
}