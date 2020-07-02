package com.hk.conred.service;

import java.util.List;

import com.hk.conred.dtos.MenuDto;

public interface IMenuService {
	public List<MenuDto> selectMenu(int store_seq);
	
	public List<MenuDto> detailMenu(int menu_seq,int store_seq);
	
	//ajax용 요일
	public List<MenuDto> selectWeek(int menu_seq, int store_seq,String store_time_day);
}
