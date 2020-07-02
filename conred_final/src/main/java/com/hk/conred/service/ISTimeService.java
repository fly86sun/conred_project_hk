package com.hk.conred.service;

import java.util.List;

import com.hk.conred.dtos.STimeDto;

public interface ISTimeService {
	//영업시간 등록
//	public boolean insertStime(STimeDto stimedto);
	//영업시간 수정
	public boolean updateStime(STimeDto stimedto);
	//영업시간 조회
	public List<STimeDto> selectStime(int store_seq);
}
