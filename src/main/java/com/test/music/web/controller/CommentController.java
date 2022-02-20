package com.test.music.web.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.test.music.biz.CommentService;
import com.test.music.domain.po.Comment;

@Controller
public class CommentController {
	@Autowired
	private CommentService commentService;

	@Autowired
	private HttpServletRequest request;

	@RequestMapping(value = "/comment", method = RequestMethod.GET)
	public ModelAndView toComment() {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("comment");
		return mv;
	}

	@RequestMapping(value = "/comment", method = RequestMethod.POST)
	public ModelAndView doComment() {
		Comment curComment = new Comment(Integer.parseInt(request.getParameter("user_id")),
				Integer.parseInt(request.getParameter("music_id")), request.getParameter("context"),
				request.getParameter("username"));

		ModelAndView mv = new ModelAndView();

		commentService.addComment(curComment);

		mv.setViewName("redirect:/music?id=" + request.getParameter("music_id"));
		return mv;
	}

	@RequestMapping(value = "/deleteComment", method = RequestMethod.GET)
	public ModelAndView doDelete() {

		ModelAndView mv = new ModelAndView();

		commentService.deleteComment(Integer.parseInt(request.getParameter("comment_id")));
		mv.setViewName("redirect:/music?id=" + request.getParameter("music_id"));
		return mv;
	}
}