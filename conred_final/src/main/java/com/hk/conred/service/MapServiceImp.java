package com.hk.conred.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.hk.conred.daos.IMapDao;
import com.hk.conred.dtos.CListDto;
import com.hk.conred.dtos.SDto;
import com.hk.conred.dtos.SLocaDto;
import com.hk.conred.dtos.SPhotoDto;
import com.hk.conred.dtos.STimeDto;

@Service
public class MapServiceImp implements IMapService{
	
	@Autowired
	private IMapDao mapDao;
	
	@Override
	public List<SDto> searchCateAll() {
		return mapDao.searchCateAll();
	}
	
	@Override
	public List<SDto> searchCate(String category_code) {
		return mapDao.searchCate(category_code);
	}
	
	@Override
	public List<SDto> searchCateAll_ajax(String nelat, String nelng, String swlat, String swlng) {
		return mapDao.searchCateAll_ajax(nelat,nelng,swlat,swlng);
	}
	
	@Override
	public List<SDto> searchCate_ajax(int pnum,String category_code, String nelat, String nelng, String swlat, String swlng) {
		return mapDao.searchCate_ajax(pnum,category_code,nelat,nelng,swlat,swlng);
	}

	@Override
	public SDto searchKey_ajax(String keyword) {
		return mapDao.searchKey_ajax(keyword);
	}
	
	@Override
	public List<SPhotoDto> getPhotos_ajax(List<SDto> list) {
		return mapDao.getPhotos_ajax(list);
	}

	@Override
	public List<CListDto> getCates_ajax(List<SDto> list) {
		return mapDao.getCates_ajax(list);
	}

	@Override
	public List<STimeDto> getStime_ajax(List<SDto> list) {
		return mapDao.getStime_ajax(list);
	}

	@Override
	public List<SLocaDto> getSloca_ajax(List<SDto> list) {
		return mapDao.getSloca_ajax(list);
	}




}
