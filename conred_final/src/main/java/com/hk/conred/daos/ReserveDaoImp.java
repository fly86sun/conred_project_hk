package com.hk.conred.daos;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.hk.conred.dtos.ReserveDto;

@Repository
public class ReserveDaoImp implements IReserveDao{

	private String nameSpace="com.hk.conred.Reserve.";
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	
	@Override
	public boolean insertReserveS(String user_id, int menu_seq, int store_seq, String reserve_price,String reserve_sdate, String reserve_edate) {
		int count=0;
		Map<String, Object> map=new HashMap<>();
		map.put("user_id", user_id);
		map.put("menu_seq", menu_seq);
		map.put("store_seq", store_seq);
		map.put("reserve_price", reserve_price);
		map.put("reserve_sdate", reserve_sdate);
		map.put("reserve_edate", reserve_edate);
		count=sqlSession.insert(nameSpace+"insertReserveS", map);
		return count>0?true:false;
	}

	@Override
	public boolean insertReserveT(String user_id, int menu_seq, int store_seq, String reserve_time,String reserve_price, String reserve_sdate) {
		int count=0;
		Map<String, Object> map=new HashMap<>();
		map.put("user_id", user_id);
		map.put("menu_seq", menu_seq);
		map.put("store_seq", store_seq);
		map.put("reserve_time", reserve_time);
		map.put("reserve_price", reserve_price);
		map.put("reserve_sdate", reserve_sdate);
		count=sqlSession.insert(nameSpace+"insertReserveT", map);
		return count>0?true:false;
	}
	

	@Override
	public List<ReserveDto> reserveList(String user_id,String pnum) {
		List<ReserveDto> list=null;
		Map<String, String> map=new HashMap<>();
		map.put("user_id", user_id);
		map.put("pnum", pnum);
		list=sqlSession.selectList(nameSpace+"reserveList", map);
		return list;
	}

	@Override
	public ReserveDto getReserve(int reserve_seq) {
	
		return sqlSession.selectOne(nameSpace+"getReserve", reserve_seq);
		 
	}
 
	@Override
	public List<ReserveDto> reserveMax(int store_seq, int menu_seq, String reserve_sdate) {
		Map<String, Object> map=new HashMap<>();
		map.put("store_seq", store_seq);
		map.put("menu_seq", menu_seq);
		map.put("reserve_sdate", reserve_sdate);
		List<ReserveDto> list=sqlSession.selectList(nameSpace+"reserveMax", map);
		return list;
	}

	@Override
	public List<ReserveDto> stayReserve(int store_seq, int menu_seq) {
		Map<String, Integer> map =new HashMap<>();
		map.put("store_seq", store_seq);
		map.put("menu_seq", menu_seq);
		List<ReserveDto> list=sqlSession.selectList(nameSpace+"stayReserve", map);
		return list;
	}

	@Override
	public boolean userReserveCancel(int reserve_seq) {
		int count=0;
		count=sqlSession.update(nameSpace+"userReserveCancel",reserve_seq);
		return count>0?true:false;
	}

	@Override
	public List<ReserveDto> userReservePhoto(String user_id) {
		List<ReserveDto> list=sqlSession.selectList(nameSpace+"userReservePhoto", user_id);
		return list;
	}

	@Override
	public boolean reserveSuccess(int reserve_seq) {
		int count=0;
		count=sqlSession.update(nameSpace+"reserveSuccess", reserve_seq);
		return count>0?true:false;
	}

	@Override
	public List<ReserveDto> userOnceReview(int store_seq, String user_id) {
		Map<String, Object> map=new HashMap<>();
		map.put("store_seq", store_seq);
		map.put("user_id", user_id);
		List<ReserveDto> list=sqlSession.selectList(nameSpace+"userOnceReview", map);
		return list;
	}

	@Override
	public boolean userReviewSuccess(String user_id, int store_seq) {
		int count=0;
		Map<String, Object> map=new HashMap<>();
		map.put("user_id", user_id);
		map.put("store_seq", store_seq);
		count=sqlSession.update(nameSpace+"userReviewSuccess", map);
		return count>0?true:false;
	}

	@Override
	public ReserveDto reserveSuccessInfo(int reserve_seq) {
		ReserveDto dto=sqlSession.selectOne(nameSpace+"reserveSuccessInfo", reserve_seq);
		return dto;
	}

	@Override
	public List<ReserveDto> ownerStoreReserve(int store_seq, int pnum) {
		Map<String, Integer> map=new HashMap<>();
		map.put("store_seq", store_seq);
		map.put("pnum", pnum);
		List<ReserveDto> list=sqlSession.selectList(nameSpace+"ownerStoreReserve", map);
		return list;
	}

	@Override
	public List<ReserveDto> ownerStoreReserveSuccess(int store_seq, int pnum) {
		Map<String, Integer> map=new HashMap<>();
		map.put("store_seq", store_seq);
		map.put("pnum", pnum);
		List<ReserveDto> list=sqlSession.selectList(nameSpace+"ownerStoreReserveSuccess", map);
		return list;
	}


}
