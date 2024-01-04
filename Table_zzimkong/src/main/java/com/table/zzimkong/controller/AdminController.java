package com.table.zzimkong.controller;

import java.io.Console;
import java.io.IOException;
import java.sql.Date;
import java.time.LocalDateTime;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.table.zzimkong.service.AdminService;
import com.table.zzimkong.vo.AdminMainVO;
import com.table.zzimkong.vo.CompanyVO;
import com.table.zzimkong.vo.CsVO;
import com.table.zzimkong.vo.MemberVO;
import com.table.zzimkong.vo.PageInfo;
import com.table.zzimkong.vo.ReportVO;

@Controller
public class AdminController {
	@Autowired
	private AdminService service;

	
	// 공통 - 관리자 페이지 접근 권한 설정
	//		+ boolean : "admin"이 아닐 경우 commit 방지
	@GetMapping("adminAccessDented")
	public String forward(Model model, HttpServletRequest request) {
		model.addAttribute("msg", "잘못된 접근입니다.");
		model.addAttribute("targetURL", request.getContextPath());
		return "forward";
	}
	public boolean isvalid(HttpSession session, Model model, HttpServletResponse response) {
		String sId = (String)session.getAttribute("sId");
		
		if (sId == null || !sId.equals("admin") ) {
			try {
				response.sendRedirect("/zzimkong/adminAccessDented");
				return false;
			} catch (IOException e) {
				e.printStackTrace();
			}
	    }
		return true;
	}

	
	// 관리자 페이지 - 메인(답변해야할 문의 갯수, 입점을 승인해야할 가게 갯수, 처리해야할 신고 갯수,
	// 						사이트 일일 방문자 수, 일일 가입자 수, 일일 예약 건수)
	@GetMapping("admin/main")
	public String adminMain(HttpSession session, Model model, HttpServletResponse response) {
		// 관리자 페이지 접근 제한
		if (!isvalid(session, model, response)) return null;
		
		// 문의 답변 대기, 입점 승인 대기, 신고 처리 대기,
		// 오늘 가입자 수, 오늘 예약 수
		AdminMainVO adminMain = service.adminMain();
        model.addAttribute("adminMain", adminMain);

        return "admin/admin_main";
	}
	
	// 관리자 페이지 - 회원 목록 조회 요청 (페이지네이션, 검색 기능, 카테고리 필터)
	@GetMapping("admin/user") 
	public String memberList(
			@RequestParam(defaultValue = "") String searchMemberType,
			@RequestParam(defaultValue = "") String searchMemberKeyword,
			@RequestParam(defaultValue = "") String memberCategory,
			@RequestParam(defaultValue = "") String memberStatusCategory,
			@RequestParam(defaultValue = "1") int pageNum,
			HttpSession session, Model model, HttpServletResponse response) {
		// 관리자 페이지 접근 제한
		if (!isvalid(session, model, response)) return null;

		System.out.println("-------------------------------------------------------");
		System.out.println("searchMemberType : " + searchMemberType);
		System.out.println("searchMemberKeyword : " + searchMemberKeyword);
		System.out.println("memberCategory : " + memberCategory);
		System.out.println("memberStatusCategory : " + memberStatusCategory);
		System.out.println("-------------------------------------------------------");

		// 검색된 회원 목록의 수
		int listCount = service.adminMemberListCount(searchMemberType, searchMemberKeyword, memberCategory, memberStatusCategory);

		// 페이지네이션
		int listLimit = 10;	// 한 페이지에 출력될 글 수
		int startRow = (pageNum - 1) * listLimit;

		// 검색된 회원 목록의 수를 바탕으로 페이지네이션 생성
		int pageListLimit = 5;
		int maxPage = listCount / listLimit + (listCount % listLimit > 0 ? 1 : 0);
		int startPage = (pageNum - 1) / pageListLimit * pageListLimit + 1;
		int endPage = startPage + pageListLimit - 1;
		if(endPage > maxPage) {
			endPage = maxPage;
		}

		PageInfo pageInfo = new PageInfo(listCount, pageListLimit, maxPage, startPage, endPage);

		List<MemberVO> memberList = service.adminMemberList(searchMemberType, searchMemberKeyword, memberCategory, memberStatusCategory, startRow, listLimit);
		model.addAttribute("memberList", memberList);
		model.addAttribute("pageInfo", pageInfo);
		model.addAttribute("searchMemberType", searchMemberType);
		model.addAttribute("searchMemberKeyword", searchMemberKeyword);
		model.addAttribute("memberCategory", memberCategory);
		model.addAttribute("memberStatusCategory", memberStatusCategory);
		
		return "admin/admin_user";
	}
	
