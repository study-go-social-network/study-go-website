package com.studygo.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.studygo.bean.User;
import com.studygo.dao.UserMapper;

@Service
public class UserService {

    @Autowired
    UserMapper userMapper;

    /**
     * Query the user logged in (by name and password)
     *
     * @param user
     * @return
     */
    public List<User> getUser(User user) {

        return userMapper.selectByUser(user);
    }

    /**
     * Query the username (registration)
     *
     * @param user
     * @return
     */
    public List<User> getUserName(User user) {

        return userMapper.selectByUserName(user);
    }

    /**
     * Insert (registration)
     *
     * @param user
     */
    public void setUser(User user) {

        userMapper.insert(user);
    }

    /**
     * Query user information (unconditional)
     *
     * @return
     */
    public List<User> getUser() {

        return userMapper.selectByUserAll();
    }

    /**
     * Query user information by userid
     *
     * @param userid
     * @return
     */
    public List<User> getUserId(int userid) {

        return userMapper.selectByUserId(userid);
    }

    /**
     * Edit profile (update user table)
     *
     * @param user
     */
    public void updateUser(User user) {

        userMapper.updateByPrimaryKey(user);
    }

    /**
     * Delete users
     *
     * @param user
     */
    public void deleteUser(User user) {

        userMapper.deleteByPrimaryKey(user.getUserid());
    }

    /**
     * Update the basic setting info
     *
     * @param user
     */
    public void updateUserSetup(User user) {

        userMapper.updateSetupByPrimaryKey(user);
    }

    /**
     * Query user info by userid
     *
     * @param userid
     * @return
     */
    public User getUserKey(int userid) {

        return userMapper.selectByPrimaryKey(userid);
    }


}
