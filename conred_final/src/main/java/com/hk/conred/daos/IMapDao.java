package com.hk.conred.daos;

import java.util.List;

import com.hk.conred.dtos.CListDto;
import com.hk.conred.dtos.SDto;
import com.hk.conred.dtos.SLocaDto;
import com.hk.conred.dtos.SPhotoDto;
import com.hk.conred.dtos.STimeDto;

public interface IMapDao {
	public List<SDto> searchCateAll();
	public List<SDto> searchCate(String category_code);
	
	public List<SDto> searchCateAll_ajax(String nelat, String nelng, String swlat, String swlng);
	public List<SDto> searchCate_ajax(int pnum,String category_code,String nelat, String nelng, String swlat, String swlng);
	public SDto searchKey_ajax(String keyword);
	
	public List<SPhotoDto> getPhotos_ajax(List<SDto> list);
	public List<CListDto> getCates_ajax(List<SDto> list);
	public List<STimeDto> getStime_ajax(List<SDto> list);
	public List<SLocaDto> getSloca_ajax(List<SDto> list);
}
