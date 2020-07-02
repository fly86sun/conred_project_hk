package com.hk.conred.daos;



import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.hk.conred.dtos.RPhotoDto;

@Repository
public class RPhotoImp implements IRPhotoDao{
	
	private String nameSpace="com.hk.conred.RPhoto.";
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	
	@Override
	public boolean reviewPhotoInsert(List<RPhotoDto> list) {
		int count=0;
		Map<String, Object> map=new HashMap<>();
		map.put("list", list);
		count=sqlSession.insert(nameSpace+"reviewPhotoInsert", map);
		
		return count>0?true:false;
	}


	@Override
	public List<RPhotoDto> reviewPhotoList(int store_seq) {
		List<RPhotoDto> list=null;
		list=sqlSession.selectList(nameSpace+"reviewPhotoList", store_seq);
		return list;
	}


	@Override
	public List<RPhotoDto> userReplyPhoto() {
		List<RPhotoDto> list=sqlSession.selectList(nameSpace+"userReplyPhoto");
		return list;
	}

}
