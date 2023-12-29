package com.table.zzimkong.controller;

import java.io.IOException;
import java.sql.Date;
import java.time.LocalDateTime;
import java.util.List;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.table.zzimkong.service.AdminService;
import com.table.zzimkong.vo.CompanyVO;
import com.table.zzimkong.vo.MemberVO;
import com.table.zzimkong.vo.ReportVO;

@Controller
public class AdminController {
	@Autowired
	private AdminService service;
	
	// 공통 - 관리자 페이지 접근 권한 설정
	public void isvalid(HttpSession session, Model model, HttpServletResponse response) {
		String sId = (String)session.getAttribute("sId");
		
		if (sId == null || !sId.equals("admin") ) {
			try {
				response.sendRedirect("/zzimkong/fail_back");
			} catch (IOException e) {
				e.printStackTrace();
			}
	    } 
	}
	
	@GetMapping("admin/main") 
	public String adminMain(HttpSession session, Model model, HttpServletResponse response) {
		// 관리자 페이지 접근 제한
//		session.setAttribute("sId", "admin"); // 세션 아이디 - 차후 삭제 예정
		isvalid(session, model, response);
		
		return "admin/admin_main";
	}
	
	// 관리자 페이지 - 회원 목록 조회, 검색 기능
	@GetMapping("admin/user") 
	public String memberList(
			@RequestParam(defaultValue = "") String searchMemberType,
			@RequestParam(defaultValue = "") String searchMemberKeyword,
			HttpSession session, Model model, HttpServletResponse response) {
		// 관리자 페이지 접근 제한
		isvalid(session, model, response);
		
		List<MemberVO> memberList = service.adminMemberList(searchMemberType, searchMemberKeyword);
		model.addAttribute("memberList", memberList);
		
		return "admin/admin_user";
	}
	
	// 관리자 페이지 - 회원 탈퇴
	@PostMapping("admin/user/withdraw/Pro")
	public String memberwithdrawPro(MemberVO member, HttpSession session, Model model, HttpServletResponse response) {
		// 관리자 페이지 접근 제한
		isvalid(session, model, response);
		
		int updateCount = service.adminMemberWithdraw(member);

		if(updateCount > 0) { // 성공 시
//			model.addAttribute("msg", "탈퇴 처리되었습니다!");
//			model.addAttribute("targetURL", "admin/user");
//			return "forward";
			return "redirect:/admin/user";
			
		} else { // 실패 시
			model.addAttribute("msg", "회원 탈퇴 처리 실패!");
			return "fail_back";
		}
	}
	
	// 관리자 페이지 - 업체 목록 조회, 검색 기능
	@GetMapping("admin/company")
	public String companyList(
			@RequestParam(defaultValue = "") String searchCompanyType,
			@RequestParam(defaultValue = "") String searchCompanyKeyword,
			HttpSession session, Model model, HttpServletResponse response) {
		// 관리자 페이지 접근 제한
		isvalid(session, model, response);
		
		List<CompanyVO> companyList = service.adminCompanyList(searchCompanyType, searchCompanyKeyword);
		model.addAttribute("companyList", companyList);
		
		return "admin/admin_company";
	}
	
	// 관리자 페이지 - 업체 목록 상세정보
	@GetMapping("admin/company/info")
	public String companyInfo(CompanyVO company, HttpSession session, Model model, HttpServletResponse response) {
		// 관리자 페이지 접근 제한
		isvalid(session, model, response);
		
		company = service.adminCompanyInfo(company);
		model.addAttribute("company", company);
		
		return "admin/admin_company_info";
	}
	
	// 관리자 페이지 - 업체 목록 상세정보 수정
	@PostMapping("admin/company/info/pro")
	public String companyInfoModifyPro(CompanyVO company, HttpSession session, Model model, HttpServletResponse response) {
		// 관리자 페이지 접근 제한
		isvalid(session, model, response);

		int updateCount = service.adminCompanyInfoModify(company);

		if(updateCount > 0) { // 성공 시
//			model.addAttribute("msg", "수정되었습니다!");
//			model.addAttribute("targetURL", "admin/company/info?com_id=" + company.getCom_id());
//			return "forward";
			return "redirect:/admin/company/info?com_id=" + company.getCom_id();
		} else { // 실패 시
			model.addAttribute("msg", "업체 정보 수정 실패!");
			return "fail_back";
		}
	}
	
	// 관리자 페이지 - 업체 승인
	@PostMapping("admin/company/approve/Pro")
	public String companyApprovePro(CompanyVO company, HttpSession session, Model model, HttpServletResponse response) {
		// 관리자 페이지 접근 제한
		isvalid(session, model, response);
		
		int updateCount = service.adminCompanyApprove(company);
		
		if(updateCount > 0) { // 성공 시
			return "redirect:/admin/company";
		} else { // 실패 시
			model.addAttribute("msg", "업체 승인 실패!");
			return "fail_back";
		}
	}
	
