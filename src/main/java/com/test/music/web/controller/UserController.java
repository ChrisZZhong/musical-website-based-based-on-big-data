package com.test.music.web.controller;

import java.util.ArrayList;
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
import com.test.music.biz.UserService;
import com.test.music.domain.po.Music;
import com.test.music.domain.po.Singer;
import com.test.music.domain.po.User;

@Controller
public class UserController {

	@Autowired
	private UserService userService;
	@Autowired
	private MusicService musicService;
	@Autowired
	private SingerService singerService;
	@Autowired
	private HttpServletRequest request;
	@Autowired
	private HttpSession session;

	@RequestMapping(value = "/login", method = RequestMethod.GET)
	public String toLogin() {
		return "login";
	}

	@RequestMapping(value = "/login", method = RequestMethod.POST)
	public ModelAndView doLogin() {
		ModelAndView mv = new ModelAndView();
		String password = request.getParameter("password");
		String username = request.getParameter("username");
		boolean b = userService.login(username, password);
		if (b) {
			session.setAttribute("curUser", userService.getUserByName(username));
			mv.setViewName("redirect:homepage");

		} else {
			mv.setViewName("login");
			mv.addObject("msg", "登录失败");
		}
		return mv;
	}

	@RequestMapping(value = "/register", method = RequestMethod.GET)
	public String toRegister() {
		return "register";
	}

	@RequestMapping(value = "/register", method = RequestMethod.POST)
	public ModelAndView doRegister(User curUser) {
		ModelAndView mv = new ModelAndView();
		boolean b = userService.checkUsername(curUser.getUsername());
		if (!b) {
			mv.setViewName("register");
			mv.addObject("error", "用户名 【" + curUser.getUsername() + "】 不可以");
			return mv;

		}
		mv.setViewName("redirect:/homepage");
		curUser.setLevel(1);
		curUser.setId(userService.register(curUser));
		session.setAttribute("curUser", curUser);
		return mv;
	}

	@RequestMapping(value = "/unlog", method = RequestMethod.GET)
	public ModelAndView doUnlog() {
		session.removeAttribute("curUser");
		ModelAndView mv = new ModelAndView();
		mv.setViewName("redirect:/homepage");
		return mv;
	}

	@RequestMapping(value = "/updateUser", method = RequestMethod.GET)
	public ModelAndView doUpdate(User update) {
		ModelAndView mv = new ModelAndView();
		userService.updateUser((User) session.getAttribute("curUser"));
		mv.setViewName("updateUser");
		return mv;
	}

	// 返回主页
	@RequestMapping(value = "/homepage", method = RequestMethod.GET)
	public ModelAndView tohomepage() {
		ModelAndView mv = new ModelAndView();
		List<Music> musics = musicService.getMusicsTop100(0, 12);
		mv.addObject("musics", musics);
		List<Music> musics2 = musicService.getMusicsTop100(0, 17);
		mv.addObject("musics2", musics2);
		List<Singer> singers = singerService.getAllSingers(0, 10);
		mv.addObject("singers", singers);
		List<Singer> singers1 = singerService.getAllSingers(0, 11);
		mv.addObject("singers1", singers1);
		mv.setViewName("homepage");
		return mv;
	}

	// 进入个人中心 ：不完全版
	@RequestMapping(value = "/personalcenter", method = RequestMethod.GET)
	public ModelAndView toper(int id) {
		ModelAndView mv = new ModelAndView();
		List<Integer> collects = userService.getcollectbyuserid(id);
		List<Music> musics_collects = new ArrayList<Music>();
		for (Integer musicid : collects) {
			Music music = musicService.getMusicById(musicid);
			musics_collects.add(music);
		}
		mv.addObject("musics_collects", musics_collects);
		mv.setViewName("personalcenter");
		return mv;
	}

	// 测试echarts图的 需要删除
	@RequestMapping(value = "/echarts", method = RequestMethod.GET)
	public String toe() {
		return "echarts";
	}

	// 如果user状态为空需要隐藏收藏按钮或者弹到注册界面
	@RequestMapping(value = "/collect", method = RequestMethod.GET)
	public ModelAndView docollect(Integer musicid) {
		ModelAndView mv = new ModelAndView();
		if (session.getAttribute("curUser") != null) {
			int userid = ((User) session.getAttribute("curUser")).getId();
			boolean result = userService.addcollect(userid, musicid);
			mv.setViewName("redirect:music?id=" + musicid);
		} else {
			mv.setViewName("redirect:login");
		}
		return mv;
	}

	@RequestMapping(value = "/uncollect", method = RequestMethod.GET)
	public ModelAndView douncollect(Integer musicid) {
		ModelAndView mv = new ModelAndView();
		if (session.getAttribute("curUser") != null) {
			int userid = ((User) session.getAttribute("curUser")).getId();
			boolean result = userService.uncollect(userid, musicid);
			mv.setViewName("redirect:music?id=" + musicid);
		} else {
			mv.setViewName("redirect:music?id=" + musicid);
		}
		return mv;

	}
}
