package com.studygo.dao;

import java.util.List;

import com.studygo.bean.Favorite;

public interface FavoriteMapper {
	
	// Query favorite info (unconditional)
	List<Favorite> selectByFavorite();

	// Delete the favorite info (by sid)
    void deleteByFavorite(Favorite record);

    // Insert the favorite info
    void insert(Favorite record);

    // Query the favorite info by user id (the favorite article)
	List<Favorite> selectByFavoriteUserid(int userid);

	// Delete the favorite info (by userid & fid)
	void deleteFavoriteByUseridAndFid(Favorite favorite);

	// Delete the favorite info by fid
	void deleteByFavoriteByFid(int fid);

	// Delete the favorite info corresponding to the user (by userid)
	void deleteFavoriteUserid(int userid);

}
