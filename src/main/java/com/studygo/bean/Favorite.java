package com.studygo.bean;

public class Favorite {
	
	private int sid;
	
	private int userid;
	
	private int fid;

	public Favorite() {
		super();
	}

	public Favorite(int sid, int userid, int fid) {
		super();
		this.sid = sid;
		this.userid = userid;
		this.fid = fid;
	}

	public int getSid() {
		return sid;
	}

	public void setSid(int sid) {
		this.sid = sid;
	}

	public int getUserid() {
		return userid;
	}

	public void setUserid(int userid) {
		this.userid = userid;
	}

	public int getFid() {
		return fid;
	}

	public void setFid(int fid) {
		this.fid = fid;
	}

	@Override
	public String toString() {
		return "Favorite [sid=" + sid + ", userid=" + userid + ", fid=" + fid + "]";
	}
}
