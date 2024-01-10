package com.table.zzimkong.controller;


import java.io.File;

import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.JSONObject;
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
		model.addAttribute("msg", "잘못된 접근입니다!");
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
	
	// 관리자 페이지 - 오늘 할 일 : 문의 답변 대기, 입점 승인 대기, 신고 처리 대기
	//               - 사이트 현황 : 오늘 가입자 수, 오늘 예약 수
	//               - 차트 : 가입자 현황(시간, 날짜별), 예약자 현황(시간, 날짜별)
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
	// 차트 : 시간별 가입자 현황
	@ResponseBody
	@GetMapping("admin/mainDataMemberTimeCount")
	public AdminMainVO adminMainDataMemberTimeCount(HttpSession session, Model model, HttpServletResponse response) {
		// 관리자 페이지 접근 제한
		if (!isvalid(session, model, response)) return null;
		
		AdminMainVO adminMain = service.adminMain();
		
		return adminMain;
	}
	// 차트 : 날짜별 가입자 현황
	@ResponseBody
	@GetMapping("admin/mainDataMemberDateCount")
	public AdminMainVO adminMainDataMemberDateCount(HttpSession session, Model model, HttpServletResponse response) {
		// 관리자 페이지 접근 제한
		if (!isvalid(session, model, response)) return null;
		
		AdminMainVO adminMain = service.adminMain();
		
		return adminMain;
	}
	// 차트 : 날짜별 예약자 현황
	@ResponseBody
	@GetMapping("admin/mainDataHour")
	public AdminMainVO adminMainDataHour(HttpSession session, Model model, HttpServletResponse response) {
		// 관리자 페이지 접근 제한
		if (!isvalid(session, model, response)) return null;
		
		AdminMainVO adminMain = service.adminMain();
		
		return adminMain;
	}
	// 차트 : 시간별 예약자 현황
	@ResponseBody
	@GetMapping("admin/mainData")
	public AdminMainVO adminMainData(HttpSession session, Model model, HttpServletResponse response) {
		// 관리자 페이지 접근 제한
		if (!isvalid(session, model, response)) return null;
		
		AdminMainVO adminMain = service.adminMain();
		
		return adminMain;
	}
	
	// 관리자 페이지 - 회원 목록 조회 (페이지네이션, 검색 기능, 카테고리 필터)
	//               + 검색 결과, 카테고리 필터링에 따른 페이지네이션의 범위 재조정
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
	
	// 관리자 페이지 - 회원 목록 상세정보
	@GetMapping("admin/user/info")
	public String userInfo(MemberVO member, HttpSession session, Model model, HttpServletResponse response) {
		// 관리자 페이지 접근 제한
		if (!isvalid(session, model, response)) return null;
		
		member = service.adminMemberInfo(member);
		model.addAttribute("member", member);
		
		return "admin/admin_user_info";
	}
	
	// 관리자 페이지 - 회원 탈퇴
	@PostMapping("admin/user/withdraw/pro")
	public String memberwithdrawPro(MemberVO member, HttpSession session, Model model, HttpServletResponse response) {
		// 관리자 페이지 접근 제한
		if (!isvalid(session, model, response)) return null;
		
		int updateCount = service.adminMemberWithdraw(member);

		if(updateCount > 0) { // 성공 시
			model.addAttribute("msg", "회원 탈퇴 처리되었습니다!");
			model.addAttribute("targetURL", "/zzimkong/admin/user");
			return "forward";
		} else { // 실패 시
			model.addAttribute("msg", "회원 탈퇴 처리 실패!");
			return "fail_back";
		}
	}
	
	// 관리자 페이지 - 업체 목록 조회 (페이지네이션, 검색 기능, 카테고리 필터)
	//               + 검색 결과, 카테고리 필터링에 따른 페이지네이션의 범위 재조정
	@GetMapping("admin/company")
	public String companyList(
			@RequestParam(defaultValue = "") String searchCompanyType,
			@RequestParam(defaultValue = "") String searchCompanyKeyword,
			@RequestParam(defaultValue = "") String adGradeCategory,
            @RequestParam(defaultValue = "") String companyStatusCategory,
			@RequestParam(defaultValue = "1") int pageNum,
			HttpSession session, Model model, HttpServletResponse response) {
		// 관리자 페이지 접근 제한
		if (!isvalid(session, model, response)) return null;
		
		// 검색된 업체 목록의 수
		int listCount = service.adminCompanyListCount(searchCompanyType, searchCompanyKeyword, adGradeCategory, companyStatusCategory);

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
				
		List<CompanyVO> companyList = service.adminCompanyList(searchCompanyType, searchCompanyKeyword, adGradeCategory, companyStatusCategory, startRow, listLimit);
		
		model.addAttribute("companyList", companyList);
		model.addAttribute("pageInfo", pageInfo);
		model.addAttribute("searchCompanyType", searchCompanyType);
		model.addAttribute("searchCompanyKeyword", searchCompanyKeyword);
		model.addAttribute("adGradeCategory", adGradeCategory);
		model.addAttribute("companyStatusCategory", companyStatusCategory);
		
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
			model.addAttribute("msg", "업체 정보가 수정되었습니다!");
			model.addAttribute("targetURL", "/zzimkong/admin/company/info?com_id=" + company.getCom_id());
			return "forward";
		} else { // 실패 시
			model.addAttribute("msg", "업체 정보 수정 실패!");
			return "fail_back";
		}
	}
	
	// 관리자 페이지 - 업체 승인/거부 처리
	@PostMapping("admin/company/register/pro")
	public String companyRegisterPro(
			CompanyVO company,
			@RequestParam("com_id") String com_id,
			@RequestParam("company_open_register") String company_open_register,
			HttpSession session, Model model, HttpServletResponse response) {
		// 관리자 페이지 접근 제한
		if (!isvalid(session, model, response)) return null;
		
		// 서버로 전송할 때마다 기존값에 추가됨을 방지
		company_open_register = company_open_register.replace(",", "");
		// 수정된 company_open_register 값을 company 객체에 다시 설정
		company.setCompany_open_register(company_open_register);

		int updateCount = service.adminCompanyRegister(company);
		
		if(updateCount > 0) { // 성공 시
			if(company_open_register.equals("company_oepn_ok")) {			// 입점 승인
				model.addAttribute("msg", "입점이 승인되었습니다!");
			} else if(company_open_register.equals("company_oepn_no")) {	// 입점 거부
				model.addAttribute("msg", "입점이 거부되었습니다!");				
			}
			model.addAttribute("targetURL", "/zzimkong/admin/company");
			return "forward";
		} else { // 실패 시
			model.addAttribute("msg", "입점 처리 실패!");
			return "fail_back";
		}
	}
	
	// 관리자 페이지 - 신고 목록 조회 (페이지네이션, 카테고리 필터)
	//               + 카테고리 필터링에 따른 페이지네이션의 범위 재조정
	@GetMapping("admin/report")
	public String reportList(
			@RequestParam(defaultValue = "") String reportCategory,
			@RequestParam(defaultValue = "") String reportStatusCategory,
			@RequestParam(defaultValue = "1") int pageNum,
			HttpSession session, Model model, HttpServletResponse response) {
		// 관리자 페이지 접근 제한
		if (!isvalid(session, model, response)) return null;

		// 페이지네이션
		int listLimit = 10;
		int startRow = (pageNum - 1) * listLimit;

		int listCount = service.adminReportListCount(reportCategory, reportStatusCategory);
		
		// 페이지네이션
		int pageListLimit = 10;
		int maxPage = listCount / listLimit + (listCount % listLimit > 0 ? 1 : 0);
		int startPage = (pageNum - 1) / pageListLimit * pageListLimit + 1;
		int endPage = startPage + pageListLimit - 1;
		if(endPage > maxPage) {
			endPage = maxPage;
		}
		
		PageInfo pageInfo = new PageInfo(listCount, pageListLimit, maxPage, startPage, endPage);
		
		List<ReportVO> reportList = service.adminReportList(reportCategory, reportStatusCategory, startRow, listLimit);
		
		model.addAttribute("reportList", reportList);
		model.addAttribute("pageInfo", pageInfo);
		model.addAttribute("reportCategory", reportCategory);
		model.addAttribute("reportStatusCategory", reportStatusCategory);
		
		return "admin/admin_report";
	}

	// 관리자 페이지 - 신고 목록 상세정보
	@GetMapping("admin/report/detail")
	public String reportDetail(ReportVO report, HttpSession session, Model model, HttpServletResponse response, Map<String, Object>map) {
		// 관리자 페이지 접근 제한
		if (!isvalid(session, model, response)) return null;
		
		map = service.adminReportDetail(report);
		
		model.addAttribute("report", map);

		return "admin/admin_report_detail";
	}
	
	// 관리자 페이지 - 신고 승인/반려 처리
	@PostMapping("admin/report/detail/register/pro")
	public String reportRegister(
			ReportVO report,
			@RequestParam("report_num") String report_num,
			@RequestParam("report_approve_register") String report_approve_register,
			HttpSession session, Model model, HttpServletResponse response) {
		// 관리자 페이지 접근 제한
		if (!isvalid(session, model, response)) return null;
		
		int updateCount = service.adminReportRegister(report);
		
		if(updateCount > 0) { // 성공 시
			if (report_approve_register.equals("report_approve_ok")) {		// 신고 승인
				model.addAttribute("msg", "신고가 승인되었습니다!");
			} else if(report_approve_register.equals("report_approve_no")) { // 신고 반려
				model.addAttribute("msg", "신고가 반려되었습니다!");
			}
			model.addAttribute("targetURL", "/zzimkong/admin/report/detail?report_num=" + report_num);
			return "forward";
		} else { // 실패 시
			model.addAttribute("msg", "신고 처리 실패!");
			return "fail_back";
		}
	}
	
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
	
	// 관리자 페이지 - 고객센터 : 공지사항 글 수정
	@GetMapping("admin/cs/notice/modify")
	public String adminCsNoticeModify(CsVO board, HttpSession session, Model model, HttpServletResponse response) {
		// 관리자 페이지 접근 제한
		if (!isvalid(session, model, response)) return null;
		
		board = csService.getBoardDetail(board);
		
		model.addAttribute("board", board);
		
		return "admin/admin_cs_notice_modify";
	}
	
	// 관리자 페이지 - 고객센터 : 공지사항 글 등록
	@PostMapping("admin/cs/notice/modifyPro")
	public String adminCsNoticeModifyPro(CsVO board, HttpSession session, Model model, HttpServletResponse response) {
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
	public String adminCsFaq(HttpSession session, Model model, HttpServletResponse response, CsVO board) {
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
	public String adminCsFaqModify(CsVO board,HttpSession session, Model model, HttpServletResponse response) {
		// 관리자 페이지 접근 제한
		if (!isvalid(session, model, response)) return null;
		
		board = csService.getBoardDetail(board);
		
		model.addAttribute("board", board);
		
		return "admin/admin_cs_faq_modify";
	}
	
	// 관리자 페이지 - 고객센터 : 글 삭제
	@GetMapping("admin/cs/delete")
	public String adminCsDelete(CsVO board,HttpSession session, Model model, HttpServletResponse response) {
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
	
	// 관리자 페이지 - 고객센터 : 1:1 문의 조회
	@GetMapping("admin/cs/qna")
	public String adminCsQna(HttpSession session, Model model, HttpServletResponse response, CsVO board) {
		// 관리자 페이지 접근 제한
		if (!isvalid(session, model, response)) return null;
		
		List<CsVO> adminCsQnaList = service.adminCsList(board, 3);
		model.addAttribute("adminCsQnaList", adminCsQnaList);

		System.out.println("1:1 문의 : " + adminCsQnaList);
		
		return "admin/admin_cs_qna";
	}
	
	// 관리자 페이지 - 고객센터 : 1:1 문의 새 글 등록
	@PostMapping("admin/cs/qna/answer/register")
	public String adminCsQnaAnswerRegister(HttpSession session, Model model, HttpServletResponse response, CsVO board) {
		// 관리자 페이지 접근 제한
		if (!isvalid(session, model, response)) return null;
		
		board = csService.getBoardDetail(board);
		
		model.addAttribute("board", board);
				
		return "admin/admin_cs_qna_answer_register";
	}
	
	// 관리자 페이지 - 고객센터 : 1:1 문의 댓글 등록
	@PostMapping("admin/cs/qna/answer/registerPro")
	public String adminCsQnaAnswerRegisterPro(HttpSession session, Model model, HttpServletResponse response, CsVO board) {
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
	
	// 관리자 페이지 - 고객센터 : 1:1 문의 글 상세보기
	@GetMapping("admin/cs/qna/answer/view")
	public String adminCsQnaAnswerView(HttpSession session, Model model, HttpServletResponse response, CsVO board) {
		// 관리자 페이지 접근 제한
		if (!isvalid(session, model, response)) return null;
		
		CsVO replyBoard = csService.getBoardDetail(board);
		
		board.setCs_board_num(replyBoard.getCs_board_re_ref());
		
		board = csService.getBoardDetail(board);
		
		model.addAttribute("board", board);
		model.addAttribute("replyBoard", replyBoard);
				
		return "admin/admin_cs_qna_answer_view";
	}
	
	// 관리자 페이지 - 고객센터 : 1:1 문의 글 수정
	@GetMapping("admin/cs/qna/answer/modify")
	public String adminCsQnaAnswerModify(HttpSession session, Model model, HttpServletResponse response, CsVO board) {
		// 관리자 페이지 접근 제한
		if (!isvalid(session, model, response)) return null;
		
		CsVO replyBoard = csService.getBoardDetail(board);
		
		board.setCs_board_num(replyBoard.getCs_board_re_ref());
		
		board = csService.getBoardDetail(board);
		
		model.addAttribute("board", board);
		model.addAttribute("replyBoard", replyBoard);
			
		return "admin/admin_cs_qna_answer_modify";
	}
	
	// 관리자 페이지 - 고객센터 : 1:1 문의 글 수정 등록
	@PostMapping("admin/cs/qna/answer/modifyPro")
	public String adminCsQnaAnswerModifyPro(HttpSession session, Model model, HttpServletResponse response, CsVO board) {
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
	
	// 관리자 페이지 - 고객센터 : 1:1 문의
	@GetMapping("admin/cs/qna/question")
	public String adminCsQnaQuestion(HttpSession session, Model model, HttpServletResponse response, CsVO board) {
		// 관리자 페이지 접근 제한
		if (!isvalid(session, model, response)) return null;
		
		board = csService.getBoardDetail(board);
		
		model.addAttribute("board", board);
				
		return "admin/admin_cs_qna_question";
	}
	
	// 관리자 페이지 - 고객센터 : 
	@ResponseBody
	@GetMapping("sortBoardNotice")
	public String sortBoardQna(CsVO board, Model model, HttpSession session, MemberVO member, 
			@RequestParam ("cs_board_category_user") String userCategory, @RequestParam("cs_board_category_main")String mainCategory,
			@RequestParam("searchFAQ")String searchFAQ, @RequestParam("sdate")String sdate, @RequestParam("edate")String edate){
		
		member.setUser_category(Integer.parseInt(userCategory));
		member.setUser_id((String)session.getAttribute("sId"));
		board.setSearchFAQ(searchFAQ);
		board.setSdate(sdate);
		board.setEdate(edate);
		
		System.out.println(board);
		List<CsVO> boardList = csService.getBoard(board, member, Integer.parseInt(mainCategory));
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("boardList", boardList);

		JSONObject jsonObject = new JSONObject(map);
		return jsonObject.toString();
	}
	
}
