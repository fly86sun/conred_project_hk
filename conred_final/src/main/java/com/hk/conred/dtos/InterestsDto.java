package com.hk.conred.dtos;

import java.util.Arrays;

public class InterestsDto {

	private int interests_seq;
	private String user_id;
	private int category_code;
	private String [] category_codes;
	
	
	public InterestsDto() {
	}
 

	public InterestsDto(int interests_seq, String user_id, int category_code, String[] category_codes) {
		super();
		this.interests_seq = interests_seq;
		this.user_id = user_id;
		this.category_code = category_code;
		this.category_codes = category_codes;
	}


	public int getInterests_seq() {
		return interests_seq;
	}


	public void setInterests_seq(int interests_seq) {
		this.interests_seq = interests_seq;
	}


	public String getUser_id() {
		return user_id;
	}


	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}


	public int getCategory_code() {
		return category_code;
	}


	public void setCategory_code(int category_code) {
		this.category_code = category_code;
	}


	public String[] getCategory_codes() {
		return category_codes;
	}


	public void setCategory_codes(String[] category_codes) {
		this.category_codes = category_codes;
	}


	@Override
	public String toString() {
		return "InterestsDto [interests_seq=" + interests_seq + ", user_id=" + user_id + ", category_code="
				+ category_code + ", category_codes=" + Arrays.toString(category_codes) + "]";
	}

	
	
	
}
