package com.hk.conred;

import java.awt.geom.Arc2D.Double;
import java.io.File;
import java.io.IOException;
import java.lang.ProcessBuilder.Redirect;
import java.rmi.server.RemoteServer;
import java.text.DateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Locale;
import java.util.Map;
import java.util.UUID;

import javax.annotation.Resource;
import javax.servlet.ServletRequest;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.hk.conred.dtos.InterestsDto;
import com.hk.conred.dtos.LikeDto;
import com.hk.conred.dtos.MenuDto;
import com.hk.conred.dtos.QnaDto;
import com.hk.conred.dtos.RPhotoDto;
import com.hk.conred.dtos.ReplyDto;
import com.hk.conred.dtos.ReserveDto;
import com.hk.conred.dtos.UDto;
import com.hk.conred.service.IInterestsService;
import com.hk.conred.service.ILikeService;
import com.hk.conred.service.IMenuService;
import com.hk.conred.service.IOService;
import com.hk.conred.service.IQnaService;
import com.hk.conred.service.IRPhotoService;
import com.hk.conred.service.IReplyService;
import com.hk.conred.service.IReserveService;
import com.hk.conred.service.IUService;
import com.hk.conred.service.InterestsServiceImp;
import com.hk.conred.service.QnaServiceImp;
import com.sun.glass.ui.Menu;

import oracle.net.aso.p;

 
@Controller
public class Sungsu {
	
	private static final Logger logger = LoggerFactory.getLogger(Sungsu.class);
	
	
//	@RequestMapping(value = "home.do", method = RequestMethod.GET)
//	public String home(Locale locale, Model model) {
//		logger.info("Welcome home! The client locale is {}.", locale);
//		
//		Date date = new Date();
//		DateFormat dateFormat = DateFormat.getDateTimeInstance(DateFormat.LONG, DateFormat.LONG, locale);
//		
//		String formattedDate = dateFormat.format(date);
//		
//		model.addAttribute("serverTime", formattedDate );
//		
//		return "test/home"; 
//	}
	
	
	@Autowired
	private IUService uService;
	
	@Autowired
	private IOService oService;
	
	@Autowired
	private IReserveService reserveService;
	
	@Autowired
	private IQnaService qnaService;
	
	@Autowired
	private ILikeService likeService;
	
	@Autowired
	private IReplyService replyService;
	
	@Autowired
	private IMenuService menuService;
	
	@Autowired
	private IRPhotoService rPhotoService;
	@Autowired
	private IInterestsService interestsService;
	
	
	@RequestMapping(value = "user_regist_finish.do", method = RequestMethod.GET)
	public String user_regist_finish(Locale locale, Model model) {
		logger.info("테스트용 푸터 접근 {}.", locale);
		
		
		
		return "user/user_regist_finish"; 
	}
	

	
	@RequestMapping(value = "sungsu.do", method = RequestMethod.GET)
	public String sungsu(Locale locale, Model model) {
		logger.info("테스트용 푸터 접근 {}.", locale);
		

		
		
		return "test/sungsu"; 
	}
	
	

	@RequestMapping(value = "test_reserve_success.do", method = RequestMethod.GET)
	public String test_reserve_success(Locale locale, Model model) {
		logger.info("테스트 결제완료창 {}.", locale);
	
		return "user/user_regist_finish"; 
	}
	
	@RequestMapping(value = "error.do", method = RequestMethod.GET)
	public String test_error(Locale locale, Model model) {
		logger.info("테스트 에러페이지 {}.", locale);
	
		return "error/error"; 
	}
	
	
	
	
	@RequestMapping(value = "user_regist.do", method = RequestMethod.GET)
	public String user_regist(Locale locale, Model model) {
		logger.info("유저 회원가입 접근 {}.", locale);

		return "user/user_regist"; 
		
	}
		
	
	@ResponseBody
	@RequestMapping(value = "user_idcheck_ajax.do", method = {RequestMethod.GET,RequestMethod.POST})
	public Map<String, String> user_idcheck_ajax(Locale locale, Model model,String user_id) {
		logger.info("유저 아이디체크ajax {}.", locale);
		String user_result=(String)uService.userIdCheck(user_id);
		Map<String, String> map=new HashMap<>();
		map.put("user_result", user_result);
		return map; 
	}
	
	
	
//	@RequestMapping(value = "user_insert.do", method = {RequestMethod.GET,RequestMethod.POST})
//	public String user_insert(Locale locale, Model model,UDto dto,String user_email1,String user_email3,HttpServletRequest request) {
//		logger.info("테스트용 유저 회원가입 폼 {}.", locale);
//		dto.setUser_email(user_email1+"@"+user_email3);
//		//성별 null일경우 String타입으로 값 받을수 있게 수정(*왜 null값이 입력이 안되는지 모르겠음)
//		if(dto.getUser_sex()==null) { 
//			dto.setUser_sex("");
//		}
//		HttpSession session=request.getSession();
//		session.setAttribute("udto", dto);
//		return "user/user_regist_category";
//	}	  
		 
		
	
	
	
