package com.test.music.biz.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.stereotype.Service;

import com.test.music.biz.PageBeanService;
import com.test.music.dao.MusicMapper;
import com.test.music.dao.SingerMapper;
import com.test.music.domain.po.Music;
import com.test.music.domain.po.PageBean;
import com.test.music.domain.po.Singer;

@Service("PageBeanServie")
@Repository
public class PageBeanServiceImpl implements PageBeanService {

	@Autowired
	private SingerMapper singeMapper;
	@Autowired
	private MusicMapper musicMapper;

	@Override
	public PageBean<Singer> getTop100(int pc) {
		PageBean<Singer> pb = new PageBean<Singer>();
		Integer ps = 17;
		pb.setPs(ps);
		pb.setTr(100);
		List<Singer> singers = singeMapper.getAllSingers(ps * (pc - 1), ps);
		pb.setListbeans(singers);
		return pb;
		// TODO Auto-generated method stub
	}

	@Override
	public PageBean<Music> getAllTop100(int pc) {
		PageBean<Music> pbmusic = new PageBean<Music>();
		Integer ps = 17;
		pbmusic.setPs(ps);
		pbmusic.setTr(100);
		List<Music> musics = musicMapper.getMusicsTop100(ps * (pc - 1), ps);
//		System.out.println(musics.toString());
		pbmusic.setListbeans(musics);
		// TODO Auto-generated method stub
		return pbmusic;
	}

}
