package com.ktds.oauthmember.web;

import java.util.Properties;
import java.util.Random;

import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.AddressException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.servlet.ServletRequest;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.ktds.oauthmember.service.OauthmemberService;
import com.ktds.oauthmember.vo.OauthmemberVO;
import com.sun.xml.internal.messaging.saaj.packaging.mime.internet.MimeUtility;

@Controller
public class OauthmemberController {

	private OauthmemberService oauthmemberService;
	
	
	public void setOauthmemberService(OauthmemberService oauthmemberService) {
		this.oauthmemberService = oauthmemberService;
	}
	
	@RequestMapping("/oauthmember/login")
	public String viewLogin() {
		
		return "oauthmember/login";
	}
	
	@RequestMapping("/oauthmember/doLogin")
	@ResponseBody
	public String doLogin(OauthmemberVO oauthmemberVO, HttpSession session) {
		
		OauthmemberVO loginMemberVO = oauthmemberService.readOneOauthmenber(oauthmemberVO);
		
		if(loginMemberVO != null) {
			session.setAttribute("_USER_", loginMemberVO);
			return "isSuccess";
		}
		
		return "false";
	}
	
	@RequestMapping("/oauthmember/doLogout")
	public String doLogout(HttpSession session) {
		session.invalidate();
		return "redirect:/";
	}
	
	@RequestMapping("/oauthmember/signup_step1")
	public String viewSignup_step1() {
		
		return "oauthmember/signup_step1";
	}
	
	@RequestMapping("/oauthmember/signup_step2")
	public String viewSignup_step2() {
		
		return "oauthmember/signup_step2";
	}
	
	@RequestMapping("/oauthmember/baeminId")
	public String viewbaeminId() {
		
		return "oauthmember/baeminId";
	}

	@RequestMapping("/oauthmember/find-id")
	public String findId() {
		return "oauthmember/find-id";
	}
	
	@RequestMapping("/oauthmember/doSignUp")
	public String doSignUp(OauthmemberVO oauthmemberVO) {
		
		String[] ninkName = oauthmemberVO.getNickName().split("@");
		String real = ninkName[0];
		
		oauthmemberVO.setNickName(real);
		
		
		String phoneNumber = (oauthmemberVO.getPhoneNumber()).replaceAll("\\,", "\\-");
		oauthmemberVO.setPhoneNumber(phoneNumber);
		
		oauthmemberService.createOauthmember(oauthmemberVO);
		return "redirect:/";
	}
	
	@RequestMapping("/oauthmember/emailCert")
	@ResponseBody
	public int emailCert(OauthmemberVO oauthMemberVO, HttpServletRequest request, ModelMap mo )
			  throws AddressException, MessagingException{
		String host = "smtp.naver.com";
		
		final String username = "01030690083";
		final String password = "new1234@";
		int port=465;
		
		int result = (int)Math.floor(Math.random() *1000000)+100000;
		if(result >1000000) {
			result -= 100000;
		}
		
		
		String recipent = oauthMemberVO.getMemberId();
		String subject = "배달의민족";
		
		String body = "배달의 민족 님으로 부터 인증 코드를 받았습니다. 인증번호:" + result;

		Properties props = System.getProperties();
		
		
		props.put("mail.smtp.host", host);
		props.put("mail.smtp.port", port);
		props.put("mail.smtp.auth", "true");
		props.put("mail.smtp.ssl.enable", "true");
		props.put("mail.smtp.ssl.trust", host);
		
		Session session = Session.getDefaultInstance(props, new javax.mail.Authenticator() {
			String un=username;
			String pw=password;
			protected javax.mail.PasswordAuthentication getPasswordAuthentication(){
				
				return new javax.mail.PasswordAuthentication(un, pw);
			}
		});
		session.setDebug(true);
		
		Message mimeMessage = new MimeMessage(session);
		mimeMessage.setFrom(new InternetAddress("01030690083@naver.com"));
		mimeMessage.setRecipient(Message.RecipientType.TO, new InternetAddress(recipent));
		
		mimeMessage.setSubject(subject); //제목셋팅
		mimeMessage.setText(body); //내용셋팅
		Transport.send(mimeMessage); //javax.mail.Transport.send 이용
		
		return result;	
	}
	
	@RequestMapping("/oauthmember/checkMemberId")
	@ResponseBody
	public OauthmemberVO checkMember(OauthmemberVO oauthmemberVO) {
		OauthmemberVO member = oauthmemberService.readOneOauthmenber(oauthmemberVO);
		return member;
	}
	
		
}
