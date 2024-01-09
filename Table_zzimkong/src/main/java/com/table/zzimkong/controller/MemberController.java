package com.table.zzimkong.controller;


import javax.servlet.http.*;

import org.springframework.beans.factory.annotation.*;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.*;
import org.springframework.ui.*;
import org.springframework.web.bind.annotation.*;

import com.table.zzimkong.service.*;
import com.table.zzimkong.vo.*;

@Controller
public class MemberController {
	
	// MemberService 객체 자동 주입
	@Autowired
	private MemberService service;
	@Autowired
	private SendMailService mailService;

	@GetMapping("join/join")
	public String join() {
		return "join/join";
	}
	
	@GetMapping("join/ceo")
	public String join_ceo() {
		return "join/join_ceo";
	}
	
	@GetMapping("join/choice")
	public String join_choice() {
		return "join/join_choice";
	}
	
	@GetMapping("join/complete")
	public String join_complete() {
		return "join/join_complete";
	}
	
	@GetMapping("join/agree")
	public String join_agree() {
		return "join/join_agree";
	}
	
	@GetMapping("my/complet")
	public String my_complet() {
		return "mypage/my_complet";
	}
	
	@GetMapping("join/unregister")
	public String join_unregister() {
		return "join/join_unregister";
	}
	
	
	//회원가입==========================================================
	@PostMapping("join/MemberJoinPro")
	public String joinPro(MemberVO member, Model model) {
		
		//암호화
		BCryptPasswordEncoder passwordEncoder = new BCryptPasswordEncoder();
		String securePasswd = passwordEncoder.encode(member.getUser_passwd());
		member.setUser_passwd(securePasswd);
		
//	      member.setUser_category(1); //임시 - 일반회원(1) or 업주회원(2)
		
			int insertCount = service.registMember(member);
			if(insertCount > 0) { // 성공				
				return "redirect:/join/complete";
			} else { // 실패
				// 실패 시 메세지 출력 및 이전페이지로 돌아가는 기능을 모듈화 한 fail_back.jsp 페이지
				model.addAttribute("msg", "회원 가입 실패!");
				return "fail_back";
			}
			
		}//joinPro()
	
	//MemberCheckDupId(아이디 중복확인)에대한 비지니스 로직 처리===============================
	@ResponseBody // 응답 데이터를 body로 그대로 활용하기 위해 이 어노테이션을 적용!
	@GetMapping("join/MemberCheckDupId")
	public String checkDupId(MemberVO member) {
		MemberVO dbMember = service.getMember(member);
		//조회 결과 판별
		if(dbMember == null) {
			return "false";
		}else {
			return "true";
		}
		
	} //checkDupId()
	
	//MemberCheckDupNick(닉네임 중복확인)에 대한 비지니스 로직 처리===============================
	@ResponseBody
	@GetMapping("join/MemberCheckDupNick")
	public String checkDupNick(MemberVO member) {
		MemberVO dbMember = service.getMember(member);
		
		if(dbMember == null) {
			return "false";
		}else {
			return "true";
		}
	} //MemberCheckDupNick()
	
	//업주회원=================================================================

		@PostMapping("join/MemberJoinCeoPro")
		public String joinCeoPro(MemberVO member, Model model) {
			
				//암호화
				BCryptPasswordEncoder passwordEncoder = new BCryptPasswordEncoder();
				String securePasswd = passwordEncoder.encode(member.getUser_passwd());
				member.setUser_passwd(securePasswd);
					
			
				int insertCount = service.registCeoMember(member);
				if(insertCount > 0) { // 성공				
					return "redirect:/join/complete";
				} else { // 실패
					// 실패 시 메세지 출력 및 이전페이지로 돌아가는 기능을 모듈화 한 fail_back.jsp 페이지
					model.addAttribute("msg", "회원 가입 실패!");
					return "fail_back";
				}
				
				
			}//joinCeoPro()
		
	//회원탈퇴=================================================================
		
//		@PostMapping("MemberWithdrawPro")
//		public String withdrawForm(HttpSession session, Model model) {
//					
//			String sId = (String)session.getAttribute("sId");
//			
//			if(sId == null) {
//				model.addAttribute("msg", "잘못된 접근 입니다.");
//				return "fail_back";
//			}
//			return "mypage/my_unregister";
//		}
		
