package com.teamnine.dao;

import com.teamnine.bean.Comment;
import java.util.List;

public interface CommentMapper {

    // Delete the comment table by cid
    int deleteByPrimaryKey(Integer cid);

    // Delete all comment information corresponding to the user (by userid)
    int deleteByUserid(int userid);
    
    // Add comment
    int insert(Comment record);

    int insertSelective(Comment record);
    
    // Query comment table info by post id (fid)
    List<Comment> selectByCommentFid(int fid);
    
    // Query the fid information of the comment table by user id (userid)
    List<Comment> selectByCommentUserid(int userid);

    Comment selectByPrimaryKey(Integer cid);

    int updateByPrimaryKeySelective(Comment record);

    int updateByPrimaryKey(Comment record);
}