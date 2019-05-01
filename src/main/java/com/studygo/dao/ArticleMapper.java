package com.studygo.dao;

import com.studygo.bean.Article;
import java.util.List;

public interface ArticleMapper {

	// Delete the article table by fid
	int deleteByPrimaryKey(Integer fid);

	// Insert article information to the database
	int insert(Article record);

	int insertSelective(Article record);

	// Query article information (unconditional)
	List<Article> selectByArticle();
	
	// Fuzzy query by article title (search box search)
	List<Article> selectByArticleTitle(String articleTitle);
	
	// Query the article by its forum
	List<Article> selectByArticleBname(String bname);

	// Query the article table info by userid
	List<Article> selectByArticleId(int userid);

	Integer selectUserByArticleId(int fid);

	String selectArticlePhotoByFid(int fid);

	// Query the article table info by fid
	Article selectByPrimaryKey(Integer fid);

	int updateByPrimaryKeySelective(Article record);

	// Update the article table
	int updateByPrimaryKey(Article record);
	
	// Update the status attribute of the article table (update the review status)
	int updateArticleStatus(Article record);

	// Delete the article info corresponding to the user (by userid)
	void deleteByUserid(int userid);

	// Update the username inside the article table
	void updateArticleSetup(Article article);
}