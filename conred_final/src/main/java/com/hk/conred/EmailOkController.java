package com.hk.conred;
import java.io.IOException;
import java.io.PrintWriter;
import java.text.DateFormat;
import java.util.Locale;
import java.util.Random;

import javax.inject.Inject;
import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;



@Controller
public class EmailOkController {
   
	@Inject    //서비스를 호출하기 위해서 의존성을 주입
    JavaMailSender mailSender;     //메일 서비스를 사용하기 위해 의존성을 주입함.
//	IEmailOkService EmailOkservice1; // 서비스를 호출하기 위해 의존성을 주입 현재 필요없음.
    
    
    
    
    //로깅을 위한 변수
    private static final Logger logger=
    LoggerFactory.getLogger(EmailOkController.class);
    private static final String String = null;
    
    //이메일 인증으로 이동
    @RequestMapping(value = "email_ok.do", method = RequestMethod.GET)
	public String admin_site(Locale locale, Model model) {
		logger.info("이메일 인증 버튼 클릭시 인증 페이지로 이동 테스트용 {}.", locale);
		
	
		return "admin/email_ok_start";
	}
    
  
    
    
        //mailSending에 관한 코드
    
    	
        @RequestMapping( value = "email_ok_start.do" , method=RequestMethod.POST )
        public ModelAndView mailSending(HttpServletRequest request, String email, HttpServletResponse response_email) throws IOException {
    		request.setCharacterEncoding("utf-8");
    		response_email.setContentType("text/html;charset=utf-8");
    		
    		System.out.println("@@@response_email::"+response_email);
    		System.out.println("@@@email::"+email);
    		
            Random r = new Random();
            int dice = r.nextInt(4589362) + 49311; //이메일로 받는 인증코드 부분 (난수)
            request.getSession().setAttribute("dice", dice); 
            String setfrom = "conred7777@gamil.com"; //보내는 사람 이메일
            String tomail = email; // 받는 사람 이메일
            String title = "회원가입 인증 이메일 입니다."; // 제목
            String content =
            
            System.getProperty("line.separator")+ //한줄씩 줄간격을 두기위해 작성
            
            System.getProperty("line.separator")+
                    
            "안녕하세요 회원님 어디가냥저기가개! 이메일 본인인증 서비스 입니다"
            
            +System.getProperty("line.separator")+
            
            System.getProperty("line.separator")+
    
            " 인증번호는 " +dice+ " 입니다 "
            
            +System.getProperty("line.separator")+
            
            System.getProperty("line.separator")+
            
            "받으신 인증번호를 사이트에 입력해 주시면 다음으로 넘어갑니다"; // 내용
            
            System.out.println("!!!!");
            try {
                MimeMessage message = mailSender.createMimeMessage();
                MimeMessageHelper messageHelper = new MimeMessageHelper(message,
                        true, "UTF-8");
 
                messageHelper.setFrom(setfrom); // 보내는사람 생략하면 정상작동을 안함
                messageHelper.setTo(tomail); // 받는사람 이메일
                messageHelper.setSubject(title); // 메일제목은 생략이 가능하다
                messageHelper.setText(content); // 메일 내용
                
                mailSender.send(message);//메일전송
            } catch (Exception e) {
                System.out.println(e);
                System.out.println("@@@@@@@@@@@@@@@@@@@@@실패");
            }
            
            ModelAndView mv = new ModelAndView();    //ModelAndView로 보낼 페이지를 지정하고, 보낼 값을 지정한다.
            mv.setViewName("admin/email_ok_end");     //뷰의이름
//            mv.addObject("email", tomail); 
            
            //세션에 담았기에 주석처리
//            mv.addObject("dice", dice);
            
            System.out.println("mv@@email_ok_start::: "+mv);
 
            response_email.setContentType("text/html; charset=UTF-8");
            PrintWriter out_email = response_email.getWriter();
            out_email.println("<script>alert('이메일이 발송되었습니다. 인증번호를 입력해주세요.'); </script>");
            out_email.flush();
            
            
            return mv;
            
        }
    
    //이메일 인증 페이지 맵핑 메소드 
    @RequestMapping("email_ok_start.do")
    public String email() {
        return "email";
    }
    
    
    //이메일로 받은 인증번호를 입력하고 전송 버튼을 누르면 맵핑되는 메소드.
    //내가 입력한 인증번호와 메일로 입력한 인증번호가 맞는지 확인해서 맞으면 회원가입 페이지로 넘어가고,
    //틀리면 다시 원래 페이지로 돌아오는 메소드
    @RequestMapping(value = "email_ok_end.do", method = RequestMethod.POST)
    public ModelAndView join_injeung(HttpServletRequest request,String email_injeung, HttpServletResponse response_equals) throws IOException {
 
        
        
        
        System.out.println("마지막 : email_injeung : "+email_injeung);
        String dice=String.valueOf((int)request.getSession().getAttribute("dice"));
        System.out.println("마지막 : dice : "+dice);
        
        
        //페이지이동과 자료를 동시에 하기위해 ModelAndView를 사용해서 이동할 페이지와 자료를 담음
         
        ModelAndView mv = new ModelAndView();
        
        mv.setViewName("user/user_regist"); //user_regist
        
        mv.addObject("email",email_injeung);
        
        if (email_injeung.equals(dice)) {
            
            //인증번호가 일치할 경우 인증번호가 맞다는 창을 출력하고 회원가입창으로 이동
                          
            mv.setViewName("admin/email_ok_end");
            
            mv.addObject("email",email_injeung);
            mv.addObject("confirm", "Y");
            mv.addObject("msg", "인증되었습니다");
            //만약 인증번호가 같다면 이메일을 회원가입 페이지로 같이 넘겨서 이메일을
            //한번더 입력할 필요가 없게 한다.
            
            response_equals.setContentType("text/html; charset=UTF-8");
            PrintWriter out_equals = response_equals.getWriter();
//            out_equals.println("<script>alert('인증번호가 일치하였습니다. 회원가입창으로 이동합니다.');</script>");
            out_equals.flush();
         
    
            return mv;
            
            
        }else if (email_injeung != dice) {
            
            
            ModelAndView mv2 = new ModelAndView(); 
            
            mv2.setViewName("admin/email_ok_end");
            
            response_equals.setContentType("text/html; charset=UTF-8");
            PrintWriter out_equals = response_equals.getWriter();
            out_equals.println("<script>alert('인증번호가 일치하지 않습니다. 인증번호를 다시 입력해주세요.'); history.go(-1);</script>");
            out_equals.flush();
            
    
            return mv2;
            
        }    
    
        return mv;
        
    }
    
}