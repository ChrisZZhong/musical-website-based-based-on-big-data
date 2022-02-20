package com.test.music.biz.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.stereotype.Service;

import com.test.music.biz.SearchService;
import com.test.music.dao.MusicMapper;
import com.test.music.dao.SingerMapper;
import com.test.music.domain.po.Music;
import com.test.music.domain.po.Singer;

@Service("SearchService")
@Repository
public class SearchServiceImpl implements SearchService {

	@Autowired
	private SingerMapper singerMapper;
	@Autowired
	private MusicMapper musicMapper;

	@Override
	public List<Music> searchMusicByName(String name) {
		// TODO Auto-generated method stub
		return musicMapper.searchMusicByName(name);
	}

	@Override
	public List<Singer> searchSingerByName(String name) {
		// TODO Auto-generated method stub
		return singerMapper.searchSingerByName(name);
	}

}
