package com.table.zzimkong.controller;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

@Controller
public class ReviewController {

	@GetMapping("detail")
	public String review_detail() {
		return "review/review_detail";
	}
	
	@GetMapping("write")
	public String review_write() {
		return "review/review_write";
	}
	
	@GetMapping("complete")
	public String review_complete() {
		return "review/review_complete";
	}
	
	@GetMapping("report")
	public String review_report() {
		return "review/review_report";
	}

	@GetMapping("comment")
	public String review_comment() {
		return "review/review_comment";
	}

	
	
	
	
	
	
	
}
