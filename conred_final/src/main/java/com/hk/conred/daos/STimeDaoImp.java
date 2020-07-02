package com.hk.conred.daos;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.hk.conred.dtos.SDto;
import com.hk.conred.dtos.STimeDto;

@Repository
public class STimeDaoImp implements ISTimeDao{
	private String namespace="com.hk.conred.STime.";
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Override
	public boolean insertStime(SDto sdto,String[] time_day,String[] time_open,String[] time_close,String[] time_break) {
//		map.put("store_seq", sdto.getStore_seq());
		List<STimeDto> list = new ArrayList<STimeDto>();
		STimeDto dto;
		for (int i = 0; i < time_break.length; i++) {
			dto = new STimeDto();
			dto.setStore_seq(sdto.getStore_seq());
			dto.setStore_time_day(time_day[i]);
			dto.setStore_time_open(time_open[i]);
			dto.setStore_time_close(time_close[i]);
			dto.setStore_time_break(time_break[i]);
			list.add(dto);
			System.out.println("각 리스트:"+list);
			dto=null;
		}
		System.out.println("최종 라스트:"+list);
		Map<String, Object> map =new HashMap<String, Object>();
		map.put("list", list);
		
		int count =0;
		count = sqlSession.insert(namespace+"insertSTime",map);
		return count>0?true:false;
	}

	@Override
	public boolean updateStime(SDto sdto,String[] time_open,String[] time_close,String[] time_break,List<STimeDto> list_stime) {
		int count =0;
		List<STimeDto> list = new ArrayList<>();
		for (int i = 0; i < time_break.length; i++) {
			STimeDto dto=new STimeDto();
			dto.setStore_time_seq(list_stime.get(i).getStore_time_seq());
//			dto.setStore_time_day(time_day[i]);
			dto.setStore_time_open(time_open[i]);
			dto.setStore_time_close(time_close[i]);
			dto.setStore_time_break(time_break[i]);
			list.add(dto);
		}
		//@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@여기 time_day는 딱히 필요없으니 나중에 빼주자.
		System.out.println("타입업데이트 최종리스트:"+list);
		Map<String, Object>map =new HashMap<>();
		map.put("list", list);
		map.put("store_seq", sdto.getStore_seq());
		count = sqlSession.update(namespace+"updateSTime",map);
		return count>0?true:false;
	}

	@Override
	public List<STimeDto> selectStime(int store_seq) {
		List<STimeDto> list=sqlSession.selectList(namespace+"selectSTime", store_seq);
		return list;
	}
	
}
