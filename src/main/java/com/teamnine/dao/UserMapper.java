package com.teamnine.dao;

import com.teamnine.bean.User;
import java.util.List;

public interface UserMapper {

    // Delete users
    int deleteByPrimaryKey(Integer userid);

    int insert(User record);

    int insertSelective(User record);

    // Login (query by name and password)
    List<User> selectByUser(User user);
    
    // Registration (query by user name)
    List<User> selectByUserName(User user);
    
    // Query the user information (unconditional)
    List<User> selectByUserAll();
    
    // Query the user by userid
    List<User> selectByUserId(int userid);
    
    // Query the user by userid
    User selectByPrimaryKey(Integer userid);

    int updateByPrimaryKeySelective(User record);
    
    // Edit profile (update user table)
    int updateByPrimaryKey(User record);
    
    // Update basic setting info (update user table)
    int updateSetupByPrimaryKey(User record);
}