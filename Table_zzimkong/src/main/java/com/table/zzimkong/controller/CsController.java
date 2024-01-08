package com.table.zzimkong.controller;

import java.io.File;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.UUID;

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

import com.table.zzimkong.service.CsService;
import com.table.zzimkong.vo.CsVO;
import com.table.zzimkong.vo.MemberVO;

@Controller
public class CsController {
	
	@Autowired
	private CsService service;

	@GetMapping("ceo/cs/faq")
	public String ceo_cs_faq(CsVO board, Model model, HttpSession session, MemberVO member) {
		
		if(session.getAttribute("sIdx") == null) {
			model.addAttribute("msg", "잘못된 접근입니다.");
			return "fail_back";
		}
		int sIdx = (int)session.getAttribute("sIdx");
		
		member = service.getmember(sIdx);
		if(member.getUser_category() ==1) {
			model.addAttribute("msg", "잘못된 접근입니다.");
			return "fail_back";
		}
		int boardCategory = 2;
		List<CsVO> boardList = service.getBoard(board, member, boardCategory);
		
		model.addAttribute("boardList", boardList);
		
		return "cs/ceo_cs_faq";
	}
	
	@GetMapping("ceo/cs/faq/view")
	public String ceo_cs_faq_view(CsVO board, Model model, HttpSession session, MemberVO member) {
		
		if(session.getAttribute("sIdx") == null) {
			model.addAttribute("msg", "잘못된 접근입니다.");
			return "fail_back";
		}
		
		int sIdx = (int)session.getAttribute("sIdx");
		
		member = service.getmember(sIdx);
		if(member.getUser_category() ==1) {
			model.addAttribute("msg", "잘못된 접근입니다.");
			return "fail_back";
		}
		board = service.getBoardDetail(board);
		
		model.addAttribute("board", board);
		
		return "cs/ceo_cs_faq_view";
	}
	
	@GetMapping("ceo/cs/notice")
	public String ceo_cs_notice(CsVO board, Model model, HttpSession session, MemberVO member) {
		
		if(session.getAttribute("sIdx") == null) {
			model.addAttribute("msg", "잘못된 접근입니다.");
			return "fail_back";
		}
		
		int sIdx = (int)session.getAttribute("sIdx");
		
		member = service.getmember(sIdx);
		if(member.getUser_category() ==1) {
			model.addAttribute("msg", "잘못된 접근입니다.");
			return "fail_back";
		}
		int boardCategory = 1;
		List<CsVO> boardList = service.getBoard(board, member, boardCategory);
		
		model.addAttribute("boardList", boardList);
		
		return "cs/ceo_cs_notice";
	}
	
	@GetMapping("ceo/cs/notice/view")
	public String ceo_cs_notice_view(CsVO board, Model model, HttpSession session, MemberVO member) {
		
		if(session.getAttribute("sIdx") == null) {
			model.addAttribute("msg", "잘못된 접근입니다.");
			return "fail_back";
		}
		
		int sIdx = (int)session.getAttribute("sIdx");
		
		member = service.getmember(sIdx);
		if(member.getUser_category() ==1) {
			model.addAttribute("msg", "잘못된 접근입니다.");
			return "fail_back";
		}
		board = service.getBoardDetail(board);
		
		model.addAttribute("board", board);
		
		return "cs/ceo_cs_notice_view";
	}
	
	@GetMapping("ceo/cs/qna/modify")
	public String ceo_cs_qna_modify(CsVO board, Model model, HttpSession session, MemberVO member) {
		
		if(session.getAttribute("sIdx") == null) {
			model.addAttribute("msg", "잘못된 접근입니다.");
			return "fail_back";
		}
		
		int sIdx = (int)session.getAttribute("sIdx");
		
		member = service.getmember(sIdx);
		if(member.getUser_category() ==1) {
			model.addAttribute("msg", "잘못된 접근입니다.");
			return "fail_back";
		}
		
		board = service.getBoardDetail(board);
		
		if(!board.getUser_id().equals(member.getUser_id())) {
			model.addAttribute("msg", "잘못된 접근입니다.");
			return "fail_back";
		}
		
		
		model.addAttribute("board", board);
		model.addAttribute("member", member);
		
		return "cs/ceo_cs_qna_modify";
	}
	
