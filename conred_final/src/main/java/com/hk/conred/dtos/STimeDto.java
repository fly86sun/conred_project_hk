package com.hk.conred.dtos;

import java.util.Arrays;

public class STimeDto {
	private int store_time_seq;
	private int store_seq;
	private String store_time_day;
	private String store_time_open;
	private String store_time_close;
	private String store_time_break;
	
	public STimeDto() {
		super();
	}
	
	public STimeDto(int store_time_seq, int store_seq, String store_time_day, String store_time_open,
			String store_time_close, String store_time_break) {
		super();
		this.store_time_seq = store_time_seq;
		this.store_seq = store_seq;
		this.store_time_day = store_time_day;
		this.store_time_open = store_time_open;
		this.store_time_close = store_time_close;
		this.store_time_break = store_time_break;
	}
	
	public int getStore_time_seq() {
		return store_time_seq;
	}
	public void setStore_time_seq(int store_time_seq) {
		this.store_time_seq = store_time_seq;
	}
	public int getStore_seq() {
		return store_seq;
	}
	public void setStore_seq(int store_seq) {
		this.store_seq = store_seq;
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
	@Override
	public String toString() {
		return "STimeDto [store_time_seq=" + store_time_seq + ", store_seq=" + store_seq + ", store_time_day="
				+ store_time_day + ", store_time_open=" + store_time_open + ", store_time_close=" + store_time_close
				+ ", store_time_break=" + store_time_break + "]";
	}
	
	
	
}
//package com.hk.conred.dtos;
//
//import java.util.Arrays;
//
//public class STimeDto {
//	private int store_time_seq;
//	private int store_seq;
//	private String store_time_day;
//	private String store_time_open;
//	private String store_time_close;
//	private String store_time_break;
//	private String [] time_day;
//	private String [] time_open;
//	private String [] time_close;
//	private String [] time_break;
//	
//	public STimeDto() {
//		super();
//	}
//
//	public STimeDto(int store_time_seq, int store_seq, String store_time_day, String store_time_open,
//			String store_time_close, String store_time_break, String[] time_day, String[] time_open,
//			String[] time_close, String[] time_break) {
//		super();
//		this.store_time_seq = store_time_seq;
//		this.store_seq = store_seq;
//		this.store_time_day = store_time_day;
//		this.store_time_open = store_time_open;
//		this.store_time_close = store_time_close;
//		this.store_time_break = store_time_break;
//		this.time_day = time_day;
//		this.time_open = time_open;
//		this.time_close = time_close;
//		this.time_break = time_break;
//	}
//
//	public int getStore_time_seq() {
//		return store_time_seq;
//	}
//
//	public void setStore_time_seq(int store_time_seq) {
//		this.store_time_seq = store_time_seq;
//	}
//
//	public int getStore_seq() {
//		return store_seq;
//	}
//
//	public void setStore_seq(int store_seq) {
//		this.store_seq = store_seq;
//	}
//
//	public String getStore_time_day() {
//		return store_time_day;
//	}
//
//	public void setStore_time_day(String store_time_day) {
//		this.store_time_day = store_time_day;
//	}
//
//	public String getStore_time_open() {
//		return store_time_open;
//	}
//
//	public void setStore_time_open(String store_time_open) {
//		this.store_time_open = store_time_open;
//	}
//
//	public String getStore_time_close() {
//		return store_time_close;
//	}
//
//	public void setStore_time_close(String store_time_close) {
//		this.store_time_close = store_time_close;
//	}
//
//	public String getStore_time_break() {
//		return store_time_break;
//	}
//
//	public void setStore_time_break(String store_time_break) {
//		this.store_time_break = store_time_break;
//	}
//
//	public String[] getTime_day() {
//		return time_day;
//	}
//
//	public void setTime_day(String[] time_day) {
//		this.time_day = time_day;
//	}
//
//	public String[] getTime_open() {
//		return time_open;
//	}
//
//	public void setTime_open(String[] time_open) {
//		this.time_open = time_open;
//	}
//
//	public String[] getTime_close() {
//		return time_close;
//	}
//
//	public void setTime_close(String[] time_close) {
//		this.time_close = time_close;
//	}
//
//	public String[] getTime_break() {
//		return time_break;
//	}
//
//	public void setTime_break(String[] time_break) {
//		this.time_break = time_break;
//	}
//
//	@Override
//	public String toString() {
//		return "STimeDto [store_time_seq=" + store_time_seq + ", store_seq=" + store_seq + ", store_time_day="
//				+ store_time_day + ", store_time_open=" + store_time_open + ", store_time_close=" + store_time_close
//				+ ", store_time_break=" + store_time_break + ", time_day=" + Arrays.toString(time_day) + ", time_open="
//				+ Arrays.toString(time_open) + ", time_close=" + Arrays.toString(time_close) + ", time_break="
//				+ Arrays.toString(time_break) + "]";
//	}
//	
//	
//}