	@RequestMapping(value = "user_regist_category.do", method = {RequestMethod.GET,RequestMethod.POST})
	public String user_regist_category(Locale locale, Model model,String []category_code,String user_id,HttpServletRequest request) {
		logger.info("관심사 선택완료후 가입완료 메시지 출력페이지로 이동{}.", locale);
			
			HttpSession session=request.getSession();
			UDto dto=(UDto)session.getAttribute("udto");

		
			boolean isS=uService.insertUser(dto, category_code,dto.getUser_id());
			if(isS){ 
				return "redirect:user_regist_finish.do";						
			}else {
				model.addAttribute("msg", "회원가입이 실패됐습니다");
				return "error/error";
			}
	}
	 
		
		 
//	@RequestMapping(value = "user_login.do", method = {RequestMethod.GET,RequestMethod.POST})
//	public String user_login(Locale locale, Model model,HttpServletRequest request,UDto dto) {
//		logger.info("유저 로그인접근 {}.", locale);
//		HttpSession session=request.getSession();
//		UDto uldto=uService.getLogin(dto.getUser_id(),dto.getUser_password());
//
//			if(uldto==null) {
//				model.addAttribute("msg", "존재하지 않는 아이디입니다 다시한번 확인해주세요");
//				return "error/error";
//			}else{
//				if(uldto.getUser_out().equals("Y")){
//					model.addAttribute("msg", "탈퇴한 회원 입니다");
//					return "error/error";
//				}else if(uldto.getUser_black().equals("Y")) {
//					model.addAttribute("msg", "블랙된 회원입니다");
//					return "error/error";
//				}else {   
//					session.setAttribute("uldto", uldto);
//					return "redirect:index.do";
//				}
//			} 
//			  
//		
//			 
//	} 
	
	
	@RequestMapping(value = "user_logout.do", method = {RequestMethod.GET,RequestMethod.POST})
	public String user_logout(Locale locale, Model model,HttpServletRequest request) {
		logger.info("사용자 로그아웃 {}.", locale);
		request.getSession().invalidate();
		return "redirect:index.do"; 
	} 
		
	
	@RequestMapping(value = "user_myinfo.do", method = {RequestMethod.GET,RequestMethod.POST})
	public String user_myinfo(Locale locale, Model model,HttpServletRequest request) {
		logger.info("사용자 마이페이지{}.", locale);
		HttpSession session=request.getSession();
		UDto uldto=(UDto)session.getAttribute("uldto");
		UDto dto=uService.userMyInfo(uldto.getUser_id());
		model.addAttribute("dto", dto);
		return "user/user_myinfo";  
	}
	
	@RequestMapping(value = "user_myinfo_update.do", method = {RequestMethod.GET,RequestMethod.POST})
	public String user_myinfo_update(Locale locale, Model model,UDto dto,String user_email1,String user_email3,String user_update_sex) {
		logger.info("사용자 마이페이지{}.", locale);
		if(user_update_sex==null) {
			
		}else {
			dto.setUser_sex(user_update_sex);
		}
		
		dto.setUser_email(user_email1+"@"+user_email3);
		boolean isS=uService.userUpdate(dto); 
		if(isS) {
			return "redirect:user_myinfo.do"; 
		}else { 
			model.addAttribute("msg", "정보수정에 실패하였습니다.");
			return "error/error";  			
		}
	}
	
