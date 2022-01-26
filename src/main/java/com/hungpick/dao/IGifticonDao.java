package com.hungpick.dao;

import org.apache.ibatis.annotations.Param;

import com.hungpick.dto.Gifticon;


public interface IGifticonDao {

	Gifticon select(@Param("gifticonCode")String gifticonCode,@Param("brandCode")String brandCode,@Param("menuCode")String menuCode); // 단건조회

	
	
	void insert(Gifticon gift); // 공지사항 입력

	void update(Gifticon gift); // 공지사항 수정

	void delete(@Param("gifticonCode")String gifticonCode,@Param("brandCode")String brandCode,@Param("menuCode")String menuCode); // 공지사항 삭제
	
	

	

}
