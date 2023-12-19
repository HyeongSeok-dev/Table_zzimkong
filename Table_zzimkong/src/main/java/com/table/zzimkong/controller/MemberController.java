package com.table.zzimkong.controller;


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

	@PostMapping("join/MemberJoinPro")
	public String joinPro(MemberVO member, Model model) {
		
	      member.setUser_category(1);
		  member.setUser_phone("010-111-1111");
		
			int insertCount = service.registMember(member);
			if(insertCount > 0) { // 성공				
				return "redirect:/";
			} else { // 실패
				// 실패 시 메세지 출력 및 이전페이지로 돌아가는 기능을 모듈화 한 fail_back.jsp 페이지
				model.addAttribute("msg", "회원 가입 실패!");
				return "fail_back";
			}
			
		}//joinPro()
	
		//MemberJoinSuccess요청에대한 페이지 포워딩======================================
//		@GetMapping("MemberJoinSuccess")
//		public String JoinSuccess() {
//			return "redirect:/";
//		}
	
	
	
		//아이디 중복검사 MemberCheckDupId =============================================
		
			
			
}//MemberController
