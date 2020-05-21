package com.hznu.lwb.persistence;

import com.hznu.lwb.model.PraiseKey;

import java.util.List;

public interface PraiseDao {

    Integer deleteByPrimaryKey(PraiseKey key);

    Integer insert(PraiseKey record);

    Integer insertSelective(PraiseKey record);
}