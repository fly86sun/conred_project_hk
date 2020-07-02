package com.hk.conred;



import java.util.HashMap;
import java.util.List;
import java.util.Locale;
import java.util.Map;

import javax.mail.Session;
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
import org.springframework.web.bind.annotation.SessionAttribute;

import com.hk.conred.dtos.SDto;
import com.hk.conred.dtos.UDto;
import com.hk.conred.service.IInterestsService;
import com.hk.conred.service.IUService;



@Controller
public class Haekang {

	
	private static final Logger logger = LoggerFactory.getLogger(Haekang.class);
	
//	@RequestMapping(value = "haekang.do", method = RequestMethod.GET)
//	public String Haekang(Locale locale, Model model) {
//		logger.info("테스트용 푸터 접근 {}.", locale);
	
		
		
//		return "test/haekang"; 
//	}
	@Autowired IUService uService;
	@Autowired IInterestsService interService ;
	HttpSession session;
	
	@RequestMapping(value = "test_index.do", method = RequestMethod.GET)
	public String test_index(HttpServletRequest request,String paging,Locale locale, Model model) {
		logger.info("테스트 인덱스 접근 {}.", locale);
		HttpSession session=request.getSession();
		UDto uldto = (UDto)session.getAttribute("uldto"); //Object(uldto객체)
		//test_index페이지로 이동하면서 관심점포list 전달해서 바로 뿌려주기
		List<SDto> list = interService.user_interests_recommended(uldto.getUser_id(), paging);
		
//		int count=interService.user_interests_count(uldto.getUser_id());//해강씨가 mapper.xml,dao,service구현
		int count=1;
		
		System.out.println(list);   
		model.addAttribute("list",list);//list[sDto,sDto[c,c,c,cDto,iDto[c,c]]...]
//			                                  new SDto().getcDto().getCategory_name()
		model.addAttribute("count", count);
		return "index"; 
	}
	
//	@ResponseBody
//	@RequestMapping(value = "user_interests_recommended.do", method = {RequestMethod.GET, RequestMethod.POST})
//	public Map<String, List<SDto>> user_interests_recommended(HttpServletRequest request, Locale locale, Model model, UDto udto, SDto sdto, String user_id, String paging) {
//		logger.info("유저 로그인시 index 페이지 관심사 추천 기능 {}.", locale); 
//			
//		HttpSession session=request.getSession();
//		UDto uldto = (UDto)session.getAttribute("uldto"); //Object(uldto객체)
//		
//		List<SDto> list = interService.user_interests_recommended(uldto.getUser_id(), paging);
//
//		System.out.println(list);   
//		model.addAttribute("list",list);//list[sDto,sDto[c,c,c,cDto,iDto[c,c]]...]
////			                                  new SDto().getcDto().getCategory_name()
//		Map<String, List<SDto>>map=new HashMap<String, List<SDto>>();
//		map.put("list", list);
//	
//						// {list:[sdto,sdto...]}    obj.list[0].
//		return map;  // [key:value,key:value]   -----> js : json객체형태와 유사 {key:value,key:value}
//	}	
	
	
	
	
	
}