package com.test.music.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import com.test.music.domain.po.Singer;

@Repository
public interface SingerMapper {
	boolean addSinger(Singer singer);

	Singer findSinger(int id);

	Singer searchSinger(String name);

	boolean updateSinger(Singer singer);

	List<String> getMusicsBySingerName(String name);

	List<Singer> getAllSingers(@Param("pspc") int pspc, @Param("ps") int ps);

	List<Singer> searchSingerByName(@Param("name") String name);

}
