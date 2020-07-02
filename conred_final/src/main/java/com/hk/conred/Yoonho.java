package com.hk.conred;

import java.io.IOException;
import java.io.PrintWriter;
import java.rmi.RemoteException;
import java.text.DateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Locale;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.hk.conred.daos.IQnaDao;
import com.hk.conred.dtos.CListDto;
import com.hk.conred.dtos.CMainDto;
import com.hk.conred.dtos.LikeDto;
import com.hk.conred.dtos.MenuDto;
import com.hk.conred.dtos.ODto;
import com.hk.conred.dtos.QnaDto;
import com.hk.conred.dtos.ReplyDto;
import com.hk.conred.dtos.SDto;
import com.hk.conred.dtos.SLocaDto;
import com.hk.conred.dtos.SPhotoDto;
import com.hk.conred.dtos.STimeDto;
import com.hk.conred.dtos.UDto;
import com.hk.conred.service.ICListService;
import com.hk.conred.service.ICMainService;
import com.hk.conred.service.ILikeService;
import com.hk.conred.service.IMapService;
import com.hk.conred.service.IMenuService;
import com.hk.conred.service.IOService;
import com.hk.conred.service.IQnaService;
import com.hk.conred.service.IReplyService;
import com.hk.conred.service.ISPhotoService;
import com.hk.conred.service.ISService;
import com.hk.conred.service.ISTimeService;
import com.hk.conred.service.OServiceImp;

@Controller
public class Yoonho {
	
	private static final Logger logger = LoggerFactory.getLogger(Yoonho.class);
	
	@Autowired
	private IOService oService;
	@Autowired
	private ISService sService;
	@Autowired
	private ISTimeService sTimeService;
	@Autowired
	private ICMainService cMainService;
	@Autowired
	private ICListService cListService;
	@Autowired
	private IMenuService menuService;
	@Autowired
	private IReplyService replyService;
	@Autowired
	private IQnaService qnaService;
	@Autowired
	private ISPhotoService sPhotoService;
	@Autowired
	private IMapService mapService;
	@Autowired
	private ILikeService likeService;
	
	@RequestMapping(value = "yoonho.do", method = RequestMethod.GET)
	public String yoonho(Locale locale, Model model) {
		logger.info("윤호입장 {}.", locale);
		
		Date date = new Date();
		DateFormat dateFormat = DateFormat.getDateTimeInstance(DateFormat.LONG, DateFormat.LONG, locale);
		
		String formattedDate = dateFormat.format(date);
		
		model.addAttribute("serverTime", formattedDate );
		
		return "test/yoonho"; 
		
	}
	
//	@ResponseBody
//	@RequestMapping(value = "ajax_owner_id.do", method = RequestMethod.GET)
//	public Map<String, Object> ajax_owner_id(Locale locale, Model model, HttpServletRequest request, HttpServletResponse response) {
//		logger.info("아약스: 점주아이디 얻으러 이동 {}.", locale);
//		HttpSession session =request.getSession();
//		ODto oldto = (ODto)session.getAttribute("oldto");
//		SDto seq =sService.selectStoreSeq(oldto);
//		System.out.println(seq);
//		System.out.println(seq.getStore_seq());
//		
//		Map<String, Object> map =new HashMap<>();
//		map.put("seq", seq.getStore_seq());
//		return map; 
//	}
	
	@RequestMapping(value = "header.do", method = RequestMethod.GET)
	public String header(Locale locale, Model model) {
		logger.info("헤더1로 이동 {}.", locale);

		return "all/header"; 
	}
	@RequestMapping(value = "header2.do", method = RequestMethod.GET)
	public String header2(Locale locale, Model model) {
		logger.info("헤더2로 이동 {}.", locale);
		
		return "all/header2"; 
	}
	@RequestMapping(value = "header_map.do", method = RequestMethod.GET)
	public String header_map(Locale locale, Model model) {
		logger.info("헤더_맵으로 {}.", locale);
		
		
		return "all/header_map"; 
	}
	
	@RequestMapping(value = "container.do", method = RequestMethod.GET)
	public String container(Locale locale, Model model) {
		logger.info("컨테이너로 이동 {}.", locale);
		
		return "test/container"; 
	}
	@RequestMapping(value = "template.do", method = RequestMethod.GET)
	public String template(Locale locale, Model model) {
		logger.info("템플릿으로이동 {}.", locale);
		
		return "test/template"; 
	}

	
	@RequestMapping(value = "owner_regist.do", method = {RequestMethod.GET,RequestMethod.POST})
	public String owner_regist(Locale locale, Model model) {
		logger.info("점주 회원가입폼으로 이동 {}.", locale);
		
		return "owner/owner_regist"; 
	}
	

//	@RequestMapping(value = "owner_insert.do", method = {RequestMethod.GET,RequestMethod.POST})
//	public String owner_insert(Locale locale, Model model, ODto dto, String owner_email1, String owner_email2) {
//		logger.info("점주 회원정보 db에 입력 {}.", locale);
//		dto.setOwner_email(owner_email1+"@"+owner_email2);
//		
//		//성별 null일경우 String타입으로 값 받을수 있게 수정(*왜 null값이 입력이 안되는지 모르겠음)
//		if(dto.getOwner_sex()==null) {
//			dto.setOwner_sex("");
//		}
//		
//		System.out.println(dto.getOwner_id());
//		System.out.println(dto.getOwner_password());
//		System.out.println(dto.getOwner_name());
//		System.out.println(dto.getOwner_email());
//		System.out.println(dto.getOwner_birth());
//		System.out.println(dto.getOwner_sex());
//		System.out.println(dto.getOwner_regdate());
//		System.out.println(dto.getOwner_agreement());
//		
//		
//		boolean isS = oService.insertOwner(dto);
//		if(isS&&dto.getOwner_agreement().equals("Y")) {
//			System.out.println("회원가입성공");
//			return "owner/owner_regist_finish"; 
//		}else {
//			System.out.println("회원가입실패");
//			model.addAttribute("msg","점주 회원가입에 실패하였습니다.");
//			return "error/error"; 
//		}
//	}

//	@RequestMapping(value = "owner_login.do", method = {RequestMethod.GET,RequestMethod.POST})
//	public String owner_login(Locale locale, Model model, HttpServletRequest request, ODto dto) {
//		logger.info("점주 로그인후 test 공통메인으로 {}.", locale);
//		
//		HttpSession session=request.getSession();
//		ODto oldto=oService.getLogin(dto.getOwner_id(),dto.getOwner_password());
//
//		/*탈퇴컬럼 만들기 owner_out*/
////		if(oldto.getOwner_id()==null||oldto.getOwner_id().equals("")) {
//		if(oldto==null) {
//			System.out.println("아이디 다시한번 확인해주세요");
//			model.addAttribute("msg","아이디와 비밀번호를 다시한번 확인해주세요");
//			return "error/error";
//		}else{
//			SDto seq =sService.selectStoreSeq(oldto);
//			System.out.println(seq);
//			
//			System.out.println(oldto.getOwner_id());
//			
//			//문제는 seq값이 아직 없을경우에 밑에 cmain구할때 오류가난다.
//			//그렇다고 if문으로 seq!=null을 넣어주면 
//			CMainDto cmain =null;
//			if(seq!=null) {//만약 seq있을때(store 만들긴 한 사람인 경우)-- 이 경우 뿌려줄때도 조건값을바꿔야한다. 
//				cmain =cMainService.selectCMain(seq.getStore_seq());
//				System.out.println("대표카테!"+cmain);
//			}
//			session.setAttribute("oldto", oldto);
//			session.setAttribute("sdto", seq);
//			if(cmain!=null) {
//				session.setAttribute("cmaindto", cmain);
//			}
//			session.setMaxInactiveInterval(60*10*6); 
//			return "redirect:index.do"; 
//		}	
//	}

