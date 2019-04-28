package com.teamnine.service;

import java.util.List;

import com.teamnine.bean.Ranking;
import com.teamnine.bean.User;
import com.teamnine.dao.RankingMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class RankingService {

    @Autowired
    RankingMapper rankingMapper;

    public void setRanking(User user) {

        rankingMapper.insert(user);
    }

    public List<Ranking> getRanking() {

        return rankingMapper.selectByRankingAll();
    }

    public Double getRankingTotal(int userid) {

        return rankingMapper.selectByRankingTotal(userid);
    }

    public void deleteRankingUserid(int userid) {

        rankingMapper.deleteByPrimaryKey(userid);
    }

    public void updateRankingPostnum(int userid) {

        rankingMapper.updatePostnumByPrimaryKey(userid);
    }

    public void updateRankingFavoritenum(int userid) {

        rankingMapper.updateFavoritenumByPrimaryKey(userid);
    }

    public void updateRankingFollownum(int beuserid) {

        rankingMapper.updateFollownumByPrimaryKey(beuserid);
    }

    public void updateRankingLevel(int level, int userid) {

        rankingMapper.updateLevelByPrimaryKey(level, userid);
    }

    public void updateRankingTime(double time, int userid) {

        rankingMapper.updateTimeByPrimaryKey(time, userid);
    }

    public void updateRankingTotal(double total, int userid) {

        rankingMapper.updateTotalByPrimaryKey(total, userid);
    }
}
