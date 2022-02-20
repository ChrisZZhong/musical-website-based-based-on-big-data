package com.test.music.web.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.test.music.biz.MusicService;
import com.test.music.biz.SingerService;
import com.test.music.domain.po.Music;
import com.test.music.domain.po.Singer;

@Controller
public class SearchController {
	@Autowired
	private HttpServletRequest request;
	@Autowired
	private HttpSession session;
	@Autowired
	private MusicService musicService;
	@Autowired
	private SingerService singerService;

	@RequestMapping(value = "/search", method = RequestMethod.GET)
	public ModelAndView toSearch() {
		String name = request.getParameter("name");
		ModelAndView mv = new ModelAndView();
		List<Music> musics = musicService.searchMusicByName(name);
		List<Singer> singers = singerService.searchSingerByName(name);
		System.out.println(name);
		mv.addObject("musics", musics);
		mv.addObject("singers", singers);
		mv.setViewName("search");
		return mv;
	}
}
