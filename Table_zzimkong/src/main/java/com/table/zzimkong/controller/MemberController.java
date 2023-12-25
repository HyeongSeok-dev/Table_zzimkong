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
	
	@GetMapping("login/find/id")
	public String login_find_id() {
		return "login/login_find_id";
	}
	
	@GetMapping("login/find/passwd")
	public String login_find_passwd() {
		return "login/login_find_passwd";
	}

	
	
	
	@PostMapping("join/MemberJoinPro")
	public String joinPro(MemberVO member, Model model) {
		
	      member.setUser_category(1); //임시 - 일반회원(1) or 업주회원(2)
		
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
	@ResponseBody
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
	
	//MemberCheckDupNick(닉네임 중복확인)에대한 비지니스 로직 처리===============================
	@ResponseBody
	@GetMapping("join/MemberCheckDupNick")
	public String checkDupNick(MemberVO member) {
		System.out.println(member);
		MemberVO dbMember = service.getMember(member);
		
		if(dbMember == null) {
			return "false";
		}else {
			return "true";
		}
	} //MemberCheckDupNick()
	
	
	//==========================================================================
		// [ 로그인]
		
		@GetMapping("login")
		public String login() {
			return "login/login";
		}
		
		@PostMapping("loginPro") 
		public String longinPro(MemberVO member, HttpSession session, Model model) {
//			System.out.println(member);
			MemberVO dbMember = service.getMember(member);
			System.out.println(dbMember);
			
//			if(dbMember.getUser_status() == 3) {
//				model.addAttribute("msg", "탈퇴한 회원입니다!");
//				return "fail_back";
//			}
			
//			BCryptPasswordEncoder passwordEncoder = new BCryptPasswordEncoder();
			
//			if(dbMember == null || !passwordEncoder.matches(member.getUser_passwd(), dbMember.getUser_passwd())) {
				if(dbMember == null || !dbMember.getUser_passwd().equals(member.getUser_passwd())) {
				// 로그인 실패 처리
				model.addAttribute("msg", "로그인 실패!");
				return "fail_back";
			} else { // 로그인 성공
				// 세션 객체에 로그인 성공한 아이디를 "sId" 속성으로 추가
				session.setAttribute("sId", member.getUser_id());
				
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
		
}//MemberController