	@RequestMapping(value = "users_main_test.do", method = {RequestMethod.GET,RequestMethod.POST})
	public String users_main_test(Locale locale, Model model) {
		logger.info("공통메인(사용자별메인)테스트로 이동  {}.", locale);
		
		return "test/users_main_test"; 
	}
	
	@RequestMapping(value = "owner_regist_certify.do", method = {RequestMethod.GET,RequestMethod.POST})
	public String owner_regist_certify(Locale locale, Model model) {
		logger.info("점주: 매장등록1-1(사업자정보 입력 폼)으로 이동  {}.", locale);
		
		return "owner/owner_regist_certify"; 
	}
	
//	owner_regist_store.do 백업 : 파일업로드 전 @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
	
//	@RequestMapping(value = "owner_regist_store.do", method = {RequestMethod.GET,RequestMethod.POST})
//	public String owner_regist_store(Locale locale, Model model, SDto sdto, STimeDto stimedto, HttpServletRequest request) {
//		logger.info("점주: 매장등록(매장정보 입력)으로 이동  {}.", locale);
//		
//		HttpSession session=request.getSession();
//		ODto odto= (ODto)session.getAttribute("oldto");
//		
//		System.out.println("odto 아이디:"+odto.getOwner_id());
//		sdto.setOwner_id(odto.getOwner_id()); 
//		
//		sdto.setStore_license_number(sdto.getStore_license_number().replace(",",""));
//		sdto.setStore_owner_phone(sdto.getStore_owner_phone().replace(",",""));
//		
//		
//		System.out.println("sdto 아이디:"+sdto.getOwner_id());
//		System.out.println("sdto 사업자이름:"+sdto.getStore_owner_name());
//		System.out.println("sdto 사업자등록번호:"+sdto.getStore_license_number());
//		System.out.println("sdto 사업자증원본명:"+sdto.getStore_license_biz_origin());
//		System.out.println("sdto 사업자증저장명:"+sdto.getStore_license_biz_stored());
//		System.out.println("sdto 사업자증사이즈:"+sdto.getStore_license_biz_size());
//		System.out.println("sdto 영업증원본명:"+sdto.getStore_license_sales_origin());
//		System.out.println("sdto 영업증저장명:"+sdto.getStore_license_sales_stored());
//		System.out.println("sdto 영업증사이즈:"+sdto.getStore_license_sales_size());
//		System.out.println("sdto 사업자전화번호:"+sdto.getStore_owner_phone());
//		System.out.println("sdto 약관동의:"+sdto.getStore_agreement());
//		System.out.println("sdto 관리자승인:"+sdto.getStore_admin_state());
//		
//		System.out.println();
//		boolean isS=sService.insertStoreCertify(sdto);
//		
//		if(isS) {
//			System.out.println("매장생성 + 사업자정보등록 :성공");
//			return "owner/owner_regist_store";
//		}else{
//			System.out.println("매장생성 + 사업자정보등록 :실패");
//			return ""; 
//		}	
//	}
//	

