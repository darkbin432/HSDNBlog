package com.hznu.lwb.persistence;

import com.hznu.lwb.model.PraiseKey;

import java.util.List;

public interface PraiseDao {

    int deleteByPrimaryKey(PraiseKey key);

    int insert(PraiseKey record);

    int insertSelective(PraiseKey record);
}