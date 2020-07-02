package com.hk.conred.daos;

import java.util.List;

import com.hk.conred.dtos.CListDto;
import com.hk.conred.dtos.SDto;

public interface ICListDao {
	public boolean insertCList(SDto sdto,String[] clist);
	
	public List<CListDto> selectCList(int store_seq);
	
	public boolean deleteCList(SDto sdto);
}
