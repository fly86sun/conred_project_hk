package com.hk.conred.service;

import java.util.List;

import com.hk.conred.dtos.CListDto;

public interface ICListService {
	public List<CListDto> selectCList(int store_seq);
}
