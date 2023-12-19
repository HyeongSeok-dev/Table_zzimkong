package com.table.zzimkong.controller;

import java.time.LocalDate;
import java.time.LocalDateTime;
import java.time.LocalTime;
import java.time.format.DateTimeFormatter;

import javax.servlet.http.HttpServletRequest;

import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import com.table.zzimkong.vo.SearchVO;

@Controller
public class ProductController {
	
	@GetMapping("product/detail")
	public String product_detail() {
		
		return "product/product_detail";
	}
	
	@GetMapping("product/list")
	public String product_list() {
		
		return "product/product_list";
	}
	
	@RequestMapping("/product/searchResult")
	public ResponseEntity<?> search_result(@RequestBody SearchVO searchInfo) {

			
		if(LocalDate.now().equals(searchInfo.getDate())) {
			searchInfo.setDisplayDate("오늘");
		}else if (LocalDate.now().plusDays(1).equals(searchInfo.getDate())) {
			searchInfo.setDisplayDate("내일");
		}else {
			searchInfo.setDisplayDate(searchInfo.getDate().toString());
		}
		
		DateTimeFormatter formatter = DateTimeFormatter.ofPattern("hh:mm");
		
		if(searchInfo.getTime().isBefore(LocalTime.NOON)) {
			searchInfo.setDisplayTime("오전 " + searchInfo.getTime().format(formatter));
		} else {
			searchInfo.setDisplayTime("오후 " + searchInfo.getTime().format(formatter));
	    }
		
		System.out.println(searchInfo.toString());
		return ResponseEntity.ok(searchInfo);
	}
	
}
