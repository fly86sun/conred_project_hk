package com.hk.conred.dtos;

public class SPhotoDto {
	private int store_photo_seq;
	private int store_seq;
	private String store_photo_origin;
	private String store_photo_stored;
	private double store_photo_size;
	private String store_photo_title;
	
	private double all_avg;
	
	public double getAll_avg() {
		return all_avg;
	}

	public void setAll_avg(double all_avg) {
		this.all_avg = all_avg;
	}

	public SPhotoDto() {
		super();
	}
	
	public SPhotoDto(int store_photo_seq, int store_seq, String store_photo_origin, String store_photo_stored,
			double store_photo_size, String store_photo_title) {
		super();
		this.store_photo_seq = store_photo_seq;
		this.store_seq = store_seq;
		this.store_photo_origin = store_photo_origin;
		this.store_photo_stored = store_photo_stored;
		this.store_photo_size = store_photo_size;
		this.store_photo_title = store_photo_title;
	}
	
	public int getStore_photo_seq() {
		return store_photo_seq;
	}
	public void setStore_photo_seq(int store_photo_seq) {
		this.store_photo_seq = store_photo_seq;
	}
	public int getStore_seq() {
		return store_seq;
	}
	public void setStore_seq(int store_seq) {
		this.store_seq = store_seq;
	}
	public String getStore_photo_origin() {
		return store_photo_origin;
	}
	public void setStore_photo_origin(String store_photo_origin) {
		this.store_photo_origin = store_photo_origin;
	}
	public String getStore_photo_stored() {
		return store_photo_stored;
	}
	public void setStore_photo_stored(String store_photo_stored) {
		this.store_photo_stored = store_photo_stored;
	}
	public double getStore_photo_size() {
		return store_photo_size;
	}
	public void setStore_photo_size(double store_photo_size) {
		this.store_photo_size = store_photo_size;
	}
	public String getStore_photo_title() {
		return store_photo_title;
	}
	public void setStore_photo_title(String store_photo_title) {
		this.store_photo_title = store_photo_title;
	}

	@Override
	public String toString() {
		return "SPhotoDto [store_photo_seq=" + store_photo_seq + ", store_seq=" + store_seq + ", store_photo_origin="
				+ store_photo_origin + ", store_photo_stored=" + store_photo_stored + ", store_photo_size="
				+ store_photo_size + ", store_photo_title=" + store_photo_title + ", all_avg=" + all_avg + "]";
	}

//	@Override
//	public String toString() {
//		return "SPhotoDto [store_photo_seq=" + store_photo_seq + ", store_seq=" + store_seq + ", store_photo_origin="
//				+ store_photo_origin + ", store_photo_stored=" + store_photo_stored + ", store_photo_size="
//				+ store_photo_size + ", store_photo_title=" + store_photo_title + "]";
//	}
	
	
	
}
