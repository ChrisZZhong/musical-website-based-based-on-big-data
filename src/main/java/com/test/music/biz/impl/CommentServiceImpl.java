package com.test.music.biz.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.stereotype.Service;

import com.test.music.biz.CommentService;
import com.test.music.dao.CommentMapper;
import com.test.music.domain.po.Comment;

@Service("CommentServie")
@Repository
public class CommentServiceImpl implements CommentService {
	@Autowired
	CommentMapper commentMapper;

	@Override
	public List<Comment> getMusicComments(int id) {

		return commentMapper.getMusicComments(id);
	}

	@Override
	public int addComment(Comment c) {
		return commentMapper.addComment(c);

	}

	@Override
	public void deleteComment(int id) {
		// TODO Auto-generated method stub
		commentMapper.deleteComment(id);
	}

}
