package com.table.zzimkong.controller;

import java.util.List;

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
	public String my_modify_profile(MypageVO mypage, HttpSession session, Model model) {
		String sId = (String) session.getAttribute("sId");
		if(sId == null) {
			model.addAttribute("msg", "잘못된 접근입니다.");
			return "fail_back";
		}
		
		// 현재 세션이 관리자가 아니거나 관리자이면서 id 파라미터가 없을 경우(null 또는 널스트링)
		// MypageVO 객체의 id 값을 세션 아이디로 교체(덮어쓰기)
		if(!sId.equals("admin") || (sId.equals("admin") && (mypage.getUser_id() == null || mypage.getUser_id().equals("")))) {
			mypage.setUser_id(sId);
		}
		
		// MypageService - getMypage() 메서드 호출하여 회원 상세정보 조회 요청
		// => 파라미터 : MypageVO 객체 리턴타입 : MypageVO(dbMypage)
		MypageVO dbMypage = service.getMypage(mypage);
	
		// 조회 결과 Model 객체에 저장
		model.addAttribute("mypage", dbMypage);
		System.out.println(dbMypage);
		
		
		// 회원정보 조회 페이지 포워딩
		return "mypage/my_modify_profile";
		
	}
	
	// 닉네임 중복확인에 대한 비지니스 로직 처리---------------------
	@ResponseBody
	@GetMapping("my/modify/MypageCheckDupNick")
	public String checkDupNick(MypageVO mypage) {
		System.out.println(mypage);
		MypageVO dbMypage = service.getUserNick(mypage);
		
		if(dbMypage == null) {
			return "false";
		}else {
			return "true";
		}
	} //MypageCheckDupNick()
	
	
	//	[ 회원정보 수정 ]
	// "MyModifyPro" 서블릿 요청에 대한 회원 정보 수정 비즈니스 로직 처리
	// => 추가로 전달되는 새 패스워드(newPasswd) 값을 전달받을 파라미터 변수 1개 추가(Map 사용 가능)
	@PostMapping("my/modify/MyModifyPro")
	public String modifyPro(MypageVO mypage, String user_passwd1, HttpSession session, Model model) {
		// 세션 아이디가 없을 경우 "fail_back" 페이지를 통해 "잘못된 접근입니다" 출력 처리
		String sId = (String) session.getAttribute("sId");
		if (sId == null) {
			model.addAttribute("msg", "잘못된 접근입니다");
			return "fail_back";
		}
		
		System.out.println("전달받은 Mypage : " + mypage);
		
		// 만약, 현재 세션이 관리자가 아니거나
		// 관리자이면서 id 파라미터가 없을 경우(null 또는 널스트링)
		// MypageVO 객체의 id 값을 세션 아이디로 교체(덮어쓰기)
		if(!sId.equals("admin") || (sId.equals("admin") && (mypage.getUser_id() == null || mypage.getUser_id().equals("")))) {
			mypage.setUser_id(sId);
		} 

		// MypageService - getMypage() 메서드 호출하여 회원 정보 조회 요청(패스워드 비교용)
		// => 파라미터 : MypageVO 객체 리턴타입 : MypageVO(dbMypage)
		MypageVO dbMypage = service.getMypage(mypage);
		
		// BCryptPasswordEncoder 클래스를 활용하여 입력받은 기존 패스워드와 DB 패스워드 비교
		BCryptPasswordEncoder passwordEncoder = new BCryptPasswordEncoder();
		
		if(!sId.equals("admin") || (sId.equals("admin") && (mypage.getUser_id() == null || mypage.getUser_id().equals("")))) {
			// 이 때, 동일한 조건에서 패스워드 검증도 추가로 수행
			// => 관리자가 다른 회원의 정보를 수정할 경우에는 패스워드 검증 수행 생략됨
			if (mypage.getUser_passwd() != null && !mypage.getUser_passwd().equals("")) { // 이 부분 추가해서 닉네임이나 이메일주소만 변경해도 정보수정 가능하게 함
				if (!passwordEncoder.matches(mypage.getUser_passwd(), dbMypage.getUser_passwd())) {
					model.addAttribute("msg", "현재 비밀번호가 틀렸습니다.");
					return "fail_back";
				}
			}
		}
		
		// 새 패스워드를 입력받았을 경우 BCryptPasswordEncoder 클래스를 활용하여 암호화 처리
		if (user_passwd1 != null && !user_passwd1.equals("")) {
			user_passwd1 = passwordEncoder.encode(user_passwd1);
			mypage.setUser_passwd(user_passwd1);
		}
		
		System.out.println(mypage);
		// MypageService - modifyMypage() 메서드 호출하여 회원 정보 수정 요청
		// => 파라미터 : MypageVO 객체, 새 패스워드(newPasswd) 리턴타입 : int(updateCount)
		int updateCount = service.modifyMypage(mypage, user_passwd1);

		// 회원 정보 수정 요청 결과 판별
		// => 실패 시 "fail_back" 페이지 포워딩 처리("회원정보 수정 실패!")
		// => 성공 시 "MypageInfo" 서블릿 리다이렉트
		if(updateCount > 0) { // 성공 시
			 session.setAttribute("msg", "회원정보 수정이 완료되었습니다.");
			// 관리자가 다른 회원 정보 수정 시 MypageInfo 서블릿 주소에 아이디 파라미터 결합
			if(!sId.equals("admin") || (sId.equals("admin") && (mypage.getUser_id() == null || mypage.getUser_id().equals("")))) {
				return "redirect:/my/modify/profile";
			} else {
				return "redirect:/my/modify/profile?id=" + mypage.getUser_id();
			}
		} else { // 실패 시
			model.addAttribute("msg", "회원정보 수정 실패!");
			return "fail_back";
		}

	}
	
	// [ 나의 예약 내역 목록 조회 ]
	
	@GetMapping("my/list")
	public String my_list(MypageVO mypage, HttpSession session, Model model, HttpServletResponse response) {
		
		int sIdx = (int)session.getAttribute("sIdx");
		String sId = (String)session.getAttribute("sId"); // 세션에 아이디값을 가져오는거
		mypage.setUser_id(sId);//검색할 아이디를 마이페이지에 넣기 
		MypageVO dbMypage = service.getMypage(mypage);
		System.out.println(dbMypage);
		// MypageService - getResList() 메서드 호출하여 회원 목록 조회 요청
		
//		List<ReservationVO> resList = service.getResList(sIdx);
//		System.out.println("예약목록 = " + resList);
		
		// 가게 이름 검색
//		for(ReservationVO res:resList) {
//			CompanyVO com = service.getComName(res);
//		}
		
		
		// Model 객체에 회원 목록 조회 결과 저장
//		model.addAttribute("resList", resList);
		model.addAttribute("mypage", mypage);
		
		return "mypage/my_list";
	}
	
	

}
