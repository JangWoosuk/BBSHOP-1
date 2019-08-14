package com.bbshop.bit.controller;

import java.util.HashMap;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.bbshop.bit.domain.MemberVO;
import com.bbshop.bit.domain.MoreDetailsVO;
import com.bbshop.bit.service.MemberService;
import com.bbshop.bit.service.UserMailSendService;

@Controller
@RequestMapping("*.do")
public class MemberController {
	
	private int noAccountCount;
	
	@Inject
    PasswordEncoder passwordEncoder;
	
	@Autowired(required=true)
	MemberService memberService;
	
	@Autowired
	private UserMailSendService mailsender;
	
	@RequestMapping(value="index.do", method=RequestMethod.GET)
	public String index() {
		System.out.println("index 입니다..");
		return "shoppingMall/main/index";
	}
	
	@RequestMapping(value="login.do" ,method=RequestMethod.POST)//RequestMethod 쿼리스트링으로 받을때 사용하는것. GET만가능 (RequestParam)
	public String login(MemberVO vo, HttpSession session ,HttpServletRequest request) {
		
		String toPage = request.getParameter("toPage"); //hidden 은 value값을 가져와야 한다.
		
		//무슨 버튼을 누르고 들어왔는지 정보를 보여준다.
		System.out.println("로그인 ID:"+vo.getMEMBER_ID()+"로그인 PW:"+vo.getMEMBER_PW()+"이동 Page:"+toPage);
		
		//암호화되어 저장된 비밀번호를 받아와야 한다. 매퍼에서는 where아이디로 비밀번호를 받아온다.
		String db_pw = memberService.memberPw(vo);
		
		System.out.println("디비에 저장된 비밀번호"+db_pw);
		
		//암호화된 비밀번호를 복호화 하여 로그인시 회원이 작성한 비밀번호와 매치 시켜서 비밀번호 일치 하는지 본다. 
		if(passwordEncoder.matches(vo.getMEMBER_PW(),db_pw)) {
			
			System.out.println("비밀번호 일치!");
			
			//비밀번호가 맞으면 vo에 db에 있는 비밀번호를 넣어준다
			vo.setMEMBER_PW(db_pw);
			
			System.out.println("vo의 비밀번호"+vo.getMEMBER_PW());
		} else {
			System.out.println("비밀번호 틀림~ 멍청이~");
		}
		//맵에다가 아이디와 pw를 넣어준다
		HashMap<String,String> map = new HashMap<String,String>();
		map.put("MEMBER_ID", vo.getMEMBER_ID());
		map.put("MEMBER_PW", vo.getMEMBER_PW());
		
		//맵과 무슨 버튼을 눌렀는지 를 서비스를 통해서 넣어준다.
		String resultUrl = memberService.memberLogin(map,toPage);
		if(resultUrl.equals("shopping_main.do") || resultUrl.equals("community_main.do")) {
			
			session.setAttribute("member", memberService.getUser_key(vo));
			session.setAttribute("nickname", memberService.getMemberInfo(memberService.getUser_key(vo)).getNICKNAME());
		}
		
		return "redirect:/" + resultUrl;
	}
	
	@RequestMapping(value="noAccount.do", method=RequestMethod.GET)
	public String noAccount(HttpServletRequest request,HttpSession session ,@RequestParam("toPage") String toPage) {
//		String toPage = request.getParameter("toPage"); //hidden 은 value값을 가져와야 한다.
		System.out.println("비회원 페이지이동:"+toPage);
		String result = "";
		noAccountCount++;
		if(toPage.equals("goShop")) {
			result="redirect:/shopping_main_temp.do";
		}
		else {
			result="redirect:/community_main.do";
		}
		
		session.setAttribute("member", (long)00);
		session.setAttribute("nickname", "noAccount" + noAccountCount);
		
		return result;
	}
	
