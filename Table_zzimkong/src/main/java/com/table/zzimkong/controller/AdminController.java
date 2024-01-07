package com.table.zzimkong.controller;

import java.io.Console;
import java.io.File;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.sql.Date;
import java.time.LocalDate;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.List;
import java.util.UUID;

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
import org.springframework.web.multipart.MultipartFile;

import com.table.zzimkong.service.AdminService;
import com.table.zzimkong.service.CsService;
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
	@Autowired
	private CsService csService;
	
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

	/**/
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
	public String csNoticeFaqRegisterPro(CsVO board, HttpSession session, Model model, HttpServletResponse response) {
		// 관리자 페이지 접근 제한
		if (!isvalid(session, model, response)) return null;
		
		String uploadDir = "/resources/upload"; // 가상의 경로(이클립스 프로젝트 상에 생성한 경로)
		String saveDir = session.getServletContext().getRealPath(uploadDir); // 또는 
		String subDir = "";
		LocalDate now = LocalDate.now();
		DateTimeFormatter dtf = DateTimeFormatter.ofPattern("yyyy/MM/dd");
		subDir = now.format(dtf);
		saveDir += File.separator + subDir; // File.separator 대신 / 또는 \ 지정도 가능
		try {
			Path path = Paths.get(saveDir); // 파라미터로 업로드 경로 전달
			Files.createDirectories(path); // 파라미터로 Path 객체 전달
		} catch (IOException e) {
			e.printStackTrace();
		}
		MultipartFile mFile1 = board.getMFile1();
		MultipartFile mFile2 = board.getMFile2();
		MultipartFile mFile3 = board.getMFile3();
		MultipartFile mFile4 = board.getMFile4();
		MultipartFile mFile5 = board.getMFile5();

		board.setCs_board_img_1("");
		board.setCs_board_img_2("");
		board.setCs_board_img_3("");
		board.setCs_board_img_4("");
		board.setCs_board_img_5("");
		
		String fileName1 = UUID.randomUUID().toString().substring(0, 8) + "_" + mFile1.getOriginalFilename();
		String fileName2 = UUID.randomUUID().toString().substring(0, 8) + "_" + mFile2.getOriginalFilename();
		String fileName3 = UUID.randomUUID().toString().substring(0, 8) + "_" + mFile3.getOriginalFilename();
		String fileName4 = UUID.randomUUID().toString().substring(0, 8) + "_" + mFile4.getOriginalFilename();
		String fileName5 = UUID.randomUUID().toString().substring(0, 8) + "_" + mFile5.getOriginalFilename();
		
		if(!mFile1.getOriginalFilename().equals("")) {
			board.setCs_board_img_1(subDir + "/" + fileName1);
		}
		
		if(!mFile2.getOriginalFilename().equals("")) {
			board.setCs_board_img_2(subDir + "/" + fileName2);
		}
		
		if(!mFile3.getOriginalFilename().equals("")) {
			board.setCs_board_img_3(subDir + "/" + fileName3);
		}
		
		if(!mFile4.getOriginalFilename().equals("")) {
			board.setCs_board_img_4(subDir + "/" + fileName4);
		}
		if(!mFile5.getOriginalFilename().equals("")) {
			board.setCs_board_img_5(subDir + "/" + fileName5);
		}
		
		System.out.println(board);
		int insertCount = service.adminCsNoticeFaqRegister(board);
		
		
		if(insertCount > 0) {
			try {
				if(!mFile1.getOriginalFilename().equals("")) {
					mFile1.transferTo(new File(saveDir, fileName1));
				}
				
				if(!mFile2.getOriginalFilename().equals("")) {
					mFile2.transferTo(new File(saveDir, fileName2));
				}
				
				if(!mFile3.getOriginalFilename().equals("")) {
					mFile3.transferTo(new File(saveDir, fileName3));
				}
				if(!mFile4.getOriginalFilename().equals("")) {
					mFile4.transferTo(new File(saveDir, fileName4));
				}
				if(!mFile5.getOriginalFilename().equals("")) {
					mFile5.transferTo(new File(saveDir, fileName5));
				}
			} catch (IllegalStateException e) {
				e.printStackTrace();
			} catch (IOException e) {
				e.printStackTrace();
			}
			model.addAttribute("msg", "글이 등록되었습니다.");
			return "popup_close";
		}else {
			model.addAttribute("msg", "글 작성 실패!");
			return "fail_back";
		}
	}
	
	// 관리자 페이지 - 고객센터 : 공지사항 목록 조회
	@GetMapping("admin/cs/notice")
	public String csNotice(HttpSession session, Model model, HttpServletResponse response, CsVO board) {
		// 관리자 페이지 접근 제한
		if (!isvalid(session, model, response)) return null;
		
		List<CsVO> adminCsNoticeList = service.adminCsList(board, 1);
		model.addAttribute("adminCsNoticeList", adminCsNoticeList);
		
		return "admin/admin_cs_notice";
	}
	
	// 관리자 페이지 - 고객센터 : 공지사항 글 수정 - 아직 안함
	@GetMapping("admin/cs/notice/modify")
	public String admin_cs_notice_modify(CsVO board, HttpSession session, Model model, HttpServletResponse response) {
		// 관리자 페이지 접근 제한
		if (!isvalid(session, model, response)) return null;
		
		board = csService.getBoardDetail(board);
		
		model.addAttribute("board", board);
		
		return "admin/admin_cs_notice_modify";
	}
	
	@PostMapping("admin/cs/notice/modifyPro")
	public String admin_cs_notice_modifyPro(CsVO board, HttpSession session, Model model, HttpServletResponse response) {
		// 관리자 페이지 접근 제한
		if (!isvalid(session, model, response)) return null;
		
		String uploadDir = "/resources/upload"; // 가상의 경로(이클립스 프로젝트 상에 생성한 경로)
		String saveDir = session.getServletContext().getRealPath(uploadDir); // 또는 
		
		String subDir = "";
		LocalDate now = LocalDate.now();
		DateTimeFormatter dtf = DateTimeFormatter.ofPattern("yyyy/MM/dd");
		subDir = now.format(dtf);
		
		saveDir += File.separator + subDir;

		try {
			Path path = Paths.get(saveDir); // 파라미터로 업로드 경로 전달
			Files.createDirectories(path); // 파라미터로 Path 객체 전달
		} catch (IOException e) {
			e.printStackTrace();
		}
		// -------------------
		System.out.println(board);
		
		
		MultipartFile mFile1 = board.getMFile1();
		MultipartFile mFile2 = board.getMFile2();
		MultipartFile mFile3 = board.getMFile3();
		MultipartFile mFile4 = board.getMFile4();
		MultipartFile mFile5 = board.getMFile5();
		
		board.setCs_board_img_1("");
		board.setCs_board_img_2("");
		board.setCs_board_img_3("");
		board.setCs_board_img_4("");
		board.setCs_board_img_5("");
		
		String fileName1 = "";
		String fileName2 = "";
		String fileName3 = "";
		String fileName4 = "";
		String fileName5 = "";
		
		if(mFile1 != null && !mFile1.getOriginalFilename().equals("")) {
			System.out.println("원본파일명1 : " + mFile1.getOriginalFilename());
			fileName1 = UUID.randomUUID().toString().substring(0, 8) + "_" + mFile1.getOriginalFilename();
			board.setCs_board_img_1(subDir + "/" + fileName1);
		}
		
		if(mFile2 != null && !mFile2.getOriginalFilename().equals("")) {
			System.out.println("원본파일명2 : " + mFile2.getOriginalFilename());
			fileName2 = UUID.randomUUID().toString().substring(0, 8) + "_" + mFile2.getOriginalFilename();
			board.setCs_board_img_2(subDir + "/" + fileName2);
		}
		
		if(mFile3 != null && !mFile3.getOriginalFilename().equals("")) {
			System.out.println("원본파일명3 : " + mFile3.getOriginalFilename());
			fileName3 = UUID.randomUUID().toString().substring(0, 8) + "_" + mFile3.getOriginalFilename();
			board.setCs_board_img_3(subDir + "/" + fileName3);
		}
		
		if(mFile4 != null && !mFile4.getOriginalFilename().equals("")) {
			System.out.println("원본파일명3 : " + mFile4.getOriginalFilename());
			fileName4 = UUID.randomUUID().toString().substring(0, 8) + "_" + mFile4.getOriginalFilename();
			board.setCs_board_img_4(subDir + "/" + fileName4);
		}
		
		if(mFile5 != null && !mFile5.getOriginalFilename().equals("")) {
			System.out.println("원본파일명3 : " + mFile5.getOriginalFilename());
			fileName5 = UUID.randomUUID().toString().substring(0, 8) + "_" + mFile5.getOriginalFilename();
			board.setCs_board_img_5(subDir + "/" + fileName5);
		}
		
		int updateCount = service.modifyNoticeAndFaqBoard(board);
		
		if(updateCount > 0) {
			try {
				// 파일명이 존재하는 파일만 이동 처리 작업 수행
				if(!board.getCs_board_img_1().equals("")) {
					mFile1.transferTo(new File(saveDir, fileName1));
				}
				
				if(!board.getCs_board_img_2().equals("")) {
					mFile2.transferTo(new File(saveDir, fileName2));
				}
				
				if(!board.getCs_board_img_3().equals("")) {
					mFile3.transferTo(new File(saveDir, fileName3));
				}
				
				if(!board.getCs_board_img_4().equals("")) {
					mFile4.transferTo(new File(saveDir, fileName3));
				}
				
				if(!board.getCs_board_img_5().equals("")) {
					mFile5.transferTo(new File(saveDir, fileName3));
				}
				model.addAttribute("msg", "수정이 완료되었습니다.");
				return "popup_close";
			} catch (IllegalStateException e) {
				e.printStackTrace();
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
		
		model.addAttribute("msg", "수정에 실패하였습니다.");
		return"fail_back";
	}

	// 관리자 페이지 - 고객센터 : 자주묻는질문 목록 조회
	@GetMapping("admin/cs/faq")
	public String admin_cs_faq(HttpSession session, Model model, HttpServletResponse response, CsVO board) {
		// 관리자 페이지 접근 제한
		if (!isvalid(session, model, response)) return null;
		
		List<CsVO> adminCsFaqList = service.adminCsList(board, 2);
		model.addAttribute("adminCsFaqList", adminCsFaqList);
		
		System.out.println("자주묻는질문 : " + adminCsFaqList);
		
		return "admin/admin_cs_faq";
	}
	
	// ※ 고객센터 view 페이지는 CsController에서 담당
	
	
	// 관리자 페이지 - 고객센터 : 자주묻는질문 글 수정
	@GetMapping("admin/cs/faq/modify")
	public String admin_cs_faq_modify(CsVO board,HttpSession session, Model model, HttpServletResponse response) {
		// 관리자 페이지 접근 제한
		if (!isvalid(session, model, response)) return null;
				
		
		board = csService.getBoardDetail(board);
		
		model.addAttribute("board", board);
		
		return "admin/admin_cs_faq_modify";
	}
	
	@GetMapping("admin/cs/delete")
	public String admin_cs_delete(CsVO board,HttpSession session, Model model, HttpServletResponse response) {
		// 관리자 페이지 접근 제한
		if (!isvalid(session, model, response)) return null;
		
		board = csService.getBoardDetail(board);
		
		int deleteCount = csService.removeBoard(board);
		
		if(deleteCount > 0) {
			model.addAttribute("msg", "삭제되었습니다!");
			return "popup_close";
		}else {
			model.addAttribute("msg", "삭제 실패!");
			return "fail_back";
		}
				
	}
	
	// 관리자 페이지 - 고객센터 : 1:1 문의 조회 - 했음
	@GetMapping("admin/cs/qna")
	public String admin_cs_qna(HttpSession session, Model model, HttpServletResponse response, CsVO board) {
		// 관리자 페이지 접근 제한
		if (!isvalid(session, model, response)) return null;
		
		List<CsVO> adminCsQnaList = service.adminCsList(board, 3);
		model.addAttribute("adminCsQnaList", adminCsQnaList);

		System.out.println("1:1 문의 : " + adminCsQnaList);
		
		return "admin/admin_cs_qna";
	}
	
	@PostMapping("admin/cs/qna/answer/register")
	public String admin_cs_qna_answer_register(HttpSession session, Model model, HttpServletResponse response, CsVO board) {
		// 관리자 페이지 접근 제한
		if (!isvalid(session, model, response)) return null;
		
		board = csService.getBoardDetail(board);
		
		model.addAttribute("board", board);
				
		return "admin/admin_cs_qna_answer_register";
	}
	
	@PostMapping("admin/cs/qna/answer/registerPro")
	public String admin_cs_qna_answer_registerPro(HttpSession session, Model model, HttpServletResponse response, CsVO board) {
		// 관리자 페이지 접근 제한
		if (!isvalid(session, model, response)) return null;
		String uploadDir = "/resources/upload"; // 가상의 경로(이클립스 프로젝트 상에 생성한 경로)
		String saveDir = session.getServletContext().getRealPath(uploadDir); // 또는 
		String subDir = "";
		LocalDate now = LocalDate.now();
		DateTimeFormatter dtf = DateTimeFormatter.ofPattern("yyyy/MM/dd");
		subDir = now.format(dtf);
		saveDir += File.separator + subDir; // File.separator 대신 / 또는 \ 지정도 가능
		try {
			Path path = Paths.get(saveDir); // 파라미터로 업로드 경로 전달
			Files.createDirectories(path); // 파라미터로 Path 객체 전달
		} catch (IOException e) {
			e.printStackTrace();
		}
		MultipartFile mFile1 = board.getMFile1();
		MultipartFile mFile2 = board.getMFile2();
		MultipartFile mFile3 = board.getMFile3();
		MultipartFile mFile4 = board.getMFile4();
		MultipartFile mFile5 = board.getMFile5();

		board.setCs_board_img_1("");
		board.setCs_board_img_2("");
		board.setCs_board_img_3("");
		board.setCs_board_img_4("");
		board.setCs_board_img_5("");
		
		String fileName1 = UUID.randomUUID().toString().substring(0, 8) + "_" + mFile1.getOriginalFilename();
		String fileName2 = UUID.randomUUID().toString().substring(0, 8) + "_" + mFile2.getOriginalFilename();
		String fileName3 = UUID.randomUUID().toString().substring(0, 8) + "_" + mFile3.getOriginalFilename();
		String fileName4 = UUID.randomUUID().toString().substring(0, 8) + "_" + mFile4.getOriginalFilename();
		String fileName5 = UUID.randomUUID().toString().substring(0, 8) + "_" + mFile5.getOriginalFilename();
		
		if(!mFile1.getOriginalFilename().equals("")) {
			board.setCs_board_img_1(subDir + "/" + fileName1);
		}
		
		if(!mFile2.getOriginalFilename().equals("")) {
			board.setCs_board_img_2(subDir + "/" + fileName2);
		}
		
		if(!mFile3.getOriginalFilename().equals("")) {
			board.setCs_board_img_3(subDir + "/" + fileName3);
		}
		
		if(!mFile4.getOriginalFilename().equals("")) {
			board.setCs_board_img_4(subDir + "/" + fileName4);
		}
		if(!mFile5.getOriginalFilename().equals("")) {
			board.setCs_board_img_5(subDir + "/" + fileName5);
		}
		
		System.out.println(board);
		int insertCount = service.registBoardReply(board);
		
		if(insertCount > 0) {
			try {
				if(!mFile1.getOriginalFilename().equals("")) {
					mFile1.transferTo(new File(saveDir, fileName1));
				}
				
				if(!mFile2.getOriginalFilename().equals("")) {
					mFile2.transferTo(new File(saveDir, fileName2));
				}
				
				if(!mFile3.getOriginalFilename().equals("")) {
					mFile3.transferTo(new File(saveDir, fileName3));
				}
				if(!mFile4.getOriginalFilename().equals("")) {
					mFile4.transferTo(new File(saveDir, fileName4));
				}
				if(!mFile5.getOriginalFilename().equals("")) {
					mFile5.transferTo(new File(saveDir, fileName5));
				}
			} catch (IllegalStateException e) {
				e.printStackTrace();
			} catch (IOException e) {
				e.printStackTrace();
			}
			model.addAttribute("msg", "댓글이 등록되었습니다.");
			return "popup_close";
		}else {
			model.addAttribute("msg", "댓글 작성 실패!");
			return "fail_back";
		}
	}
	
	@GetMapping("admin/cs/qna/answer/view")
	public String admin_cs_qna_answer_view(HttpSession session, Model model, HttpServletResponse response, CsVO board) {
		// 관리자 페이지 접근 제한
		if (!isvalid(session, model, response)) return null;
		
		CsVO replyBoard = csService.getBoardDetail(board);
		
		board.setCs_board_num(replyBoard.getCs_board_re_ref());
		
		board = csService.getBoardDetail(board);
		
		model.addAttribute("board", board);
		model.addAttribute("replyBoard", replyBoard);
				
		return "admin/admin_cs_qna_answer_view";
	}
	
	@GetMapping("admin/cs/qna/answer/modify")
	public String admin_cs_qna_answer_modify(HttpSession session, Model model, HttpServletResponse response, CsVO board) {
		// 관리자 페이지 접근 제한
		if (!isvalid(session, model, response)) return null;
		
		CsVO replyBoard = csService.getBoardDetail(board);
		
		board.setCs_board_num(replyBoard.getCs_board_re_ref());
		
		board = csService.getBoardDetail(board);
		
		model.addAttribute("board", board);
		model.addAttribute("replyBoard", replyBoard);
			
		return "admin/admin_cs_qna_answer_modify";
	}
	
	@PostMapping("admin/cs/qna/answer/modifyPro")
	public String admin_cs_qna_answer_modifyPro(HttpSession session, Model model, HttpServletResponse response, CsVO board) {
		// 관리자 페이지 접근 제한
		if (!isvalid(session, model, response)) return null;
		
		String uploadDir = "/resources/upload"; // 가상의 경로(이클립스 프로젝트 상에 생성한 경로)
		String saveDir = session.getServletContext().getRealPath(uploadDir); // 또는 
		
		String subDir = "";
		LocalDate now = LocalDate.now();
		DateTimeFormatter dtf = DateTimeFormatter.ofPattern("yyyy/MM/dd");
		subDir = now.format(dtf);
		
		saveDir += File.separator + subDir;

		try {
			Path path = Paths.get(saveDir); // 파라미터로 업로드 경로 전달
			Files.createDirectories(path); // 파라미터로 Path 객체 전달
		} catch (IOException e) {
			e.printStackTrace();
		}
		// -------------------
		System.out.println(board);
		
		
		MultipartFile mFile1 = board.getMFile1();
		MultipartFile mFile2 = board.getMFile2();
		MultipartFile mFile3 = board.getMFile3();
		MultipartFile mFile4 = board.getMFile4();
		MultipartFile mFile5 = board.getMFile5();
		
		board.setCs_board_img_1("");
		board.setCs_board_img_2("");
		board.setCs_board_img_3("");
		board.setCs_board_img_4("");
		board.setCs_board_img_5("");
		
		String fileName1 = "";
		String fileName2 = "";
		String fileName3 = "";
		String fileName4 = "";
		String fileName5 = "";
		
		if(mFile1 != null && !mFile1.getOriginalFilename().equals("")) {
			System.out.println("원본파일명1 : " + mFile1.getOriginalFilename());
			fileName1 = UUID.randomUUID().toString().substring(0, 8) + "_" + mFile1.getOriginalFilename();
			board.setCs_board_img_1(subDir + "/" + fileName1);
		}
		
		if(mFile2 != null && !mFile2.getOriginalFilename().equals("")) {
			System.out.println("원본파일명2 : " + mFile2.getOriginalFilename());
			fileName2 = UUID.randomUUID().toString().substring(0, 8) + "_" + mFile2.getOriginalFilename();
			board.setCs_board_img_2(subDir + "/" + fileName2);
		}
		
		if(mFile3 != null && !mFile3.getOriginalFilename().equals("")) {
			System.out.println("원본파일명3 : " + mFile3.getOriginalFilename());
			fileName3 = UUID.randomUUID().toString().substring(0, 8) + "_" + mFile3.getOriginalFilename();
			board.setCs_board_img_3(subDir + "/" + fileName3);
		}
		
		if(mFile4 != null && !mFile4.getOriginalFilename().equals("")) {
			System.out.println("원본파일명3 : " + mFile4.getOriginalFilename());
			fileName4 = UUID.randomUUID().toString().substring(0, 8) + "_" + mFile4.getOriginalFilename();
			board.setCs_board_img_4(subDir + "/" + fileName4);
		}
		
		if(mFile5 != null && !mFile5.getOriginalFilename().equals("")) {
			System.out.println("원본파일명3 : " + mFile5.getOriginalFilename());
			fileName5 = UUID.randomUUID().toString().substring(0, 8) + "_" + mFile5.getOriginalFilename();
			board.setCs_board_img_5(subDir + "/" + fileName5);
		}
		
		int updateCount = service.modifyNoticeAndFaqBoard(board);
		
		if(updateCount > 0) {
			try {
				// 파일명이 존재하는 파일만 이동 처리 작업 수행
				if(!board.getCs_board_img_1().equals("")) {
					mFile1.transferTo(new File(saveDir, fileName1));
				}
				
				if(!board.getCs_board_img_2().equals("")) {
					mFile2.transferTo(new File(saveDir, fileName2));
				}
				
				if(!board.getCs_board_img_3().equals("")) {
					mFile3.transferTo(new File(saveDir, fileName3));
				}
				
				if(!board.getCs_board_img_4().equals("")) {
					mFile4.transferTo(new File(saveDir, fileName3));
				}
				
				if(!board.getCs_board_img_5().equals("")) {
					mFile5.transferTo(new File(saveDir, fileName3));
				}
				model.addAttribute("msg", "수정이 완료되었습니다.");
				return "popup_close";
			} catch (IllegalStateException e) {
				e.printStackTrace();
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
		
		model.addAttribute("msg", "수정에 실패하였습니다.");
		return"fail_back";
	}
	
	@GetMapping("admin/cs/qna/question")
	public String admin_cs_qna_question(HttpSession session, Model model, HttpServletResponse response, CsVO board) {
		// 관리자 페이지 접근 제한
		if (!isvalid(session, model, response)) return null;
		
		board = csService.getBoardDetail(board);
		
		model.addAttribute("board", board);
				
		return "admin/admin_cs_qna_question";
	}
	
}
