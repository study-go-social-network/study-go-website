package com.studygo.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.studygo.bean.Admin;
import com.studygo.dao.AdminMapper;

@Service
public class AdminService {

	@Autowired
	AdminMapper adminMapper;

	/**
	 * Query admin logged in
	 * 
	 * @param admin
	 * @return
	 */
	public List<Admin> getAdmin(Admin admin) {

		return adminMapper.selectByAdmin(admin);
	}
	
	/**
	 * Query admin by the name
	 * 
	 * @param admin
	 * @return
	 */
	public List<Admin> getAdminName(Admin admin) {

		return adminMapper.selectByAdminName(admin);
	}

	/**
	 * Insert admin (registration)
	 * @param admin
	 */
	public void setAdmin(Admin admin) {

		adminMapper.insert(admin);
	}

}
