package com.teamnine.controller;

import java.text.DecimalFormat;
import java.util.Collections;
import java.util.Comparator;
import java.util.List;

import com.teamnine.bean.Ranking;
import com.teamnine.service.RankingService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@RequestMapping("/rankingController")
@Controller
public class RankingController {

    @Autowired
    RankingService rankingService;

    @RequestMapping("/getRanking")
    public ModelAndView getRanking() {
        ModelAndView mav = new ModelAndView();
        List<Ranking> rs = rankingService.getRanking();

        sortList(rs);

        // redirect property
        mav.addObject("rs", rs);
        // jsp path
        mav.setViewName("ranking");

        return mav;
    }

    private void sortList(List<Ranking> rs) {

        for (int i = 0; i < rs.size(); i++) {

            int level = rs.get(i).getLevel();
            double total = rs.get(i).getTotal();
            double studytime = rs.get(i).getTime();

            // For the test record
            int postnum = rs.get(i).getPostnum();
            int follownum = rs.get(i).getFollownum();
            if (postnum == 1 && follownum == 0) {
                total = 0.5;
                rs.get(i).setTotal(total);
                rankingService.updateRankingTotal(total, rs.get(i).getUserid());
            }

            // Round the double up to 2 decimals
            DecimalFormat df = new DecimalFormat("0.00");
            rs.get(i).setTime(Double.parseDouble(df.format(studytime)));
            rs.get(i).setTotal(Double.parseDouble(df.format(total)));
            rankingService.updateRankingTime(Double.parseDouble(df.format(studytime)),
                    rs.get(i).getUserid());
            rankingService.updateRankingTotal(Double.parseDouble(df.format(total)),
                    rs.get(i).getUserid());


            level = (int) (total / 10.0);
            rs.get(i).setLevel(level);
            rankingService.updateRankingLevel(level, rs.get(i).getUserid());

            Collections.sort(rs, new Comparator<Ranking>() {
                public int compare(Ranking o1, Ranking o2) {
                    return Double.compare(o2.getTotal(), o1.getTotal());
                }
            });
        }
    }
}