	@RequestMapping(value = "owner_insert_certify.do", method = {RequestMethod.GET,RequestMethod.POST})
	public String owner_insert_certify(Locale locale, Model model, SDto sdto, HttpServletRequest request) {
		logger.info("점주: 매장등록1-2(사업자정보 입력)  {}.", locale);

		HttpSession session=request.getSession();
		ODto odto= (ODto)session.getAttribute("oldto");
		System.out.println("odto 아이디:"+odto.getOwner_id());
		
		sdto.setOwner_id(odto.getOwner_id()); 
		System.out.println("odto 아이디 sdto에 넣기 완료");
		
		System.out.println(sdto.getStore_license_number());
		//만약 3칸에서 받아와줄거라면 이거 쓰기
//		System.out.println(sdto.getStore_license_number().replace(",",""));
//		sdto.setStore_license_number(sdto.getStore_license_number().replace(",",""));
		System.out.println("사업자번호 sdto에 넣기 완료");
		sdto.setStore_owner_phone(sdto.getStore_owner_phone().replace(",",""));
		System.out.println("점주전화번호 sdto에 넣기 완료");
		
		System.out.println("sdto 아이디:"+sdto.getOwner_id());
		System.out.println("sdto 사업자이름:"+sdto.getStore_owner_name());
		System.out.println("sdto 사업자등록번호:"+sdto.getStore_license_number());
		System.out.println("sdto 사업자전화번호:"+sdto.getStore_owner_phone());
		System.out.println("sdto 약관동의:"+sdto.getStore_agreement());
		System.out.println("sdto 관리자승인:"+sdto.getStore_admin_state());
		
		boolean isS=sService.insertStoreCertify(sdto,request);
//		boolean isS=false;//임시 false: 사진업로드 test중 
		if(isS) {
			System.out.println("매장생성 + 사업자정보등록 :성공");
//			return "owner/owner_regist_store";
			return "redirect:owner_regist_store.do";
//			http://localhost:8090/conred/egist_store.jsp
		}else{
			System.out.println("매장생성 + 사업자정보등록 :실패");
			model.addAttribute("msg","사업자 정보 등록에 실패하였습니다.");
			return "error/error"; 
		}	
	}
	@RequestMapping(value = "owner_toUpdate_certify.do", method = {RequestMethod.GET,RequestMethod.POST})
	public String owner_toUpdate_certify(Locale locale, Model model, SDto sdto, HttpServletRequest request) {
		logger.info("점주: 매장수정1-1(사업자정보 수정 폼으로 이동(일단 도중수정ver))  {}.", locale);
		HttpSession session=request.getSession();
		ODto odto= (ODto)session.getAttribute("oldto");
		SDto seq =sService.selectStoreSeq(odto);
		System.out.println(seq);
		System.out.println("sdto seq:"+seq.getStore_seq());
		model.addAttribute("sdto",seq);
		return "owner/owner_update_certify";
	}
	
	@RequestMapping(value = "owner_update_certify.do", method = {RequestMethod.GET,RequestMethod.POST})
	public String owner_update_certify(Locale locale, Model model, SDto sdto,
			/* String sales_change, String biz_change, */HttpServletRequest request) {
		logger.info("점주: 매장수정1-2(사업자정보 수정(일단 도중수정ver))  {}.", locale);
		
		HttpSession session=request.getSession();
		ODto odto= (ODto)session.getAttribute("oldto");
		SDto seq =sService.selectStoreSeq(odto);
		
		System.out.println("odto 아이디:"+odto.getOwner_id());
		
		sdto.setOwner_id(odto.getOwner_id()); 
		System.out.println("odto 아이디 sdto에 넣기 완료");
		
		System.out.println(sdto.getStore_license_number());
//		System.out.println(sdto.getStore_license_number().replace(",",""));
		
		sdto.setStore_seq(seq.getStore_seq());
		System.out.println("매장seq sdto에 넣기 완료");
//		sdto.setStore_license_number(sdto.getStore_license_number().replace(",",""));
		sdto.setStore_license_number(sdto.getStore_license_number());
		System.out.println("사업자번호 sdto에 넣기 완료");
		sdto.setStore_owner_phone(sdto.getStore_owner_phone().replace(",",""));
		System.out.println("점주전화번호 sdto에 넣기 완료");
		
		System.out.println("sdto seq:"+sdto.getStore_seq());
		System.out.println("sdto 아이디:"+sdto.getOwner_id());
		System.out.println("sdto 사업자이름:"+sdto.getStore_owner_name());
		System.out.println("sdto 사업자등록번호:"+sdto.getStore_license_number());
		System.out.println("sdto 사업자전화번호:"+sdto.getStore_owner_phone());
		System.out.println("sdto 약관동의:"+sdto.getStore_agreement());
		System.out.println("sdto 관리자승인:"+sdto.getStore_admin_state());
		
		//만약 값이 바뀌지 않았으면 --이게 필요하지 않으려면? 
		//화면쪽에서 값을 넣는순간 기존값이 담긴 hidden을 없애주면 되긴한다.
		//하지만 여러파일일 경우? 이경우에도 마찬가지로 기존값이 담긴 hidden을 없애주면 된다.
		//이 경우에도 마찬가지로 service에 가서 hidden안의 값을 넣을지 말지를 판별해줘야한다.
		
//		얘넨 서비스에가서 if바꼈는지 안바꼈는지에 따라 값을 넣고말고를 정해주면 된다.
//		if(sales_change.equals("N")) {//sales값이 안바뀌었으면 기존sales값 넣기 dao
//			
//		}else if (biz_change.equals("N")) {//biz값이 안바뀌었으면 기존biz값 넣기 dao
//			
//		}

		//얘는 다음페이지에서 값을 뿌려줄건지 말건지 정해주기위한 녀석
		//null이면 뿌려주고 아니면 안뿌려주고. 근데 이렇게되면 나중에 그냥 수정할때는 못쓰나
		//아니다. 나중에도 더 큰 틀에 if문 걸어주면 된다. 뭐하면 하나더 만들어도되고
//		CMainDto cmain = cMainService.selectCMain(seq.getStore_seq());
		
//		boolean isS=sService.updateStoreCertify(sdto, request, sales_change, biz_change);
		boolean isS=sService.updateStoreCertify(sdto, request ,seq);
//		boolean isS=false;//임시 false: 사진업로드 test중 
		
		
		
		if(isS) {
			if(seq.getStore_name()==null) {
				System.out.println("매장수정 + 사업자정보수정 :성공");
				return "redirect:owner_regist_store.do";
			}else{
				System.out.println("매장수정 + 사업자정보수정 :성공");
				System.out.println("이미 다음페이지에 값이 있기 때문에 다음페이지에 값을 넣어서 이동합니다.");
				return "redirect:owner_toUpdate_store.do";
			}
		}else{
			System.out.println("매장수정 + 사업자정보수정 :실패");
			return ""; 
		}	
	}
	
	
	@RequestMapping(value = "owner_regist_store.do", method = {RequestMethod.GET,RequestMethod.POST})
	public String owner_regist_store(Locale locale, Model model,SDto sdto, STimeDto stimedto,String [] store_photo_title, SLocaDto slocadto, HttpServletRequest request) {
		logger.info("점주: 매장등록2-1 (상세정보, 사진, 주소, 영업시간 입력 폼)으로 이동  {}.", locale);
		HttpSession session=request.getSession();
		ODto odto= (ODto)session.getAttribute("oldto");
		SDto seq =sService.selectStoreSeq(odto);
		System.out.println(seq);
		System.out.println("sdto seq:"+seq.getStore_seq());
		model.addAttribute("sdto",seq);
		session.setAttribute("sdto",seq);
		
		return "owner/owner_regist_store";
	}
	@RequestMapping(value = "owner_insert_store.do", method = {RequestMethod.GET,RequestMethod.POST})
	public String owner_insert_store(Locale locale, Model model,SDto sdto, STimeDto stimedto,String [] store_photo_title, SLocaDto slocadto, HttpServletRequest request) {
		logger.info("점주: 매장등록2-2 (상세정보, 사진, 주소, 영업시간 입력) {}.", locale);
		
		//세션에서 id정보 가져오기(store_seq구하기용)
		HttpSession session=request.getSession();
		ODto odto= (ODto)session.getAttribute("oldto");
		SDto seq =sService.selectStoreSeq(odto);
		
		for (int i = 0; i < store_photo_title.length; i++) {
			System.out.println(i+"번째 사진이름"+store_photo_title[i]);
		}
		
		System.out.println("세션에서가져온sdto2의 store_seq값: "+seq.getStore_seq());
		sdto.setStore_seq(seq.getStore_seq());
		System.out.println("sdto에 넣은 store_seq값: "+sdto.getStore_seq());

		System.out.println("sdto 매장명:"+sdto.getStore_name());
		System.out.println("sdto 매장홈피링크:"+sdto.getStore_path());
		System.out.println("sdto 간단소개:"+sdto.getStore_intro_simple());
		System.out.println("sdto 상세소개:"+sdto.getStore_intro());
		System.out.println("sdto 영업상태:"+sdto.getStore_state());
		System.out.println("sdto 매장번호:"+sdto.getStore_phone());
		System.out.println("sdto 담당자번호:"+sdto.getStore_phone_manager());
		System.out.println("sdto 주소:"+sdto.getStore_address());
		System.out.println("sdto 상세주소:"+sdto.getStore_address_detail());
		System.out.println("sdto 영업시간 기타사항:"+sdto.getStore_time_other());
		System.out.println("sdto 은행명:"+sdto.getStore_bank());
		System.out.println("sdto 계좌번호:"+sdto.getStore_account());
//		System.out.println("배열로받아온 요일:"+store_time_day.toString());
		
		stimedto.setStore_seq(seq.getStore_seq());
		System.out.println("매장번호:"+stimedto.getStore_seq());
		System.out.println("요일:"+stimedto.getStore_time_day());
		System.out.println("개점시간:"+stimedto.getStore_time_open());
		System.out.println("폐점시간:"+stimedto.getStore_time_close());
		System.out.println("휴무여부:"+stimedto.getStore_time_break());
		String [] time_day=stimedto.getStore_time_day().split(",");
		String [] time_open=stimedto.getStore_time_open().split(",");
		String [] time_close=stimedto.getStore_time_close().split(",");
		String [] time_break=stimedto.getStore_time_break().split(",");
		
		for (int i = 0; i < time_day.length; i++) {
			System.out.println(time_day[i]+" : "+time_open[i]+"~"+time_close[i]+"/폐점여부:"+time_break[i]); 
		}
		
		System.out.println("위도 lat:"+slocadto.getStore_latitude());
		System.out.println("경도 lng:"+slocadto.getStore_longitude());
//		return ""; 
		boolean isS=sService.insertStoreInfo(sdto,time_day,time_open,time_close,time_break,store_photo_title,slocadto,request);
		if(isS) {
			System.out.println("매장정보 신규등록성공~");
			return "redirect:owner_regist_menu.do";
		}else{
			System.out.println("매장정보 신규등록실패~");
			model.addAttribute("msg","매장 정보 등록에 실패하였습니다.");
			return "error/error"; 
		}	
	}
	