	@PostMapping("ceo/cs/qna/modifyPro")
	public String ceo_cs_qna_modifyPro(CsVO board, Model model, HttpSession session, MemberVO member) {
		
		if(session.getAttribute("sIdx") == null) {
			model.addAttribute("msg", "잘못된 접근입니다.");
			return "fail_back";
		}
		
		int sIdx = (int)session.getAttribute("sIdx");
		
		member = service.getmember(sIdx);
		
		if(member.getUser_category() == 1) {
			model.addAttribute("msg", "잘못된 접근입니다.");
			return "fail_back";
		}
		
		if(!member.getUser_id().equals(board.getUser_id())) {
			model.addAttribute("msg", "잘못된 접근입니다.");
			return "fail_back";
		}
		
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
		
		int updateCount = service.modifyQnaBoard(board);
		
		// DB 작업 요청 처리 결과 판별
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
	
	@GetMapping("ceo/cs/qna/register")
	public String ceo_cs_qna_register(CsVO board, Model model, HttpSession session, MemberVO member) {
		
		if(session.getAttribute("sIdx") == null) {
			model.addAttribute("msg", "잘못된 접근입니다.");
			return "fail_back";
		}
		
		int sIdx = (int)session.getAttribute("sIdx");
		
		member = service.getmember(sIdx);
		if(member.getUser_category() ==1) {
			model.addAttribute("msg", "잘못된 접근입니다.");
			return "fail_back";
		}
		
		model.addAttribute("member", member);
		
		
		return "cs/ceo_cs_qna_register";
	}
	
	@PostMapping("ceo/cs/qna/registerPro")
	public String ceo_cs_qna_registerPro(CsVO board, Model model, HttpSession session, MemberVO member) {
		
		if(session.getAttribute("sIdx") == null) {
			model.addAttribute("msg", "잘못된 접근입니다.");
			return "fail_back";
		}
		
		int sIdx = (int)session.getAttribute("sIdx");
		
		member = service.getmember(sIdx);
		if(member.getUser_category() ==1) {
			model.addAttribute("msg", "잘못된 접근입니다.");
			return "fail_back";
		}
		
		//이미지 업로드 로직
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
		
		board.setUser_id(member.getUser_id());
		board.setCs_board_category_user(2);
		board.setCs_board_category_main(3);
		
		System.out.println(board);
		int insertCount = service.registboard(board);
		
		
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
			model.addAttribute("msg", "문의가 등록되었습니다.");
			return "popup_close";
		}else {
			model.addAttribute("msg", "글 작성 실패!");
			return "fail_back";
		}
	}
	
	@GetMapping("ceo/cs/qna/view")
	public String ceo_cs_qna_view(CsVO board, Model model, HttpSession session, MemberVO member) {
		
		if(session.getAttribute("sIdx") == null) {
			model.addAttribute("msg", "잘못된 접근입니다.");
			return "fail_back";
		}
		
		int sIdx = (int)session.getAttribute("sIdx");
		
		member = service.getmember(sIdx);
		
		System.out.println(board);
		board = service.getBoardDetail(board);
		List<CsVO> memberBoards = service.getBoard(board, member, 3);
		
		boolean isReplyBoard = false;
		
		for(CsVO memberBoard : memberBoards) {
			if(memberBoard.getCs_board_num() == board.getCs_board_re_ref()) {
				isReplyBoard = true;
			}
		}
		
		if(!member.getUser_id().equals(board.getUser_id())) {
			if(isReplyBoard) {
				model.addAttribute("board", board);
				model.addAttribute("member", member);
				
				return "cs/ceo_cs_qna_view";
			}
			model.addAttribute("msg", "잘못된 접근입니다.");
			return "fail_back";
		}
		
		model.addAttribute("board", board);
		model.addAttribute("member", member);
		
		return "cs/ceo_cs_qna_view";
	}
	
	@GetMapping("ceo/cs/qna")
	public String ceo_cs_qna(CsVO board, Model model, HttpSession session, MemberVO member) {
		
		if(session.getAttribute("sIdx") == null) {
			model.addAttribute("msg", "잘못된 접근입니다.");
			return "fail_back";
		}
		
		int sIdx = (int)session.getAttribute("sIdx");
		
		member = service.getmember(sIdx);
		if(member.getUser_category() ==1) {
			model.addAttribute("msg", "잘못된 접근입니다.");
			return "fail_back";
		}
		int boardCategory = 3;
		List<CsVO> boardList = service.getBoard(board, member, boardCategory);
		
		model.addAttribute("boardList", boardList);
		return "cs/ceo_cs_qna";
	}
	
	
	@GetMapping("ceo/cs/qna/delete")
	public String ceo_cs_qna_delete(CsVO board, Model model, HttpSession session, MemberVO member) {
		
		if(session.getAttribute("sIdx") == null) {
			model.addAttribute("msg", "잘못된 접근입니다.");
			return "fail_back";
		}
		
		int sIdx = (int)session.getAttribute("sIdx");
		
		member = service.getmember(sIdx);
		if(member.getUser_category() ==1) {
			model.addAttribute("msg", "잘못된 접근입니다.");
			return "fail_back";
		}
		board = service.getBoardDetail(board);
		
		if(!member.getUser_id().equals(board.getUser_id())) {
			model.addAttribute("msg", "잘못된 접근입니다.");
			return "fail_back";
		}
		
		int deleteCount = service.removeBoard(board);
		
		if(deleteCount > 0) {
			model.addAttribute("msg", "삭제되었습니다!");
			return "popup_close";
		}else {
			model.addAttribute("msg", "삭제 실패!");
			return "fail_back";
		}
	}
	
	
	
	
	@GetMapping("member/cs/faq")
	public String member_cs_faq(CsVO board, Model model, HttpSession session, MemberVO member) {
		
		member.setUser_category(1);
		int boardCategory = 2;
		List<CsVO> boardList = service.getBoard(board, member, boardCategory);
		
		model.addAttribute("boardList", boardList);
		
		return "cs/member_cs_faq";
	}
	
