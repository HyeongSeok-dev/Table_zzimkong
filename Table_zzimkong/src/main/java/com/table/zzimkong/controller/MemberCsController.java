package com.table.zzimkong.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class MemberCsController {

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
