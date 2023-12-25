package com.table.zzimkong.controller;

import javax.servlet.http.*;

import org.springframework.beans.factory.annotation.*;
import org.springframework.stereotype.*;
import org.springframework.ui.*;
import org.springframework.web.bind.annotation.*;

import com.table.zzimkong.service.*;
import com.table.zzimkong.vo.*;

@Controller
public class MypageController {
	// MypageService 객체 자동 주입
	@Autowired
	private MypageService service;
	
	// 회원정보 조회
	@GetMapping("my/modify/profile")
	public String my_modify_profile(MemberVO member, HttpSession session, Model model) {
		String sId = (String) session.getAttribute("sId");
		if(sId == null) {
			model.addAttribute("msg", "잘못된 접근입니다.");
			return "fail_back";
		}
		
		// 현재 세션이 관리자가 아니거나 관리자이면서 id 파라미터가 없을 경우(null 또는 널스트링)
		// MemberVO 객체의 id 값을 세션 아이디로 교체(덮어쓰기)
		if(!sId.equals("admin") || (sId.equals("admin") && (member.getUser_id() == null || member.getUser_id().equals("")))) {
			member.setUser_id(sId);
		}
		
		// MemberService - getMember() 메서드 호출하여 회원 상세정보 조회 요청
		// => 파라미터 : MemberVO 객체 리턴타입 : MemberVO(dbMember)
		MemberVO dbMember = service.getMember(member);
		
		// 조회 결과 Model 객체에 저장
		model.addAttribute("member", dbMember);
		
		
		
		// 회원정보 조회 페이지 포워딩
		return "mypage/my_modify_profile";

	}
	
	
	
	
	
}
