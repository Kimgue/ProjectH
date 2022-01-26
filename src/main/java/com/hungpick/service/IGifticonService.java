package com.hungpick.service;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.hungpick.dto.Gifticon;

public interface IGifticonService {

	Gifticon select(@Param("gifticonCode")String gifticonCode,@Param("brandCode")String brandCode,@Param("menuCode")String menuCode)throws Exception; // 단건조회

	List<Gifticon> selectgift();
	
	void insert(Gifticon gift)throws Exception; // 기프티콘 입력

	void update(Gifticon gift)throws Exception; // 기프티콘 수정

	void delete(@Param("gifticonCode")String gifticonCode,@Param("brandCode")String brandCode,@Param("menuCode")String menuCode)throws Exception; // 공지사항 삭제
	
}
