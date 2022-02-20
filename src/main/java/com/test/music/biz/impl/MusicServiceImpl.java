package com.test.music.biz.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.stereotype.Service;

import com.test.music.biz.MusicService;
import com.test.music.dao.MusicMapper;
import com.test.music.domain.po.Music;

@Service("MusicService")
@Repository
public class MusicServiceImpl implements MusicService {
	@Autowired
	MusicMapper musicMapper;

	@Override
	public Music getMusicById(int id) {
		return musicMapper.getMusicById(id);
	}

	@Override
	public List<Music> searchMusicByName(String name) {
		return musicMapper.searchMusicByName(name);

	}

	@Override
	public Music updateMusic(Music m) {
		return musicMapper.updateMusic(m);

	}

	@Override
	public int insertMusic(Music m) {
		return musicMapper.insertMusic(m);
	}

	@Override
	public List<Music> getMusicsTop100(int pspc, int ps) {
		// TODO Auto-generated method stub
		return musicMapper.getMusicsTop100(pspc, ps);
	}

}
