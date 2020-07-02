package com.hk.conred.daos;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.hk.conred.dtos.SPhotoDto;

@Repository
public class SPhotoDaoImp implements ISPhotoDao{
		
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	private String namespace="com.hk.conred.SPhoto.";
	
	@Override
	public boolean insertSPhoto(List<SPhotoDto> list){
		int count=0;
		System.out.println("list : "+list);
		Map<String, Object> map =new HashMap<>();
		map.put("list", list);
		System.out.println("map : "+map);
		count =sqlSession.insert(namespace+"insertSPhoto",list);
		return count>0?true:false;
	}

	@Override
	public List<SPhotoDto> selectSPhoto(int store_seq) {
		List<SPhotoDto> list = sqlSession.selectList(namespace+"selectSPhoto",store_seq);
		return list;
	}

	@Override
	public boolean updateSPhoto(List<SPhotoDto> list) {
		int count=0;
		System.out.println("list : "+list);
		Map<String, Object> map =new HashMap<>();
		map.put("list", list);
		System.out.println("map : "+map);
		count =sqlSession.insert(namespace+"updateSPhoto",list);
		return count>0?true:false;
	}

	@Override
	public boolean deleteSPhoto(String[] dels) {
		int count=0;
		System.out.println("dels:"+dels[0]);
		Map<String, Object> map =new HashMap<>();
		map.put("arr", dels);
		count =sqlSession.delete(namespace+"deleteSPhoto",map);
		return count>0?true:false;
		
	}
}
