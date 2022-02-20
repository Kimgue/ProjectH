package com.hungpick.service;

import java.util.List;



import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.hungpick.dao.IBrandDao;
import com.hungpick.dto.BrandDto;

@Service("brandService")
public class BrandServiceImpl implements IBrandService {
	
	@Autowired
	private IBrandDao brandDao;
	
	private static final Logger logger = LoggerFactory.getLogger(BrandServiceImpl.class);
	
	
	//브랜드 전체 리스트 보기
	@Override
	public List<BrandDto> sltMulti() {
		logger.info("Brand sltMulti called =========");
		
		return brandDao.sltMulti();
	}
	
	//각 브랜드 이름과 코드
	@Override
	public List<BrandDto> sltEachBrand() {
		logger.info("Brand sltMulti called =========");
			
		return brandDao.sltEachBrand();
	}
	

	@Override
	public void insertBrand(BrandDto brandDto) {
		
		brandDao.insertBrand(brandDto);
	}


	@Override
	public void updateBrand(BrandDto brandDto) {
	
		brandDao.updateBrand(brandDto);
	}


	@Override
	public void deleteBrand(String brandCode) {
		
		brandDao.deleteBrand(brandCode);
	}
	

}