	@RequestMapping(value = "user_myinfo_delete.do", method = {RequestMethod.GET,RequestMethod.POST})
	public String user_myinfo_delete(Locale locale, Model model,HttpServletRequest request) {
		logger.info("사용자 탈퇴{}.", locale);
		HttpSession session=request.getSession();
		UDto uldto=(UDto)session.getAttribute("uldto");
		boolean isS=uService.userDelete(uldto.getUser_id());
		if(isS) { 
			request.getSession().invalidate();
			return "redirect:index.do";
		}else { 
			model.addAttribute("msg", "회원탈퇴에 실패하였습니다.");
			return "error/error";  			
		}
	}
	
	
	
	@RequestMapping(value = "user_mypage.do", method = {RequestMethod.GET,RequestMethod.POST})
	public String user_mypage(Locale locale, Model model,HttpServletRequest request) {
		logger.info("사용자 마이페이지{}.", locale);
		HttpSession session=request.getSession();
		UDto uldto=(UDto)session.getAttribute("uldto"); 
		UDto dto=uService.getStats(uldto.getUser_id());
		List<UDto> list=uService.userInterestsIcon(uldto.getUser_id());
		model.addAttribute("dto", dto);
		model.addAttribute("list", list);
		
		return "user/user_mypage";  
	}
	
	@RequestMapping(value = "user_mypage_review.do", method = {RequestMethod.GET,RequestMethod.POST})
	public String user_mypage_review(Locale locale, Model model,HttpServletRequest request) {
		logger.info("사용자 마이페이지_리뷰{}.", locale);
		HttpSession session=request.getSession();
		UDto uldto=(UDto)session.getAttribute("uldto");
		List<ReplyDto> list=replyService.replyList(uldto.getUser_id(),"1");
		List<ReplyDto> sphoto_list=replyService.userReplyStorePhoto(uldto.getUser_id());
		List<RPhotoDto> rphoto_list=rPhotoService.userReplyPhoto();
		model.addAttribute("list",list); 
		model.addAttribute("sphoto_list",sphoto_list); 
		model.addAttribute("rphoto_list",rphoto_list); 
		return "user/user_mypage_review";  
	}
	
	@ResponseBody
	@RequestMapping(value = "user_review_ajax.do", method = {RequestMethod.GET,RequestMethod.POST})
	public Map<String, Object> user_review_ajax(Locale locale, Model model,HttpServletRequest request,String pnum){
		logger.info("사용자 리뷰 스크롤{}.", locale);
		HttpSession session=request.getSession();
		UDto uldto=(UDto)session.getAttribute("uldto");
		List<ReplyDto> list=replyService.replyList(uldto.getUser_id(),pnum);
		List<ReplyDto> sphoto_list=replyService.userReplyStorePhoto(uldto.getUser_id());
		List<RPhotoDto> rphoto_list=rPhotoService.userReplyPhoto();
		
		Map<String, Object> map=new HashMap<>();
		map.put("list", list); 
		map.put("sphoto_list", sphoto_list);
		map.put("rphoto_list", rphoto_list);
		return map;
	}
	
	@RequestMapping(value = "user_review_delete.do", method = {RequestMethod.GET,RequestMethod.POST})
	public String user_review_delete(Locale locale, Model model,HttpServletRequest request,int reply_seq) {
		logger.info("사용자 리뷰삭제 {}.", locale);
		System.out.println("@@@@reply_seq:::"+reply_seq);
		HttpSession session=request.getSession(); 
		UDto uldto=(UDto)session.getAttribute("uldto");
		boolean isS=replyService.userReplyDelete(uldto.getUser_id(), reply_seq);
		if(isS) {
			return "redirect:user_mypage_review.do";
		}else {
			model.addAttribute("msg", "리뷰삭제에 실패하였습니다.");
			return "error/error";
		}
	}
	

	
	
	@RequestMapping(value = "user_mypage_qna.do", method = {RequestMethod.GET,RequestMethod.POST})
	public String user_mypage_qna(Locale locale, Model model,HttpServletRequest request) {
		logger.info("사용자 마이페이지_문의{}.", locale);
		HttpSession session=request.getSession();
		UDto uldto=(UDto)session.getAttribute("uldto");
		List<QnaDto> list=(List<QnaDto>)qnaService.qnaList(uldto.getUser_id(),"1");
		List<QnaDto> photo_list=(List<QnaDto>)qnaService.userQnaPhoto(uldto.getUser_id());
		model.addAttribute("list",list);
		model.addAttribute("photo_list",photo_list);
		return "user/user_mypage_qna";   
	}
	  