	@RequestMapping(value = "owner_toUpdate_store.do", method = {RequestMethod.GET,RequestMethod.POST})
	public String owner_toUpdate_store(Locale locale, Model model, SDto sdto, HttpServletRequest request) {
		logger.info("점주: 매장수정2-1(상세정보, 사진, 주소, 영업시간 수정 폼으로 이동(일단 도중수정ver)) {}.", locale);
		HttpSession session=request.getSession();
		ODto odto= (ODto)session.getAttribute("oldto");
		SDto seq =sService.selectStoreSeq(odto);
		System.out.println(seq);
		System.out.println("sdto seq:"+seq.getStore_seq());
		List<STimeDto> list_stime =sTimeService.selectStime(seq.getStore_seq());
		System.out.println("list_stime : "+list_stime);
		List<SPhotoDto> list_sphoto = sPhotoService.selectSPhoto(seq.getStore_seq());
		System.out.println("list_sphoto : "+list_sphoto);
		List<SDto> list = new ArrayList<SDto>();
		list.add(seq);
		List<SLocaDto> list_sloca= mapService.getSloca_ajax(list);
		System.out.println(list_sloca);
		model.addAttribute("sdto",seq);
		model.addAttribute("list_stime",list_stime);// 영업시간
		model.addAttribute("list_sphoto",list_sphoto);// 매장사진
		model.addAttribute("list_sloca",list_sloca);// 매장좌표
		return "owner/owner_update_store";
	}