	// 관리자 페이지 - 신고 목록 조회
	@GetMapping("admin/report")
	public String reportList(HttpSession session, Model model, HttpServletResponse response) {
		// 관리자 페이지 접근 제한
		isvalid(session, model, response);

		List<ReportVO> reportList = service.adminReportList();
		model.addAttribute("reportList", reportList);
		
		return "admin/admin_report";
	}

	// 관리자 페이지 - 신고 목록 상세정보
	@GetMapping("admin/report/detail")
	public String reportDetail(ReportVO report, HttpSession session, Model model, HttpServletResponse response) {
		// 관리자 페이지 접근 제한
		isvalid(session, model, response);
		
		report = service.adminReportDetail(report);
		model.addAttribute("report", report);

		return "admin/admin_report_detail";
	}
	
	// 관리자 페이지 - 신고 승인/반려 처리
//	@PostMapping("admin/report/detail/Blind/Pro")
//	public String reportBlind(ReportVO report, HttpSession session, Model model, HttpServletResponse response) {
//		// 관리자 페이지 접근 제한
//		isvalid(session, model, response);
//		
//		int updateCount = service.adminReportBlind(report);
//		
//		if(updateCount > 0) { // 성공 시
//			return "redirect:/admin/report";
//		} else { // 실패 시
//			model.addAttribute("msg", "신고 승인 실패!");
//			return "fail_back";
//		}
//	}

	
	
	
	
	
	
	
	// 관리자 페이지 - 고객센터 : 공지사항 조회
	@GetMapping("admin/cs/notice")
	public String admin_cs_notice(HttpSession session, Model model, HttpServletResponse response) {
		// 관리자 페이지 접근 제한
		isvalid(session, model, response);
		
		// CsVO 아직 없음..
//		List<CsVO> adminCsList = service.adminCsList();
//		model.addAttribute("csList", csList);
				
		return "admin/admin_cs_notice";
	}
	
	@GetMapping("admin/cs/notice/modify")
	public String admin_cs_notice_modify(HttpSession session, Model model, HttpServletResponse response) {
		// 관리자 페이지 접근 제한
		isvalid(session, model, response);
			
		return "admin/admin_cs_notice_modify";
	}
	
	@GetMapping("admin/cs/notice/register")
	public String admin_cs_notice_register(HttpSession session, Model model, HttpServletResponse response) {
		// 관리자 페이지 접근 제한
		isvalid(session, model, response);
				
		return "admin/admin_cs_notice_register";
	}
	
	@GetMapping("admin/cs/qna")
	public String admin_cs_qna(HttpSession session, Model model, HttpServletResponse response) {
		// 관리자 페이지 접근 제한
		isvalid(session, model, response);
		
		return "admin/admin_cs_qna";
	}
	
	@GetMapping("admin/cs/qna/answer/register")
	public String admin_cs_qna_answer_register(HttpSession session, Model model, HttpServletResponse response) {
		// 관리자 페이지 접근 제한
		isvalid(session, model, response);
				
		return "admin/admin_cs_qna_answer_register";
	}
	
	@GetMapping("admin/cs/qna/answer/view")
	public String admin_cs_qna_answer_view(HttpSession session, Model model, HttpServletResponse response) {
		// 관리자 페이지 접근 제한
		isvalid(session, model, response);
				
		return "admin/admin_cs_qna_answer_view";
	}
	
	@GetMapping("admin/cs/qna/answer/modify")
	public String admin_cs_qna_answer_modify(HttpSession session, Model model, HttpServletResponse response) {
		// 관리자 페이지 접근 제한
		isvalid(session, model, response);
				
		return "admin/admin_cs_qna_answer_modify";
	}
	
	@GetMapping("admin/cs/qna/question")
	public String admin_cs_qna_question(HttpSession session, Model model, HttpServletResponse response) {
		// 관리자 페이지 접근 제한
		isvalid(session, model, response);
				
		return "admin/admin_cs_qna_question";
	}

	@GetMapping("admin/cs/faq")
	public String admin_cs_faq(HttpSession session, Model model, HttpServletResponse response) {
		// 관리자 페이지 접근 제한
		isvalid(session, model, response);
				
		return "admin/admin_cs_faq";
	}
	
	@GetMapping("admin/cs/faq/register")
	public String admin_cs_faq_register(HttpSession session, Model model, HttpServletResponse response) {
		// 관리자 페이지 접근 제한
		isvalid(session, model, response);
				
		return "admin/admin_cs_faq_register";
	}
	
	@GetMapping("admin/cs/faq/modify")
	public String admin_cs_faq_modify(HttpSession session, Model model, HttpServletResponse response) {
		// 관리자 페이지 접근 제한
		isvalid(session, model, response);
				
		return "admin/admin_cs_faq_modify";
	}
	
}