	@ResponseBody
	@RequestMapping(value = "user_qna_ajax.do", method = {RequestMethod.GET,RequestMethod.POST})
	public Map<String, List<QnaDto>> user_qna_ajax(Locale locale, Model model,HttpServletRequest request,String pnum) {
		logger.info("사용자 문의 스크롤{}.", locale);
		HttpSession session=request.getSession();
		UDto uldto=(UDto)session.getAttribute("uldto");
		List<QnaDto> list=(List<QnaDto>)qnaService.qnaList(uldto.getUser_id(),pnum);
		List<QnaDto> photo_list=(List<QnaDto>)qnaService.userQnaPhoto(uldto.getUser_id());
		Map<String, List<QnaDto>> map=new HashMap<>();
		map.put("photo_list", photo_list);
		map.put("list", list);
		return map;  
	}  
	
	@RequestMapping(value = "user_qna_update_form.do", method = {RequestMethod.GET,RequestMethod.POST})
	public String user_qna_update_form(Locale locale, Model model,int qna_seq) {
		logger.info("사용자_문의 수정 {}.", locale);
		QnaDto dto=qnaService.getUserQna(qna_seq);
		model.addAttribute("dto", dto);
		return "user/user_mypage_qna_update";  
	}
	
	@RequestMapping(value = "user_qna_update.do", method = {RequestMethod.GET,RequestMethod.POST})
	public String user_qna_update(Locale locale, Model model,int qna_seq,String qna_title,String qna_content,String qna_hide) {
		logger.info("사용자_문의 수정완료 {}.", locale);
		
		boolean isS=qnaService.userQnaUpdate(qna_seq, qna_title, qna_content, qna_hide);
		if(isS) {
			return "redirect:user_mypage_qna.do"; 
		}else {
			model.addAttribute("msg", "문의수정에 실패하였습니다.");
			return "error/error"; 
		} 
	}
	
	@RequestMapping(value = "user_qna_delete.do", method = {RequestMethod.GET,RequestMethod.POST})
	public String user_qna_delete(Locale locale, Model model,int qna_seq) {
		logger.info("사용자_문의 삭제 {}.", locale);
		boolean isS=qnaService.userQnaDelete(qna_seq); 
		if(isS) {
			return "redirect:user_mypage_qna.do";  			
		}else {
			model.addAttribute("msg", "문의삭제에 실패하였습니다");
			return "error/error";
		}
	}
	
		
	@RequestMapping(value = "user_mypage_reserve.do", method = {RequestMethod.GET,RequestMethod.POST})
	public String user_mypage_reservation(Locale locale, Model model,HttpServletRequest request) {
		logger.info("사용자 마이페이지_예약{}.", locale);
		HttpSession session=request.getSession();
		UDto uldto=(UDto)session.getAttribute("uldto");
		List<ReserveDto> list=reserveService.reserveList(uldto.getUser_id(), "1");
		List<ReserveDto> photo_list=reserveService.userReservePhoto(uldto.getUser_id());
		model.addAttribute("list", list);
		model.addAttribute("photo_list", photo_list);
		return "user/user_mypage_reserve";  
	}
	
	@ResponseBody 
	@RequestMapping(value = "user_reserve_ajax.do", method = {RequestMethod.GET,RequestMethod.POST})
	public Map<String, List<ReserveDto>> user_reserve_ajax(Locale locale, Model model,HttpServletRequest request,String pnum) {
		logger.info("사용자예약 스크롤{}.", locale);
		HttpSession session=request.getSession();
		UDto uldto=(UDto)session.getAttribute("uldto");
		List<ReserveDto> list=reserveService.reserveList(uldto.getUser_id(), pnum);
		List<ReserveDto> photo_list=reserveService.userReservePhoto(uldto.getUser_id());
		Map<String, List<ReserveDto>> map=new HashMap<>();
		map.put("list", list);
		map.put("photo_list", photo_list);
		return map;  
	}
	
	@RequestMapping(value = "user_reserve_cancel.do", method = {RequestMethod.GET,RequestMethod.POST})
	public String user_reserve_cancel(Locale locale, Model model,int reserve_seq) {
		logger.info("사용자 예약 취소{}.", locale);
		boolean isS=reserveService.userReserveCancel(reserve_seq);
		if(isS) { 
			return "redirect:user_mypage_reserve.do"; 
		}else {
			model.addAttribute("msg", "예약취소에 실패하였습니다.");
			return "error/error";
		}
	} 
	
