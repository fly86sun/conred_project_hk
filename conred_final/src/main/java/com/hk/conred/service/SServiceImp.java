package com.hk.conred.service;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.hk.conred.daos.ICListDao;
import com.hk.conred.daos.ICMainDao;
import com.hk.conred.daos.IMenuDao;
import com.hk.conred.daos.IReplyDao;
import com.hk.conred.daos.ISDao;
import com.hk.conred.daos.ISLocaDao;
import com.hk.conred.daos.ISPhotoDao;
import com.hk.conred.daos.ISTimeDao;
import com.hk.conred.dtos.CMainDto;
import com.hk.conred.dtos.ODto;
import com.hk.conred.dtos.SDto;
import com.hk.conred.dtos.SLocaDto;
import com.hk.conred.dtos.SPhotoDto;
import com.hk.conred.dtos.STimeDto;

@Service
public class SServiceImp implements ISService {
	
	@Autowired
	private ISDao SDaoImp;
	@Autowired
	private ISTimeDao STimeDaoImp;
	@Autowired
	private ICMainDao CMainDaoImp;
	@Autowired
	private ICListDao CListDaoImp;
	@Autowired
	private IMenuDao MenuDaoImp;
	@Autowired
	private ISPhotoDao SPhotoDaoImp;
	@Autowired
	private ISLocaDao SLocaDaoImp;
	@Autowired
	private IReplyDao ReplyDaoImp;
	
