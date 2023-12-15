package com.table.zzimkong.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class ProductController {
	
	@GetMapping("product/detail")
	public String product_detail(Model model, HttpServletRequest request) {
		
		model.addAttribute("currentUrl", request.getRequestURI());
		return "product/product_detail";
	}
	
	@GetMapping("product/list")
	public String product_list(Model model, HttpServletRequest request) {
		
		model.addAttribute("currentUrl", request.getRequestURI());
		return "product/product_list";
	}
	
	@GetMapping("product/searchResult")
	public String search_result(Model model, HttpServletRequest request) {
		
		model.addAttribute("currentUrl", request.getRequestURI());
		return "product/product_list";
	}
	
}