	@RequestMapping(value = "owner_update_store.do", method = {RequestMethod.GET,RequestMethod.POST})
	public String owner_update_store(Locale locale, Model model,SDto sdto,
			STimeDto stimedto,String [] store_photo_title,String [] store_photo_title_before,
			String[] before_seq,SLocaDto slocadto,String del, HttpServletRequest request) {
		logger.info("점주: 매장수정2-2 (상세정보, 사진, 주소, 영업시간 수정) {}.", locale);
		
		//insert때랑 다른점:기존의 store는 그대로 수정이고,
		//stime, sloca, sphoto만 insert아닌 update개념으로 바뀐다.
		
		//세션에서 id정보 가져오기(store_seq구하기용)
		HttpSession session=request.getSession();
		ODto odto= (ODto)session.getAttribute("oldto");
		SDto seq =sService.selectStoreSeq(odto);
		if(store_photo_title!=null) {
			for (int i = 0; i < store_photo_title.length; i++) {
				System.out.println(i+"번째 사진이름: "+store_photo_title[i]);
			}
		}
		if(store_photo_title_before!=null) {
			for (int i = 0; i < store_photo_title_before.length; i++) {
				System.out.println(i+"번째 기존사진seq: "+before_seq[i]);
				System.out.println(i+"번째 기존사진이름: "+store_photo_title_before[i]);
			}
		}
		System.out.println("세션에서가져온sdto2의 store_seq값: "+seq.getStore_seq());
		sdto.setStore_seq(seq.getStore_seq());
		System.out.println("sdto에 넣은 store_seq값: "+sdto.getStore_seq());

		System.out.println("sdto 매장명:"+sdto.getStore_name());
		System.out.println("sdto 매장홈피링크:"+sdto.getStore_path());
		System.out.println("sdto 간단소개:"+sdto.getStore_intro_simple());
		System.out.println("sdto 상세소개:"+sdto.getStore_intro());
		System.out.println("sdto 영업상태:"+sdto.getStore_state());
		System.out.println("sdto 매장번호:"+sdto.getStore_phone());
		System.out.println("sdto 담당자번호:"+sdto.getStore_phone_manager());
		System.out.println("sdto 주소:"+sdto.getStore_address());
		System.out.println("sdto 상세주소:"+sdto.getStore_address_detail());
		System.out.println("sdto 영업시간 기타사항:"+sdto.getStore_time_other());
		System.out.println("sdto 은행명:"+sdto.getStore_bank());
		System.out.println("sdto 계좌번호:"+sdto.getStore_account());
//		System.out.println("배열로받아온 요일:"+store_time_day.toString());
		
		stimedto.setStore_seq(seq.getStore_seq());
		System.out.println("매장번호:"+stimedto.getStore_seq());
		System.out.println("요일:"+stimedto.getStore_time_day());
		System.out.println("개점시간:"+stimedto.getStore_time_open());
		System.out.println("폐점시간:"+stimedto.getStore_time_close());
		System.out.println("휴무여부:"+stimedto.getStore_time_break());
		String [] time_day=stimedto.getStore_time_day().split(",");
		String [] time_open=stimedto.getStore_time_open().split(",");
		String [] time_close=stimedto.getStore_time_close().split(",");
		String [] time_break=stimedto.getStore_time_break().split(",");
		//얘는 기존stime각각의 seq가져올 목적
		List<STimeDto> list_stime =sTimeService.selectStime(sdto.getStore_seq());

		for (int i = 0; i < time_day.length; i++) {
			System.out.println(time_day[i]+" : "+time_open[i]+"~"+time_close[i]+"/폐점여부:"+time_break[i]); 
		}
		
		System.out.println("위도 lat:"+slocadto.getStore_latitude());
		System.out.println("경도 lng:"+slocadto.getStore_longitude());
		
		System.out.println(del);
		String [] dels=null;
		if(del==null||del=="") {
			del=" ";
		}
		dels=del.split(",");
		System.out.println(dels[0]);
//		return ""; 
		boolean isS=sService.updateStoreInfo(sdto,time_open,time_close,time_break,
				store_photo_title,slocadto,request,dels,store_photo_title_before,
				before_seq,list_stime);
		if(isS) {
			System.out.println("매장정보 업데이트성공~");
			return "redirect:owner_regist_menu.do";
		}else{
			System.out.println("매장정보 업데이트실패~");
			model.addAttribute("msg","매장정보 수정에 실패하였습니다.");
			return "error/error"; 
		}	
	}
	

	
	
	@RequestMapping(value = "owner_regist_menu.do", method = {RequestMethod.GET,RequestMethod.POST})
	public String owner_regist_menu(Locale locale, Model model,HttpServletRequest request) {
		logger.info("점주: 매장등록3-1 (카테고리, 메뉴 입력 폼)으로 이동 {}.", locale);
		//점포등록 진행도 표시용
		HttpSession session= request.getSession();
		ODto odto = (ODto)session.getAttribute("oldto");
		SDto seq = sService.selectStoreSeq(odto);
		session.setAttribute("sdto", seq);
		return "owner/owner_regist_menu";
	}
	
