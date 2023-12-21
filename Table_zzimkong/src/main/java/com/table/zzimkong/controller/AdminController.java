package com.table.zzimkong.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.table.zzimkong.service.AdminService;
import com.table.zzimkong.service.MemberService;
import com.table.zzimkong.vo.MemberVO;

@Controller
public class AdminController {
	@Autowired
	private AdminService service;
	
	// 공통 - 관리자 페이지 접근 권한 설정
	
	@GetMapping("admin/main") 
	public String adminMain(HttpSession session, Model model) {
		// 세션 아이디가 null 이거나 "admin" 이 아닐 경우 접근불가
		session.setAttribute("sId", "admin");	/// 세션 아이디 test
		String sId = (String) session.getAttribute("sId");
		if (sId == null || !sId.equals("admin")) {
			model.addAttribute("msg", "잘못된 접근입니다");
			return "fail_back";
		}
		
		return "admin/admin_main";
	}
	
	// 관리자 페이지 - 회원 목록 조회
	@GetMapping("admin/user") 
	public String memberList(HttpSession session, Model model) {
		// 세션 아이디가 null 이거나 "admin" 이 아닐 경우 접근불가
		String sId = (String) session.getAttribute("sId");
		session.setAttribute("sId", "admin");	/// 세션 아이디 test
		if (sId == null || !sId.equals("admin")) {
			model.addAttribute("msg", "잘못된 접근입니다");
			return "fail_back";
		}
		System.out.println("연결은 됨");
		
		// AdminService - adminMemberList() 메서드 호출하여 회원 목록 조회 요청
		// => 파라미터 : 없음 / 리턴타입 : List<MemberVO>(memberList)
		List<MemberVO> memberList = service.adminMemberList();
		
		// Model 객체에 회원 목록 조회 결과 저장
		model.addAttribute("memberList", memberList);
		
		// 회원 목록 조회 페이지(admin/admin_user.jsp)로 포워딩
		return "admin/admin_user";
		
	}
	
	@GetMapping("admin/company")
	public String admin_company(HttpSession session, Model model) {
		// 세션 아이디가 null 이거나 "admin" 이 아닐 경우 접근불가
		String sId = (String) session.getAttribute("sId");
		session.setAttribute("sId", "admin");	/// 세션 아이디 test
		if (sId == null || !sId.equals("admin")) {
			model.addAttribute("msg", "잘못된 접근입니다");
			return "fail_back";
		}
		
		return "admin/admin_company";
	}
	
	@GetMapping("admin/company/info")
	public String admin_company_info(HttpSession session, Model model) {
		// 세션 아이디가 null 이거나 "admin" 이 아닐 경우 접근불가
		String sId = (String) session.getAttribute("sId");
		session.setAttribute("sId", "admin");	/// 세션 아이디 test
		if (sId == null || !sId.equals("admin")) {
			model.addAttribute("msg", "잘못된 접근입니다");
			return "fail_back";
		}
		
		return "admin/admin_company_info";
	}
	
	@GetMapping("admin/review")
	public String admin_review(HttpSession session, Model model) {
		// 세션 아이디가 null 이거나 "admin" 이 아닐 경우 접근불가
		String sId = (String) session.getAttribute("sId");
		session.setAttribute("sId", "admin");	/// 세션 아이디 test
		if (sId == null || !sId.equals("admin")) {
			model.addAttribute("msg", "잘못된 접근입니다");
			return "fail_back";
		}
				
		return "admin/admin_review";
	}
	
	@GetMapping("admin/review/detail")
	public String admin_review_detail(HttpSession session, Model model) {
		// 세션 아이디가 null 이거나 "admin" 이 아닐 경우 접근불가
		String sId = (String) session.getAttribute("sId");
		session.setAttribute("sId", "admin");	/// 세션 아이디 test
		if (sId == null || !sId.equals("admin")) {
			model.addAttribute("msg", "잘못된 접근입니다");
			return "fail_back";
		}
				
		return "admin/admin_review_detail";
	}

	@GetMapping("admin/cs/qna")
	public String admin_cs_qna(HttpSession session, Model model) {
		// 세션 아이디가 null 이거나 "admin" 이 아닐 경우 접근불가
		String sId = (String) session.getAttribute("sId");
		session.setAttribute("sId", "admin");	/// 세션 아이디 test
		if (sId == null || !sId.equals("admin")) {
			model.addAttribute("msg", "잘못된 접근입니다");
			return "fail_back";
		}
				
		return "admin/admin_cs_qna";
	}
	
	@GetMapping("admin/cs/qna/answer/register")
	public String admin_cs_qna_answer_register(HttpSession session, Model model) {
		// 세션 아이디가 null 이거나 "admin" 이 아닐 경우 접근불가
		String sId = (String) session.getAttribute("sId");
		session.setAttribute("sId", "admin");	/// 세션 아이디 test
		if (sId == null || !sId.equals("admin")) {
			model.addAttribute("msg", "잘못된 접근입니다");
			return "fail_back";
		}
				
		return "admin/admin_cs_qna_answer_register";
	}
	
