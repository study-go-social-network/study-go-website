package com.teamnine.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.teamnine.bean.Article;
import com.teamnine.dao.ArticleMapper;

@Service
public class ArticleService {

	@Autowired
	ArticleMapper articleMapper;

	/**
	 * Insert article info to the database
	 * @param article
	 */
	public void setArticle(Article article) {

		articleMapper.insert(article);
	}

	/**
	 * Query article info (unconditional)
	 * @return
	 */
	public List<Article> getArticle() {

		return articleMapper.selectByArticle();
	}

	/**
	 * Fuzzy query by article title (search box search)
	 * @param articleTitle
	 * @return
	 */
	public List<Article> getArticleTitle(String articleTitle) {

		return articleMapper.selectByArticleTitle(articleTitle);
	}

	/**
	 * Query the article by its forum
	 * @param bname
	 * @return
	 */
	public List<Article> getArticleBname(String bname) {

		return articleMapper.selectByArticleBname(bname);
	}

	/**
	 * Query the article info by userid
	 * @return
	 */
	public List<Article> getArticleId(int userid) {

		return articleMapper.selectByArticleId(userid);
	}

	public Integer getArticleUserId(int fid) {

		return articleMapper.selectUserByArticleId(fid);
	}

	/**
	 * Query the article info by fid
	 * @return
	 */
	public Article getArticleKey(int fid) {

		return articleMapper.selectByPrimaryKey(fid);
	}

	/**
	 * Delete the article by fid
	 * @param fid
	 */
	public void deleteArticle(int fid) {

		articleMapper.deleteByPrimaryKey(fid);
	}

	/**
	 * Update the article table
	 * @param article
	 */
	public void updateArticle(Article article) {

		articleMapper.updateByPrimaryKey(article);
	}

	/**
	 * Update the status attribute of the article table (modify the review status)
	 * @param article
	 */
	public void updateArticleStatus(Article article) {

		articleMapper.updateArticleStatus(article);
	}

	/**
	 * Delete the article info corresponding to the user (by userid)
	 * @param userid
	 */
	public void deleteArticleUserid(int userid) {

		articleMapper.deleteByUserid(userid);
	}

	/**
	 * Update the username of the article table
	 * @param userid
	 */
	public void updateArticleSetup(Article article) {

		articleMapper.updateArticleSetup(article);
	}


}
