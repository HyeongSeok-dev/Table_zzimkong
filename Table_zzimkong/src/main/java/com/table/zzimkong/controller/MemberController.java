package com.table.zzimkong.controller;


import org.apache.ibatis.reflection.*;
import org.springframework.beans.factory.annotation.*;
import org.springframework.stereotype.*;
import org.springframework.ui.*;
import org.springframework.web.bind.annotation.*;

import com.table.zzimkong.service.*;
import com.table.zzimkong.vo.*;

@Controller
public class MemberController {
	/**/
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
	
	@GetMapping("login")
	public String login() {
		return "login/login";
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
		MemberVO dbMember = service.getId(member);
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
		MemberVO dbMember = service.getNick(member);
		
		if(dbMember == null) {
			return "false";
		}else {
			return "true";
		}
	} //MemberCheckDupNick()
	
	
}//MemberController
