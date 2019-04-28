package com.teamnine.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.teamnine.bean.Comment;
import com.teamnine.dao.CommentMapper;

@Service
public class CommentService {
	
	@Autowired
	CommentMapper commentMapper;

	/**
	 * Query comment table info by article id (fid)
	 * @param fid
	 * @return
	 */
	public List<Comment> getCommentFid(int fid) {
		
		return commentMapper.selectByCommentFid(fid);
	}

	/**
	 * Query the fid info of the comment table by user id (userid)
	 * @param userid
	 * @return
	 */
	public List<Comment> getCommentUserid(int userid) {

		return commentMapper.selectByCommentUserid(userid);
	}

	/**
	 * Add the comment
	 * @param comment
	 */
	public void setComment(Comment comment) {

		commentMapper.insert(comment);
	}

	/**
	 * Delete the comment table by cid
	 * @param comment
	 */
	public void deleteComment(int cid) {

		commentMapper.deleteByPrimaryKey(cid);
	}

	/**
	 * Delete all comment info corresponding to the user (by userid)
	 * @param userid
	 */
	public void deleteCommentUserid(int userid) {
		
		commentMapper.deleteByUserid(userid);
	}

	
}
