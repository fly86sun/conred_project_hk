package com.hk.conred.dtos;

public class RPhotoDto {

	private int reply_photo_seq;
	private int reply_seq;
	private String reply_photo_origin;
	private String reply_photo_stored;
	private double reply_photo_size;
	private int store_seq;
	private String user_id;
	
	public RPhotoDto() {
	}

	public RPhotoDto(int reply_photo_seq, int reply_seq, String reply_photo_origin, String reply_photo_stored,
			double reply_photo_size, int store_seq, String user_id) {
		super();
		this.reply_photo_seq = reply_photo_seq;
		this.reply_seq = reply_seq;
		this.reply_photo_origin = reply_photo_origin;
		this.reply_photo_stored = reply_photo_stored;
		this.reply_photo_size = reply_photo_size;
		this.store_seq = store_seq;
		this.user_id = user_id;
	}

	public int getReply_photo_seq() {
		return reply_photo_seq;
	}

	public void setReply_photo_seq(int reply_photo_seq) {
		this.reply_photo_seq = reply_photo_seq;
	}

	public int getReply_seq() {
		return reply_seq;
	}

	public void setReply_seq(int reply_seq) {
		this.reply_seq = reply_seq;
	}

	public String getReply_photo_origin() {
		return reply_photo_origin;
	}

	public void setReply_photo_origin(String reply_photo_origin) {
		this.reply_photo_origin = reply_photo_origin;
	}

	public String getReply_photo_stored() {
		return reply_photo_stored;
	}

	public void setReply_photo_stored(String reply_photo_stored) {
		this.reply_photo_stored = reply_photo_stored;
	}

	public double getReply_photo_size() {
		return reply_photo_size;
	}

	public void setReply_photo_size(double reply_photo_size) {
		this.reply_photo_size = reply_photo_size;
	}

	public int getStore_seq() {
		return store_seq;
	}

	public void setStore_seq(int store_seq) {
		this.store_seq = store_seq;
	}

	public String getUser_id() {
		return user_id;
	}

	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}

	@Override
	public String toString() {
		return "RPhotoDto [reply_photo_seq=" + reply_photo_seq + ", reply_seq=" + reply_seq + ", reply_photo_origin="
				+ reply_photo_origin + ", reply_photo_stored=" + reply_photo_stored + ", reply_photo_size="
				+ reply_photo_size + ", store_seq=" + store_seq + ", user_id=" + user_id + "]";
	}

	
	
	
	


	

	

	

	
	
	
}
