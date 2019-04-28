package com.teamnine.dao;

import java.util.List;

import com.teamnine.bean.Follow;

public interface FollowMapper {

    // Delete follow info (by gid)
    void deleteByFollow(Follow record);
    
    // Delete follow information (by userid and beuserid)
    void deleteByFollowMyself(Follow record);

    // Insert follow info
    void insert(Follow record);

    // Query follow info by userid
    List<Follow> selectByUserid(Integer userid);
    
    // Query follow info by beuserid
  	List<Follow> selectByBeUserid(int beuserid);

    // Query follow info (unconditional)
	List<Follow> selectByFollow();

	// Delete the follow and be followed info of the user
	void deleteFollowUseridOrBeUserid(int userid);
}
