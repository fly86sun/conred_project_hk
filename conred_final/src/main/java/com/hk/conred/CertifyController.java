//package com.hk.conred;
//
//import com.baroservice.api.BarobillApiProfile;
//import com.baroservice.api.BarobillApiService;
//import com.baroservice.ws.ArrayOfCorpState;
//import com.baroservice.ws.ArrayOfString;
//import com.baroservice.ws.CorpState;
//import org.junit.Test;
//import org.slf4j.Logger;
//import org.slf4j.LoggerFactory;
//import org.springframework.stereotype.Controller;
//import org.springframework.ui.Model;
//import org.springframework.web.bind.annotation.RequestMapping;
//import org.springframework.web.bind.annotation.RequestMethod;
//import org.springframework.web.bind.annotation.ResponseBody;
//
//import java.net.MalformedURLException;
//import java.rmi.RemoteException;
//import java.util.Locale;
//
///**
// * 바로빌 휴폐업조회 API 샘플
// */
//@Controller
//public class CertifyController {
//	
//	private static final Logger logger = LoggerFactory.getLogger(CertifyController.class);
//
//	/**
//	 * 바로빌 API 정의 클래스
//	 *
//	 * 환경에 따라 BarobillApiProfile 를 지정해주세요.
//	 */
//	private BarobillApiService barobillApiService;
//
//	public CertifyController() throws MalformedURLException {
//		barobillApiService = new BarobillApiService(BarobillApiProfile.TESTBED);
//	}
//
//	/**
//	 * GetCorpState - 단건 조회
//	 */
////	@Test
//	@RequestMapping(value = "GetCorpState.do", method = {RequestMethod.GET,RequestMethod.POST})
//	public void GetCorpState(Locale locale, Model model) throws RemoteException {
//		logger.info("사업자번호 조회  {}.", locale);
//
//		
//
//		String certKey = "DCDEBDA2-8E3F-4054-8454-97C0078C63E5";            // 인증키
////		String CERTKEY = "DCDEBDA2-8E3F-4054-8454-97C0078C63E5";            // 인증키
////		String CERTKEY = "DCDEBDA28E3F4054845497C0078C63E5";            // 인증키
//		String corpNum = "1048147984";            // 바로빌 회원 사업자번호 ('-' 제외, 10자리)
//		String checkCorpNum = "1138641728";
////		113 - 86 - 41728
////		1138641728
//		CorpState result = barobillApiService.corpState.getCorpState(certKey, corpNum, checkCorpNum);
//		System.out.println(result);
////		System.out.println("휴폐업상태 :"+result.getState());//오류난다고 나옴
//		System.out.println("사업자번호: "+result.getCorpNum());
//		System.out.println("과세구분: "+result.getTaxType());
//		System.out.println("휴폐업상태: "+result.getState());
//		System.out.println("휴폐업일자: "+result.getStateDate());
//		System.out.println("기준일자: "+result.getBaseDate());
//		
////		return "error/error";
//
//	}
//
//	/** 
//	 * GetCorpStates - 대량 조회
//	 */
//	@RequestMapping(value = "GetCorpStates.do", method = {RequestMethod.GET,RequestMethod.POST})
//	public String GetCorpStates(Locale locale, Model model) throws RemoteException {
//		logger.info("대량 사업자번호 조회  {}.", locale);
//		String certKey = "DCDEBDA2-8E3F-4054-8454-97C0078C63E5";            //인증키
//		String corpNum = "1048147984";            //연계사업자 사업자번호 ('-' 제외, 10자리)
//
//
//		ArrayOfString checkCorpNumList = new ArrayOfString();        //확인할 사업자번호 ('-' 제외, 10자리)
//		checkCorpNumList.getString().add("1048147984");
////		checkCorpNumList.getString().add("");
//
//		ArrayOfCorpState result = barobillApiService.corpState.getCorpStates(certKey, corpNum, checkCorpNumList);
//
//		System.out.println(result);
//		System.out.println(result.getCorpState().get(0).getState());
//		
//		model.addAttribute("msg", result);
//		return "error/error";
//				
//	}
//
//	/**
//	 * GetCorpStateScrapRequestURL - 휴폐업 서비스 신청 URL
//	 */
//	@RequestMapping(value = "GetCorpStateScrapRequestURL.do", method = {RequestMethod.GET,RequestMethod.POST})
//	public void GetCorpStateScrapRequestURL(Locale locale, Model model) throws RemoteException {
//		logger.info("사업자번호 조회 관련 테스트 2 {}.", locale);
//		
//		String certKey = "DCDEBDA2-8E3F-4054-8454-97C0078C63E5";            // 인증키
//		String corpNum = "1048147984";            // 바로빌 회원 사업자번호 ('-' 제외, 10자리)
//		String id = "syhnz1102";                // 바로빌 회원 아이디
//		String pwd = "conred";                // 바로빌 회원 비밀번호
//
//		String result = barobillApiService.corpState.getCorpStateScrapRequestURL(certKey, corpNum, id, pwd);
//
//		System.out.println(result);
////		System.out.println("사업자번호"+result.getCorpNum()); 
////		System.out.println("과세구분"+result.getTaxType());
////		System.out.println("휴폐업상태"+result.getState());
////		System.out.println("휴폐업일자"+result.getStateDate());
////		System.out.println("기준일자"+result.getBaseDate());
//
//
//	}
//
//}
