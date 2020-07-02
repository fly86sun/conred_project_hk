package com.hk.conred.daos;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.hk.conred.dtos.SubwayDto;

@Repository
public class SubwayDaoImp implements ISubwayDao{

	private String namespace="com.hk.conred.Subway.";
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Override
	public SubwayDto subway_search(String keyword) {
		SubwayDto dto =sqlSession.selectOne(namespace+"subway_search",keyword);
		return dto;
	}

}
