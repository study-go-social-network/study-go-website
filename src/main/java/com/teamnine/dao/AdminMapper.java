package com.teamnine.dao;

import com.teamnine.bean.Admin;
import java.util.List;

public interface AdminMapper {

    // Delete the admin table by aid
    int deleteByPrimaryKey(Integer aid);

    // Administrator registration, query by name
    int insert(Admin record);

    int insertSelective(Admin record);

    // Administrator login query
    List<Admin> selectByAdmin(Admin admin);
    
    // Administrator registration by name
    List<Admin> selectByAdminName(Admin admin);
    
    Admin selectByPrimaryKey(Integer aid);

    int updateByPrimaryKeySelective(Admin record);

    int updateByPrimaryKey(Admin record);
}