	@RequestMapping(value = "user_reserve_success.do", method = {RequestMethod.GET,RequestMethod.POST})
	public String user_reserve_success(String msg, Locale locale, Model model,HttpServletRequest request,String imp_uid,String merchant_uid) {
		logger.info("유저 선택메뉴 결제{}.", locale);
		System.out.println("@@@imp_uid::"+imp_uid);
		System.out.println("@@@merchant_uid::"+merchant_uid); 
		System.out.println("@@@msg::"+msg); // msg담아서말고 merchant_uid받은걸로 셀렉트결과뿌려주기
		int reserve_seq=Integer.parseInt(msg);
		ReserveDto dto=reserveService.reserveSuccessInfo(reserve_seq);
		model.addAttribute("dto", dto);
		System.out.println("결제정보들@:"+dto); 
		return "user/user_reserve_success";  
	}
	
	
	
	
	@RequestMapping(value = "user_mypage_like.do", method = {RequestMethod.GET,RequestMethod.POST})
	public String user_mypage_like(Locale locale, Model model,HttpServletRequest request) {
		logger.info("사용자 마이페이지_좋아요{}.", locale);
		HttpSession session=request.getSession();
		UDto uldto=(UDto)session.getAttribute("uldto");
		List<LikeDto> list=likeService.likeList(uldto.getUser_id(),1); 
		List<LikeDto> list_store_img=likeService.likeStoreImg(uldto.getUser_id());
		model.addAttribute("list",list);
		model.addAttribute("list_store_img", list_store_img);
		return "user/user_mypage_like";  
	}
	 
	@ResponseBody
	@RequestMapping(value = "user_like_ajax.do", method = {RequestMethod.GET,RequestMethod.POST})
	public Map<String, List<LikeDto>> user_like_ajax(Locale locale, Model model,HttpServletRequest request,int pnum) {
		logger.info("사용자 좋아요 스크롤{}.", locale);
		HttpSession session=request.getSession();
		UDto uldto=(UDto)session.getAttribute("uldto"); 
		List<LikeDto> list=likeService.likeList(uldto.getUser_id(),pnum); 
		List<LikeDto> list_store_img=likeService.likeStoreImg(uldto.getUser_id());
		System.out.println("list@@::::"+list);
		System.out.println("list_store_img@@@::"+list_store_img);
		Map<String, List<LikeDto>> map=new HashMap<>(); 
		map.put("list", list);  
		map.put("list_store_img", list_store_img); 
		return map;   
	}
	
	@RequestMapping(value = "user_like_delete.do", method = {RequestMethod.GET,RequestMethod.POST})
	public String user_like_delete(Locale locale, Model model,int like_list_seq) {
		logger.info("사용자 좋아요 취소{}.", locale);
		boolean isS=likeService.userLikeDelete(like_list_seq);
		if(isS) { 
			return "redirect:user_mypage_like.do";  	 		
		}else {
			model.addAttribute("msg", "좋아요 취소에 실패하였습니다.");
			return "error/error";
		}
	}
	
	
	
	
	@RequestMapping(value = "select_regist.do", method = RequestMethod.GET)
	public String select_regist(Locale locale, Model model) {
		logger.info("사용자 회원가입폼 접근 {}.", locale);
		
		return "all/select_regist"; 
	}
	
	
	
	
	
	
	
	/*
	
	
	
	
	       
	owner_login.do
	
	
	 */ 
	
	@RequestMapping(value = "asd.do", method = {RequestMethod.GET,RequestMethod.POST})
	public String asd(Locale locale, Model model) {
		logger.info("사용자 마이페이지_문의{}.", locale);
		
		return "user/user_mypage_like";  
	}
	
	
	
	
	@RequestMapping(value = "user_regist_category_test.do", method = {RequestMethod.GET,RequestMethod.POST})
	public String user_regist_category_test(Locale locale, Model model) {
		logger.info("사용자 카테고리 틀 만들기{}.", locale);
		
		return "user/user_regist_category_test";  
	}
	
		
	@RequestMapping(value = "test_reserve.do", method = {RequestMethod.GET,RequestMethod.POST})
	public String test_reserve(Locale locale, Model model,HttpServletRequest request) {
		logger.info("테스트 결제{}.", locale);
		
		
		return "test/test_reserve";  
	}
	
