package com.hk.conred.daos;

import com.hk.conred.dtos.CMainDto;
import com.hk.conred.dtos.SDto;

public interface ICMainDao {
	//대표카테고리 등록
	public boolean insertCMain(CMainDto cmaindto);
	//대표카테고리 조회
	public CMainDto selectCMain(int store_seq);
	//대표카테고리 수정
	public boolean updateCMain(CMainDto cmaindto);
}
