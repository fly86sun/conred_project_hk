package com.hk.conred.daos;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.hk.conred.dtos.CListDto;
import com.hk.conred.dtos.SDto;
import com.hk.conred.dtos.SLocaDto;
import com.hk.conred.dtos.SPhotoDto;
import com.hk.conred.dtos.STimeDto;

@Repository
public class MapDaoImp implements IMapDao{
	
	private String namespace="con.hk.conred.Map.";
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Override
	public List<SDto> searchCateAll() {
		return sqlSession.selectList(namespace+"searchCateAll");
	}
	
	@Override
	public List<SDto> searchCate(String category_code) {
		return sqlSession.selectList(namespace+"searchCate",category_code);
	}
	
	@Override
	public List<SDto> searchCateAll_ajax(String nelat, String nelng, String swlat, String swlng) {
		Map<String, Object> map = new HashMap<>();
		map.put("nelat", nelat);
		map.put("nelng", nelng);
		map.put("swlat", swlat);
		map.put("swlng", swlng);
		return sqlSession.selectList(namespace+"searchCateAll_ajax",map);
	}
	
	@Override
	public List<SDto> searchCate_ajax(int pnum,String category_code, String nelat, String nelng, String swlat, String swlng) {
		Map<String, Object> map = new HashMap<>();
		map.put("nelat", nelat);
		map.put("nelng", nelng);
		map.put("swlat", swlat);
		map.put("swlng", swlng);
		System.out.println("fffffffff"+category_code);
		System.out.println("length"+category_code.length());
		List<String> list=new ArrayList<>();
//		if(category_code.length()>1) {
		String [] array = category_code.split(",");
		System.out.println(array);
		for (int i = 0; i < array.length; i++) {
			list.add(array[i]);
		}
		System.out.println(list);
		System.out.println(pnum);
//		}
		map.put("list", list);
		map.put("pnum", pnum+"");
		return sqlSession.selectList(namespace+"searchCate_ajax",map);
	}

	@Override
	public SDto searchKey_ajax(String keyword) {
		return sqlSession.selectOne(namespace+"searchKey_ajax",keyword);
	}

	@Override
	public List<SPhotoDto> getPhotos_ajax(List<SDto> list) {
		Map<String, Object> map = new HashMap<>();
		System.out.println("photo뽑을때 첫번째 매장의 seq:"+list.get(0).getStore_seq());
		
		map.put("list", list);
		return sqlSession.selectList(namespace+"getPhotos_ajax",map);
	}

	@Override
	public List<CListDto> getCates_ajax(List<SDto> list) {
		Map<String, Object> map = new HashMap<>();
		
		map.put("list", list);
		return sqlSession.selectList(namespace+"getCates_ajax",map);
	}

	@Override
	public List<STimeDto> getStime_ajax(List<SDto> list) {
		Map<String, Object> map = new HashMap<>();
		
		map.put("list", list);
		return sqlSession.selectList(namespace+"getStime_ajax",map);
	}

	@Override
	public List<SLocaDto> getSloca_ajax(List<SDto> list) {
		Map<String, Object> map = new HashMap<>();
		
		map.put("list", list);
		return sqlSession.selectList(namespace+"getSloca_ajax",map);
	}




}
