package com.hk.conred.service;

import java.util.List;

import com.hk.conred.dtos.SPhotoDto;

public interface ISPhotoService {
	public List<SPhotoDto> selectSPhoto(int store_seq);
}
