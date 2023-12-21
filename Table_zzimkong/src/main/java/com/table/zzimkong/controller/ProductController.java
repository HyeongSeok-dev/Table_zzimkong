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
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import com.table.zzimkong.vo.SearchVO;

@Controller
public class ProductController {

	@RequestMapping("/product/searchResult")
	public ResponseEntity<?> search_result(@RequestBody SearchVO searchInfo) {

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

		System.out.println(searchInfo.toString());
		return ResponseEntity.ok(searchInfo);
	}

	@GetMapping("product/list")
	public String product_list(Model model, SearchVO search) {
		
		System.out.println("리스트에서 받음" + search);
        model.addAttribute("search", search);
		return "product/product_list";
	}
	
	@GetMapping("product/detail")
	public String product_detail() {
		
		return "product/product_detail";
	}
}