		//회원탈퇴 비지니스 로직처리
		@PostMapping("my/check/MemberWithdrawPro")
		public String withdrawPro(MemberVO member, HttpSession session, Model model) {
			
				String sId = (String)session.getAttribute("sId");
					
					if(sId == null) {
						model.addAttribute("msg", "잘못된 접근 입니다.");
						return "fail_back";
					}
					
					member.setUser_id(sId);
					
					MemberVO dbMember = service.getMember(member);
					
					//db랑비교
					//추후 비밀번호 암호화기능 추가해야함
					BCryptPasswordEncoder passwordEncoder = new BCryptPasswordEncoder();
					if(passwordEncoder.matches(member.getUser_passwd(), dbMember.getUser_passwd())) {
						model.addAttribute("msg", "비밀번호가 일치하지 않습니다.");
						return "fail_back";
				}
					
				//탈퇴처리 요청
				int updateCount = service.withdrawMember(member);
				
				if(updateCount > 0) { //성공
					return "mypage/my_complet";
				}else {
					return "fail_back";
				}
		}
	
	
	//==========================================================================
	// [ 로그인]
	
	@GetMapping("login")
	public String login() {
		return "login/login";
	}
	
	@PostMapping("loginPro") 
	public String longinPro(MemberVO member, HttpSession session, Model model) {
		System.out.println(member);
		MemberVO dbMember = service.getMember(member);
		if(dbMember == null) {
			model.addAttribute("msg", "존재하지 않는 회원입니다.");
		    return "fail_back";
		}
		System.out.println(dbMember);
		
		if(dbMember.getUser_status() == 3) {
			model.addAttribute("msg", "탈퇴한 회원입니다!");
			return "fail_back";
		}
		
		BCryptPasswordEncoder passwordEncoder = new BCryptPasswordEncoder();
		
		// 아이디가 널 문자열이거나, dbMember가 null인 경우 존재하지 않는 아이디 처리
		if(member.getUser_id() == null || member.getUser_id().equals("")) {
//		 if (member.getUser_id() == null || !member.getUser_id().matches("^[A-Za-z0-9]+$")) {
//	        model.addAttribute("msg", "아이디를 다시 확인해주세요.");
//	    if (!dbMember.getUser_id().equals(member.getUser_id())) {
//	    	model.addAttribute("msg", "아이디를 다시 확인해주세요.");
		    return "fail_back";
		} else if(!passwordEncoder.matches(member.getUser_passwd(), dbMember.getUser_passwd())) {
		    // 비밀번호 일치하지 않음 처리
		    model.addAttribute("msg", "비밀번호가 일치하지 않습니다.");
		    return "fail_back";
		    
		} else { // 로그인 성공
		    // 세션 객체에 로그인 성공한 아이디를 "sId" 속성으로 추가
		    session.setAttribute("sId", member.getUser_id());
		    //메인닉네임표시
		    session.setAttribute("sNick", dbMember.getUser_nick());
		    //메인화면 회원상태 구별을 위한 세션
		    session.setAttribute("sCategory", dbMember.getUser_category());
		    //메인 업주화면 이름 표시를위한 세션
		    session.setAttribute("sName", dbMember.getUser_name());
		    //  user_idx가 외래키여서 session에 sIdx 넣었음
		    session.setAttribute("sIdx", dbMember.getUser_idx());    
		    // 메인페이지로 리다이렉트
		    return "redirect:/";
		}
		
	}
		
	// "MemberLogout" 요청에 대한 로그아웃 비즈니스 로직 처리
	@GetMapping("MemberLogout")
	public String logout(HttpSession session) {
		// 세션 초기화
		session.invalidate();
		return "redirect:/";
	}

	// 아이디 찾기
	@GetMapping("login/find/id")
	public String loginFindId(MemberVO member, HttpSession session, Model model) {
//		System.out.println(member); 
		
		return "login/login_find_id";
	}
	
