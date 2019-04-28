package com.teamnine.controller;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import com.teamnine.bean.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.teamnine.bean.Follow;
import com.teamnine.service.FollowService;
import com.teamnine.service.FavoriteService;
import com.teamnine.service.ForumService;

@RequestMapping("/common")
@SessionAttributes(value={"forum"})
@Controller
public class Common {
	
	@Autowired
	ForumController forumController;
	@Autowired
	UserController userController;
	@Autowired
	ArticleController articleController;
	@Autowired
	CommentController commentController;
	@Autowired
	ForumService forumService;
	@Autowired
	FollowService followService;
	@Autowired
	FavoriteService favoriteService;
	
	/**
	 * Query output all information of the first page (excluding head)
	 * @return
	 */
	@RequestMapping("/getAll")
	public String getAll(Map<Object, Object> map,Map<Object, Object> map2) {
		
		articleController.getArticle(map);
		List<Article> listArticle=(List<Article>) map.get("listArticle");
		int count=listArticle.size();
		
		for(int i=0;i<count;i++) {
			
			// Separate the id for each article
			int fid=listArticle.get(i).getFid();
			System.out.println(fid);
			// To find out the corresponding comment info through the id of each article
			commentController.getCommentFid(fid, map);
			// Place the corresponding comment info found in the previous step in the listComment
			List<Comment> listComment =  (List<Comment>) map.get("listComment");
			System.out.println(listComment);
			
			// The map is preset with a key that changes with the post id
			String listCommentFid="listComment_"+fid;
			// Store all comments corresponding to each article in a map (whose key changes with the post id)
			map.put(listCommentFid, listComment);
			
			// Store the map into map2
			map2.put("map", map);
		}
		
		// Query forum information (unconditional)
		List<Forum> forum = forumService.getForum();
		map.put("forum", forum);
		
		// Query follow information (unconditional)
		List<Follow> follow = followService.getFollow();
		map.put("follow", follow);
		
		// Query favorite information (unconditional)
		List<Favorite> favorite = favoriteService.getFavorite();
		map.put("favorite", favorite);
		
		return "list";
	}
	
	
	/**
	 * Query all information of the admin's home page (excluding head)
	 * @return
	 */
	@RequestMapping("/getAll_Admin")
	public String getAll_Admin(Map<Object, Object> map) {
		
		// Query section information (unconditional)
		forumController.getForum(map);
		// Query user information (unconditional)
		userController.getUser(map);
		// Query post information (unconditional)
		articleController.getArticle(map);
		
		return "admin";
	}
	
	
	/**
	 * Fuzzy query by post title (search box search)
	 * @param request
	 * @param map
	 * @param map2
	 * @return
	 */
	@RequestMapping("/getArticleTitle")
	public String getArticleTitle(HttpServletRequest request,Map<Object, Object> map,Map<Object, Object> map2) {
		articleController.getArticleTitle(request.getParameter("articleTitle"),map);
		List<Article> listArticle=(List<Article>) map.get("listArticle");
		int count=listArticle.size();
		
		for(int i=0;i<count;i++) {
			// Extract the id corresponding to each post separately
			int fid=listArticle.get(i).getFid();
			System.out.println(fid);
			// Find the corresponding comment information by the id of each article
			commentController.getCommentFid(fid, map);
			// Store the corresponding comment information found in the previous step into listComment
			List<Comment> listComment =  (List<Comment>) map.get("listComment");
			System.out.println(listComment);
			
			// Preset a map for the map that changes with the post id
			String listCommentFid="listComment_"+fid;
			// Save all comments corresponding to each post to the map (the key is changed as the post id changes)
			map.put(listCommentFid, listComment);
			
			// Save the map to map2
			map2.put("map", map);
		}
		
		// Query forum information (unconditional)
		List<Forum> forum = forumService.getForum();
		map.put("forum", forum);
		
		return "list";
	}
	
	
	/**
	 * Query the article by the forum
	 * @param request
	 * @param map
	 * @param map2
	 * @return
	 */
	@RequestMapping("/getArticleBname")
	public String getArticleBname(HttpServletRequest request,Map<Object, Object> map,Map<Object, Object> map2) {
		articleController.getArticleBname(request.getParameter("bname"),map);
		List<Article> listArticle=(List<Article>) map.get("listArticle");
		int count=listArticle.size();
		
		for(int i=0;i<count;i++) {
			// Extract the id corresponding to each article separately
			int fid=listArticle.get(i).getFid();
			System.out.println(fid);
			// Find the corresponding comment information by the id of each article
			commentController.getCommentFid(fid, map);
			// Store the corresponding comment information found in the previous step into listComment
			List<Comment> listComment =  (List<Comment>) map.get("listComment");
			System.out.println(listComment);
			
			// Preset a map for the map that changes with the post id
			String listCommentFid="listComment_"+fid;
			// Save all comments corresponding to each article to the map (the key is changed as the post id changes)
			map.put(listCommentFid, listComment);
			
			// Save the map to map2
			map2.put("map", map);
		}
		
		// Query forum information (unconditional)
		List<Forum> forum = forumService.getForum();
		map.put("forum", forum);
		
		return "list";
	}
	
}
