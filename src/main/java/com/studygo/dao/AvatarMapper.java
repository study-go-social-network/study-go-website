package com.studygo.dao;

import com.studygo.bean.Avatar;

public interface AvatarMapper {

    // Delete the avatar info corresponding to the user.
    int deleteByPrimaryKey(Integer userid);

    // Upload user avatar (insert)
    int insert(Avatar record);

    int insertSelective(Avatar record);

    // Query user information by userid
    Avatar selectByPrimaryKey(Integer userid);

    int updateByPrimaryKeySelective(Avatar record);

    // Update user avatar information by userid
    int updateByPrimaryKey(Avatar record);
}