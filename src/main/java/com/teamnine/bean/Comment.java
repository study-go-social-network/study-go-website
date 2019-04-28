package com.teamnine.bean;

public class Comment {
    private Integer cid;

    private String pcontent;

    private Integer userid;

    private Integer fid;

    private String time;
    
    // Username
    private String name;

    public Comment() {
		super();
	}

	public Comment(Integer cid, String pcontent, Integer userid, Integer fid, String time) {
		super();
		this.cid = cid;
		this.pcontent = pcontent;
		this.userid = userid;
		this.fid = fid;
		this.time = time;
	}

	public Integer getCid() {
        return cid;
    }

    public void setCid(Integer cid) {
        this.cid = cid;
    }

    public String getPcontent() {
        return pcontent;
    }

    public void setPcontent(String pcontent) {
        this.pcontent = pcontent == null ? null : pcontent.trim();
    }

    public Integer getUserid() {
        return userid;
    }

    public void setUserid(Integer userid) {
        this.userid = userid;
    }

    public Integer getFid() {
        return fid;
    }

    public void setFid(Integer fid) {
        this.fid = fid;
    }

    public String getTime() {
        return time;
    }

    public void setTime(String time) {
        this.time = time.substring(0,time.length()-2);
    }

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	@Override
	public String toString() {
		return "Comment [cid=" + cid + ", pcontent=" + pcontent + ", userid=" + userid + ", fid=" + fid + ", time="
				+ time + ", name=" + name + "]";
	}
    
}