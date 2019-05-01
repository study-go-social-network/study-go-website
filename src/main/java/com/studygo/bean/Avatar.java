package com.studygo.bean;

public class Avatar {
    private Integer userid;

    private String photo;

    public Integer getUserid() {
        return userid;
    }

    public void setUserid(Integer userid) {
        this.userid = userid;
    }

    public String getPhoto() {
        return photo;
    }

    public void setPhoto(String photo) {
        this.photo = photo == null ? null : photo.trim();
    }

	public Avatar() {
		super();
	}

	public Avatar(Integer userid, String photo) {
		super();
		this.userid = userid;
		this.photo = photo;
	}

	@Override
	public String toString() {
		return "Avatar [userid=" + userid + ", photo=" + photo + "]";
	}
    
}