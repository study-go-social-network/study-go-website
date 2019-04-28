package com.teamnine.controller;

import com.teamnine.bean.Follow;
import com.teamnine.service.RankingService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.teamnine.service.FollowService;

@RequestMapping("/followController")
@Controller
public class FollowController {

	@Autowired
	FollowService followService;
	@Autowired
	RankingService rankingService;
	
	/**
	 * Follow
	 * @return
	 */
	@RequestMapping("/setFollow")
	public String setFollow(Follow follow) {
		
		followService.setFollow(follow);
		rankingService.updateRankingFollownum(follow.getBeuserid());

		double total = rankingService.getRankingTotal(follow.getBeuserid());
		total += 0.5;
		rankingService.updateRankingTotal(total, follow.getBeuserid());

		return "redirect:/index.jsp"; // redirect
	}
	
	
	/**
	 * Unfollow (home page)
	 * @param follow
	 * @return
	 */
	@RequestMapping("/deleteFollow")
	public String deleteFollow(Follow follow) {

		int beuserid = follow.getBeuserid();
		followService.deleteFollow(follow);
		rankingService.updateRankingFollownum(beuserid);

		double total = rankingService.getRankingTotal(beuserid);
		total -= 0.5;
		rankingService.updateRankingTotal(total, beuserid);

		return "redirect:/index.jsp";
	}
	
	/**
	 * Unfollow (personal home page)
	 * @param follow
	 * @return
	 */
	@RequestMapping("/deleteFollowMyself")
	public ModelAndView deleteFollowMyself(Follow follow) {

		int beuserid = follow.getBeuserid();
		followService.deleteFollowMyself(follow);
		rankingService.updateRankingFollownum(beuserid);

		double total = rankingService.getRankingTotal(beuserid);
		total -= 0.5;
		rankingService.updateRankingTotal(total, beuserid);

		return new ModelAndView("redirect:/userController/getMyself");
	}
	
	
}
