package com.hk.conred.dtos;

public class ULocaDto {

	private int user_location_seq;
	private String user_id;
	private String user_latitude;
	private String user_longitude;
	
	
	public ULocaDto() {
	}


	public ULocaDto(int user_location_seq, String user_id, String user_latitude, String user_longitude) {
		super();
		this.user_location_seq = user_location_seq;
		this.user_id = user_id;
		this.user_latitude = user_latitude;
		this.user_longitude = user_longitude;
	}


	public int getUser_location_seq() {
		return user_location_seq;
	}


	public void setUser_location_seq(int user_location_seq) {
		this.user_location_seq = user_location_seq;
	}


	public String getUser_id() {
		return user_id;
	}


	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}


	public String getUser_latitude() {
		return user_latitude;
	}


	public void setUser_latitude(String user_latitude) {
		this.user_latitude = user_latitude;
	}


	public String getUser_longitude() {
		return user_longitude;
	}


	public void setUser_longitude(String user_longitude) {
		this.user_longitude = user_longitude;
	}


	@Override
	public String toString() {
		return "uLocaDto [user_location_seq=" + user_location_seq + ", user_id=" + user_id + ", user_latitude="
				+ user_latitude + ", user_longitude=" + user_longitude + "]";
	}
	
	
}
