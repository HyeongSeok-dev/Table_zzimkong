package com.table.zzimkong.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class CeoCsController {

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
	
}
