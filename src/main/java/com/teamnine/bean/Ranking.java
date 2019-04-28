package com.teamnine.bean;

public class Ranking {
    private Integer rid;

    private Integer userid;

    private String username;

    private Double time;

    private Integer rate;

    private Integer postnum;

    private Integer favoritenum;

    private Integer follownum;

    private Integer level;

    private Integer sstime;

    private Double total;

    public Ranking() {
        super();
    }

    public Ranking(Integer rid, Integer userid, String username, Double time, Integer rate, Integer postnum,
                   Integer favoritenum, Integer follownum, Integer level, Integer sstime, Double total) {
        this.rid = rid;
        this.userid = userid;
        this.username = username;
        this.time = time;
        this.rate = rate;
        this.postnum = postnum;
        this.favoritenum = favoritenum;
        this.follownum = follownum;
        this.level = level;
        this.sstime = sstime;
        this.total = total;
    }

    public Integer getRid() {
        return rid;
    }

    public void setRid(Integer rid) {
        this.rid = rid;
    }

    public Integer getUserid() {
        return userid;
    }

    public void setUserid(Integer userid) {
        this.userid = userid;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public Double getTime() {
        return time;
    }

    public void setTime(Double time) {
        this.time = time;
    }

    public Integer getRate() {
        return rate;
    }

    public void setRate(Integer rate) {
        this.rate = rate;
    }

    public Integer getPostnum() {
        return postnum;
    }

    public void setPostnum(Integer postnum) {
        this.postnum = postnum;
    }

    public Integer getFavoritenum() {
        return favoritenum;
    }

    public void setFavoritenum(Integer favoritenum) {
        this.favoritenum = favoritenum;
    }

    public Integer getFollownum() {
        return follownum;
    }

    public void setFollownum(Integer follownum) {
        this.follownum = follownum;
    }

    public Integer getLevel() {
        return level;
    }

    public void setLevel(Integer level) {
        this.level = level;
    }

    public Integer getSstime() {
        return sstime;
    }

    public void setSstime(Integer sstime) {
        this.sstime = sstime;
    }

    public double getTotal() {
        return total;
    }

    public void setTotal(Double total) {
        this.total = total;
    }

    @Override
    public String toString() {
        return "Ranking{" +
                "rid=" + rid +
                ", userid=" + userid +
                ", username='" + username + '\'' +
                ", time=" + time +
                ", rate=" + rate +
                ", postnum=" + postnum +
                ", favoritenum=" + favoritenum +
                ", follownum=" + follownum +
                ", level=" + level +
                ", sstime=" + sstime +
                ", total=" + total +
                '}';
    }
}