	@ResponseBody
	@RequestMapping(value = "test_reserve2.do", method = {RequestMethod.GET,RequestMethod.POST})
	public void test_reserve2(Locale locale, Model model,String imp_uid,String merchant_uid) {
		logger.info("가맹점쪽 상황 << 여기서 해당주문건에 대한 정보 받기{}.", locale);
		logger.info("@@imp_uid@@:"+imp_uid);
		logger.info("@@주문번호==reserve_seq@@:"+merchant_uid);
		int reserve_seq=Integer.parseInt(merchant_uid);
		boolean isS=reserveService.reserveSuccess(reserve_seq);
		System.out.println("결제성공  @@ reserve_seq:"+reserve_seq);
		
//		return "test/test_reserve2";  
	}
	
	

	

	
	
	@RequestMapping(value = "user_store_reserve.do", method = {RequestMethod.GET,RequestMethod.POST})
	public String user_store_reserve(Locale locale, Model model,int store_seq,String store_name) {
		logger.info("매장 예약가능목록 출력{}.", locale);
		List<MenuDto> list_menu=menuService.selectMenu(store_seq);
		model.addAttribute("list_menu", list_menu);
		model.addAttribute("store_name", store_name);
		System.out.println(store_name);
		return "user/user_store_reserve";
	} 
	
	@RequestMapping(value = "user_reserve_time_select.do", method = {RequestMethod.GET,RequestMethod.POST})
	public String user_reserve_time_select(Locale locale, Model model,int menu_seq,String menu_state,int store_seq) {
		logger.info("사용자 해당메뉴선택후 숙박/당일여부 별로 예약하러가기{}.", locale);
		List<MenuDto> list=menuService.detailMenu(menu_seq,store_seq);
		List<ReserveDto> stay_reserve_list=reserveService.stayReserve(store_seq, menu_seq);
		System.out.println("!!!!!!!!!!::::::::::"+stay_reserve_list);
		if(menu_state.equals("T")) {
			model.addAttribute("list", list);
			return "user/user_reserve_time_selectT";			
		}else if(menu_state.equals("S")){
			model.addAttribute("list", list);
			model.addAttribute("stay_reserve_list", stay_reserve_list);
			return "user/user_reserve_time_selectS";
		}else {
			model.addAttribute("msg", "미구현 페이지 입니다");
			return "error/error";			
		}
	} 
	
	@ResponseBody
	@RequestMapping(value = "user_reserve_time_ajax.do", method = {RequestMethod.GET,RequestMethod.POST})
	public Map<String, Object> user_reserve_time_ajax(Locale locale, Model model,int menu_seq,int store_seq) {
		logger.info("사용자 예약 ajax {}.", locale);
//		System.out.println(menu_seq+"::@@@@@::"+store_seq);
		List<MenuDto> list=menuService.detailMenu(menu_seq,store_seq);
		List<ReserveDto> stay_reserve_list=reserveService.stayReserve(store_seq, menu_seq);
		Map<String, Object> map=new HashMap<>();
		map.put("list", list);	
		map.put("stay_reserve_list", stay_reserve_list);
		return map;
	}  
	
	
	@ResponseBody
	@RequestMapping(value = "user_selectWeek_ajax.do", method = {RequestMethod.GET,RequestMethod.POST})
	public Map<String, List<MenuDto>> user_selectWeek_ajax(Locale locale, Model model,int menu_seq,int store_seq,String store_time_day) {
		logger.info("선택요일에따라 시간출력 {}.", locale);
		List<MenuDto> listWeek=menuService.selectWeek(menu_seq, store_seq, store_time_day);	
		Map<String, List<MenuDto>> map=new HashMap<>();
		map.put("listWeek", listWeek); 	
		return map;
	}
	
