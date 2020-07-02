package com.hk.conred;

import java.text.DateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Locale;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.websocket.Session;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.hk.conred.dtos.ODto;
import com.hk.conred.dtos.QnaDto;
import com.hk.conred.dtos.UDto;
import com.hk.conred.service.IQnaService;


@Controller
public class QnaController {
	
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
	@Autowired
	private IQnaService qnaService;
	 
	@RequestMapping(value = "qna.do", method = {RequestMethod.GET,RequestMethod.POST})
	public String qna_store(Locale locale, Model model,@RequestParam("store_seq") int store_seq,String owner_id,HttpServletRequest request) {
		logger.info("매장 문의{}.", locale);  
		HttpSession session=request.getSession();
		ODto oldto=(ODto)session.getAttribute("oldto");
		
		if(oldto!=null) {
			if(oldto.getOwner_id().equals(owner_id)) {
				qnaService.ownerQnaRead(store_seq);
			}
		}
		
		List<QnaDto> list=qnaService.qnaListStore(store_seq, 1);
		QnaDto qnaAvg=qnaService.qnaAvg(store_seq);
		QnaDto owner_chk=qnaService.ownerQnaIdChk(store_seq);
		model.addAttribute("list", list);
		model.addAttribute("qnaAvg", qnaAvg);
		model.addAttribute("owner_chk", owner_chk);
		System.out.println(qnaAvg+"@@@@@@@@@@@@@@@@@@@@");
		return "all/qna"; 
	}
	
	@ResponseBody 
	@RequestMapping(value = "qna_ajax.do", method = {RequestMethod.GET,RequestMethod.POST})
	public Map<String, Object> qna_ajax(Locale locale, Model model,int store_seq,int pnum) {
		logger.info("매장 문의 ajax {}.", locale);
		List<QnaDto> list=qnaService.qnaListStore(store_seq, pnum); 
		QnaDto owner_chk=qnaService.ownerQnaIdChk(store_seq);
		Map<String, Object> map=new HashMap<>();
		map.put("list", list);
		map.put("owner_chk", owner_chk);
		return map;  
	} 
	
	@RequestMapping(value = "insert_qna.do", method = {RequestMethod.GET,RequestMethod.POST})
	public String insert_qna(Locale locale, Model model,HttpServletRequest request,int store_seq,String qna_content,String qna_title, String qna_hide,RedirectAttributes redirect) {
		logger.info("매장 문의{}.", locale); 
		HttpSession session=request.getSession();
		UDto uldto=(UDto)session.getAttribute("uldto");
		boolean isS=qnaService.insertQna(store_seq, uldto.getUser_id(), qna_title, qna_content, qna_hide);
		if(isS) {
			redirect.addAttribute("store_seq", store_seq);
			return "redirect:qna.do";   
		}else {
			model.addAttribute("msg", "매장 문의등록에 실패하였습니다.");
			return "error/error"; 
		}
	}
	
	
	@RequestMapping(value = "owner_qna_answer.do", method = {RequestMethod.GET,RequestMethod.POST})
	public String owner_qna_answer(Locale locale, Model model,int store_seq,int qna_seq,String qna_answer,RedirectAttributes redirect) {
		logger.info("매장 답변{}.", locale);  
		System.out.println("@@@qna_seq:::"+qna_seq);
		System.out.println("@@@@qna_answer:::"+qna_answer);
		boolean isS=qnaService.ownerQnaAnswer(qna_seq, qna_answer);
		if(isS) {
			redirect.addAttribute("store_seq", store_seq);
			return "redirect:qna.do"; 
		}else {		
			model.addAttribute("msg", "답변등록에 실패했습니다.");
			return "error/error"; 
		}
	}
	
	
}
