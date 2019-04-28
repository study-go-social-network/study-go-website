package com.teamnine.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.teamnine.bean.Avatar;
import com.teamnine.dao.AvatarMapper;

@Service
public class AvatarService {

	@Autowired
	AvatarMapper avatarMapper;

	/**
	 * Query user avatar info by userid
	 * @param userid
	 * @return
	 */
	public Avatar getAvatar(int userid) {

		return avatarMapper.selectByPrimaryKey(userid);
	}

	/**
	 * Upload user avatar (insert)
	 * 
	 * @param avatar
	 */
	public void setUserPhoto(Avatar avatar) {

		avatarMapper.insert(avatar);
	}

	/**
	 * Update user avatar info by userid
	 * @param avatar
	 */
	public void updateAvatar(Avatar avatar) {
		
		avatarMapper.updateByPrimaryKey(avatar);
	}

	/**
	 * Delete the avatar info corresponding to the user
	 * @param userid
	 */
	public void deleteAvatar(Integer userid) {
		
		avatarMapper.deleteByPrimaryKey(userid);
	}

}
