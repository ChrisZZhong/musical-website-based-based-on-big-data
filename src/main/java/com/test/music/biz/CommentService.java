package com.test.music.biz;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.test.music.domain.po.Comment;

public interface CommentService {
	public List<Comment> getMusicComments(@Param("id")int id);
	public int addComment(@Param("c")Comment c); 
	public void deleteComment(@Param("id") int id);
}
