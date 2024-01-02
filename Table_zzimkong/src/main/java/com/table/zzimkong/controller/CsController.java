package com.table.zzimkong.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

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
		int boardCategory = 1;
		List<CsVO> boardList = service.getBoard(board, member, boardCategory);
		
		model.addAttribute("boardList", boardList);
		
		return "ceo/ceo_cs_faq";
	}
	
	@GetMapping("ceo/cs/faq/view")
	public String ceo_cs_faq_view() {
		return "ceo/ceo_cs_faq_view";
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
		int boardCategory = 2;
		List<CsVO> boardList = service.getBoard(board, member, boardCategory);
		
		model.addAttribute("boardList", boardList);
		
		return "ceo/ceo_cs_notice";
	}
	
	@GetMapping("ceo/cs/notice/view")
	public String ceo_cs_notice_view() {
		return "ceo/ceo_cs_notice_view";
	}
	
	@GetMapping("ceo/cs/qna/modify")
	public String ceo_cs_qna_modify() {
		return "ceo/ceo_cs_qna_modify";
	}
	
	@GetMapping("ceo/cs/qna/register")
	public String ceo_cs_qna_register() {
		return "ceo/ceo_cs_qna_register";
	}
	
	@GetMapping("ceo/cs/qna/view")
	public String ceo_cs_qna_view() {
		return "ceo/ceo_cs_qna_view";
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
		return "ceo/ceo_cs_qna";
	}
	
	
	
	
	
	
	
	@GetMapping("member/cs/faq")
	public String member_cs_faq() {
		return "cs/member_cs_faq";
	}
	
	@GetMapping("member/cs/faq/view")
	public String member_cs_faq_view() {
		return "cs/member_cs_faq_view";
	}
	
	@GetMapping("member/cs/notice")
	public String member_cs_notice() {
		return "cs/member_cs_notice";
	}
	
	@GetMapping("member/cs/notice/view")
	public String member_cs_notice_view() {
		return "cs/member_cs_notice_view";
	}
	
	@GetMapping("member/cs/qna/modify")
	public String member_cs_qna_modify() {
		return "cs/member_cs_qna_modify";		
	}
	
	@GetMapping("member/cs/qna/register")
	public String member_cs_qna_register() {
		return "cs/member_cs_qna_register";
	}
	
	@GetMapping("member/cs/qna")
	public String member_cs_qna() {
		return "cs/member_cs_qna";
	}
	
	@GetMapping("member/cs/qna/view")
	public String member_cs_qna_view() {
		return "cs/member_cs_qna_view";
	}
}
