package com.test.music.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import com.test.music.domain.po.Music;

@Repository
public interface MusicMapper {
	Music getMusicById(int id);

	Music updateMusic(@Param("m") Music m);

	int insertMusic(@Param("m") Music m);

	List<Music> searchMusicByName(@Param("name") String name);

	List<Music> getMusicsTop100(@Param("pspc") int pspc, @Param("ps") int ps);
}
