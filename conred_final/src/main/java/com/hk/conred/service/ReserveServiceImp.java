package com.hk.conred.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.hk.conred.daos.IReserveDao;
import com.hk.conred.daos.ReserveDaoImp;
import com.hk.conred.dtos.ReserveDto;


@Service
public class ReserveServiceImp implements IReserveService{
	
	@Autowired
	private IReserveDao reserveDaoImp;
	
	
	@Override
	public boolean insertReserveS(String user_id, int menu_seq, int store_seq, String reserve_price,String reserve_sdate, String reserve_edate) {
		return reserveDaoImp.insertReserveS(user_id, menu_seq, store_seq, reserve_price, reserve_sdate, reserve_edate);
	}

	@Override
	public boolean insertReserveT(String user_id, int menu_seq, int store_seq, String reserve_time,String reserve_price, String reserve_sdate) {
		return reserveDaoImp.insertReserveT(user_id, menu_seq, store_seq, reserve_time, reserve_price, reserve_sdate);
	}
	
	

	@Override
	public List<ReserveDto> reserveList(String user_id,String pnum) {	
		return reserveDaoImp.reserveList(user_id,pnum);
	}

	@Override
	public ReserveDto getReserve(int reserve_seq) {
		return reserveDaoImp.getReserve(reserve_seq);
	}

	@Override
	public List<ReserveDto> reserveMax(int store_seq, int menu_seq, String reserve_sdate) {
		return reserveDaoImp.reserveMax(store_seq, menu_seq, reserve_sdate);
	}

	@Override
	public List<ReserveDto> stayReserve(int store_seq, int menu_seq) {
		return reserveDaoImp.stayReserve(store_seq, menu_seq);
	}

	@Override
	public boolean userReserveCancel(int reserve_seq) {
		return reserveDaoImp.userReserveCancel(reserve_seq);
	}

	@Override
	public List<ReserveDto> userReservePhoto(String user_id) {
		return reserveDaoImp.userReservePhoto(user_id);
	}

	@Override
	public boolean reserveSuccess(int reserve_seq) {
		return reserveDaoImp.reserveSuccess(reserve_seq);
	}

	@Override
	public List<ReserveDto> userOnceReview(int store_seq, String user_id) {
		return reserveDaoImp.userOnceReview(store_seq, user_id);
	}

	@Override
	public boolean userReviewSuccess(String user_id, int store_seq) {
		return reserveDaoImp.userReviewSuccess(user_id, store_seq);
	}

	@Override
	public ReserveDto reserveSuccessInfo(int reserve_seq) {
		return reserveDaoImp.reserveSuccessInfo(reserve_seq);
	}

	@Override
	public List<ReserveDto> ownerStoreReserve(int store_seq, int pnum) {
		return reserveDaoImp.ownerStoreReserve(store_seq, pnum);
	}

	@Override
	public List<ReserveDto> ownerStoreReserveSuccess(int store_seq, int pnum) {
		return reserveDaoImp.ownerStoreReserveSuccess(store_seq, pnum);
	}



}
