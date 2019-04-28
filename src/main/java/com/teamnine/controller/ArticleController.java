package com.teamnine.controller;

import java.io.File;
import java.io.IOException;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import com.teamnine.bean.Ranking;
import com.teamnine.service.RankingService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.teamnine.bean.Article;
import com.teamnine.bean.Article2;
import com.teamnine.service.ArticleService;
import com.teamnine.service.FavoriteService;
import com.teamnine.service.CommentService;
import com.teamnine.utils.PathUtil;

@RequestMapping("/articleController")
@SessionAttributes(value= {"article_Edit","article_Show"})
@Controller
public class ArticleController {

	@Autowired
	ArticleService articleService;
	@Autowired
	CommentService commentService;
	@Autowired
    FavoriteService favoriteService;
	@Autowired
	RankingService rankingService;
	
	/**
	 * Insert article info (including pic) into the database
	 * 
	 * @param file
	 * @param article2
	 * @return
	 * @throws IOException
	 */
	@RequestMapping("/setArticle")
	public String setArticle(@RequestParam("photo") MultipartFile file, Article2 article2, HttpSession session,HttpServletRequest request)
			throws IOException {
		String projectname;	// project name
		projectname = request.getSession().getServletContext().getRealPath("/");
		projectname=projectname.substring(0,projectname.length()-1);
		if (projectname.indexOf("/")==-1) { // Under non-Linux OS
			projectname = projectname.substring(projectname.lastIndexOf("\\"),projectname.length());
		} else { // Under Linux OS
			projectname = projectname.substring(projectname.lastIndexOf("/"),projectname.length());
		}

		// File (pic) path
		String filePath = PathUtil.getCommonPath()+projectname+PathUtil.getArticlePath();
		// Store the name of newly generated file (not repeated)
		String newFileName = "photo";
		String username=(String) session.getAttribute("username");
		System.out.println(username!=null);
		// Users can only post when they login
		if(username!=null) {
			// Error "int userid = null" when there is no value in it
			int userid = (Integer) session.getAttribute("userid");
			
			// Get the file name and suffix of the uploaded image (get the extension of the original image)
			String fileName = file.getOriginalFilename();
			
			if(!fileName.equals("")) {
				// Generate new file name (not repeated)
				newFileName = UUID.randomUUID() + fileName;
				// Encapsulates the full path to the location of the uploaded file
				File targetFile = new File(filePath, newFileName);
				System.out.println(targetFile);
				// Upload local files to the encapsulated upload file location
				file.transferTo(targetFile);
			}
			
			// Integrate the article2 and photo into the article
			Article article = new Article(article2, newFileName);

			article.setUserid(userid);
			article.setUsername(username);
			article.setStatus(1);

			// Store the article into the database
			articleService.setArticle(article);

			rankingService.updateRankingPostnum(userid);

			double total = rankingService.getRankingTotal(userid);
			total += 0.5;
			rankingService.updateRankingTotal(total, userid);
		}
		
		return "redirect:/index.jsp"; // redirect
	}
	
	/**
	 * Query article info (unconditional)
	 * @param map
	 */
	public void getArticle(Map<Object, Object> map) {

		List<Article> listArticle = articleService.getArticle();
		map.put("listArticle", listArticle);
	}
	
	/**
	 * Fuzzy search by article title (search in the search box)
	 * @param articleTitle
	 * @param map
	 */
	public void getArticleTitle(String articleTitle,Map<Object, Object> map) {

		List<Article> listArticle = articleService.getArticleTitle(articleTitle);
		map.put("listArticle", listArticle);
	}
	
	/**
	 * Query article by its forum
	 * @param bname
	 * @param map
	 */
	public void getArticleBname(String bname, Map<Object, Object> map) {

		List<Article> listArticle = articleService.getArticleBname(bname);
		map.put("listArticle", listArticle);
	}
	

	/**
	 * Delete the article by fid
	 * @param article
	 * @return
	 * @throws IOException 
	 */
	@RequestMapping("/deleteArticle")
	public ModelAndView deleteArticle(Article article,HttpServletRequest request) throws IOException {
		int fid = article.getFid();
		int userid = article.getUserid();
		int count = commentService.getCommentFid(fid).size();

		for(int i=0;i<count;i++) {
			int cid=commentService.getCommentFid(fid).get(0).getCid();
			// Delete the comment below the article (note: delete the comment first and then delete the article)
			commentService.deleteComment(cid);
		}
		
		// Invoke the delete article corresponding to the image method
		articlePhotoDelete(fid,request);
		// Delete the article (database)
		articleService.deleteArticle(fid);
		
		// Delete the favorite info with the id of this article
		favoriteService.deleteFavoriteFid(fid);
		
		// Delete the user's favorite info (by userid)
		favoriteService.deleteFavoriteFid(fid);

		rankingService.updateRankingPostnum(userid);

		double total = rankingService.getRankingTotal(userid);
		total -= 0.5;
		rankingService.updateRankingTotal(total, userid);
		
		// Redirect to the method of getMyself
		return new ModelAndView("redirect:/userController/getMyself");
	}
	
