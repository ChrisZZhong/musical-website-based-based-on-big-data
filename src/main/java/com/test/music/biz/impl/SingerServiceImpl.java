package com.test.music.biz.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.stereotype.Service;

import com.test.music.biz.SingerService;
import com.test.music.dao.SingerMapper;
import com.test.music.domain.po.Singer;

@Service("SingerService")
@Repository
public class SingerServiceImpl implements SingerService {

	@Autowired
	private SingerMapper singerMapper;

	@Override
	public boolean addSinger(Singer singer) {
		boolean result = singerMapper.addSinger(singer);
		// TODO Auto-generated method stub
		return result;
	}

	@Override
	public Singer findSinger(int id) {
		Singer singer = singerMapper.findSinger(id);
		// TODO Auto-generated method stub
		return singer;
	}

	@Override
	public Singer searchSinger(String name) {
		Singer singer = singerMapper.searchSinger(name);
		// TODO Auto-generated method stub
		return singer;
	}

	@Override
	public boolean updateSinger(Singer singer) {
		boolean result = singerMapper.updateSinger(singer);
		// TODO Auto-generated method stub
		return result;
	}

	@Override
	public List<Singer> getAllSingers(int pspc, int ps) {
		List<Singer> singers = singerMapper.getAllSingers(pspc, ps);
		// TODO Auto-generated method stub
		return singers;
	}

	@Override
	public List<String> getMusicsBySingerName(String name) {
		List<String> musics = singerMapper.getMusicsBySingerName(name);
		// TODO Auto-generated method stub
		return musics;
	}

	@Override
	public List<Singer> searchSingerByName(String name) {
		// TODO Auto-generated method stub
		return singerMapper.searchSingerByName(name);
	}

}
