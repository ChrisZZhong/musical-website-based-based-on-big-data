
package com.test.music.web.controller;

import java.io.UnsupportedEncodingException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.test.music.biz.CommentService;
import com.test.music.biz.MusicService;
import com.test.music.biz.PageBeanService;
import com.test.music.biz.UserService;
import com.test.music.domain.po.Comment;
import com.test.music.domain.po.Music;
import com.test.music.domain.po.PageBean;
import com.test.music.domain.po.User;

@Controller
public class MusicController {
	@Autowired
	private HttpServletRequest request;
	private HttpServletResponse response;
	@Autowired
	private HttpSession session;
	@Autowired
	private MusicService musicService;
	@Autowired
	private PageBeanService pageBeanService;
	@Autowired
	private UserService userService;
	@Autowired
	CommentService commentService;

	@RequestMapping(value = "/music", method = RequestMethod.GET)
	public ModelAndView tomusic(int id) {
		ModelAndView mv = new ModelAndView();
		List<Comment> list = commentService.getMusicComments(id);
		mv.addObject("l", list);
		// collect按钮判断情况
		if (session.getAttribute("curUser") != null) {
			int userid = ((User) session.getAttribute("curUser")).getId();
			int iscollect = userService.iscollect(userid, id);
			mv.addObject("iscollect", iscollect);
		}
		List<Music> musics2 = musicService.getMusicsTop100(0, 17);
		mv.addObject("musics2", musics2);
		//
		Music music = musicService.getMusicById(id);
		String musicname = music.getName();
		String lyrics = music.getWords();
		String[] temp = lyrics.split("\n");
		String formattedLyrics = "";
		for (String tmp : temp)
			formattedLyrics += tmp + "<br>";
		music.setWords(formattedLyrics);
		mv.setViewName("music");
		mv.addObject(music);
		return mv;
	}

	@RequestMapping(value = "/musictop100", method = RequestMethod.GET)
	public ModelAndView tomusictop(int pcex) {
		ModelAndView mv = new ModelAndView();
		Integer pc = 1;
		// 当发送分页查询请求时，如果没有pc值，默认为1
		if ("".equals(pcex)) {
			pc = 1;
		} else {
			pc = Integer.valueOf(pcex);
		}
		try {
			request.setCharacterEncoding("UTF-8");
		} catch (UnsupportedEncodingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		String url = request.getRequestURI();
		int index = url.indexOf("?pcex=");
		if (index != -1) {
			url = url.substring(0, index);
		}
		PageBean<Music> pb = pageBeanService.getAllTop100(pcex);
		pb.setUrl(url);
		pb.setPc(pc);
		pb.setTp(pb.getTp());

		mv.addObject("pb", pb);
		mv.setViewName("musictop100");
		return mv;

	}
}
