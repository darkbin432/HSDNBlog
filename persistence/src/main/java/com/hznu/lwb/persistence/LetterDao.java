package com.hznu.lwb.persistence;

import java.util.List;

import com.hznu.lwb.model.Letter;

public interface LetterDao {

    int deleteByPrimaryKey(Integer letterId);

    int insert(Letter record);

    int insertSelective(Letter record);

    Letter selectByPrimaryKey(Integer letterId);

    int updateByPrimaryKeySelective(Letter record);

    int updateByPrimaryKey(Letter record);
}