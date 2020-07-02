package com.hk.conred.dtos;

import java.util.Date;

public class LikeDto {
	
	private int like_list_seq; 
	private String user_id;
	private int store_seq;
	private String store_name;
	private String store_intro_simple;
	private String store_address;
	private String store_photo_stored;
	private Date like_regdate;
	
	public LikeDto() {
	}

	public LikeDto(int like_list_seq, String user_id, int store_seq, String store_name, String store_intro_simple,
			String store_address, String store_photo_stored, Date like_regdate) {
		super();
		this.like_list_seq = like_list_seq;
		this.user_id = user_id;
		this.store_seq = store_seq;
		this.store_name = store_name;
		this.store_intro_simple = store_intro_simple;
		this.store_address = store_address;
		this.store_photo_stored = store_photo_stored;
		this.like_regdate = like_regdate;
	}

	public int getLike_list_seq() {
		return like_list_seq;
	}

	public void setLike_list_seq(int like_list_seq) {
		this.like_list_seq = like_list_seq;
	}

	public String getUser_id() {
		return user_id;
	}

	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}

	public int getStore_seq() {
		return store_seq;
	}

	public void setStore_seq(int store_seq) {
		this.store_seq = store_seq;
	}

	public String getStore_name() {
		return store_name;
	}

	public void setStore_name(String store_name) {
		this.store_name = store_name;
	}

	public String getStore_intro_simple() {
		return store_intro_simple;
	}

	public void setStore_intro_simple(String store_intro_simple) {
		this.store_intro_simple = store_intro_simple;
	}

	public String getStore_address() {
		return store_address;
	}

	public void setStore_address(String store_address) {
		this.store_address = store_address;
	}

	public String getStore_photo_stored() {
		return store_photo_stored;
	}

	public void setStore_photo_stored(String store_photo_stored) {
		this.store_photo_stored = store_photo_stored;
	}

	public Date getLike_regdate() {
		return like_regdate;
	}

	public void setLike_regdate(Date like_regdate) {
		this.like_regdate = like_regdate;
	}

	@Override
	public String toString() {
		return "LikeDto [like_list_seq=" + like_list_seq + ", user_id=" + user_id + ", store_seq=" + store_seq
				+ ", store_name=" + store_name + ", store_intro_simple=" + store_intro_simple + ", store_address="
				+ store_address + ", store_photo_stored=" + store_photo_stored + ", like_regdate=" + like_regdate + "]";
	}


	

	

	


	


	
	
	
}