	@GetMapping("admin/cs/qna/answer/view")
	public String admin_cs_qna_answer_view(HttpSession session, Model model) {
		// 세션 아이디가 null 이거나 "admin" 이 아닐 경우 접근불가
		String sId = (String) session.getAttribute("sId");
		session.setAttribute("sId", "admin");	/// 세션 아이디 test
		if (sId == null || !sId.equals("admin")) {
			model.addAttribute("msg", "잘못된 접근입니다");
			return "fail_back";
		}
				
		return "admin/admin_cs_qna_answer_view";
	}
	
	@GetMapping("admin/cs/qna/answer/modify")
	public String admin_cs_qna_answer_modify(HttpSession session, Model model) {
		// 세션 아이디가 null 이거나 "admin" 이 아닐 경우 접근불가
		String sId = (String) session.getAttribute("sId");
		session.setAttribute("sId", "admin");	/// 세션 아이디 test
		if (sId == null || !sId.equals("admin")) {
			model.addAttribute("msg", "잘못된 접근입니다");
			return "fail_back";
		}
				
		return "admin/admin_cs_qna_answer_modify";
	}
	
	@GetMapping("admin/cs/qna/question")
	public String admin_cs_qna_question(HttpSession session, Model model) {
		// 세션 아이디가 null 이거나 "admin" 이 아닐 경우 접근불가
		String sId = (String) session.getAttribute("sId");
		session.setAttribute("sId", "admin");	/// 세션 아이디 test
		if (sId == null || !sId.equals("admin")) {
			model.addAttribute("msg", "잘못된 접근입니다");
			return "fail_back";
		}
				
		return "admin/admin_cs_qna_question";
	}

	@GetMapping("admin/cs/faq")
	public String admin_cs_faq(HttpSession session, Model model) {
		// 세션 아이디가 null 이거나 "admin" 이 아닐 경우 접근불가
		String sId = (String) session.getAttribute("sId");
		session.setAttribute("sId", "admin");	/// 세션 아이디 test
		if (sId == null || !sId.equals("admin")) {
			model.addAttribute("msg", "잘못된 접근입니다");
			return "fail_back";
		}
				
		return "admin/admin_cs_faq";
	}
	
	@GetMapping("admin/cs/faq/register")
	public String admin_cs_faq_register(HttpSession session, Model model) {
		// 세션 아이디가 null 이거나 "admin" 이 아닐 경우 접근불가
		String sId = (String) session.getAttribute("sId");
		session.setAttribute("sId", "admin");	/// 세션 아이디 test
		if (sId == null || !sId.equals("admin")) {
			model.addAttribute("msg", "잘못된 접근입니다");
			return "fail_back";
		}
				
		return "admin/admin_cs_faq_register";
	}
	
	@GetMapping("admin/cs/faq/modify")
	public String admin_cs_faq_modify(HttpSession session, Model model) {
		// 세션 아이디가 null 이거나 "admin" 이 아닐 경우 접근불가
		String sId = (String) session.getAttribute("sId");
		session.setAttribute("sId", "admin");	/// 세션 아이디 test
		if (sId == null || !sId.equals("admin")) {
			model.addAttribute("msg", "잘못된 접근입니다");
			return "fail_back";
		}
				
		return "admin/admin_cs_faq_modify";
	}
	
	@GetMapping("admin/cs/notice")
	public String admin_cs_notice(HttpSession session, Model model) {
		// 세션 아이디가 null 이거나 "admin" 이 아닐 경우 접근불가
		String sId = (String) session.getAttribute("sId");
		session.setAttribute("sId", "admin");	/// 세션 아이디 test
		if (sId == null || !sId.equals("admin")) {
			model.addAttribute("msg", "잘못된 접근입니다");
			return "fail_back";
		}
				
		return "admin/admin_cs_notice";
	}
	
	@GetMapping("admin/cs/notice/modify")
	public String admin_cs_notice_modify(HttpSession session, Model model) {
		// 세션 아이디가 null 이거나 "admin" 이 아닐 경우 접근불가
		String sId = (String) session.getAttribute("sId");
		session.setAttribute("sId", "admin");	/// 세션 아이디 test
		if (sId == null || !sId.equals("admin")) {
			model.addAttribute("msg", "잘못된 접근입니다");
			return "fail_back";
		}
				
		return "admin/admin_cs_notice_modify";
	}
	
	@GetMapping("admin/cs/notice/register")
	public String admin_cs_notice_register(HttpSession session, Model model) {
		// 세션 아이디가 null 이거나 "admin" 이 아닐 경우 접근불가
		String sId = (String) session.getAttribute("sId");
		session.setAttribute("sId", "admin");	/// 세션 아이디 test
		if (sId == null || !sId.equals("admin")) {
			model.addAttribute("msg", "잘못된 접근입니다");
			return "fail_back";
		}
				
		return "admin/admin_cs_notice_register";
	}
}
