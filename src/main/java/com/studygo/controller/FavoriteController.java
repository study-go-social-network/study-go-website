package com.studygo.controller;

import com.studygo.bean.Article;
import com.studygo.bean.Favorite;
import com.studygo.service.ArticleService;
import com.studygo.service.RankingService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.studygo.service.FavoriteService;

@RequestMapping("/favoriteController")
@Controller
public class FavoriteController {

	@Autowired
	FavoriteService favoriteService;
	@Autowired
	RankingService rankingService;
	@Autowired
	ArticleService articleService;
	
	
	/**
	 * Delete favorite article (by sid)
	 * @param favorite
	 * @return
	 */
	@RequestMapping("/deleteFavorite")
	public String deleteFavorite(Favorite favorite) {

		int aUserid = articleService.getArticleUserId(favorite.getFid());
		favoriteService.deleteFavorite(favorite);
		rankingService.updateRankingFavoritenum(aUserid);

		double total = rankingService.getRankingTotal(aUserid);
		total -= 0.5;
		rankingService.updateRankingTotal(total, aUserid);

		return "redirect:/index.jsp"; // redirect
	}
	
	/**
	 * Delete favorite article (by userid & fid)
	 * @param favorite
	 * @return
	 */
	@RequestMapping("/deleteFavoriteByUseridAndFid")
	public String deleteFavoriteByUseridAndFid(Favorite favorite) {

		int aUserid = articleService.getArticleUserId(favorite.getFid());
		favoriteService.deleteFavoriteByUseridAndFid(favorite);
		rankingService.updateRankingFavoritenum(aUserid);

		double total = rankingService.getRankingTotal(aUserid);
		total -= 0.5;
		rankingService.updateRankingTotal(total, aUserid);

		return "redirect:../userController/getMyself"; // redirect
	}
	
	/**
	 * Add a favorite
	 * @param favorite
	 * @return
	 */
	@RequestMapping("/setFavorite")
	public String setFavorite(Favorite favorite, Article article) {
		
		int aUserid = articleService.getArticleUserId(favorite.getFid());
		favoriteService.setFavorite(favorite);
		rankingService.updateRankingFavoritenum(aUserid);

		double total = rankingService.getRankingTotal(aUserid);
		total += 0.5;
		rankingService.updateRankingTotal(total, aUserid);

		return "redirect:/index.jsp"; // redirect
	}
	
}
