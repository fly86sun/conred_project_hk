package com.hk.conred.dtos;

public class CDto {
	private String category_code;
	private String category_name;
	
	public CDto() {
	}

	public CDto(String category_code, String category_name) {
		super();
		this.category_code = category_code;
		this.category_name = category_name;
	}

	public String getCategory_code() {
		return category_code;
	}

	public void setCategory_code(String category_code) {
		this.category_code = category_code;
	}

	public String getCategory_name() {
		return category_name;
	}

	public void setCategory_name(String category_name) {
		this.category_name = category_name;
	}

	@Override
	public String toString() {
		return "cDto [category_code=" + category_code + ", category_name=" + category_name + "]";
	}
	
	
}
