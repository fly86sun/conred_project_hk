package com.hk.conred;

import java.text.DateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Locale;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.hk.conred.dtos.ODto;
import com.hk.conred.dtos.QnaDto;
import com.hk.conred.dtos.ReserveDto;
import com.hk.conred.dtos.SDto;
import com.hk.conred.service.IOService;
import com.hk.conred.service.IQnaService;
import com.hk.conred.service.IReserveService;


@Controller
public class OwnerController {
	
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
	@Autowired
	private IOService oService;
	
	@Autowired
	private IReserveService reserveService;
	 
	@RequestMapping(value = "owner_myinfo.do", method = {RequestMethod.GET,RequestMethod.POST})
	public String owner_myinfo(Locale locale, Model model,HttpServletRequest request) {
		logger.info("점주 나의정보조회{}.", locale);  
		HttpSession session=request.getSession();   
		ODto oldto=(ODto)session.getAttribute("oldto");
		ODto dto=(ODto)oService.ownerMyInfo(oldto.getOwner_id());	
		model.addAttribute("dto",dto); 
		return "owner/owner_myinfo"; 
	}
	
	
	@RequestMapping(value = "owner_myinfo_update.do", method = {RequestMethod.GET,RequestMethod.POST})
	public String owner_myinfo_update(Locale locale, Model model,ODto dto,String owner_email1,String owner_email3,String owner_update_sex) {
		logger.info("점주 나의정보수정{}.", locale);  
		System.out.println("@@성별::"+owner_update_sex);
		
		if(owner_update_sex==null) {
			
		}else {
			dto.setOwner_sex(owner_update_sex);
		}
		
		
		dto.setOwner_email(owner_email1+"@"+owner_email3);
		boolean isS=oService.ownerUpdate(dto);
		if(isS) {			
			return "redirect:owner_myinfo.do"; 
		}else {
			model.addAttribute("msg", "정보수정에 실패하셨습니다.");
			return "error/error";
		}
		
	}
	 
	
	
	@RequestMapping(value = "owner_myinfo_delete.do", method = {RequestMethod.GET,RequestMethod.POST})
	public String owner_myinfo_delete(Locale locale, Model model,HttpServletRequest request) {
		logger.info("점주 탈퇴{}.", locale);  
		HttpSession session=request.getSession(); 
		ODto oldto=(ODto)session.getAttribute("oldto");
		boolean isS=oService.ownerDelete(oldto.getOwner_id());
		if(isS) {
			session.invalidate();
			return "redirect:index.do"; 
		}else {
			model.addAttribute("msg", "회원탈퇴에 실패하였습니다.");
			return "error/error";  
		}
	}
	
	@ResponseBody
	@RequestMapping(value = "owner_idcheck_ajax.do", method = {RequestMethod.GET,RequestMethod.POST})
	public Map<String, String> owner_idcheck_ajax(Locale locale, Model model,String owner_id) {
		logger.info("점주 아이디체크ajax {}.", locale);
		System.out.println("@@@점주아이디::"+owner_id); 
		String owner_result=(String)oService.ownerIdCheck(owner_id);
		Map<String, String> map=new HashMap<>();
		map.put("owner_result", owner_result); 
		return map; 
	}
	
	
	@RequestMapping(value = "owner_mystore_info.do", method = {RequestMethod.GET,RequestMethod.POST})
	public String owner_mystore_info(Locale locale, Model model,HttpServletRequest request,int store_seq) {
		logger.info("점주 매장정보{}.", locale);
		System.out.println("@@@@store_seq::"+store_seq);
		HttpSession session=request.getSession();
		ODto oldto=(ODto)session.getAttribute("oldto"); 
		ODto dto=oService.getState(oldto.getOwner_id());
		List<ODto> list_qna=oService.contentNewQna(store_seq);
		List<ODto> list_reply=oService.contentNewReply(store_seq);
		ODto owner_id=oService.ownerMyStoreInfoId(store_seq);
		model.addAttribute("dto", dto);
		model.addAttribute("list_qna", list_qna);
		model.addAttribute("list_reply", list_reply); 
		model.addAttribute("owner_id", owner_id); 
		return "owner/owner_mystore_info";
	}
	
	
	
	@RequestMapping(value = "owner_mystore_reserve.do", method = {RequestMethod.GET,RequestMethod.POST})
	public String owner_mystore_reserve(Locale locale, Model model,int store_seq) {
		logger.info("점주 예약목록{}.", locale);
		List<ReserveDto> list=reserveService.ownerStoreReserve(store_seq, 1);
		model.addAttribute("list", list);
		return "owner/owner_mystore_reserve";
	}
	
	@ResponseBody
	@RequestMapping(value = "owner_reserve_ajax.do", method = {RequestMethod.GET,RequestMethod.POST})
	public Map<String, List<ReserveDto>> owner_reserve_ajax(Locale locale, Model model,int store_seq,int pnum) {
		logger.info("점주 결제목록ajax{}.", locale);
		System.out.println("@@@seq::"+store_seq);
		System.out.println("@@@pnum::"+pnum);
		Map<String, List<ReserveDto>> map=new HashMap<>(); 
		List<ReserveDto> list=reserveService.ownerStoreReserve(store_seq, pnum);
		map.put("list", list);
		return map;
	}
	
	
	
	@RequestMapping(value = "owner_mystore_reserve_success.do", method = {RequestMethod.GET,RequestMethod.POST})
	public String owner_mystore_reserve_success(Locale locale, Model model,int store_seq) {
		logger.info("점주 결제목록{}.", locale);
		List<ReserveDto> list=reserveService.ownerStoreReserveSuccess(store_seq, 1);
		model.addAttribute("list", list);
		return "owner/owner_mystore_reserve_success";
	}
	
	
	@ResponseBody
	@RequestMapping(value = "owner_reserve_success_ajax.do", method = {RequestMethod.GET,RequestMethod.POST})
	public Map<String, List<ReserveDto>> owner_reserve_success_ajax(Locale locale, Model model,int store_seq,int pnum) {
		logger.info("점주 결제목록ajax{}.", locale);
		System.out.println("@@@seq::"+store_seq);
		System.out.println("@@@pnum::"+pnum);
		Map<String, List<ReserveDto>> map=new HashMap<>(); 
		List<ReserveDto> list=reserveService.ownerStoreReserveSuccess(store_seq, pnum);
		map.put("list", list);
		return map;
	}
	
	
}