	@PostMapping("login/find/idPro")
	public String login_find_idPro(MemberVO member, HttpSession session, Model model) {
		System.out.println(member); // form action 값 잘 넘어왔는지 찍어보기
		member.setUser_email(member.getUser_email1() + "@" + member.getUser_email2());
		System.out.println(member); // email 두개 결합 잘 되었나 확인
		
		MemberVO dbMember = service.getValidMember(member);
		
		if(dbMember == null) { // 이메일이 없음
			model.addAttribute("msg", "존재하지 않는 이메일입니다.");
			return "fail_back";
		} 
		
		String auth_code = mailService.sendIdAuthMail(member); // MemberVO 객체 전달 및 이메일 전송 완료
		service.registMailAuthInfo(member.getUser_email(), auth_code);
		model.addAttribute("msg", "인증메일이 발송되었습니다. 메일을 확인하세요");
		return "popup_close";

	}


	//비밀번호 찾기
	@GetMapping("login/find/passwd")
	public String login_find_passwd() {
		return "login/login_find_passwd";
	}
	
	@PostMapping("login/find/passwdPro")
	public String login_find_passwdPro(MemberVO member, HttpSession session, Model model) {
		System.out.println(member);
		
		member.setUser_email(member.getUser_email1()+"@"+member.getUser_email2());
		
		MemberVO dbMember = service.getValidMember(member);
		
		if(dbMember == null) {
			model.addAttribute("msg", "존재하지 않는 회원입니다.");
			return "fail_back";
		}
		
		String auth_code = mailService.sendPasswdAuthMail(member); // MemberVO 객체 전달 및 이메일 전송 완료
		service.registMailAuthInfo(member.getUser_id(), auth_code);
		model.addAttribute("msg", "인증메일이 발송되었습니다. 메일을 확인하세요");
		return "popup_close";
	}
	
	@GetMapping("MemberIdEmailAuth")
	public String MemberIdEmailAuth(MailAuthInfoVO authInfo, HttpSession session, Model model) {
		
//		MailAuthInfoVO authinfo
		System.out.println("authInfo : " + authInfo);
		
		// MemberService - requestEmailAuth() 메서드 호출하여 인증 요청
		// => 파라미터 : MailAuthInfoVO 객체   리턴타입 : boolean(isAuthSuccess)
		boolean isAuthSuccess = service.requestEmailAuth(authInfo);
		
		if(isAuthSuccess) { // 성공
//			model.addAttribute("msg", "인증 성공!");
//			model.addAttribute("targetURL", "login");
			return "login/login_result_id";
		} else { // 실패 
			model.addAttribute("msg", "인증 실패!");
			return "fail_back";
		}
	}
	
	
	
	@GetMapping("MemberPasswdEmailAuth")
	public String MemberPasswdEmailAuth(MailAuthInfoVO authInfo, HttpSession session, Model model) {
		
//		MailAuthInfoVO authinfo
		System.out.println("authInfo : " + authInfo);
		
		// MemberService - requestEmailAuth() 메서드 호출하여 인증 요청
		// => 파라미터 : MailAuthInfoVO 객체   리턴타입 : boolean(isAuthSuccess)
		boolean isAuthSuccess = service.requestEmailAuth(authInfo);
		System.out.println("불린값" + isAuthSuccess);
		if(isAuthSuccess) { // 성공
			model.addAttribute("authInfo", authInfo);
			return "login/login_update_passwd";
		} else { // 실패 
			model.addAttribute("msg", "인증 실패!");
			return "fail_back";
		}
	}
	
	@PostMapping("updatePasswdPro")
	public String updatePasswdPro(MemberVO member, HttpSession session, Model model, MailAuthInfoVO authInfo) {
		
		MailAuthInfoVO dbAuthInfo = service.getAuthInfo(authInfo);
		
		System.out.println(member);
		System.out.println(authInfo);
		if(dbAuthInfo == null) {
			model.addAttribute("msg", "잘못된 접근입니다!");
			return "fail_back";
		}
		
		BCryptPasswordEncoder passwordEncoder = new BCryptPasswordEncoder();
		String securePasswd = passwordEncoder.encode(member.getUser_passwd());
		member.setUser_passwd(securePasswd);
		
		int updateCount = service.updatePasswd(member);
		if(updateCount > 0) { //성공
			model.addAttribute("msg", "비밀번호가 변경되었습니다.");
			model.addAttribute("targetURL", "login");
			service.removeAuthInfo(authInfo.getUser_id()); // 이거 호출하라 함
			return "forward";
		}else {
			model.addAttribute("msg", "비밀번호 변경 오류! 인증을 다시 진행하세요");
			return "fail_back";
		}
	}
	
		
}//MemberController
