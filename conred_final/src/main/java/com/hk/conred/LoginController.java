package com.hk.conred;

import java.io.Console;
import java.io.IOException;
import java.text.DateFormat;
import java.util.Date;
import java.util.List;
import java.util.Locale;
import java.util.UUID;

import javax.inject.Inject;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.github.scribejava.core.model.OAuth2AccessToken;
import com.hk.conred.dtos.CMainDto;
import com.hk.conred.dtos.ODto;
import com.hk.conred.dtos.SDto;
import com.hk.conred.dtos.UDto;
import com.hk.conred.service.ICMainService;
import com.hk.conred.service.IInterestsService;
import com.hk.conred.service.IOService;
import com.hk.conred.service.ISService;
import com.hk.conred.service.IUService;
import com.hk.conred.NaverLoginBO;


@Controller
public class LoginController {
	
	private static final Logger logger = LoggerFactory.getLogger(LoginController.class);
    
	/* NaverLoginBO */
    private NaverLoginBO naverLoginBO;
    private String apiResult = null;
    
 
    
    @Autowired
	private IUService uService;
    
    @Autowired
    private IOService oService;
    
    @Autowired
    private ISService sService;
    
    @Autowired
    private ICMainService cMainService; 
    
    @Autowired
    private void setNaverLoginBO(NaverLoginBO naverLoginBO) {
        this.naverLoginBO = naverLoginBO;
    }
	

	

    
    
	@RequestMapping(value = "login.do", method = { RequestMethod.GET, RequestMethod.POST })
	public String login(Locale locale, Model model, HttpSession session) {
		logger.info("공통 로그인폼 접근 및 네이버 로그인 준비 {}.", locale);
	 
		/* 네이버아이디로 인증 URL을 생성하기 위하여 naverLoginBO클래스의 getAuthorizationUrl메소드 호출 */
        String naverAuthUrl = naverLoginBO.getAuthorizationUrl(session);
//        System.out.println(naverAuthUrl.replace("user_regist_naver.do", "owner_regist_naver.do"));
        String naverAuthUrl02 = naverAuthUrl.replace("user_regist_naver.do", "owner_regist_naver.do");
//        String naverAuthUrl_owner = naverLoginBOOwner.getAuthorizationUrl(session);
        
        //https://nid.naver.com/oauth2.0/authorize?response_type=code&client_id=sE***************&
        //redirect_uri=http%3A%2F%2F211.63.89.90%3A8090%2Flogin_project%2Fcallback&state=e68c269c-5ba9-4c31-85da-54c16c658125
        System.out.println("네이버:" + naverAuthUrl);
        System.out.println("네이버(오너):" + naverAuthUrl02);
        
        //네이버 
        model.addAttribute("url", naverAuthUrl);
        model.addAttribute("url02", naverAuthUrl02);
//        model.addAttribute("url02", naverAuthUrl_owner);

        /* 생성한 인증 URL을 View로 전달 */
  
		return "all/login"; 
	} 
	
//  //네이버 로그인 성공시 callback호출 메소드
//  @RequestMapping(value = "naverSuccess", method = { RequestMethod.GET, RequestMethod.POST })
//  public String callback(Model model, @RequestParam String code, @RequestParam String state, HttpSession session)
//          throws IOException {
//      System.out.println("여기는 callback");
//      OAuth2AccessToken oauthToken;
//      oauthToken = naverLoginBO.getAccessToken(session, code, state);
//      //로그인 사용자 정보를 읽어온다.
//      apiResult = naverLoginBO.getUserProfile(oauthToken); 
//      System.out.println(naverLoginBO.getUserProfile(oauthToken).toString());
//      model.addAttribute("result", apiResult);
//      System.out.println("result"+apiResult);
     
      /* 네이버 로그인 성공 페이지 View 호출 */
//    JSONObject jsonobj = jsonparse.stringToJson(apiResult, "response");
//    String snsId = jsonparse.JsonToString(jsonobj, "id");
//    String name = jsonparse.JsonToString(jsonobj, "name");
//
//    UserVO vo = new UserVO();
//    vo.setUser_snsId(snsId);
//    vo.setUser_name(name);
//
//    System.out.println(name);
//    try {
//        vo = service.naverLogin(vo);
//    } catch (Exception e) {
//        // TODO Auto-generated catch block
//        e.printStackTrace();
//    }
 

//    session.setAttribute("login",vo);
//    return new ModelAndView("views/loginPost", "result", vo);
      
//      return "naverSuccess";
//  }
  

