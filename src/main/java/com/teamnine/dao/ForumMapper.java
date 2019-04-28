package com.teamnine.dao;

import com.teamnine.bean.Forum;

import java.util.List;

public interface ForumMapper {

    // Delete forum info by bid
    int deleteByPrimaryKey(Integer bid);

    int insert(Forum record);

    int insertSelective(Forum record);

    Forum selectByPrimaryKey(Integer bid);
    
    // Query all information about the forum
    List<Forum> selectAll();
    
    // Query by forum name
    List<Forum> selectByAdminName(Forum forum);

    int updateByPrimaryKeySelective(Forum record);

    // Update the forum
    int updateByPrimaryKey(Forum record);
}