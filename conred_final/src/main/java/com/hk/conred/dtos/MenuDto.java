package com.hk.conred.dtos;

public class MenuDto {
	private int menu_seq;
	private int store_seq;
	private String category_code;
	private String menu_name;
	private String menu_content;
	private String menu_price;
	private String menu_state;
	private String menu_delflag;
	
	private String category_name;
	private int store_maxman;
	private int store_time_seq;
	private String store_time_day;
	private String store_time_open;
	private String store_time_close;
	private String store_time_break;
	private int rownum;
	

	
	
	public MenuDto() {
		super();
	}


	

	public MenuDto(int menu_seq, int store_seq, String category_code, String menu_name, String menu_content,
			String menu_price, String menu_state, String menu_delflag) {
		super();
		this.menu_seq = menu_seq;
		this.store_seq = store_seq;
		this.category_code = category_code;
		this.menu_name = menu_name;
		this.menu_content = menu_content;
		this.menu_price = menu_price;
		this.menu_state = menu_state;
		this.menu_delflag = menu_delflag;
	}




	public MenuDto(int menu_seq, int store_seq, String category_code, String menu_name, String menu_content,
			String menu_price, String menu_state, String category_name, int store_maxman, int store_time_seq,
			String store_time_day, String store_time_open, String store_time_close, String store_time_break,
			int rownum) {
		super();
		this.menu_seq = menu_seq;
		this.store_seq = store_seq;
		this.category_code = category_code;
		this.menu_name = menu_name;
		this.menu_content = menu_content;
		this.menu_price = menu_price;
		this.menu_state = menu_state;
		this.category_name = category_name;
		this.store_maxman = store_maxman;
		this.store_time_seq = store_time_seq;
		this.store_time_day = store_time_day;
		this.store_time_open = store_time_open;
		this.store_time_close = store_time_close;
		this.store_time_break = store_time_break;
		this.rownum = rownum;
	}



	public String getMenu_delflag() {
		return menu_delflag;
	}

	public void setMenu_delflag(String menu_delflag) {
		this.menu_delflag = menu_delflag;
	}
	
	public int getMenu_seq() {
		return menu_seq;
	}




	public void setMenu_seq(int menu_seq) {
		this.menu_seq = menu_seq;
	}




	public int getStore_seq() {
		return store_seq;
	}




	public void setStore_seq(int store_seq) {
		this.store_seq = store_seq;
	}




	public String getCategory_code() {
		return category_code;
	}




	public void setCategory_code(String category_code) {
		this.category_code = category_code;
	}




	public String getMenu_name() {
		return menu_name;
	}




	public void setMenu_name(String menu_name) {
		this.menu_name = menu_name;
	}




	public String getMenu_content() {
		return menu_content;
	}




	public void setMenu_content(String menu_content) {
		this.menu_content = menu_content;
	}




	public String getMenu_price() {
		return menu_price;
	}




	public void setMenu_price(String menu_price) {
		this.menu_price = menu_price;
	}




	public String getMenu_state() {
		return menu_state;
	}




	public void setMenu_state(String menu_state) {
		this.menu_state = menu_state;
	}




	public String getCategory_name() {
		return category_name;
	}




	public void setCategory_name(String category_name) {
		this.category_name = category_name;
	}




	public int getStore_maxman() {
		return store_maxman;
	}




	public void setStore_maxman(int store_maxman) {
		this.store_maxman = store_maxman;
	}




	public int getStore_time_seq() {
		return store_time_seq;
	}




	public void setStore_time_seq(int store_time_seq) {
		this.store_time_seq = store_time_seq;
	}




	public String getStore_time_day() {
		return store_time_day;
	}




	public void setStore_time_day(String store_time_day) {
		this.store_time_day = store_time_day;
	}




	public String getStore_time_open() {
		return store_time_open;
	}




	public void setStore_time_open(String store_time_open) {
		this.store_time_open = store_time_open;
	}




	public String getStore_time_close() {
		return store_time_close;
	}




	public void setStore_time_close(String store_time_close) {
		this.store_time_close = store_time_close;
	}




	public String getStore_time_break() {
		return store_time_break;
	}




	public void setStore_time_break(String store_time_break) {
		this.store_time_break = store_time_break;
	}




	public int getRownum() {
		return rownum;
	}




	public void setRownum(int rownum) {
		this.rownum = rownum;
	}




	@Override
	public String toString() {
		return "MenuDto [menu_seq=" + menu_seq + ", store_seq=" + store_seq + ", category_code=" + category_code
				+ ", menu_name=" + menu_name + ", menu_content=" + menu_content + ", menu_price=" + menu_price
				+ ", menu_state=" + menu_state + ", menu_delflag=" + menu_delflag + ", category_name=" + category_name
				+ ", store_maxman=" + store_maxman + ", store_time_seq=" + store_time_seq + ", store_time_day="
				+ store_time_day + ", store_time_open=" + store_time_open + ", store_time_close=" + store_time_close
				+ ", store_time_break=" + store_time_break + ", rownum=" + rownum + "]";
	}


	


	
	
	
	
	
}