	@RequestMapping(value = "owner_insert_menu.do", method = {RequestMethod.GET,RequestMethod.POST})
	public String owner_insert_menu(Locale locale, Model model,String[] category_code_2, SDto sdto,
			CMainDto cmaindto, CListDto clistdto, MenuDto menudto, HttpServletRequest request) {
		logger.info("점주: 매장등록3-2 (카테고리, 메뉴 입력)+(입점신청) {}.", locale);
		
		//세션에서 id정보 가져오기(store_seq구하기용)
		HttpSession session = request.getSession();
		ODto odto =(ODto)session.getAttribute("oldto");
		SDto seq = sService.selectStoreSeq(odto);
		
		System.out.println("세션에서가져온sdto2의 store_seq값: "+seq.getStore_seq());
		sdto.setStore_seq(seq.getStore_seq());
		cmaindto.setStore_seq(seq.getStore_seq());//각 dto안에 store_seq값 넣어주기
		clistdto.setStore_seq(seq.getStore_seq());//각 dto안에 store_seq값 넣어주기
		menudto.setStore_seq(seq.getStore_seq());//각 dto안에 store_seq값 넣어주기
		
//		sdto.setStore_seq(seq.getStore_seq());
		System.out.println("sdto에 넣은 store_seq값: "+sdto.getStore_seq());
		System.out.println("sdto 최대일수:"+sdto.getStore_maxdate());
		System.out.println("sdto 허용인원:"+sdto.getStore_maxman());
		
		//체크한 대표카테고리
		System.out.println("CMain 카테고리:"+cmaindto.getCategory_code());
		//체크한 세부카테고리
		System.out.println("CList 카테고리:"+clistdto.getCategory_code_small());
		String [] clist=clistdto.getCategory_code_small().split(",");
		//만든 메뉴
		String [] name=menudto.getMenu_name().split(",");
		String [] content=menudto.getMenu_content().split(",");
		String [] price=menudto.getMenu_price().split(",");
		String [] state=menudto.getMenu_state().split(",");
		for (int i = 0; i < category_code_2.length; i++) {
			System.out.println
			("메뉴 카테고리코드: "+category_code_2[i]+"/ 메뉴명:"+name[i]+"/ 내용:"+
					content[i]+"/ 가격:"+price[i]+"/ 예약코드:"+state[i]);
		}
		System.out.println("메뉴명: "+menudto.getMenu_name());
		System.out.println("내용: "+menudto.getMenu_content());
		System.out.println("가격: "+menudto.getMenu_price());
		System.out.println("예약: "+menudto.getMenu_state());
		
//		return "";
		boolean isS=sService.insertStoreMenu(sdto,cmaindto,clist,category_code_2,name,content,price,state);
		if(isS) {
			System.out.println("메뉴정보 업데이트성공~");
//			seq =sService.selectStoreSeq(odto);
//			session.setAttribute("sdto", seq);
//			return "owner/owner_regist_finish"; 
			return "redirect:owner_regist_store_finish.do"; 
		}else{
			System.out.println("메뉴정보 업데이트실패~");
			model.addAttribute("msg","매뉴정보 수정에 실패하였습니다.");
			return "error/error"; 
		}	
	}
	
	@RequestMapping(value = "owner_regist_store_finish.do", method = {RequestMethod.GET,RequestMethod.POST})
	public String owner_regist_store_finish(Locale locale, Model model, HttpServletRequest request) {
		logger.info("입점신청 완료 페이지로 이동  {}.", locale);
		HttpSession session= request.getSession();
		ODto odto=(ODto)session.getAttribute("oldto");
		SDto seq=sService.selectStoreSeq(odto);
		session.setAttribute("sdto", seq);
		CMainDto cmain =null;
		if(seq!=null) {//만약 seq있을때(store 만들긴 한 사람인 경우)-- 이 경우 뿌려줄때도 조건값을바꿔야한다. 
			cmain =cMainService.selectCMain(seq.getStore_seq());
			System.out.println("대표카테!"+cmain);
		}
		if(cmain!=null) {
			session.setAttribute("cmaindto", cmain);
		}
		
		return "owner/owner_regist_store_finish";
		
	}

	@RequestMapping(value = "store.do", method = {RequestMethod.GET,RequestMethod.POST})
	public String store(Locale locale, Model model,@RequestParam("store_seq") int store_seq, HttpServletRequest request) {
		logger.info("(일렬번호 : "+store_seq+")번 매장(사용자별 매장)으로 이동  {}.", locale);
		
		HttpSession session = request.getSession();
		ODto odto =(ODto)session.getAttribute("oldto");
		UDto udto =(UDto)session.getAttribute("uldto");

		SDto sldto =null;//초기값널
		if (odto!=null) {
			System.out.println("점주 로그인정보가 있습니다. 점주의 store_seq를 빼오겠습니다.");
			sldto = sService.selectStoreSeq(odto);
			System.out.println("점주 로그인정보가 있습니다. 점주의 store_seq를 빼오겠습니다.");
		}
//		int store_seq = Integer.parseInt(store_seq);
		
		SDto store_detail = sService.selectStoreDetail(store_seq);
		List<STimeDto> list_stime =sTimeService.selectStime(store_seq);
		CMainDto cmain =cMainService.selectCMain(store_seq);
		List<CListDto> list_clist =cListService.selectCList(store_seq);
		List<MenuDto> list_menu =menuService.selectMenu(store_seq);
		List<ReplyDto> list_reply=replyService.replyListStore(store_seq);
		ReplyDto reply_avg = replyService.replyAvgStore(store_seq);
		List<QnaDto> list_qna = qnaService.qnaListStore(store_seq,1);//성수 수정후에 빨간줄뜨니까 1 넣기
		List<SPhotoDto> list_sphoto = sPhotoService.selectSPhoto(store_seq);
		
		
		System.out.println("store_detail : "+store_detail); 
		System.out.println("list_stime : "+list_stime);
		System.out.println("cmain : "+cmain);
		System.out.println("list_clist : "+list_clist);
		System.out.println("list_menu : "+list_menu);
		System.out.println("list_reply : "+list_reply);
		System.out.println("reply_avg : "+reply_avg);
		System.out.println("list_qna : "+list_qna);
		System.out.println("list_sphoto : "+list_sphoto);
		
		System.out.println("sdto의 store_seq:"+store_seq);
		System.out.println("sldto의 store_seq(점포소지자/비소지자여부):"+sldto);//초기값(null 이거나,seq가 들어간 sdto가 나옴)
		
		//뿌려줄값들
		model.addAttribute("store_detail",store_detail);// 매장 상세정보
		model.addAttribute("list_stime",list_stime);// 영업시간
		model.addAttribute("cmain",cmain);// 대분류카테고리
		model.addAttribute("list_clist",list_clist);// 소분류카테고리
		model.addAttribute("list_menu",list_menu);// 메뉴
		model.addAttribute("list_reply",list_reply);// 리뷰
		model.addAttribute("reply_avg",reply_avg);// 리뷰평균,댓글갯수들 모음
		model.addAttribute("list_qna",list_qna);// 리뷰평균,댓글갯수들 모음
		model.addAttribute("list_sphoto",list_sphoto);// 매장사진
		
		//내 매장인지/타인 매장인지 여부 확인용
		model.addAttribute("s_seq",store_seq);//내 매장인지/타인 매장인지 여부 확인용
		model.addAttribute("sldto",sldto);//스토어정보 세션
		if (udto!=null) {
			LikeDto like_dto=likeService.likeStore(udto.getUser_id(), store_seq);
			model.addAttribute("like_dto", like_dto);
		}
		return "all/store"; 
	}
	
