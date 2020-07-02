package com.hk.conred.daos;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.hk.conred.dtos.LikeDto;
import com.hk.conred.dtos.UDto;

@Repository
public class LikeDaoImp implements ILikeDao{

	private String nameSpace="com.hk.conred.Like.";
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Override
	public List<LikeDto> likeList(String user_id,int pnum) {
		Map<String, Object> map=new HashMap<>();
		map.put("user_id", user_id);
		map.put("pnum", pnum);
		List<LikeDto> list=sqlSession.selectList(nameSpace+"likeList", map);
		return list;
	}

	@Override
	public boolean userLikeDelete(int like_list_seq) {
		int count=0;
		count=sqlSession.delete(nameSpace+"userLikeDelete", like_list_seq);
		return count>0?true:false;
	}

	@Override
	public List<LikeDto> likeStoreImg(String user_id) {
		List<LikeDto> list=sqlSession.selectList(nameSpace+"likeStoreImg", user_id);
		return list;
	}

	@Override
	public LikeDto likeStore(String user_id, int store_seq) {
		LikeDto dto=null;
		Map<String, Object> map=new HashMap<>();
		map.put("user_id", user_id);
		map.put("store_seq", store_seq);
		dto=sqlSession.selectOne(nameSpace+"likeStore", map);
		return dto;
	}

	@Override
	public boolean insertLike(String user_id, int store_seq) {
		int count=0;
		Map<String, Object> map=new HashMap<>();
		map.put("user_id", user_id);
		map.put("store_seq", store_seq);
		count=sqlSession.insert(nameSpace+"insertLike", map);
		return count>0?true:false;
	}

	@Override
	public boolean deleteLike(String user_id, int store_seq) {
		int count=0;
		Map<String, Object> map=new HashMap<>();
		map.put("user_id", user_id);
		map.put("store_seq", store_seq);
		count=sqlSession.insert(nameSpace+"deleteLike", map);
		return count>0?true:false;
	}

}
