package com.studygo.service;

import java.util.List;

import com.studygo.bean.Follow;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.studygo.dao.FollowMapper;

@Service
public class FollowService {

	@Autowired
	FollowMapper followMapper;
	
	/**
	 * Add follow
	 * @param follow
	 */
	public void setFollow(Follow follow) {

		followMapper.insert(follow);
	}

	/**
	 * Query follow info (unconditional)
	 * @return
	 */
	public List<Follow> getFollow() {

		return followMapper.selectByFollow();
	}

	/**
	 * Unfollow (Home page)
	 * @param follow
	 */
	public void deleteFollow(Follow follow) {

		followMapper.deleteByFollow(follow);
	}

	/**
	 * Query follow information by userid
	 * @param userid
	 * @return
	 */
	public List<Follow> getFollow(int userid) {
		
		return followMapper.selectByUserid(userid);
	}
	
	/**
	 * Query be followed info by beuserid
	 * @param userid
	 * @return
	 */
	public List<Follow> getFollowBe(int beuserid) {
		
		return followMapper.selectByBeUserid(beuserid);
	}

	/**
	 * Unfollow (personal homepage)
	 * @param follow
	 */
	public void deleteFollowMyself(Follow follow) {
		
		followMapper.deleteByFollowMyself(follow);
	}

	/**
	 * Delete the follow and be followed information of the user
	 * @param userid
	 */
	public void deleteFollowUseridOrBeUserid(int userid) {
		
		followMapper.deleteFollowUseridOrBeUserid(userid);
	}

}
