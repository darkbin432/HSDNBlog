package com.hznu.lwb.persistence;

import com.hznu.lwb.model.PraiseKey;

public interface PraiseDao {

    Integer deleteByPrimaryKey(PraiseKey key);

    Integer insert(PraiseKey record);

    Integer count(Integer blogId);
}