package com.test.music.web.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.test.music.biz.SongListService;
import com.test.music.domain.po.List_musics;
import com.test.music.domain.po.SongList;

@Controller
public class SongListController {

	@Autowired
	private SongListService songListService;

	@RequestMapping(value = "/SongList", method = RequestMethod.GET)
	public ModelAndView toSongList(String name) {
		ModelAndView mv = new ModelAndView();
		SongList songList = songListService.findSongList(name);
		List<List_musics> list_musics = songListService.findList_musics_Byid(songList.getId());
		songList.setMusic_of_SongList(list_musics);
		mv.addObject(songList);
		return mv;

	}

}