	@RequestMapping(value = "owner_mystore_update.do", method = {RequestMethod.GET,RequestMethod.POST})
	public String owner_mystore_update(Locale locale, Model model) {
		logger.info("매장 업데이트 폼으로 이동  {}.", locale);
		
		return "owner/owner_mystore_update"; 
	}
	
	@RequestMapping(value = "owner_toReupdate_store.do", method = {RequestMethod.GET,RequestMethod.POST})
	public String owner_toReupdate_store(Locale locale, Model model, SDto sdto, HttpServletRequest request) {
		logger.info("점주: 매장수정2-1(상세정보, 사진, 주소, 영업시간 수정 폼으로 이동(일단 도중수정ver)) {}.", locale);
		HttpSession session=request.getSession();
		ODto odto= (ODto)session.getAttribute("oldto");
		SDto seq =sService.selectStoreSeq(odto);
		System.out.println(seq);
		System.out.println("sdto seq:"+seq.getStore_seq());
		List<STimeDto> list_stime =sTimeService.selectStime(seq.getStore_seq());
		System.out.println("list_stime : "+list_stime);
		List<SPhotoDto> list_sphoto = sPhotoService.selectSPhoto(seq.getStore_seq());
		System.out.println("list_sphoto : "+list_sphoto);
		List<SDto> list = new ArrayList<SDto>();
		list.add(seq);
		List<SLocaDto> list_sloca= mapService.getSloca_ajax(list);
		System.out.println("list_sloca:"+list_sloca);
		
		//cmain, clist, menu
		CMainDto cmain =cMainService.selectCMain(seq.getStore_seq());
		System.out.println("cmain:"+cmain);
		List<CListDto> list_clist =cListService.selectCList(seq.getStore_seq());
		System.out.println("list_clist:"+list_clist);
		List<MenuDto> list_menu =menuService.selectMenu(seq.getStore_seq());
		System.out.println("list_menu:"+list_menu);
		
		model.addAttribute("sdto",seq);//store_info정보
		model.addAttribute("list_stime",list_stime);// 영업시간
		model.addAttribute("list_sphoto",list_sphoto);// 매장사진
		model.addAttribute("list_sloca",list_sloca);// 매장좌표
		model.addAttribute("cmain",cmain);// 대분류카테고리
		model.addAttribute("list_clist",list_clist);// 소분류카테고리
		model.addAttribute("list_menu",list_menu);// 메뉴
		return "owner/owner_mystore_update";
		
		
	}

