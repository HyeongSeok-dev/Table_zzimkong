package com.table.zzimkong.controller;

import java.time.LocalDate;
import java.time.LocalTime;
import java.time.format.DateTimeFormatter;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;

import com.table.zzimkong.service.ProductService;
import com.table.zzimkong.vo.CompanyVO;
import com.table.zzimkong.vo.SearchVO;

@Controller
public class ProductController {
	
	@Autowired
	private ProductService service;

	@RequestMapping("/product/searchResult")
	public ResponseEntity<?> search_result(@RequestBody SearchVO searchInfo, HttpSession session) {

		LocalDate localDate = LocalDate.parse(searchInfo.getDate());
		LocalTime localTime = LocalTime.parse(searchInfo.getTime());
		DateTimeFormatter formatter = DateTimeFormatter.ofPattern("h:mm");
		
		if (LocalDate.now().equals(localDate)) {
	        searchInfo.setDisplayDate("오늘");
	    } else if (LocalDate.now().plusDays(1).equals(localDate)) {
	        searchInfo.setDisplayDate("내일");
	    } else {
	        searchInfo.setDisplayDate(localDate.toString());
	    }

		if (localTime.isBefore(LocalTime.NOON)) {
	        searchInfo.setDisplayTime("오전 " + localTime.format(formatter));
	    } else {
	        searchInfo.setDisplayTime("오후 " + localTime.format(formatter));
	    }
		
		session.setAttribute("search", searchInfo);
		searchInfo.setRedirectURL("/product/list");

		System.out.println(searchInfo.toString());
		
		return ResponseEntity.ok(searchInfo);
	}

	@RequestMapping("product/list")
	public String product_list(Model model, SearchVO search, HttpSession session) {
		
		search = (SearchVO)session.getAttribute("search");
		
		System.out.println("리스트에서 받음" + search);
		
		
		List<CompanyVO> companyList = service.getCompanyList(search);
		
		int listCount = companyList.size();

		
		model.addAttribute("search", search);
		model.addAttribute("listCount", listCount);
		model.addAttribute("companyList", companyList);
		
		return "product/product_list";
	}
	
	@GetMapping("product/detail")
	public String product_detail() {
		
		return "product/product_detail";
	}
}
