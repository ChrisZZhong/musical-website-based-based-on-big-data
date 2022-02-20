package com.test.music.dao;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.test.music.domain.po.List_musics;
import com.test.music.domain.po.SongList;

@Repository
public interface SongListMapper {
	boolean addSongList(SongList songList);

	SongList findSongList(String name);

//	boolean updateSongList(SongList songList);

	SongList searchSongList(String name);

	List<List_musics> findList_musics_Byid(int id);

	boolean addSongsOfList(List_musics list_musics);

	boolean deleteSongsOfList(int id);
}