	@RequestMapping(value = "owner_reupdate_store.do", method = {RequestMethod.GET,RequestMethod.POST})
	public String owner_reupdate_store(Locale locale, Model model,SDto sdto, STimeDto stimedto,
			String [] store_photo_title,String [] store_photo_title_before, String[] before_seq,
			SLocaDto slocadto,String del, HttpServletRequest request,String[] category_code_2,
			CMainDto cmaindto, CListDto clistdto, MenuDto menudto, RedirectAttributes redirect, String del_menu, String menu_seq,
			String[] category_code_3, String[] name_2, String[] content_2, String[] price_2, String[] state_2) {
		logger.info("점주: 매장수정페이지 (상세정보, 사진, 주소, 영업시간, 카테고리(대/소), 메뉴 수정) {}.", locale);
		
		//insert때랑 다른점:기존의 store는 그대로 수정이고,
		//stime, sloca, sphoto만 insert아닌 update개념으로 바뀐다.
		
		//세션에서 id정보 가져오기(store_seq구하기용)
		HttpSession session=request.getSession();
		ODto odto= (ODto)session.getAttribute("oldto");
		SDto seq =sService.selectStoreSeq(odto);
		if(store_photo_title!=null) {
			for (int i = 0; i < store_photo_title.length; i++) {
				System.out.println(i+"번째 사진이름: "+store_photo_title[i]);
			}
		}
		if(store_photo_title_before!=null) {
			for (int i = 0; i < store_photo_title_before.length; i++) {
				System.out.println(i+"번째 기존사진seq: "+before_seq[i]);
				System.out.println(i+"번째 기존사진이름: "+store_photo_title_before[i]);
			}
		}
		System.out.println("세션에서가져온sdto2의 store_seq값: "+seq.getStore_seq());
		sdto.setStore_seq(seq.getStore_seq());
		System.out.println("sdto에 넣은 store_seq값: "+sdto.getStore_seq());

		System.out.println("sdto 매장명:"+sdto.getStore_name());
		System.out.println("sdto 매장홈피링크:"+sdto.getStore_path());
		System.out.println("sdto 간단소개:"+sdto.getStore_intro_simple());
		System.out.println("sdto 상세소개:"+sdto.getStore_intro());
		System.out.println("sdto 영업상태:"+sdto.getStore_state());
		System.out.println("sdto 매장번호:"+sdto.getStore_phone());
		System.out.println("sdto 담당자번호:"+sdto.getStore_phone_manager());
		System.out.println("sdto 주소:"+sdto.getStore_address());
		System.out.println("sdto 상세주소:"+sdto.getStore_address_detail());
		System.out.println("sdto 영업시간 기타사항:"+sdto.getStore_time_other());
		System.out.println("sdto 은행명:"+sdto.getStore_bank());
		System.out.println("sdto 계좌번호:"+sdto.getStore_account());
//		System.out.println("배열로받아온 요일:"+store_time_day.toString());
		
		stimedto.setStore_seq(seq.getStore_seq());
		System.out.println("매장번호:"+stimedto.getStore_seq());
		System.out.println("요일:"+stimedto.getStore_time_day());
		System.out.println("개점시간:"+stimedto.getStore_time_open());
		System.out.println("폐점시간:"+stimedto.getStore_time_close());
		System.out.println("휴무여부:"+stimedto.getStore_time_break());
		String [] time_day=stimedto.getStore_time_day().split(",");
		String [] time_open=stimedto.getStore_time_open().split(",");
		String [] time_close=stimedto.getStore_time_close().split(",");
		String [] time_break=stimedto.getStore_time_break().split(",");
		//얘는 기존stime각각의 seq가져올 목적
		List<STimeDto> list_stime =sTimeService.selectStime(sdto.getStore_seq());
		for (int i = 0; i < time_day.length; i++) {
			System.out.println(time_day[i]+" : "+time_open[i]+"~"+time_close[i]+"/폐점여부:"+time_break[i]); 
		}
		
		System.out.println("위도 lat:"+slocadto.getStore_latitude());
		System.out.println("경도 lng:"+slocadto.getStore_longitude());
		
		//지우는 사진의 seq들
		System.out.println(del);
		String [] dels=null;
		if(del==null||del=="") {
			del=" ";
		}
		dels=del.split(",");
		System.out.println("삭제되는사진수:"+dels[0]);
//		return "";
		
		//지우는 메뉴의 seq들
		System.out.println(del_menu);
		String [] del_menus=null;
		if(del_menu==null||del_menu=="") {
			del_menu="0";
		}
		del_menus=del_menu.split(",");
		//여기에 추가할것
		//0_1.일단 화면에서 값가져오기
		cmaindto.setStore_seq(seq.getStore_seq());//각 dto안에 store_seq값 넣어주기
		clistdto.setStore_seq(seq.getStore_seq());//각 dto안에 store_seq값 넣어주기
		menudto.setStore_seq(seq.getStore_seq());//각 dto안에 store_seq값 넣어주기
		
		System.out.println("sdto에 넣은 store_seq값: "+sdto.getStore_seq());
		System.out.println("sdto 최대일수:"+sdto.getStore_maxdate());
		System.out.println("sdto 허용인원:"+sdto.getStore_maxman());
		
		//체크한 대표카테고리
			System.out.println("CMain 카테고리:"+cmaindto.getCategory_code());
			//체크한 세부카테고리
			System.out.println("CList 카테고리:"+clistdto.getCategory_code_small());
			String [] clist=clistdto.getCategory_code_small().split(",");
			//만든 메뉴
			String [] menu_seqs= menu_seq.split(",");
			String [] name=menudto.getMenu_name().split(",");
			String [] content=menudto.getMenu_content().split(",");
			String [] price=menudto.getMenu_price().split(",");
			String [] state=menudto.getMenu_state().split(",");
		
			for (int i = 0; i < category_code_2.length; i++) {
				System.out.println
				("기존 메뉴 카테고리코드: "+category_code_2[i]+"/ 메뉴명:"+name[i]+"/ 내용:"+
						content[i]+"/ 가격:"+price[i]+"/ 예약코드:"+state[i]);
			}
			if(category_code_3!=null) {
				for (int i = 0; i < category_code_3.length; i++) {
					System.out.println
					("새 메뉴 카테고리코드: "+category_code_3[i]+"/ 메뉴명:"+name_2[i]+"/ 내용:"+
							content_2[i]+"/ 가격:"+price_2[i]+"/ 예약코드:"+state_2[i]);
				}
			}
//			else{
//				category_code_3[0]="none";
//				name_2[0]="none";
//				content_2[0]="none";
//				price_2[0]="none";
//				state_2[0]="none";
//			}
			System.out.println("메뉴명: "+menudto.getMenu_name());
			System.out.println("내용: "+menudto.getMenu_content());
			System.out.println("가격: "+menudto.getMenu_price());
			System.out.println("예약: "+menudto.getMenu_state());
			
		//0.서비스 새로만들고 안에 같은 글 넣기
		boolean isS=sService.reupdateStore(sdto,time_open,time_close,time_break,
				store_photo_title,slocadto,request,dels,store_photo_title_before,before_seq,
				cmaindto,clist,category_code_2,name,content,price,state,list_stime,del_menus,menu_seqs,
				 category_code_3, name_2, content_2, price_2, state_2);
		//그안에 추가할것
		//	1.대표카테고리 수정하는 dao, sdto최대인원날짜 수정하는 dao
		//	2.기존 세부카테고리, 메뉴 지우는 기능
		//  3.세부카테고리, 메뉴 insert하는 기능 복붙
				
//		return "";
		
		if(isS) {
			System.out.println("매장정보 re업데이트성공~");
			redirect.addAttribute("store_seq",sdto.getStore_seq());  
			return "redirect:owner_reupdate_finish.do";
		}else{
			System.out.println("매장정보 re업데이트실패~");
			model.addAttribute("msg","매장정보 재수정에 실패하였습니다.");
			return "error/error"; 
		}	
	}
	
	
	
	@RequestMapping(value = "owner_reupdate_finish.do", method = {RequestMethod.GET,RequestMethod.POST})
	public String owner_reupdate_finish(Locale locale, Model model,@RequestParam("store_seq") int store_seq,RedirectAttributes redirect) {
		logger.info("매장정보 re업데이트완료  {}.", locale);
//		redirect.addAttribute("store_seq",store_seq);  
//		return "redirect:store.do"; 
		
		model.addAttribute("store_seq",store_seq);
		return "owner/owner_reupdate_finish"; 
	}
	
	@RequestMapping(value = "owner_mystore_reservation.do", method = {RequestMethod.GET,RequestMethod.POST})
	public String owner_mystore_reservation(Locale locale, Model model) {
		logger.info("매장관리> 예약으로 이동  {}.", locale);
		
		return "owner/owner_mystore_reservation"; 
	}
	

	
	@RequestMapping(value = "owner_mystore_qna.do", method = {RequestMethod.GET,RequestMethod.POST})
	public String owner_mystore_qna(Locale locale, Model model) {
		logger.info("매장관리> 문의로 이동  {}.", locale);
		
		return "owner/owner_mystore_qna"; 
	}
	
	
}
