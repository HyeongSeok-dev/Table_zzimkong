package com.table.zzimkong.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.table.zzimkong.vo.SearchVO;

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
	
	@RequestMapping("/product/searchResult")
	public ModelAndView search_result(@ModelAttribute SearchVO searchInfo, ModelAndView modelAndView) {
		System.out.println(searchInfo.toString());
		if(searchInfo.getTriggered_by() != null) {
			modelAndView.setViewName("redirect:/product/list");
		}
		modelAndView.addObject(searchInfo);
		return modelAndView;
	}
	
}
