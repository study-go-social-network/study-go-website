package com.studygo.controller;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import com.studygo.bean.Forum;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.studygo.service.ForumService;

@Controller
@RequestMapping("/forumController")
/*
 * By adding the @SessionAttributes annotation to the Controller class, the name and value attribute values of the
 * annotation are the key values of the Model.
 * Means that the data corresponding to these keys in the Model will also be stored in the HttpSession,
 * not only in the HttpServletRequest object.
 * This page can share the data stored in the HttpSession
 */
@SessionAttributes(value={"forum","forumEdit"}, types={String.class})
public class ForumController {

	@Autowired
	ForumService forumService;
	
	/**
	 * Query forum information (unconditional)
	 * @param map
	 */
	@RequestMapping("/getforum")
	public void getForum(Map<Object, Object> map) {
		List<Forum> forum = forumService.getForum();
		
		map.put("forum", forum);
		
		System.out.println(forum);
	}
	
	/**
	 * Add forum information
	 * @param forum
	 * @return
	 */
	@RequestMapping("/setForum")
	@ResponseBody
	public String setForum(Map<Object, Object> map,HttpServletRequest request) {
		
		Forum forum_add =new Forum();
		forum_add.setBname(request.getParameter("bname"));
		System.out.println(forumService.getForumName(forum_add));
		if(forumService.getForumName(forum_add).toString().equals("[]")) {
			forumService.setForum(forum_add);
			System.out.println("Adding a forum successfully");
			return "OK";
		} else {
			System.err.println("Adding a forum failed");
			return "NO";
		}
	}
	
	/**
	 * Get the data from the content.jsp page and save it in the map ("forumEdit") for use with the forumEdit.jsp page
	 * @param request
	 * @param map
	 * @return
	 */
	@RequestMapping("/getUpdateForum")
	public String getUpdateForum(HttpServletRequest request,Map<Object, Object> map) {
		
		Forum forum =new Forum();
		forum.setBid(Integer.parseInt(request.getParameter("bid")));
		forum.setBname(request.getParameter("bname"));
		map.put("forumEdit", forum);
		return "redirect:/admin/forumEdit.jsp";
	}
	
	/**
	 * Update the forum
	 * @param forum
	 */
	@RequestMapping("/updateForum")
	@ResponseBody
	public String updateForum(HttpServletRequest request) {
		
		Forum forum =new Forum();
		forum.setBid(Integer.parseInt(request.getParameter("bid")));
		forum.setBname(request.getParameter("bname"));
		if(forumService.getForumName(forum).toString().equals("[]")) {
			forumService.updateForum(forum);
			return "OK";
		}else {
			return "NO";
		}
	}
	
	
	
	/**
	 * Delete info of the forum by bid
	 * @param request
	 * @return
	 */
	@RequestMapping("/deleteForum")
	public String deleteForum(HttpServletRequest request) {
		
		Forum forum_delete =new Forum();
		forum_delete.setBid(Integer.parseInt(request.getParameter("bid")));
		forumService.deleteForum(forum_delete);
		
		return "redirect:/admin/index.jsp"; // redirect
	}
	
	
	
}
