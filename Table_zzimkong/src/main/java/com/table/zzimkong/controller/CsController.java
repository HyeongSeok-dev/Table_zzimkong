package com.table.zzimkong.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

import com.table.zzimkong.service.CsService;

@Controller
public class CsController {
	
	@Autowired
	private CsService service;

	@GetMapping("ceo/cs/faq")
	public String ceo_cs_faq() {
		return "ceo/ceo_cs_faq";
	}
	
	@GetMapping("ceo/cs/faq/view")
	public String ceo_cs_faq_view() {
		return "ceo/ceo_cs_faq_view";
	}
	
	@GetMapping("ceo/cs/notice")
	public String ceo_cs_notice() {
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
	public String ceo_cs_qna() {
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
