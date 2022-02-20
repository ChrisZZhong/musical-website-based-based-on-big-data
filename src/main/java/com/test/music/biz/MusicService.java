package com.test.music.biz;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.test.music.domain.po.Music;

public interface MusicService {
	Music getMusicById(int id);

	Music updateMusic(@Param("m") Music m);

	int insertMusic(@Param("m") Music m);

	List<Music> searchMusicByName(@Param("name") String name);

	List<Music> getMusicsTop100(@Param("pspc") int pspc, @Param("ps") int ps);
}
