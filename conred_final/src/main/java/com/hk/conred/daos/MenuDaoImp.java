package com.hk.conred.daos;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.hk.conred.dtos.MenuDto;
import com.hk.conred.dtos.SDto;

@Repository
public class MenuDaoImp implements IMenuDao{

	private String namespace="com.hk.conred.Menu.";
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Override
	public boolean insertMenu(SDto sdto, String[] category_code_2, String[] name,
			String[] content, String[] price, String[] state) {
		int count = 0;
		List<MenuDto> list = new ArrayList<>();
		MenuDto dto;
		for (int i = 0; i < name.length; i++) {
			dto = new MenuDto();
			dto.setStore_seq(sdto.getStore_seq());
			dto.setCategory_code(category_code_2[i]);
			dto.setMenu_name(name[i]);
			dto.setMenu_content(content[i]);
			dto.setMenu_price(price[i]);
			dto.setMenu_state(state[i]);
			list.add(dto);
			dto=null;
		}
		Map<String, Object> map = new HashMap<>();
		map.put("list", list);
		count=sqlSession.insert(namespace+"insertMenu",list);
		return count>0?true:false;
	}

	@Override
	public List<MenuDto> selectMenu(int store_seq) {
		List<MenuDto> list= sqlSession.selectList(namespace+"selectMenu",store_seq);
		return list;
	}

	@Override
	public List<MenuDto> detailMenu(int menu_seq,int store_seq) {
		Map<String, Integer> map= new HashMap<>();
		map.put("menu_seq", menu_seq);
		map.put("store_seq", store_seq);
		List<MenuDto> list=sqlSession.selectList(namespace+"detailMenu", map);
		return list;
	}

	@Override
	public List<MenuDto> selectWeek(int menu_seq, int store_seq, String store_time_day) {
		Map<String, Object> map= new HashMap<>();
		map.put("menu_seq", menu_seq);
		map.put("store_seq", store_seq);
		map.put("store_time_day", store_time_day);
		List<MenuDto> list=sqlSession.selectList(namespace+"selectWeek", map);
		return list;
	}

	@Override
	public boolean deleteMenu(SDto sdto) {
		int count=0;
		count=sqlSession.delete(namespace+"deleteMenu",sdto);
		return count>0?true:false;
	}

	@Override
	public boolean updatemenu(SDto sdto, String[] category_code_2,String[] name,
			String[] content,String[] price,String[] state, String[] menu_seqs){
		int count=0;
		Map<String, Object> map=new HashMap<>();
		List<MenuDto> list = new ArrayList<>();
		MenuDto dto;
		System.out.println("menu_name길이:"+name.length);
		System.out.println("menu_seqs길이:"+menu_seqs.length);
//		System.out.println("menu_seqs배열0:"+menu_seqs[0]);
//		System.out.println("menu_seqs배열1:"+menu_seqs[1]);
//		System.out.println("menu_seqs배열2:"+menu_seqs[2]);
//		System.out.println("menu_seqs배열3:"+menu_seqs[3]);
//		System.out.println("menu_seqs배열4:"+menu_seqs[4]);
//		System.out.println("menu_seqs배열5:"+menu_seqs[5]);
		System.out.println(category_code_2.length);
//		for (int i = 0; i < name.length; i++) {
		for (int i = 0; i < menu_seqs.length; i++) {
			dto = new MenuDto();
//			dto.setStore_seq(sdto.getStore_seq());
			dto.setMenu_seq(Integer.parseInt(menu_seqs[i]));
			dto.setCategory_code(category_code_2[i]);
			dto.setMenu_name(name[i]);
			dto.setMenu_content(content[i]);
			dto.setMenu_price(price[i]);
			dto.setMenu_state(state[i]);
			list.add(dto);
			dto=null;
		}
		System.out.println(list);
		map.put("list", list);
		map.put("store_seq", sdto.getStore_seq());
		count=sqlSession.update(namespace+"updateMenu",map);
		return count>0?true:false;
	}

	@Override
	public boolean deletemenu(String[] del_menus) {
		int count=0;
		System.out.println("del_menus:"+del_menus[0]);
		Map<String, Object> map=new HashMap<>();
		map.put("arr", del_menus);
		count=sqlSession.update(namespace+"deleteMenu",map);
		return count>0?true:false;
	}


}