	// 관리자 페이지 - 회원 탈퇴
	@PostMapping("admin/user/withdraw/Pro")
	public String memberwithdrawPro(MemberVO member, HttpSession session, Model model, HttpServletResponse response) {
		// 관리자 페이지 접근 제한
		if (!isvalid(session, model, response)) return null;
		
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
	
	// 관리자 페이지 - 업체 목록 조회, 검색 기능, 페이지네이션
	@GetMapping("admin/company")
	public String companyList(
			@RequestParam(defaultValue = "") String searchCompanyType,
			@RequestParam(defaultValue = "") String searchCompanyKeyword,
			@RequestParam(defaultValue = "1") int pageNum,
			HttpSession session, Model model, HttpServletResponse response) {
		// 관리자 페이지 접근 제한
		if (!isvalid(session, model, response)) return null;
		
		// 검색된 업체 목록의 수
		int listCount = service.adminCompanyListCount(searchCompanyType, searchCompanyKeyword);

		// 페이지네이션
		int listLimit = 10;
		int startRow = (pageNum - 1) * listLimit;

		// 검색된 업체 목록의 수를 바탕으로 페이지네이션 생성
		int pageListLimit = 5;
		int maxPage = listCount / listLimit + (listCount % listLimit > 0 ? 1 : 0);
		int startPage = (pageNum - 1) / pageListLimit * pageListLimit + 1;
		int endPage = startPage + pageListLimit - 1;
		if(endPage > maxPage) {
			endPage = maxPage;
		}
		
		PageInfo pageInfo = new PageInfo(listCount, pageListLimit, maxPage, startPage, endPage);
				
		List<CompanyVO> companyList = service.adminCompanyList(searchCompanyType, searchCompanyKeyword, startRow, listLimit);
		model.addAttribute("companyList", companyList);
		model.addAttribute("pageInfo", pageInfo);
		model.addAttribute("searchCompanyType", searchCompanyType);
		model.addAttribute("searchCompanyKeyword", searchCompanyKeyword);
		
		return "admin/admin_company";
	}
	
	// 관리자 페이지 - 업체 목록 상세정보
	@GetMapping("admin/company/info")
	public String companyInfo(CompanyVO company, HttpSession session, Model model, HttpServletResponse response) {
		// 관리자 페이지 접근 제한
		if (!isvalid(session, model, response)) return null;
		
		company = service.adminCompanyInfo(company);
		model.addAttribute("company", company);
		
		return "admin/admin_company_info";
	}
	
	// 관리자 페이지 - 업체 목록 상세정보 수정
	@PostMapping("admin/company/info/pro")
	public String companyInfoModifyPro(CompanyVO company, HttpSession session, Model model, HttpServletResponse response) {
		// 관리자 페이지 접근 제한
		if (!isvalid(session, model, response)) return null;

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
		if (!isvalid(session, model, response)) return null;
		
		int updateCount = service.adminCompanyApprove(company);
		
		if(updateCount > 0) { // 성공 시
			return "redirect:/admin/company";
		} else { // 실패 시
			model.addAttribute("msg", "업체 승인 실패!");
			return "fail_back";
		}
	}
	
	// 관리자 페이지 - 신고 목록 조회, 페이지네이션
	@GetMapping("admin/report")
	public String reportList(
			@RequestParam(defaultValue = "1") int pageNum,
			HttpSession session, Model model, HttpServletResponse response) {
		// 관리자 페이지 접근 제한
		if (!isvalid(session, model, response)) return null;

		// 페이지네이션
		int listLimit = 10;
		int startRow = (pageNum - 1) * listLimit;

		int listCount = service.adminReportListCount();
		int pageListLimit = 5;
		int maxPage = listCount / listLimit + (listCount % listLimit > 0 ? 1 : 0);
		int startPage = (pageNum - 1) / pageListLimit * pageListLimit + 1;
		int endPage = startPage + pageListLimit - 1;
		if(endPage > maxPage) {
			endPage = maxPage;
		}
		
		PageInfo pageInfo = new PageInfo(listCount, pageListLimit, maxPage, startPage, endPage);
		
		List<ReportVO> reportList = service.adminReportList(startRow, listLimit);
		model.addAttribute("reportList", reportList);
		model.addAttribute("pageInfo", pageInfo);
		
		return "admin/admin_report";
	}

	// 관리자 페이지 - 신고 목록 상세정보
	@GetMapping("admin/report/detail")
	public String reportDetail(ReportVO report, HttpSession session, Model model, HttpServletResponse response) {
		// 관리자 페이지 접근 제한
		if (!isvalid(session, model, response)) return null;
		
		report = service.adminReportDetail(report);
		model.addAttribute("report", report);

		return "admin/admin_report_detail";
	}
	
	// 관리자 페이지 - 신고 승인/반려 처리
//	@PostMapping("admin/report/detail/Blind/Pro")
//	public String reportBlind(ReportVO report, HttpSession session, Model model, HttpServletResponse response) {
//		// 관리자 페이지 접근 제한
//		if (!isvalid(session, model, response)) return null;
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
	
	// 관리자 페이지 - 고객센터 : 공지사항 새 글 작성
	@GetMapping("admin/cs/notice/register")
	public String csNoticeRegister(HttpSession session, Model model, HttpServletResponse response) {
		// 관리자 페이지 접근 제한
		if (!isvalid(session, model, response)) return null;
		
		return "admin/admin_cs_notice_register";
	}

	// 관리자 페이지 - 고객센터 : 자주묻는질문 새 글 작성
	@GetMapping("admin/cs/faq/register")
	public String csFaqRegister(HttpSession session, Model model, HttpServletResponse response) {
		// 관리자 페이지 접근 제한
		if (!isvalid(session, model, response)) return null;
				
		return "admin/admin_cs_faq_register";
	}
	
	// 관리자 페이지 - 고객센터 : 공지사항, 자주묻는질문 새 글 등록
	@PostMapping("admin/cs/Register/pro")
	public String csNoticeFaqRegisterPro(CsVO cs, HttpSession session, Model model, HttpServletResponse response) {
		// 관리자 페이지 접근 제한
		if (!isvalid(session, model, response)) return null;
		
		int insertCount = service.adminCsNoticeFaqRegister(cs);
		String csRegisterUrl = "";
		if(insertCount > 0) {
			if(cs.getCs_board_category_sub() == 0) {		// 공지사항으로 작성할 경우
				csRegisterUrl = "admin/cs/notice";
			} else if(cs.getCs_board_category_sub() < 0) {	// 자주묻는질문으로 작성할 경우
				csRegisterUrl = "admin/cs/faq";	
			}
			return "redirect:/" + csRegisterUrl;
		} else {
			model.addAttribute("msg", "글 등록 실패!");
			return "fail_back";
		}
	}
	
	// 관리자 페이지 - 고객센터 : 공지사항 목록 조회
	@GetMapping("admin/cs/notice")
	public String csNotice(HttpSession session, Model model, HttpServletResponse response) {
		// 관리자 페이지 접근 제한
		if (!isvalid(session, model, response)) return null;
		
		List<CsVO> adminCsNoticeList = service.adminCsList(1);
		model.addAttribute("adminCsNoticeList", adminCsNoticeList);
		
		return "admin/admin_cs_notice";
	}
	
	// 관리자 페이지 - 고객센터 : 공지사항 글 수정 - 아직 안함
	@GetMapping("admin/cs/notice/modify")
	public String admin_cs_notice_modify(HttpSession session, Model model, HttpServletResponse response) {
		// 관리자 페이지 접근 제한
		if (!isvalid(session, model, response)) return null;
		
		
		return "admin/admin_cs_notice_modify";
	}

	// 관리자 페이지 - 고객센터 : 자주묻는질문 목록 조회
	@GetMapping("admin/cs/faq")
	public String admin_cs_faq(HttpSession session, Model model, HttpServletResponse response) {
		// 관리자 페이지 접근 제한
		if (!isvalid(session, model, response)) return null;
		
		List<CsVO> adminCsFaqList = service.adminCsList(2);
		model.addAttribute("adminCsFaqList", adminCsFaqList);
		
		System.out.println("자주묻는질문 : " + adminCsFaqList);
		
		return "admin/admin_cs_faq";
	}
	
	// ※ 고객센터 view 페이지는 CsController에서 담당
	
	
	
	

	
	
	// 관리자 페이지 - 고객센터 : 자주묻는질문 글 수정
	@GetMapping("admin/cs/faq/modify")
	public String admin_cs_faq_modify(HttpSession session, Model model, HttpServletResponse response) {
		// 관리자 페이지 접근 제한
		if (!isvalid(session, model, response)) return null;
				
		return "admin/admin_cs_faq_modify";
	}
	
	// 관리자 페이지 - 고객센터 : 1:1 문의 조회 - 했음
	@GetMapping("admin/cs/qna")
	public String admin_cs_qna(HttpSession session, Model model, HttpServletResponse response) {
		// 관리자 페이지 접근 제한
		if (!isvalid(session, model, response)) return null;
		
		List<CsVO> adminCsQnaList = service.adminCsList(3);
		model.addAttribute("adminCsQnaList", adminCsQnaList);

		System.out.println("1:1 문의 : " + adminCsQnaList);
		
		return "admin/admin_cs_qna";
	}
	
	@GetMapping("admin/cs/qna/answer/register")
	public String admin_cs_qna_answer_register(HttpSession session, Model model, HttpServletResponse response) {
		// 관리자 페이지 접근 제한
		if (!isvalid(session, model, response)) return null;
				
		return "admin/admin_cs_qna_answer_register";
	}
	
	@GetMapping("admin/cs/qna/answer/view")
	public String admin_cs_qna_answer_view(HttpSession session, Model model, HttpServletResponse response) {
		// 관리자 페이지 접근 제한
		if (!isvalid(session, model, response)) return null;
				
		return "admin/admin_cs_qna_answer_view";
	}
	
	@GetMapping("admin/cs/qna/answer/modify")
	public String admin_cs_qna_answer_modify(HttpSession session, Model model, HttpServletResponse response) {
		// 관리자 페이지 접근 제한
		if (!isvalid(session, model, response)) return null;
				
		return "admin/admin_cs_qna_answer_modify";
	}
	
	@GetMapping("admin/cs/qna/question")
	public String admin_cs_qna_question(HttpSession session, Model model, HttpServletResponse response) {
		// 관리자 페이지 접근 제한
		if (!isvalid(session, model, response)) return null;
				
		return "admin/admin_cs_qna_question";
	}
	
}
