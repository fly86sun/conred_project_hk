package com.hk.conred.dtos;

public class CMainDto {
	private int category_main_seq;
	private int store_seq;
	private String category_code;
	
	public CMainDto() {
		super();
	}
	
	public CMainDto(int category_main_seq, int store_seq, String category_code) {
		super();
		this.category_main_seq = category_main_seq;
		this.store_seq = store_seq;
		this.category_code = category_code;
	}
	
	public int getCategory_main_seq() {
		return category_main_seq;
	}
	public void setCategory_main_seq(int category_main_seq) {
		this.category_main_seq = category_main_seq;
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
	
	@Override
	public String toString() {
		return "CMainDto [category_main_seq=" + category_main_seq + ", store_seq=" + store_seq + ", category_code="
				+ category_code + "]";
	}
	
}