	@GetMapping("member/cs/faq/view")
	public String member_cs_faq_view(CsVO board, Model model, HttpSession session, MemberVO member) {
		
		board = service.getBoardDetail(board);
		
		model.addAttribute("board", board);
		
		return "cs/member_cs_faq_view";
	}
	
	@GetMapping("member/cs/notice")
	public String member_cs_notice(CsVO board, Model model, HttpSession session, MemberVO member) {
		
		member.setUser_category(1);
		int boardCategory = 1;
		List<CsVO> boardList = service.getBoard(board, member, boardCategory);
		
		model.addAttribute("boardList", boardList);
		
		return "cs/member_cs_notice";
	}
	
	@GetMapping("member/cs/notice/view")
	public String member_cs_notice_view(CsVO board, Model model, HttpSession session, MemberVO member) {
		
		board = service.getBoardDetail(board);
		
		model.addAttribute("board", board);
		
		return "cs/member_cs_notice_view";
	}
	
	@GetMapping("member/cs/qna/modify")
	public String member_cs_qna_modify(CsVO board, Model model, HttpSession session, MemberVO member) {
		
		if(session.getAttribute("sIdx") == null) {
			model.addAttribute("msg", "로그인이 필요합니다!");
			model.addAttribute("targetURL", "../../login");
			return "forward";
		}
		
		board = service.getBoardDetail(board);
		
		model.addAttribute("board", board);
		model.addAttribute("member", member);
		return "cs/member_cs_qna_modify";
	}

	@PostMapping("member/cs/qna/modifyPro")
	public String member_cs_qna_modifyPro(CsVO board, Model model, HttpSession session, MemberVO member) {
		
		if(session.getAttribute("sIdx") == null) {
			model.addAttribute("msg", "로그인이 필요합니다!");
			model.addAttribute("targetURL", "../../login");
			return "forward";
		}
		
		int sIdx = (int)session.getAttribute("sIdx");
		
		member = service.getmember(sIdx);
		member.setUser_category(1);
		if(!member.getUser_id().equals(board.getUser_id())) {
			model.addAttribute("msg", "잘못된 접근입니다.");
			return "fail_back";
		}
		
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
		
		int updateCount = service.modifyQnaBoard(board);
		
		// DB 작업 요청 처리 결과 판별
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
	
	
	@GetMapping("member/cs/qna/register")
	public String member_cs_qna_register(CsVO board, Model model, HttpSession session, MemberVO member) {
		
		if(session.getAttribute("sIdx") == null) {
			model.addAttribute("msg", "로그인이 필요합니다!");
			model.addAttribute("targetURL", "../../login");
			return "forward";
		}
		
		int sIdx = (int)session.getAttribute("sIdx");
		
		member = service.getmember(sIdx);
		
		model.addAttribute("member", member);
		
		return "cs/member_cs_qna_register";
	}
	
	
	@PostMapping("member/cs/qna/registerPro")
	public String member_cs_qna_registerPro(CsVO board, Model model, HttpSession session, MemberVO member) {
		
		if(session.getAttribute("sIdx") == null) {
			model.addAttribute("msg", "로그인이 필요합니다!");
			model.addAttribute("targetURL", "../../login");
			return "forward";
		}
		
		int sIdx = (int)session.getAttribute("sIdx");
		
		member = service.getmember(sIdx);
		member.setUser_category(1);

		//이미지 업로드 로직
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
		
		board.setUser_id(member.getUser_id());
		board.setCs_board_category_user(1);
		board.setCs_board_category_main(3);
		
		System.out.println(board);
		int insertCount = service.registboard(board);
		
		
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
			model.addAttribute("msg", "문의가 등록되었습니다.");
			return "popup_close";
		}else {
			model.addAttribute("msg", "글 작성 실패!");
			return "fail_back";
		}
	}
	
	
	