	@RequestMapping(value = "reserve_successT.do", method = {RequestMethod.GET,RequestMethod.POST})
	public String reserve_successT(Locale locale, Model model,int menu_seq,int store_seq,String reserve_time,String reserve_sdate,String reserve_price,HttpServletRequest request) {
		logger.info("날짜,시간선택후 예약 {}.", locale);
		HttpSession session=request.getSession();
		UDto uldto=(UDto)session.getAttribute("uldto");
		boolean isS=reserveService.insertReserveT(uldto.getUser_id(), menu_seq, store_seq, reserve_time, reserve_price, reserve_sdate);
		if(isS) {
			return "redirect:index.do";		
		}else {
			model.addAttribute("msg", "당일예약에 실패하셨습니다");
			return "error/error";
		}
	}  
	
	  
	@ResponseBody
	@RequestMapping(value = "user_reservemax_ajax.do", method = {RequestMethod.GET,RequestMethod.POST})
	public Map<String, Object> user_reservemax_ajax(Locale locale, Model model,int menu_seq,int store_seq,String reserve_sdate,String store_time_day) {
		logger.info("선택요일에따라 시간출력 {}.", locale);
		List<ReserveDto> listMax=reserveService.reserveMax(store_seq, menu_seq, reserve_sdate);
		List<MenuDto> listWeek=menuService.selectWeek(menu_seq, store_seq, store_time_day);	
		Map<String, Object> map=new HashMap<>();
//		System.out.println(menu_seq+"::@@@@::"+store_seq+"::@@@@::"+reserve_sdate);
		map.put("listMax", listMax); 
		map.put("listWeek", listWeek);
		for (int i = 0; i < listMax.size(); i++) {
			System.out.println(listMax.get(i));	
		}  
		return map; 
	} 
	
