package com.test.music.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import com.test.music.domain.po.Comment;

@Repository
public interface CommentMapper {
	public List<Comment> getMusicComments(@Param("id") int id);

	public int addComment(@Param("c") Comment c);

	public void deleteComment(@Param("id") int id);

}