	@GetMapping("member/cs/qna")
	public String member_cs_qna(CsVO board, Model model, HttpSession session, MemberVO member) {
		
		if(session.getAttribute("sIdx") == null) {
			model.addAttribute("msg", "로그인이 필요합니다!");
			model.addAttribute("targetURL", "../../login");
			return "forward";
		}
		
		int sIdx = (int)session.getAttribute("sIdx");
		
		member = service.getmember(sIdx);
		
		int boardCategory = 3;
		member.setUser_category(1);
		List<CsVO> boardList = service.getBoard(board, member, boardCategory);
		
		model.addAttribute("boardList", boardList);
		return "cs/member_cs_qna";
	}
	
	@GetMapping("member/cs/qna/view")
	public String member_cs_qna_view(CsVO board, Model model, HttpSession session, MemberVO member) {
		
		if(session.getAttribute("sIdx") == null) {
			model.addAttribute("msg", "로그인이 필요합니다!");
			model.addAttribute("targetURL", "../../login");
			return "forward";
		}
		int sIdx = (int)session.getAttribute("sIdx");
		
		member = service.getmember(sIdx);
		member.setUser_category(1);
		System.out.println(board);
		board = service.getBoardDetail(board);
		
		List<CsVO> memberBoards = service.getBoard(board, member, 3);
		
		boolean isReplyBoard = false;
		
		for(CsVO memberBoard : memberBoards) {
			if(memberBoard.getCs_board_num() == board.getCs_board_re_ref()) {
				isReplyBoard = true;
			}
		}
		model.addAttribute("board", board);
		model.addAttribute("member", member);
		if(!member.getUser_id().equals(board.getUser_id())) {
			if(isReplyBoard) {
				return "cs/member_cs_qna_view";
			}
			model.addAttribute("msg", "잘못된 접근입니다.");
			return "fail_back";
		}
		
		return "cs/member_cs_qna_view";
	}
	
	@GetMapping("member/cs/qna/delete")
	public String member_cs_qna_delete(CsVO board, Model model, HttpSession session, MemberVO member) {
		
		if(session.getAttribute("sIdx") == null) {
			model.addAttribute("msg", "로그인이 필요합니다!");
			model.addAttribute("targetURL", "../../login");
			return "forward";
		}
		
		int sIdx = (int)session.getAttribute("sIdx");
		
		member = service.getmember(sIdx);
		board = service.getBoardDetail(board);
		
		if(!member.getUser_id().equals(board.getUser_id())) {
			model.addAttribute("msg", "잘못된 접근입니다.");
			return "fail_back";
		}
		
		int deleteCount = service.removeBoard(board);
		
		if(deleteCount > 0) {
			model.addAttribute("msg", "삭제되었습니다!");
			return "popup_close";
		}else {
			model.addAttribute("msg", "삭제 실패!");
			return "fail_back";
		}
	}
	
	
	@ResponseBody
	@GetMapping("sortBoardFaq")
	public String sortBoardFaq(CsVO board, Model model, HttpSession session, MemberVO member, 
			@RequestParam("cs_board_category_user")String userCategory, @RequestParam("cs_board_category_main")String mainCategory,
			@RequestParam("cs_board_category_sub")String subCategory, @RequestParam("searchFAQ")String searchFAQ) {
		
		member.setUser_category(Integer.parseInt(userCategory));
		board.setCs_board_category_sub(Integer.parseInt(subCategory));
		board.setSearchFAQ(searchFAQ);
		
		List<CsVO> boardList = service.getBoard(board, member, Integer.parseInt(mainCategory));
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("boardList", boardList);
		System.out.println("보드리스트" + boardList);
		JSONObject jsonObject = new JSONObject(map);
		return jsonObject.toString();
	}
	
	@ResponseBody
	@GetMapping("sortBoardQna")
	public String sortBoardQna(CsVO board, Model model, HttpSession session, MemberVO member, 
			@RequestParam("cs_board_category_user")String userCategory, @RequestParam("cs_board_category_main")String mainCategory,
			@RequestParam("cs_board_category_sub")String subCategory, @RequestParam("searchFAQ")String searchFAQ, 
			@RequestParam("sdate")String sdate, @RequestParam("edate")String edate){
		
		member.setUser_category(Integer.parseInt(userCategory));
		member.setUser_id((String)session.getAttribute("sId"));
		board.setCs_board_category_sub(Integer.parseInt(subCategory));
		board.setSearchFAQ(searchFAQ);
		board.setSdate(sdate);
		board.setEdate(edate);
		
		List<CsVO> boardList = service.getBoard(board, member, Integer.parseInt(mainCategory));
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("boardList", boardList);
		System.out.println("보드리스트" + boardList);
		JSONObject jsonObject = new JSONObject(map);
		return jsonObject.toString();
	}
}