  //로그인성공시 콜백페이지 작성중!!   사용자
   @RequestMapping(value = "user_regist_naver.do", method = { RequestMethod.GET, RequestMethod.POST })
   public String callback(Locale locale, Model model, @RequestParam String code, @RequestParam String state, HttpSession session, HttpServletRequest request 
		  )
          throws IOException {
	  logger.info("유저 - 네아로 기능 마지막단계 {}.", locale); 
      System.out.println("여기는 callback");
      OAuth2AccessToken oauthToken;
      oauthToken = naverLoginBO.getAccessToken(session, code, state);
      //로그인 사용자 정보를 읽어온다.
      apiResult = naverLoginBO.getUserProfile(oauthToken);
      System.out.println(naverLoginBO.getUserProfile(oauthToken).toString());
      model.addAttribute("result", apiResult);
      System.out.println("result"+apiResult); 
      
        
      /* 네이버 로그인 성공하면서 JSON 데이터 파싱*/ //데이터 베이스에 여기서 바로 넣어준다
      
      JSONParser parser = new JSONParser();
      Object obj;
		try {
			obj = parser.parse(apiResult);
			JSONObject jsonObj = (JSONObject) obj;	
			System.out.println(jsonObj);
			JSONObject jsonObj2=(JSONObject)jsonObj.get("response");
			System.out.println("1"+jsonObj2.get("id"));
			System.out.println("2"+jsonObj2.get("name"));
			System.out.println("3"+jsonObj2.get("email"));
			System.out.println("4"+jsonObj2.get("gender"));
			System.out.println("5"+jsonObj2.get("birthday"));
//			JSONObject jsonObjreal = new JSONObject();
			String user_id=(String)jsonObj2.get("id");
			String user_name=(String)jsonObj2.get("name");
		    String user_email=(String)jsonObj2.get("email");
		    String user_sex2=(String)jsonObj2.get("gender");
		    String user_birth=(String)jsonObj2.get("birthday");
		    
		    if(user_sex2==null) {
		    	user_sex2=" "; 
		    }
		    if(user_birth==null) {
		    	user_birth=" ";
		    }
		    if(user_name==null) {
		    	user_name=" ";
		    }
		    if(user_email==null) {
		    	user_email=" ";
		    }
//		    
//		    if(jsonObj.get("gender")==null) {
//		    	user_sex2=" "; 
//			}
//		    if(jsonObj.get("birthday")==null) {
//		    	user_birth=" ";
//		    }
//		    if(jsonObj.get("name")==null) {
//		    	user_name=" ";
//		    }
//		    if(jsonObj.get("email")==null) { 
//		    	user_email=" ";
//		    }
		    
		     
		    
//회원 가입 페이지로 넘겨주려고 했으나, 바로 DB로 넘겨주고 로그인 되는 방식으로 변경함
//		    model.addAttribute("id", id);
//		    model.addAttribute("password", password);
//		    model.addAttribute("name", name);
//		    model.addAttribute("email", email);
			
		    UDto confirm_id = uService.naver_confirm_id(user_id);
		    System.out.println("확인"+confirm_id);
		    //이 패스워드는 실제 사용되지 않음 보안상 및 DB널값 방지용
		    String user_password="naverpassword";  //난수바꾸기
		    
		    //남자 여자 변형
		    String user_sex = user_sex2;
		    if(user_sex != "M") {
		    	user_sex = "여자";
		    }else{
		    	user_sex = "남자";
		    }
		    
		    
		    UDto dto1 = new UDto(); 
		    dto1.setUser_id(user_id);
		    dto1.setUser_password(user_password);
		    dto1.setUser_name(user_name);
		    dto1.setUser_email(user_email);
		    dto1.setUser_birth(user_birth);  //사용자가 선택 안했을시 테스트 필요 널포인트 익센셥
		    dto1.setUser_sex(user_sex);
		    dto1.setUser_agreement("Y");
//		    System.out.println("확인"+confirm_id);
		    
		    if(confirm_id==null) {

		    	session=request.getSession();
		    	//dto를 세션에 담고 관심사 선택과 트랜잭션
		    	session.setAttribute("udto", dto1);
		    	//네이버 정보로 회원가입 실행
		    	//네이버 로그인 버튼 클릭하자마자 약관페이지 뜨고 인서트는 안하고 
				//체크하면 관심사 체크 만들고 그다음 관심사 선택 페이지로 했어요
		    	
		    	return "redirect:user_insert.do";
		    
		    }else{
		    	
		            //세션을 요청하여 불러와서 session에 저장했고
			    	session=request.getSession();
			    	//dto를 세션에 담았고
			    	session.setAttribute("uldto", confirm_id);
		    	
		    	return "redirect:user_login.do";
		    	
		    }			    
		    
		    
			    
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
      
		return "redirect:index.do";
      
  }    
   
   
   
   
   
   
   
 //로그인성공시 콜백페이지 작성중!!    점주
   @RequestMapping(value = "owner_regist_naver.do", method = { RequestMethod.GET, RequestMethod.POST })
   public String owner_regist_naver(Locale locale, Model model, @RequestParam String code, @RequestParam String state, HttpSession session, HttpServletRequest request 
		  )
          throws IOException {
	  logger.info("점주 - 네아로 기능 마지막단계 {}.", locale); 
      System.out.println("여기는 callback02");
      OAuth2AccessToken oauthToken;
      oauthToken = naverLoginBO.getAccessToken(session, code, state);
      //로그인 사용자 정보를 읽어온다.
      apiResult = naverLoginBO.getUserProfile(oauthToken);
      System.out.println(naverLoginBO.getUserProfile(oauthToken).toString());
      model.addAttribute("result", apiResult);
      System.out.println("result"+apiResult);
      
      
      /* 네이버 로그인 성공하면서 JSON 데이터 파싱*/ //데이터 베이스에 여기서 바로 넣어준다
      
      JSONParser parser = new JSONParser();
      Object obj;
		try {
			obj = parser.parse(apiResult);
			JSONObject jsonObj = (JSONObject) obj;	
			System.out.println(jsonObj);
			JSONObject jsonObj2=(JSONObject)jsonObj.get("response");
			System.out.println("1"+jsonObj2.get("id"));
			System.out.println("2"+jsonObj2.get("name"));
			System.out.println("3"+jsonObj2.get("email"));
			System.out.println("4"+jsonObj2.get("gender"));
			System.out.println("5"+jsonObj2.get("birthday"));
//			JSONObject jsonObjreal = new JSONObject();
			String owner_id=(String)jsonObj2.get("id");
			String owner_name=(String)jsonObj2.get("name");
		    String owner_email=(String)jsonObj2.get("email");
		    String owner_sex2=(String)jsonObj2.get("gender");
		    String owner_birth=(String)jsonObj2.get("birthday");
		    
		    if(owner_sex2==null) {
		    	owner_sex2=" "; 
		    }
		    if(owner_birth==null) {
		    	owner_birth=" ";
		    }
		    if(owner_name==null) {
		    	owner_name=" ";
		    }
		    if(owner_email==null) {
		    	owner_email=" ";
		    }
		    
		     
		    
//회원 가입 페이지로 넘겨주려고 했으나, 바로 DB로 넘겨주고 로그인 되는 방식으로 변경함
//		    model.addAttribute("id", id);
//		    model.addAttribute("password", password);
//		    model.addAttribute("name", name);
//		    model.addAttribute("email", email);
			

		    ODto confirm_id= oService.naver_confirm_id(owner_id);
		    System.out.println("확인"+confirm_id);
		    //이 패스워드는 실제 사용되지 않음 보안상 및 DB널값 방지용
		    String owner_password="naverpassword";  //난수바꾸기
		    
		    //남자 여자 변형
		    String owner_sex = owner_sex2;
		    if(owner_sex == "F") {
		    	owner_sex = "여자";
		    }else if(owner_sex == "M"){
		    	owner_sex = "남자";
		    }else {
		    	owner_sex = " "; 
		    }
		    
		    
		    
		    ODto dto1 = new ODto();
		    dto1.setOwner_id(owner_id);
		    dto1.setOwner_password(owner_password);
		    dto1.setOwner_name(owner_name);
		    dto1.setOwner_email(owner_email);
		    dto1.setOwner_birth(owner_birth);  //사용자가 선택 안했을시 테스트 필요 널포인트 익센셥
		    dto1.setOwner_sex(owner_sex);
		    dto1.setOwner_agreement("Y");
			System.out.println("@@@:d1::"+dto1.getOwner_id());
			System.out.println("@@@:d2::"+dto1.getOwner_password());
			System.out.println("@@@:d3::"+dto1.getOwner_name());
			System.out.println("@@@:d4::"+dto1.getOwner_email());
			System.out.println("@@@:d5::"+dto1.getOwner_birth());
			System.out.println("@@@:d6::"+dto1.getOwner_sex());
			System.out.println("@@@:d7::"+dto1.getOwner_agreement());
		    
		    
		    if(confirm_id==null) {

		    	session=request.getSession();
		    	//dto를 세션에 담고 관심사 선택과 트랜잭션
		    	session.setAttribute("odto", dto1);
		    	//네이버 정보로 회원가입 실행
		    	//네이버 로그인 버튼 클릭하자마자 약관페이지 뜨고 인서트는 안하고 
				//체크하면 관심사 체크 만들고 그다음 관심사 선택 페이지로 했어요
		    	
		    	return "redirect:owner_insert.do";
		    
		    }else{
		    	
		            //세션을 요청하여 불러와서 session에 저장했고
			    	session=request.getSession();
			    	//dto를 세션에 담았고
			    	session.setAttribute("oldto", confirm_id);
		    	
		    	return "redirect:owner_login.do";
		    	
		    }			    
		    
		    
			    
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
      
		return "redirect:index.do";
      
  }     
   
   
	
   	
	@RequestMapping(value = "user_insert.do", method = {RequestMethod.GET,RequestMethod.POST})
	public String user_insert(Locale locale, Model model,UDto dto,String user_email1,String user_email3,HttpServletRequest request) {
		logger.info("테스트용 유저 회원가입 폼 {}.", locale);
		dto.setUser_email(user_email1+"@"+user_email3);
		//성별 null일경우 String타입으로 값 받을수 있게 수정(*왜 null값이 입력이 안되는지 모르겠음)
		if(dto.getUser_sex()==null) {
			dto.setUser_sex("");
		}
		if(user_email1!=null) {
		HttpSession session=request.getSession();
		session.setAttribute("udto", dto);
		}
		
		
		return "user/user_regist_category";
	}	 
	
	@RequestMapping(value = "owner_regist_finish.do", method = {RequestMethod.GET,RequestMethod.POST})
	public String owner_regist_finish(Locale locale, Model model) {
		logger.info("끝 {}.", locale);	
		return "owner/owner_regist_finish"; 
	}	 
	
	
	@RequestMapping(value = "owner_insert.do", method = {RequestMethod.GET,RequestMethod.POST})
	public String owner_insert(Locale locale, Model model, ODto dto, String owner_email1, String owner_email2,HttpServletRequest request) {
		logger.info("점주 회원정보 db에 입력 {}.", locale);
		
		HttpSession session=request.getSession();
		ODto odto=(ODto)session.getAttribute("odto");
		System.out.println("@@odto:::"+odto);
		
		if(odto==null) {
			dto.setOwner_email(owner_email1+"@"+owner_email2);
			
			//성별 null일경우 String타입으로 값 받을수 있게 수정(*왜 null값이 입력이 안되는지 모르겠음)
			if(dto.getOwner_sex()==null) {
				dto.setOwner_sex("");
			}
			
			
			boolean isS = oService.insertOwner(dto);
			if(isS&&dto.getOwner_agreement().equals("Y")) {
				System.out.println("회원가입성공");
				return "redirect:owner_regist_finish.do"; 
			}else {
				System.out.println("회원가입실패");
				model.addAttribute("msg","점주 회원가입에 실패하였습니다.");
				return "error/error"; 
			}
			
		}else {
			 	
			boolean isS=oService.insertOwner(odto);
			if(isS){ 
				return "redirect:owner_regist_finish.do";						
			}else {
				model.addAttribute("msg", "회원가입이 실패됐습니다");
				return "error/error";  
			}  

		}  
		 

	}
	
		
		
		
//		System.out.println("o1"+dto.getOwner_id());
//		System.out.println("o2"+dto.getOwner_password());
//		System.out.println("o3"+dto.getOwner_name());
//		System.out.println("o4"+dto.getOwner_email());
//		System.out.println("o5"+dto.getOwner_birth());
//		System.out.println("o6"+dto.getOwner_sex());
//		System.out.println("o7"+dto.getOwner_regdate());
//		System.out.println("o8"+dto.getOwner_agreement());
		
		 
		
	
	
	 
	
	
	@RequestMapping(value = "user_login.do", method = {RequestMethod.GET,RequestMethod.POST})
	public String user_login(Locale locale, Model model,HttpServletRequest request,UDto dto) {
		logger.info("유저 로그인접근 {}.", locale);
		HttpSession session=request.getSession();
		UDto uldtoNaver=(UDto)session.getAttribute("uldto");//기존회원정보
		UDto uldto=null;
		if(uldtoNaver!=null) {
			uldto=uService.getLogin(uldtoNaver.getUser_id(),uldtoNaver.getUser_password());
			System.out.println("################"+uldto);
		}else {
			uldto=uService.getLogin(dto.getUser_id(),dto.getUser_password());			
		}
		

			if(uldto==null) {
				model.addAttribute("msg", "존재하지 않는 아이디입니다 다시한번 확인해주세요");
				return "error/error";
			}else{
				if(uldto.getUser_out().equals("Y")){
					model.addAttribute("msg", "탈퇴한 회원 입니다");
					return "error/error";
				}else if(uldto.getUser_black().equals("Y")) {
					model.addAttribute("msg", "블랙된 회원입니다");
					return "error/error";
				}else {   
					session.setAttribute("uldto", uldto);
					session.setMaxInactiveInterval(60*60);//1시간--사용자
					return "redirect:index.do";
				}
			} 
			  
		
			 
	}
	
	
	@RequestMapping(value = "owner_login.do", method = {RequestMethod.GET,RequestMethod.POST})
	public String owner_login(Locale locale, Model model, HttpServletRequest request, ODto dto) {
		logger.info("점주 로그인후 test 공통메인으로 {}.", locale);
		
		HttpSession session=request.getSession();
		
			
		///////////	
		ODto oldtoNaver=(ODto)session.getAttribute("oldto");
		ODto oldto=null;
		
		if(oldtoNaver!=null) {
			oldto=oService.getLogin(oldtoNaver.getOwner_id(),oldtoNaver.getOwner_password());
			System.out.println("################"+oldto);
		}else {
			oldto=oService.getLogin(dto.getOwner_id(),dto.getOwner_password());	
		}
		
		//////////
		
		
		
		
		/*탈퇴컬럼 만들기 owner_out*/
//		if(oldto.getOwner_id()==null||oldto.getOwner_id().equals("")) {
		if(oldto==null) {
			System.out.println("아이디 다시한번 확인해주세요");
			model.addAttribute("msg","아이디와 비밀번호를 다시한번 확인해주세요");
			return "error/error";
		}else{
			SDto seq =sService.selectStoreSeq(oldto);
			System.out.println(seq);
			
			System.out.println(oldto.getOwner_id());
			
			//문제는 seq값이 아직 없을경우에 밑에 cmain구할때 오류가난다.
			//그렇다고 if문으로 seq!=null을 넣어주면 
			CMainDto cmain =null;
			if(seq!=null) {//만약 seq있을때(store 만들긴 한 사람인 경우)-- 이 경우 뿌려줄때도 조건값을바꿔야한다. 
				cmain =cMainService.selectCMain(seq.getStore_seq());
				System.out.println("대표카테!"+cmain);
			}
			session.setAttribute("oldto", oldto);
			session.setAttribute("sdto", seq);
			if(cmain!=null) {
				session.setAttribute("cmaindto", cmain);
			}
			session.setMaxInactiveInterval(60*60);//1시간 --점주
			return "redirect:index.do"; 
		}	
	}
	
	
	
	
	
	
	
		
	
}