	@RequestMapping(value = "reserve_successS.do", method = {RequestMethod.GET,RequestMethod.POST})
	public String reserve_successS(Locale locale, Model model,int menu_seq,int store_seq,String reserve_price,HttpServletRequest request,String reserve_sdate, String reserve_edate) {
		logger.info("날짜,시간 선택후 예약 {}.", locale);
		HttpSession session=request.getSession();
		UDto uldto=(UDto)session.getAttribute("uldto");
		System.out.println("@@@아이디::"+uldto.getUser_id()+"@@@메뉴일렬번호::"+menu_seq+"@@@가게일렬번호::"+store_seq+"@@@예약시작날짜::"+reserve_sdate+"::@@@@예약마지막날짜::"+reserve_edate+"@@@예약가격::"+reserve_price);
		System.out.println("@@@@@@@!!!!!!!!!!::"+reserve_price);
		boolean isS=reserveService.insertReserveS(uldto.getUser_id(), menu_seq, store_seq, reserve_price, reserve_sdate, reserve_edate);
		if(isS) { 
			return "redirect:index.do";
		}else {
			model.addAttribute("msg", "숙박예약에 실패하였습니다.");
			return "error/error";
		}
	}
	
	
//	@ResponseBody
//	@RequestMapping(value = "store_review_ajax.do", method = {RequestMethod.GET,RequestMethod.POST})
//	public Map<String, Object> store_review_ajax(Locale locale, Model model,int store_seq,String reply_content,double reply_service,double reply_price,double reply_clean ,HttpServletRequest request) {
//		logger.info("매장 리뷰 ajax {}.", locale);
//		Map<String, Object> map=new HashMap<>();
//		HttpSession session=request.getSession();
//		UDto uldto=(UDto)session.getAttribute("uldto");
//		List<ReplyDto> list=replyService.replyListStoreDetail(store_seq, 1);
//		map.put("list", list);
//		boolean isS=replyService.userInsertReview(uldto.getUser_id(),store_seq,reply_content,reply_service,reply_price,reply_clean);
//		if(isS) {
//			return map;  
//		}else { 
//			return null;			
//		}	
//	}
	
	
	@RequestMapping(value = "user_store_review.do", method = {RequestMethod.GET,RequestMethod.POST})
	public String user_review_img(Locale locale, Model model,HttpServletRequest request,int store_seq,String reply_content,
			@RequestParam("star-input01") double reply_service,@RequestParam("star-input02") double reply_price,@RequestParam("star-input03") double reply_clean,RedirectAttributes redirect ) {
		logger.info("유저 매장 리뷰,사진등록 {}.", locale);
		System.out.println("@@@@@@@@@@store_seq::"+store_seq);
		System.out.println("@@@@@@@@@@reply_content::"+reply_content);
		System.out.println("@@@@@@@@@@reply_service::"+reply_service);
		System.out.println("@@@@@@@@@@reply_price::"+reply_price);
		System.out.println("@@@@@@@@@@reply_clean::"+reply_clean);
		MultipartHttpServletRequest multi=(MultipartHttpServletRequest)request;
		List<MultipartFile> fileList=multi.getFiles("photos");
		HttpSession session=request.getSession();
		UDto uldto=(UDto)session.getAttribute("uldto");

		List<ReplyDto> list=replyService.replyListStoreDetail(store_seq, 1);
		ReplyDto list_avg=replyService.replyAvgStore(store_seq);
		List<RPhotoDto> list_photo=rPhotoService.reviewPhotoList(store_seq);
		System.out.println("fileList:"+fileList.size());
		//리뷰사진 안넣을때
		if(fileList.get(0).getOriginalFilename()=="") {
			replyService.userInsertReview(uldto.getUser_id(), store_seq, reply_content, reply_service, reply_clean, reply_price); 
			reserveService.userReviewSuccess(uldto.getUser_id(), store_seq);
//			list=replyService.replyListStoreDetail(store_seq, 1);
//			list_avg=replyService.replyAvgStore(store_seq); 
//			list_photo=rPhotoService.reviewPhotoList(store_seq);
//			model.addAttribute("list", list); 
//			model.addAttribute("list_avg", list_avg); 	
//			model.addAttribute("list_photo", list_photo); 	
//			return "all/review"; 
			redirect.addAttribute("store_seq", store_seq);
			return "redirect:review.do";
			
		//리뷰사진 넣을때	
		}else { 
			replyService.userInsertReview(uldto.getUser_id(), store_seq, reply_content, reply_service, reply_clean, reply_price);
			
			List<RPhotoDto> rPhoto_list=new ArrayList<>();
			
			for (int i = 0; i < fileList.size(); i++) {
				RPhotoDto dto=new RPhotoDto(); 
				
				//originName
				String originName=fileList.get(i).getOriginalFilename();
				//storedName
				String createUUID=UUID.randomUUID().toString().replace("-", "");
				String storedName=createUUID+originName.substring(originName.indexOf("."));
			 	//fileSize
				double fileSize=fileList.get(i).getSize();
				
				//path
				String path=request.getSession().getServletContext().getRealPath("upload_rphoto/");
				System.out.println("@@@@@@@@사진경로::"+path);
				File file=new File(path+storedName);
				
				//////////////////
				dto.setReply_photo_origin(originName);
				dto.setReply_photo_stored(storedName);
				dto.setReply_photo_size(fileSize);
				rPhoto_list.add(dto); 
				
				try {
					System.out.println("파일업로드 시작!!");
					fileList.get(i).transferTo(file);
					System.out.println("파일업로드 성공");
				} catch (IllegalStateException e) {
					e.printStackTrace();
				} catch (IOException e) {
					e.printStackTrace();
				}
				
			}
			
			rPhotoService.reviewPhotoInsert(rPhoto_list);
			reserveService.userReviewSuccess(uldto.getUser_id(), store_seq);
//			list=replyService.replyListStoreDetail(store_seq, 1);
//			list_avg=replyService.replyAvgStore(store_seq);
//			list_photo=rPhotoService.reviewPhotoList(store_seq);
//			model.addAttribute("list", list); 
//			model.addAttribute("list_avg", list_avg); 	
//			model.addAttribute("list_photo", list_photo); 
//			return "all/review";
			redirect.addAttribute("store_seq", store_seq);
			return "redirect:review.do";
		}
		
	}
	
	
	
	
	@ResponseBody
	@RequestMapping(value = "store_unlike_ajax.do", method = {RequestMethod.GET,RequestMethod.POST})
	public String store_unlike_ajax(Locale locale, Model model,String user_id,int store_seq) {
		logger.info("사용자 매장 좋아요 취소 {}.", locale);
		
		boolean isS=likeService.deleteLike(user_id, store_seq);
		if(isS) {
			return "Y";
		}else {
			return "N";
		}
	}
	
	@ResponseBody
	@RequestMapping(value = "store_like_ajax.do", method = {RequestMethod.GET,RequestMethod.POST})
	public String store_like_ajax(Locale locale, Model model,String user_id,int store_seq) {
		logger.info("사용자 매장 좋아요 {}.", locale);
		boolean isS=likeService.insertLike(user_id, store_seq);
		if(isS) {
			return "Y";
		}else {
			return "N";
		}
		
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
} 
