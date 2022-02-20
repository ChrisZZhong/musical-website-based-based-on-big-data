package com.test.music.biz.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.stereotype.Service;

import com.test.music.biz.SongListService;
import com.test.music.domain.po.List_musics;
import com.test.music.domain.po.SongList;

@Service("SongListService")
@Repository
public class SongListServiceImpl implements SongListService {
	@Autowired
	private SongListService songListService;

	@Override
	public boolean addSongList(SongList songList) {
		boolean result = songListService.addSongList(songList);
		// TODO Auto-generated method stub
		return result;
	}

	@Override
	public SongList findSongList(String name) {
		SongList songList = songListService.findSongList(name);
		// TODO Auto-generated method stub
		return songList;
	}

	@Override
	public SongList searchSongList(String name) {
		SongList songList = songListService.searchSongList(name);
		// TODO Auto-generated method stub
		return songList;
	}

	@Override
	public List<List_musics> findList_musics_Byid(int id) {
		List<List_musics> list_musics = songListService.findList_musics_Byid(id);
		// TODO Auto-generated method stub
		return list_musics;
	}

	@Override
	public boolean addSongsOfList(List_musics list_musics) {
		boolean result = songListService.addSongsOfList(list_musics);
		// TODO Auto-generated method stub
		return result;
	}

	@Override
	public boolean deleteSongsOfList(int id) {
		boolean result = songListService.deleteSongsOfList(id);
		// TODO Auto-generated method stub
		return result;
	}

}
