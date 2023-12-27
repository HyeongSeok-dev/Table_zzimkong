package com.table.zzimkong.controller;

import javax.servlet.http.*;

import org.springframework.beans.factory.annotation.*;
import org.springframework.security.crypto.bcrypt.*;
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
	
	// [ 회원정보 조회 ]
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
		System.out.println(dbMember);
	
		// 조회 결과 Model 객체에 저장
		model.addAttribute("member", dbMember);
		
		
		
		// 회원정보 조회 페이지 포워딩
		return "mypage/my_modify_profile";

	}
	
	//	[ 회원정보 수정 ]
	// "MyModifyPro" 서블릿 요청에 대한 회원 정보 수정 비즈니스 로직 처리
	// => 추가로 전달되는 새 패스워드(newPasswd) 값을 전달받을 파라미터 변수 1개 추가(Map 사용 가능)
	@PostMapping("MyModifyPro")
	public String modifyPro(MemberVO member, String newPasswd, HttpSession session, Model model) {
		// 세션 아이디가 없을 경우 "fail_back" 페이지를 통해 "잘못된 접근입니다" 출력 처리
		String sId = (String) session.getAttribute("sId");
//		if (sId == null) {
//			model.addAttribute("msg", "잘못된 접근입니다");
//			return "fail_back";
//		}
		
//		System.out.println("전달받은 Member : " + member);
		
		// 만약, 현재 세션이 관리자가 아니거나
		// 관리자이면서 id 파라미터가 없을 경우(null 또는 널스트링)
		// MemberVO 객체의 id 값을 세션 아이디로 교체(덮어쓰기)
//		if(!sId.equals("admin") || (sId.equals("admin") && (member.getUser_id() == null || member.getUser_id().equals("")))) {
//			member.setUser_id(sId);
//		} 

		// MemberService - getMember() 메서드 호출하여 회원 정보 조회 요청(패스워드 비교용)
		// => 파라미터 : MemberVO 객체 리턴타입 : MemberVO(dbMember)
		MemberVO dbMember = service.getMember(member);
		
		// BCryptPasswordEncoder 클래스를 활용하여 입력받은 기존 패스워드와 DB 패스워드 비교
		BCryptPasswordEncoder passwordEncoder = new BCryptPasswordEncoder();
		
		if(!sId.equals("admin") || (sId.equals("admin") && (member.getUser_id() == null || member.getUser_id().equals("")))) {
			// 이 때, 동일한 조건에서 패스워드 검증도 추가로 수행
			// => 관리자가 다른 회원의 정보를 수정할 경우에는 패스워드 검증 수행 생략됨
			if (!passwordEncoder.matches(member.getUser_passwd(), dbMember.getUser_passwd())) {
				model.addAttribute("msg", "수정 권한이 없습니다!");
				return "fail_back";
			}
		}
		
		// 새 패스워드를 입력받았을 경우 BCryptPasswordEncoder 클래스를 활용하여 암호화 처리
		if (newPasswd != null && !newPasswd.equals("")) {
			newPasswd = passwordEncoder.encode(newPasswd);
		}

		// MemberService - modifyMember() 메서드 호출하여 회원 정보 수정 요청
		// => 파라미터 : MemberVO 객체, 새 패스워드(newPasswd) 리턴타입 : int(updateCount)
		int updateCount = service.modifyMember(member, newPasswd);

		// 회원 정보 수정 요청 결과 판별
		// => 실패 시 "fail_back" 페이지 포워딩 처리("회원정보 수정 실패!")
		// => 성공 시 "MemberInfo" 서블릿 리다이렉트
		if(updateCount > 0) { // 성공 시
			// 관리자가 다른 회원 정보 수정 시 MemberInfo 서블릿 주소에 아이디 파라미터 결합
			if(!sId.equals("admin") || (sId.equals("admin") && (member.getUser_id() == null || member.getUser_id().equals("")))) {
				return "redirect:/MemberInfo";
			} else {
				return "redirect:/MemberInfo?id=" + member.getUser_id();
			}
		} else { // 실패 시
			model.addAttribute("msg", "회원정보 수정 실패!");
			return "fail_back";
		}

	}
	
	

}
