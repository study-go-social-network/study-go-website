package com.teamnine.service;

import java.util.List;

import com.teamnine.bean.Favorite;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.teamnine.dao.FavoriteMapper;

@Service
public class FavoriteService {

	@Autowired
	FavoriteMapper favoriteMapper;
	
	/**
	 * Query favorite information (unconditional)
	 * @return
	 */
	public List<Favorite> getFavorite() {
		
		return favoriteMapper.selectByFavorite();
	}

	/**
	 * Delete the favorite (by sid)
	 * @param favorite
	 */
	public void deleteFavorite(Favorite favorite) {
		
		favoriteMapper.deleteByFavorite(favorite);
	}

	/**
	 * Add the favorite
	 * @param favorite
	 */
	public void setFavorite(Favorite favorite) {
		
		favoriteMapper.insert(favorite);
	}

	/**
	 * Query the favorite info by userid (which articles are favorite)
	 * @param userid
	 * @return
	 */
	public List<Favorite> getFavorite(int userid) {

		return favoriteMapper.selectByFavoriteUserid(userid);
	}

	/**
	 * Delete the favorite (by userid and fid)
	 * @param favorite
	 */
	public void deleteFavoriteByUseridAndFid(Favorite favorite) {
		
		favoriteMapper.deleteFavoriteByUseridAndFid(favorite);
	}

	/**
	 * Delete the favorite info by fid
	 * @param fid
	 */
	public void deleteFavoriteFid(int fid) {
		
		favoriteMapper.deleteByFavoriteByFid(fid);
	}

	/**
	 * Delete the favorite info corresponding to the user (by userid)
	 * @param userid
	 */
	public void deleteFavoriteUserid(int userid) {
		
		favoriteMapper.deleteFavoriteUserid(userid);
	}

}
