package com.hk.conred.daos;

import java.util.List;

import com.hk.conred.dtos.SubwayDto;

public interface ISubwayDao {
	public SubwayDto subway_search(String keyword);
	
}