	//이메일을 받아와서 먼저 아이디 체크를 해보고 없으면 아이디를 넣어준다!
	@ResponseBody
	@RequestMapping(value="kakaoLogin.do" , method=RequestMethod.POST)
	public String kakaoLogin(MemberVO vo , HttpServletRequest request,HttpSession session) {
		vo.setMEMBER_ID(request.getParameter("MEMBER_ID"));
		String toPage = request.getParameter("toPage");
		System.out.println(vo.getMEMBER_ID());
		String result ="";
		System.out.println(toPage);
		if (toPage.equals("goShop")) {
			
			result="shopping_main.do";
		}
		else {
			
			result="community_main.do";
		}
		int temp = memberService.getId(vo);
		if(temp==1) {
			System.out.println("아이디가 존재 합니다");
			session.setAttribute("member",vo.getMEMBER_ID());
		}
		else {
			System.out.println("아이디가 없으니 이쪽으로 들어오니??");
			vo.setMEMBER_PW("kakao");
			vo.setGRADE("silver");
			vo.setNAME(vo.getNICKNAME());
			vo.setPHONE("kakao");
			
			memberService.register(vo);
			session.setAttribute("member", vo.getUSER_KEY());
		}
		System.out.println(result);
		return result;
	}
	
	@RequestMapping(value="register.do",method=RequestMethod.POST)
	public String register(Model model, MemberVO vo, HttpServletRequest request) {
		vo.setGRADE("silver");
		System.out.println(vo.toString());
			
		try {
			memberService.register(vo);
			System.out.println("회원등록 성공!");			
			return "redirect:index.do";
		}
		catch(Exception e) {
			System.out.println("회원 등록 실패...");
			return "redirect:index.do";
		}
	}
	@ResponseBody
	@RequestMapping(value="authEmail.do", method=RequestMethod.POST)
	public String authEmail(MemberVO vo , HttpServletRequest request){
		System.out.println(vo.toString());
		String key= "";
		key=mailsender.mailSendWithUserKey(vo.getMEMBER_ID(),vo.getMEMBER_ID(),request);
		System.out.println(key);
		return key;
	}
	
	@RequestMapping(value="moredetails.do", method= {RequestMethod.GET, RequestMethod.POST})
	public String moredetails(MemberVO vo, MoreDetailsVO md, HttpServletRequest request) {
				
		vo.setGRADE("silver"); // 등급 설정
		
		System.out.println("moredetails 컨트롤러에서의 vo : " + vo.toString());
		System.out.println("moredetails 컨트롤러에서의 md : " + md.toString());
		
		try {
			
			memberService.register(vo);
			
			long user_key=memberService.getUser_key(vo);
			System.out.println("vo user_key : " + user_key);
			
			md.setUSER_KEY(user_key);
			memberService.moreDetailsRegister(md);
			System.out.println("추가정보 등록 성공!");

			return "redirect:index.do";
		}
		catch(Exception e) {
			
			System.out.println("회원등록 실패..");

			return "redirect:index.do";
		}
	}
	
	@ResponseBody
	@RequestMapping(value="check_id.do" , method=RequestMethod.GET)
	public String check_id(MemberVO vo) {
		System.out.println("중복체크할 아이디:"+vo.getMEMBER_ID());
		
		int temp = memberService.getId(vo);
		
		String result ="";
		System.out.println("중복체크가 끝났는가??"+result);
		if(temp==1) {
			result="success";
		}
		else {
			result="false";
		}
		
		return result;
		
	}
	@ResponseBody
	@RequestMapping(value="check_nickname.do" , method=RequestMethod.GET)
	public String check_nickname(MemberVO vo) {
		System.out.println("중복체크할 nickname:"+vo.getNICKNAME());
		
		int temp = memberService.getNickname(vo);
		
		String result ="";
		if(temp==1) {
			result="success";
		}
		else {
			result="false";
		}
		System.out.println("중복체크가 끝났는가??"+result);
		
		return result;
		
	}
}