	//매장등록(사업자등록정보)
	@Override
	public boolean insertStoreCertify(SDto sdto, HttpServletRequest request) {
		MultipartHttpServletRequest multi = (MultipartHttpServletRequest)request;

		MultipartFile multiFile_biz=multi.getFile("biz");
		MultipartFile multiFile_sales=multi.getFile("sales");
		
		//originName
		String originName_biz=multiFile_biz.getOriginalFilename();
		System.out.println("biz의 원본파일명:"+originName_biz);
		String originName_sales=multiFile_sales.getOriginalFilename();
		System.out.println("sales의 원본파일명:"+originName_sales);
			
		//storedName
		String createUUid_biz=UUID.randomUUID().toString().replaceAll("-", "");
		String storedName_biz = createUUid_biz+originName_biz.substring(originName_biz.indexOf("."));
		System.out.println("biz의 저장파일명:"+storedName_biz);
		String createUUid_sales=UUID.randomUUID().toString().replaceAll("-", "");
		String storedName_sales = createUUid_sales+originName_sales.substring(originName_sales.indexOf("."));
		System.out.println("sales의 저장파일명:"+storedName_sales);
			
		//fileSize
		String fileSize_biz=Long.toString(multiFile_biz.getSize());
		System.out.println("biz의 사이즈:"+fileSize_biz);
		String fileSize_sales=Long.toString(multiFile_sales.getSize());
		System.out.println("sales의 사이즈:"+fileSize_sales);
		
		//path
		//String path_biz="C:/Users/hkedu/git/conred/conred_final/src/main/webapp/upload_biz/";
		String path_biz = request.getSession().getServletContext().getRealPath("upload_biz/");
		System.out.println("가져온 경로:"+path_biz);
		//String path_sales="C:/Users/hkedu/git/conred/conred_final/src/main/webapp/upload_sales/";
		String path_sales = request.getSession().getServletContext().getRealPath("upload_sales/");
		System.out.println("가져온 경로:"+path_sales);
		File file_biz = new File(path_biz+storedName_biz);
		File file_sales = new File(path_sales+storedName_sales);
		
		sdto.setStore_license_biz_origin(originName_biz);
		sdto.setStore_license_biz_stored(storedName_biz);
		sdto.setStore_license_biz_size(fileSize_biz);
		sdto.setStore_license_sales_origin(originName_sales);
		sdto.setStore_license_sales_stored(storedName_sales);
		sdto.setStore_license_sales_size(fileSize_sales);
			
//		sdto.setStore_license_biz_origin("1");
//		sdto.setStore_license_biz_stored("1");
//		sdto.setStore_license_biz_size("1");
//		sdto.setStore_license_sales_origin("1");
//		sdto.setStore_license_sales_stored("1");
//		sdto.setStore_license_sales_size("1");
			
		boolean isS=false; 
		try {
			//이건 선생님이 알려준 방식 사용시
//			isS=SDaoImp.insertStoreCertify(new SDto (odto.getOwner_id(), store_owner_name, store_license_number,
//					originName_biz, storedName_biz, fileSize_biz, store_license_sales_origin, 
//					store_license_sales_stored, store_license_sales_size, store_owner_phone, store_agreement));
			isS=SDaoImp.insertStoreCertify(sdto);
			if(isS) {
				multiFile_biz.transferTo(file_biz);
				multiFile_sales.transferTo(file_sales);
			}
		} catch (IllegalStateException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
		return isS;
	}
	//매장등록2(매장정보)
	@Transactional
	@Override
	public boolean insertStoreInfo(SDto sdto,String[] time_day,String[] time_open,String[] time_close,String[] time_break, String[] store_photo_title, SLocaDto slocadto, HttpServletRequest request) {
		
		MultipartHttpServletRequest multi = (MultipartHttpServletRequest)request;
		List<MultipartFile> fileList = multi.getFiles("photos");
		
		List<SPhotoDto> list = new ArrayList<>();
//		for (MultipartFile mf : fileList) {s
		for (int i = 0; i < fileList.size(); i++) {
			SPhotoDto sphotodto = new SPhotoDto();
			//originName
//			String originName=mf.getOriginalFilename(); //상향된 for문 이용시
			String originName=fileList.get(i).getOriginalFilename();
			System.out.println("원본파일명:"+originName);
			
			//storedName
			String createUUid=UUID.randomUUID().toString().replaceAll("-", "");
			String storedName = createUUid+originName.substring(originName.indexOf("."));
			System.out.println("저장파일명:"+storedName);
			
			//fileSize
//			double fileSize=mf.getSize(); //상향된 for문 이용시
			double fileSize=fileList.get(i).getSize();
			System.out.println("파일사이즈:"+fileSize);
//			String fileSize=Long.toString(mf.getSize()); //String으로 형변환하려면
			
			System.out.println(store_photo_title[i]);
			
			String path = request.getSession().getServletContext().getRealPath("upload_sphoto/");
			System.out.println("가져온 경로:"+path);
//			String path="C:/Users/hkedu/git/conred/conred_final/src/main/webapp/upload_sphoto/";
			File file = new File(path+storedName);
			
			System.out.println("sdto에 넣으러간다");
			sphotodto.setStore_seq(sdto.getStore_seq());
			sphotodto.setStore_photo_origin(originName);
			sphotodto.setStore_photo_stored(storedName);
			sphotodto.setStore_photo_size(fileSize);
			sphotodto.setStore_photo_title(store_photo_title[i]);
			
			System.out.println("sdto에 넣는거 완료");
			list.add(sphotodto);
			try {
				System.out.println("파일업로드시도");
				fileList.get(i).transferTo(file);
				System.out.println("파일업로드완료");
			} catch (IllegalStateException e) {
				e.printStackTrace();
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
		
		//매장사진 값넣기
		SPhotoDaoImp.insertSPhoto(list);
		//매장좌표 값변경
		SLocaDaoImp.insertSLoca(sdto, slocadto);
//		SLocaDaoImp.updateSLoca(sdto, slocadto);
		//매장정보 값넣기
		SDaoImp.insertStoreInfo(sdto);
		//위의 updateStoreInfo을 true false 리턴 안해주는 이유
		//	>>어차피 여기서 오류나면 밑에 return은 실행되지않으니, 실행되면 true라는걸 알 수 있다.s
		return STimeDaoImp.insertStime(sdto,time_day,time_open,time_close,time_break);
	}
	//매장등록3(메뉴/서비스정보)
	@Transactional
	@Override
	public boolean insertStoreMenu(SDto sdto,CMainDto cmaindto,
			String[] clist,String[] category_code_2,String[] name,
			String[] content,String[] price,String[] state) {//아직미구현
		SDaoImp.updateStoreMenu(sdto);
		CMainDaoImp.insertCMain(cmaindto);
		CListDaoImp.insertCList(sdto, clist);
		ReplyDaoImp.adminInsertReview((int)sdto.getStore_seq());
//		MenuDaoImp.insertMenu(sdto, category_code_2, name, content, price, state);
		return MenuDaoImp.insertMenu(sdto, category_code_2, name, content, price, state);
	}
	
	
	//매장수정1(사업자등록정보)
	@Override
//	public boolean updateStoreCertify(SDto sdto, HttpServletRequest request, String sales_change, String biz_change) {
	public boolean updateStoreCertify(SDto sdto, HttpServletRequest request, SDto seq) {
		MultipartHttpServletRequest multi = (MultipartHttpServletRequest)request;

		//파일가져오기 biz
		MultipartFile multiFile_biz=multi.getFile("biz");
		System.out.println("파일명(값없으면 공백):"+multiFile_biz.getOriginalFilename());
		
		File file_biz = null;
		File file_sales = null;
		if(multiFile_biz.getOriginalFilename()!="") {
			//originName
			String originName_biz=multiFile_biz.getOriginalFilename();
			System.out.println("biz의 원본파일명:"+originName_biz);
			//storedName
			String createUUid_biz=UUID.randomUUID().toString().replaceAll("-", "");
			String storedName_biz = createUUid_biz+originName_biz.substring(originName_biz.indexOf("."));
			System.out.println("biz의 저장파일명:"+storedName_biz);
			//fileSize
			String fileSize_biz=Long.toString(multiFile_biz.getSize());
			System.out.println("biz의 사이즈:"+fileSize_biz);
			//path
			//String path_biz="C:/Users/hkedu/git/conred/conred_final/src/main/webapp/upload_biz/";
			String path_biz = request.getSession().getServletContext().getRealPath("upload_biz/");
			System.out.println("가져온 경로(biz):"+path_biz);
			//저장될파일경로+이름
//			File file_biz = new File(path_biz+storedName_biz);
			file_biz = new File(path_biz+storedName_biz);
			//새로운값들 dto에 넣기
			sdto.setStore_license_biz_origin(originName_biz);
			sdto.setStore_license_biz_stored(storedName_biz);
			sdto.setStore_license_biz_size(fileSize_biz);
		}else if(multiFile_biz.getOriginalFilename()==""){
			//기존값 dto에 넣기
			System.out.println("들어갈 biz기존원본명:"+seq.getStore_license_biz_origin());
			System.out.println("들어갈 biz기존저장명:"+seq.getStore_license_biz_stored());
			System.out.println("들어갈 biz기존사이즈:"+seq.getStore_license_biz_size());
			sdto.setStore_license_biz_origin(seq.getStore_license_biz_origin());
			sdto.setStore_license_biz_stored(seq.getStore_license_biz_stored());
			sdto.setStore_license_biz_size(seq.getStore_license_biz_size());
		}
		//파일가져오기 sales
		MultipartFile multiFile_sales=multi.getFile("sales");
		System.out.println("파일명(값없으면 공백):"+multiFile_sales.getOriginalFilename());
		if(multiFile_sales.getOriginalFilename()!="") {
			//originName
			String originName_sales=multiFile_sales.getOriginalFilename();
			System.out.println("sales의 원본파일명:"+originName_sales);
			//storedName
			String createUUid_sales=UUID.randomUUID().toString().replaceAll("-", "");
			String storedName_sales = createUUid_sales+originName_sales.substring(originName_sales.indexOf("."));
			System.out.println("sales의 저장파일명:"+storedName_sales);
			//fileSize
			String fileSize_sales=Long.toString(multiFile_sales.getSize());
			System.out.println("sales의 사이즈:"+fileSize_sales);
			//path
			//String path_sales="C:/Users/hkedu/git/conred/conred_final/src/main/webapp/upload_sales/";
			String path_sales = request.getSession().getServletContext().getRealPath("upload_sales/");
			System.out.println("가져온 경로(sales):"+path_sales);
			//저장될파일경로+이름
//			File file_sales = new File(path_sales+storedName_sales);
			file_sales = new File(path_sales+storedName_sales);
			//새로운값들 dto에 넣기
			sdto.setStore_license_sales_origin(originName_sales);
			sdto.setStore_license_sales_stored(storedName_sales);
			sdto.setStore_license_sales_size(fileSize_sales);
		}else if(multiFile_sales.getOriginalFilename()==""){
			//기존값 dto에 넣기
			System.out.println("들어갈 sales기존원본명:"+seq.getStore_license_sales_origin());
			System.out.println("들어갈 sales기존저장명:"+seq.getStore_license_sales_stored());
			System.out.println("들어갈 sales기존사이즈:"+seq.getStore_license_sales_size());
			sdto.setStore_license_sales_origin(seq.getStore_license_sales_origin());
			sdto.setStore_license_sales_stored(seq.getStore_license_sales_stored());
			sdto.setStore_license_sales_size(seq.getStore_license_sales_size());
		}
		
		boolean isS=false; 
		isS=SDaoImp.updateStoreCertify(sdto);
		if(isS) {
			if(multiFile_biz.getOriginalFilename()!=""){
				try {
					multiFile_biz.transferTo(file_biz);
				} catch (IllegalStateException e) {
					e.printStackTrace();
				} catch (IOException e) {
					e.printStackTrace();
				}
			}
			if(multiFile_sales.getOriginalFilename()!=""){
				try {
					multiFile_sales.transferTo(file_sales);
				} catch (IllegalStateException e) {
					e.printStackTrace();
				} catch (IOException e) {
					e.printStackTrace();
				}
			}
		}
		
		return isS;
	}
	
	//매장수정2(매장정보)
	@Override
	public boolean updateStoreInfo(SDto sdto, String[] time_open, String[] time_close,
			String[] time_break, String[] store_photo_title, SLocaDto slocadto, HttpServletRequest request,
			String[] dels,String[] store_photo_title_before,String[] before_seq,List<STimeDto> list_stime) {

		MultipartHttpServletRequest multi = (MultipartHttpServletRequest)request;
		List<MultipartFile> fileList = multi.getFiles("photos");
		
		//여기서 추가로 해줘야만 할 것: 삽입,수정,삭제 다 되야함
		
		//삽입:새로 추가된 파일for문돌려서 db넣어주고 파일업로드(insert:기존과같음)
		//수정:글자가 바뀐 것들만 따로 update처리(기존의 db는 삭제하거나 글자건들거나 두가지 뿐이다.)
		//삭제:hidden으로 삭제하라고 넘겨받은 기존 sphoto의 seq값들로 삭제처리(String[] dels)

		//삽입●●●●●●●●●●●●●●●●●●●●ㅇㅋ
		List<SPhotoDto> list = new ArrayList<>();
		System.out.println(fileList.size());
		if(store_photo_title!=null) {
	//		for (MultipartFile mf : fileList) {
			for (int i = 0; i < fileList.size(); i++) {
				SPhotoDto sphotodto = new SPhotoDto();
				//originName
	//			String originName=mf.getOriginalFilename(); //상향된 for문 이용시
				String originName=fileList.get(i).getOriginalFilename();
				System.out.println("원본파일명:"+originName);
				
				//storedName
				String createUUid=UUID.randomUUID().toString().replaceAll("-", "");
				String storedName = createUUid+originName.substring(originName.indexOf("."));
				System.out.println("저장파일명:"+storedName);
				
				//fileSize
	//			double fileSize=mf.getSize(); //상향된 for문 이용시
				double fileSize=fileList.get(i).getSize();
				System.out.println("파일사이즈:"+fileSize);
	//			String fileSize=Long.toString(mf.getSize()); //String으로 형변환하려면
				
				System.out.println(store_photo_title[i]);
				
				String path = request.getSession().getServletContext().getRealPath("upload_sphoto/");
				System.out.println("가져온 경로:"+path);
	//			String path="C:/Users/hkedu/git/conred/conred_final/src/main/webapp/upload_sphoto/";
				File file = new File(path+storedName);
				
				System.out.println("sdto에 넣으러간다");
				sphotodto.setStore_seq(sdto.getStore_seq());
				sphotodto.setStore_photo_origin(originName);
				sphotodto.setStore_photo_stored(storedName);
				sphotodto.setStore_photo_size(fileSize);
				sphotodto.setStore_photo_title(store_photo_title[i]);
				
				System.out.println("sdto에 넣는거 완료");
				list.add(sphotodto);
				try {
					System.out.println("파일업로드시도");
					fileList.get(i).transferTo(file);
					System.out.println("파일업로드완료");
				} catch (IllegalStateException e) {
					e.printStackTrace();
				} catch (IOException e) {
					e.printStackTrace();
				}
			}
			//매장사진 값넣기
			SPhotoDaoImp.insertSPhoto(list);
		}
		
		//수정●●●●●●●●●●●●●●●●●●●●ㅇㅋ
//		store_photo_title_before
		List<SPhotoDto> list_before = new ArrayList<>();
		if(before_seq!=null) {
			for (int i = 0; i < before_seq.length; i++) {
				SPhotoDto sphotodto_before = new SPhotoDto();
				//기존사진의 seq, title을 dto에 담고 list에추가
				sphotodto_before.setStore_photo_seq(Integer.parseInt(before_seq[i]));
				sphotodto_before.setStore_photo_title(store_photo_title_before[i]);
				list_before.add(sphotodto_before);
			}
			//매장사진 제목수정
			SPhotoDaoImp.updateSPhoto(list_before);
		}
		
		//삭제●●●●●●●●●●●●●●●●●●●●
		if(dels[0]!=" ") {
			SPhotoDaoImp.deleteSPhoto(dels);
		}
		
		//밑에도 다 update로 바꿔주기. --한개씩 확인하자 이번엔
		//매장좌표 값변경하기
//		SLocaDaoImp.insertSLoca(sdto, slocadto);
		SLocaDaoImp.updateSLoca(sdto, slocadto);
		//매장정보 값넣기
		SDaoImp.insertStoreInfo(sdto);//얘는 얘 자체가 update문이다.
		//return 매장시간 값넣기
//		return STimeDaoImp.insertStime(sdto,time_day,time_open,time_close,time_break);
		return STimeDaoImp.updateStime(sdto,time_open,time_close,time_break,list_stime);
	}
	
	//매장수정(완료후수정:reupdate)(매장정보 + 메뉴/서비스정보)
		@Override
		public boolean reupdateStore(SDto sdto, String[] time_open, String[] time_close,
				String[] time_break, String[] store_photo_title, SLocaDto slocadto, HttpServletRequest request,
				String[] dels,String[] store_photo_title_before,String[] before_seq,
				CMainDto cmaindto,String[] clist,String[] category_code_2,String[] name,
				String[] content,String[] price,String[] state,List<STimeDto> list_stime,String[] del_menus, String[] menu_seqs,
				String[] category_code_3, String[] name_2, String[] content_2, String[] price_2, String[] state_2) {

			MultipartHttpServletRequest multi = (MultipartHttpServletRequest)request;
			List<MultipartFile> fileList = multi.getFiles("photos");
			
			//1.매장정보 수정111111111111111111111111111111111111111111111111111111111111111111111111111111111
			
			//삽입●●●●●●●●●●●●●●●●●●●●ㅇㅋ
			List<SPhotoDto> list = new ArrayList<>();
			System.out.println(fileList.size());
			if(store_photo_title!=null) {
		//		for (MultipartFile mf : fileList) {
				for (int i = 0; i < fileList.size(); i++) {
					SPhotoDto sphotodto = new SPhotoDto();
					//originName
		//			String originName=mf.getOriginalFilename(); //상향된 for문 이용시
					String originName=fileList.get(i).getOriginalFilename();
					System.out.println("원본파일명:"+originName);
					
					//storedName
					String createUUid=UUID.randomUUID().toString().replaceAll("-", "");
					String storedName = createUUid+originName.substring(originName.indexOf("."));
					System.out.println("저장파일명:"+storedName);
					
					//fileSize
		//			double fileSize=mf.getSize(); //상향된 for문 이용시
					double fileSize=fileList.get(i).getSize();
					System.out.println("파일사이즈:"+fileSize);
		//			String fileSize=Long.toString(mf.getSize()); //String으로 형변환하려면
					
					System.out.println(store_photo_title[i]);
					
					String path = request.getSession().getServletContext().getRealPath("upload_sphoto/");
					System.out.println("가져온 경로:"+path);
		//			String path="C:/Users/hkedu/git/conred/conred_final/src/main/webapp/upload_sphoto/";
					File file = new File(path+storedName);
					
					System.out.println("sdto에 넣으러간다");
					sphotodto.setStore_seq(sdto.getStore_seq());
					sphotodto.setStore_photo_origin(originName);
					sphotodto.setStore_photo_stored(storedName);
					sphotodto.setStore_photo_size(fileSize);
					sphotodto.setStore_photo_title(store_photo_title[i]);
					
					System.out.println("sdto에 넣는거 완료");
					list.add(sphotodto);
					try {
						System.out.println("파일업로드시도");
						fileList.get(i).transferTo(file);
						System.out.println("파일업로드완료");
					} catch (IllegalStateException e) {
						e.printStackTrace();
					} catch (IOException e) {
						e.printStackTrace();
					}
				}
				//매장사진 값넣기
				SPhotoDaoImp.insertSPhoto(list);
			}
			
			//수정●●●●●●●●●●●●●●●●●●●●ㅇㅋ
//			store_photo_title_before
			List<SPhotoDto> list_before = new ArrayList<>();
			if(before_seq!=null) {
				for (int i = 0; i < before_seq.length; i++) {
					SPhotoDto sphotodto_before = new SPhotoDto();
					//기존사진의 seq, title을 dto에 담고 list에추가
					sphotodto_before.setStore_photo_seq(Integer.parseInt(before_seq[i]));
					sphotodto_before.setStore_photo_title(store_photo_title_before[i]);
					list_before.add(sphotodto_before);
				}
				//매장사진 제목수정
				SPhotoDaoImp.updateSPhoto(list_before);
			}
			
			//삭제●●●●●●●●●●●●●●●●●●●●ㅇㅋ
			if(dels[0]!=" ") {
				SPhotoDaoImp.deleteSPhoto(dels);
			}
			//매장좌표 값변경
//			SLocaDaoImp.insertSLoca(sdto, slocadto);
			SLocaDaoImp.updateSLoca(sdto, slocadto);
			//매장정보 값넣기
			SDaoImp.insertStoreInfo(sdto);
			//위의 updateStoreInfo을 true false 리턴 안해주는 이유
			//	>>어차피 여기서 오류나면 밑에 return은 실행되지않으니, 실행되면 true라는걸 알 수 있다.s
			
			//2. 카테고리, menu 수정222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222
			
			SDaoImp.updateStoreMenu(sdto);//얘는 그대로(최대인원/날짜 업데이트)
			System.out.println("매장됐습니다.");
			CMainDaoImp.updateCMain(cmaindto);//업데이트(대표카테고리 업데이트)
			System.out.println("메인카테고리 됐습니다.");
			
			//clist 모두삭제 
			CListDaoImp.deleteCList(sdto);//기존 카테고리리스트 삭제
			System.out.println("카테고리리스트 삭제 됐습니다..");
//			//clist 모두추가
			CListDaoImp.insertCList(sdto, clist);//기존과같은방식으로 카테고리리스트 추가
			System.out.println("카테고리리스트 추가 됐습니다..");
			
			//menu 모두삭제 추가
//			MenuDaoImp.deleteMenu(sdto);//기존 메뉴리스트 삭제
//			System.out.println("기존 메뉴리스트 삭제 됐습니다..");
//			MenuDaoImp.insertMenu(sdto, category_code_2, name, content, price, state);//얘도그대로
//			System.out.println("기존 메뉴리스트 추가 됐습니다..");
			
			//위에꺼 fk오류 뜨니 delflag바꿔주기로 하자
			//전달할 것 sdto, category_code, name, content, price, state
			MenuDaoImp.updatemenu(sdto, category_code_2, name, content, price, state, menu_seqs);//기존 메뉴리스트 삭제표시(delflag)
			System.out.println("메뉴 업데이트 됐습니다");
			MenuDaoImp.deletemenu(del_menus);//기존 메뉴리스트 삭제표시(delflag)
			System.out.println("메뉴 삭제업데이트 됐습니다.");
			if(category_code_3!=null) {
				MenuDaoImp.insertMenu(sdto, category_code_3, name_2, content_2, price_2, state_2);//얘도그대로
				System.out.println("새 메뉴 insert 됐습니다.");
			}
			System.out.println("insert할 새 메뉴는 없습니다.");
			
//			return STimeDaoImp.insertStime(sdto,time_day,time_open,time_close,time_break);
			return STimeDaoImp.updateStime(sdto,time_open,time_close,time_break,list_stime);
		}
	
	
	
	
	//Store Seq 가져오기
	@Override
	public SDto selectStoreSeq(ODto odto) {
		return SDaoImp.selectStoreSeq(odto);
	}
	//일반 매장 상세정보들 가져오기
	@Override
	public SDto selectStoreDetail(int store_seq) {
		return SDaoImp.selectStoreDetail(store_seq);
	}
	//매장 리스트+각 리스트의 상세정보 가져오기
	@Override
	public List<SDto> StoreSeqList(String[] store_seq_list) {
		return SDaoImp.StoreSeqList(store_seq_list);
	}


	
	
	

}
