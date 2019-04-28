package com.teamnine.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.teamnine.bean.Forum;
import com.teamnine.dao.ForumMapper;

@Service
public class ForumService {

	@Autowired
	ForumMapper forumMapper;

	/**
	 * Query forum information (unconditional)
	 * @return
	 */
	public List<Forum> getForum() {
		
		return forumMapper.selectAll();
	}

	/**
	 * Add forum information
	 * @param forum
	 */
	public void setForum(Forum forum) {
		
		forumMapper.insert(forum);
	}

	public List<Forum> getForumName(Forum forum) {
			
		return forumMapper.selectByAdminName(forum);
	}

	/**
	 * Delete the forum info by bid
	 * @param forum_delete
	 */
	public void deleteForum(Forum forum_delete) {

		forumMapper.deleteByPrimaryKey(forum_delete.getBid());
	}

	/**
	 * Update the forum
	 * @param forum
	 */
	public void updateForum(Forum forum) {
		
		forumMapper.updateByPrimaryKey(forum);
	}
	
}
