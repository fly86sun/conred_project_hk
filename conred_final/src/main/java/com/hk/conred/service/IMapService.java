package com.hk.conred.service;

import java.util.List;

import com.hk.conred.dtos.CListDto;
import com.hk.conred.dtos.SDto;
import com.hk.conred.dtos.SLocaDto;
import com.hk.conred.dtos.SPhotoDto;
import com.hk.conred.dtos.STimeDto;

public interface IMapService {
	//카테고리검색
	public List<SDto> searchCateAll();//전체
	public List<SDto> searchCate(String category_code);//카테고리별
	
	//카테고리를들고 맵으로 이동
	//아작스로 맵에뿌려주기1 : 카테고리 all
	public List<SDto> searchCateAll_ajax(String nelat, String nelng, String swlat, String swlng);
	//아작스로 맵에뿌려주기2 : 카테고리별 검색
	public List<SDto> searchCate_ajax(int pnum,String category_code,String nelat, String nelng, String swlat, String swlng);
	//아작스로 맵에뿌려주기3 : 키워드로 지하철검색 : 얘는 지하철service 쪽에서
	
	//아작스로 맵에뿌려주기4 : 키워드로 매장1개검색
	public SDto searchKey_ajax(String keyword);
	
	
	//검색결과로 받은 seq의 상세정보를 가져오는 기능
	public List<SPhotoDto> getPhotos_ajax(List<SDto> list);
	public List<CListDto> getCates_ajax(List<SDto> list);
	public List<STimeDto> getStime_ajax(List<SDto> list);
	public List<SLocaDto> getSloca_ajax(List<SDto> list);
}
