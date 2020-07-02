package com.hk.conred.service;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.hk.conred.daos.IRPhotoDao;
import com.hk.conred.dtos.RPhotoDto;

@Service
public class RPhotoServiceImp implements IRPhotoService{
	
	@Autowired
	private IRPhotoDao rPhotoDao;
	
	@Override
	public boolean reviewPhotoInsert(List<RPhotoDto> list) {
		
//		MultipartHttpServletRequest multi=(MultipartHttpServletRequest)request;
//		List<MultipartFile> fileList=multi.getFiles("photos");
//		String reply_content=multi.getParameter("reply_content");
//		double reply_service=(double)multi.getParameter("star-input01");
//		List<RPhotoDto> list=new ArrayList<>();
//		
//		for (int i = 0; i < fileList.size(); i++) {
//			RPhotoDto dto=new RPhotoDto();
//			
//			//originName
//			String originName=fileList.get(i).getOriginalFilename();
//			//storedName
//			String createUUID=UUID.randomUUID().toString().replace("-", "");
//			String storedName=createUUID+originName.substring(originName.indexOf("."));
//			//fileSize
//			double fileSize=fileList.get(i).getSize();
//			
//			//path
//			String path=request.getSession().getServletContext().getRealPath("upload_rphoto/");
//			System.out.println("@@@@@@@@사진경로::"+path);
//			File file=new File(path+storedName);
//			
//			//////////////////
//			dto.setReply_photo_origin(originName);
//			dto.setReply_photo_stored(storedName);
//			dto.setReply_photo_size(fileSize);
//			list.add(dto);
//			
//			try {
//				System.out.println("파일업로드 시작!!");
//				fileList.get(i).transferTo(file);
//				System.out.println("파일업로드 성공");
//			} catch (IllegalStateException e) {
//				e.printStackTrace();
//			} catch (IOException e) {
//				e.printStackTrace();
//			}
//			
//		}
		return rPhotoDao.reviewPhotoInsert(list);
	}

	@Override
	public List<RPhotoDto> reviewPhotoList(int store_seq) {
		return rPhotoDao.reviewPhotoList(store_seq);
	}

	@Override
	public List<RPhotoDto> userReplyPhoto() {
		return rPhotoDao.userReplyPhoto();
	}
	
	

	

}
