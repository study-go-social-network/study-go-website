package com.studygo.controller;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.studygo.bean.Comment;
import com.studygo.service.CommentService;

@RequestMapping("/commentController")
@Controller
public class CommentController {

	@Autowired
	CommentService commentService;
	
	/**
	 * Query the comment table information by article id (fid)
	 * @param fid
	 * @param map
	 */
	@RequestMapping("/getCommentFid")
	public void getCommentFid(int fid,Map<Object, Object> map) {
		List<Comment> listComment = commentService.getCommentFid(fid);
		map.put("listComment", listComment);
	}
	
	/**
	 * Add the comment
	 * @param comment
	 */
	@RequestMapping("/setComment")
	public String setComment(Comment comment) {
		System.out.println(comment);
		commentService.setComment(comment);
		
		return "redirect:/index.jsp";
	}
	
	/**
	 * Delete the comment table by cid
	 * @return
	 */
	@RequestMapping("/deleteComment")
	public ModelAndView deleteComment(Comment comment) {
		System.out.println(comment);
		commentService.deleteComment(comment.getCid());
		
		// redirect to the method getMyself
		return new ModelAndView("redirect:/userController/getMyself");
	}
}
