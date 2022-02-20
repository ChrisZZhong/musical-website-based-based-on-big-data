package com.test.music.biz;

import java.util.List;

import com.test.music.domain.po.List_musics;
import com.test.music.domain.po.SongList;

public interface SongListService {
	boolean addSongList(SongList songList);

	SongList findSongList(String name);

//	boolean updateSongList(SongList songList);

	SongList searchSongList(String name);

	List<List_musics> findList_musics_Byid(int id);

	boolean addSongsOfList(List_musics list_musics);

	boolean deleteSongsOfList(int id);
}
