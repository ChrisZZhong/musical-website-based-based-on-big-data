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

import com.test.music.biz.PageBeanService;
import com.test.music.biz.SingerService;
import com.test.music.domain.po.PageBean;
import com.test.music.domain.po.Singer;

@Controller
public class SingerController {
	@Autowired
	private HttpServletRequest request;
	private HttpServletResponse response;
	@Autowired
	private HttpSession session;
	@Autowired
	private SingerService singerService;
	@Autowired
	private PageBeanService pageBeanService;

	@RequestMapping(value = "/singer", method = RequestMethod.POST)
	public ModelAndView gettoSinger() {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("singer");
		return mv;
	}

	@RequestMapping(value = "/singer", method = RequestMethod.GET)
	public ModelAndView toSinger(int id) {
		ModelAndView mv = new ModelAndView();
		Singer singer = singerService.findSinger(id);
		List<String> musics = singerService.getMusicsBySingerName(singer.getName() + " ");
		singer.setMusics(musics);
		int ids = 0;
		mv.addObject("ids", ids);
//		System.out.println(singer.toString());
		mv.addObject(singer);
		List<Singer> singers = singerService.getAllSingers(0, 17);

		mv.addObject("singers", singers);
		mv.setViewName("singer");
		return mv;
	}

	@RequestMapping(value = "/singertop100", method = RequestMethod.GET)
	public ModelAndView tosingertop(int pcex) {
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
		PageBean<Singer> pb = pageBeanService.getTop100(pcex);
		pb.setUrl(url);
		pb.setPc(pc);
		pb.setTp(pb.getTp());
//		System.out.println(pb.toString());
		mv.addObject("pb", pb);
		mv.setViewName("singertop100");
		return mv;

	}
}
