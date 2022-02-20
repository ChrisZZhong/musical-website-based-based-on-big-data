package com.test.music.biz;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.test.music.domain.po.Music;
import com.test.music.domain.po.Singer;

public interface SearchService {
	List<Music> searchMusicByName(@Param("name") String name);

	List<Singer> searchSingerByName(@Param("name") String name);
}
