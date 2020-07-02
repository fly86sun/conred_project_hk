package com.hk.conred.daos;

import java.util.List;

import com.hk.conred.dtos.MenuDto;
import com.hk.conred.dtos.SDto;

public interface IMenuDao {
	public boolean insertMenu(SDto sdto, String[] category_code_2,String[] name,
			String[] content,String[] price,String[] state);
	
	public List<MenuDto> selectMenu(int store_seq);
	
	//메뉴 상세 예약가능시간,매장최대인원수 같이출력
	public List<MenuDto> detailMenu(int menu_seq,int store_seq);
	
	//ajax용 요일
	public List<MenuDto> selectWeek(int menu_seq, int store_seq,String store_time_day);
	
	//delete메뉴 --안씀 udpate로 대체
	public boolean deleteMenu(SDto sdto);
	
	//update메뉴
	public boolean updatemenu(SDto sdto, String[] category_code_2,String[] name,
			String[] content,String[] price,String[] state, String[] menu_seqs);

	public boolean deletemenu(String[] del_menus);
	
}