	/**
	 * Get the data from the mycontent.jsp page and save it in a map("article") for the articleEdit.jsp page to use
	 * @param article
	 * @param map
	 * @return
	 */
	@RequestMapping("/getUpdateArticle")
	public String getUpdateArticle(Article article, Map<Object, Object> map) {
		
		map.put("article_Edit", article);
		
		return "redirect:/content/articleEdits.jsp";
	}
	
	/**
	 * Update article table
	 * @param article
	 * @return
	 * @throws IOException 
	 */
	@RequestMapping("/updateArticle")
	public ModelAndView updateArticle(@RequestParam("photo") MultipartFile file, Article2 article2,
									  HttpServletRequest request) throws IOException {
		
		String projectname;	// project name
		projectname = request.getSession().getServletContext().getRealPath("/");
		projectname=projectname.substring(0,projectname.length()-1);
		if (projectname.indexOf("/")==-1) { // under non-Linux OS
			projectname = projectname.substring(projectname.lastIndexOf("\\"),projectname.length());
		} else { // under Linux OS
			projectname = projectname.substring(projectname.lastIndexOf("/"),projectname.length());
		}

		// File (pic) path
		String filePath = PathUtil.getCommonPath()+projectname+PathUtil.getArticlePath();
		
		int fid=article2.getFid();
		
		// Get the file name and suffix of the uploaded image (get the extension of the original image)
		String fileName = file.getOriginalFilename();
		// Generate new file name (not repeated)
		String newFileName = UUID.randomUUID() + fileName;
		// Encapsulates the full path to the location of the uploaded file
		File targetFile = new File(filePath, newFileName);
		System.out.println(targetFile);
		// The full path to upload a local file to encapsulate the location of the uploaded file
		file.transferTo(targetFile);

		// Integrate article2 and photo into the article
		Article article = new Article(article2, newFileName);
		
		// Invoke the delete article method corresponding to the image
		articlePhotoDelete(fid,request);
		// Update post table (database)
		articleService.updateArticle(article);
		
		// Redirect to the method getMyself
		return new ModelAndView("redirect:/userController/getMyself");
	}
	
	
	/**
	 * Delete the picture corresponding to the article
	 * @throws IOException 
	 */
	public void articlePhotoDelete(int fid,HttpServletRequest request) throws IOException {
		
		String projectname;	// project name
		projectname = request.getSession().getServletContext().getRealPath("/");
		projectname=projectname.substring(0,projectname.length()-1);
		if (projectname.indexOf("/")==-1) { // Under non-Linux OS
			projectname = projectname.substring(projectname.lastIndexOf("\\"),projectname.length());
		} else { // Under Linux OS
			projectname = projectname.substring(projectname.lastIndexOf("/"),projectname.length());
		}

		// File (pic) path
		String filePath = PathUtil.getCommonPath()+projectname+PathUtil.getArticlePath();
		
		// Get the file name of the image corresponding to the article to be deleted (get the article info through fid)
		String fileName = articleService.getArticleKey(fid).getPhoto();
		// Encapsulates the full path to the location of the uploaded file
		File targetFile = new File(filePath, fileName);
		
		// Delete the picture corresponding to the article (actual deletion)
		targetFile.delete();
	}
	
	/**
	 * Update the status attribute of the article table (modify the review status)
	 * @return
	 */
	@RequestMapping("/articleStatus")
	public String articleStatus(Article article) {

		articleService.updateArticleStatus(article);

		rankingService.updateRankingPostnum(article.getUserid());

		return "redirect:/admin/index.jsp";
	}
	
	/**
	 * Query article info by fid (article display)
	 * @return
	 */
	@RequestMapping("/getArticleFid")
	public String getArticleFid(Map<Object, Object> map,HttpServletRequest request) {
		
		int fid=Integer.parseInt(request.getParameter("fid"));
		map.put("article_Show",articleService.getArticleKey(fid));
		return "redirect:/content/articleDisplay.jsp";
	}
}
