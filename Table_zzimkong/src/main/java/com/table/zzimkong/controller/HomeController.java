package com.table.zzimkong.controller;


import java.time.LocalDate;
import java.time.LocalDateTime;
import java.time.LocalTime;
import java.time.format.DateTimeFormatter;
import java.util.*;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.*;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import com.table.zzimkong.service.*;
import com.table.zzimkong.vo.*;

/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {
	
	@Autowired
	private ProductService service;

	@GetMapping("/")
	public String main(Model model, SearchVO search, MemberVO member, HttpSession session) {
	        search.setPersons(2);
	        
	        LocalDateTime defaultTime = LocalDateTime.now().plusHours(2);
	        LocalDate date;
	        String time;
	        String displayTime;
	        if (defaultTime.toLocalTime().isAfter(LocalTime.of(22, 0)) || defaultTime.toLocalTime().isBefore(LocalTime.of(1, 0))) {
	            date = LocalDate.now().plusDays(1);
	            time = "13:00"; 
	            search.setDisplayDate("내일");
	        } else if (defaultTime.toLocalTime().isBefore(LocalTime.of(10, 0))) {
	            date = LocalDate.now();
	            time = "13:00"; 
	            search.setDisplayDate("오늘");
	        } else {
	        	date = LocalDate.now();
	            // 30분 단위로 반올림
	            int minute = defaultTime.getMinute();
	            if (minute % 30 >= 15) {
	                defaultTime = defaultTime.plusMinutes(30 - (minute % 30));
	            } else {
	                defaultTime = defaultTime.minusMinutes(minute % 30);
	            }
	            time = defaultTime.format(DateTimeFormatter.ofPattern("HH:mm")); 
	            search.setDisplayDate("오늘");
	        }
	        LocalTime localTime = LocalTime.parse(time, DateTimeFormatter.ofPattern("HH:mm"));
	        displayTime = localTime.format(DateTimeFormatter.ofPattern("a h:mm"));
	        search.setDate(date.toString());
	        search.setTime(time);
	        search.setDisplayTime(displayTime);
	        search.setLocation("전국");
	        
	        model.addAttribute("search", search);
	        
	        System.out.println(search);
	      
	        model.addAttribute("member", member);
	        
       
	        //메인화면에 카테고리별로 정보 뿌리기==================================
	        
	        //추천순(광고순)
	        search = (SearchVO)session.getAttribute("search");
	        
	        List<CompanyVO>recommendList = service.getRecommendList(search);
	        model.addAttribute("recommendList", recommendList);
	        
	        //별점순
	        search = (SearchVO)session.getAttribute("search");
	        
	        List<CompanyVO>reviewList = service.getReviewList(search);
	        model.addAttribute("reviewList", reviewList);
	        
	        //==============================================================
	        
	    return "main";
	    
	}
	
	
	
	
//	@GetMapping("review/detail")
//	public String review_detail() {
//		return "review/review_detail";
//	}
	
//	@GetMapping("review/write")
//	public String review_write() {
//		return "review/review_write";
//	}
	
	@GetMapping("review/complete")
	public String review_complete() {
		return "review/review_complete";
	}
	
//	@GetMapping("review/report")
//	public String review_report() {
//		return "review/review_report";
//	}

	@GetMapping("review/comment")
	public String review_comment() {
		return "review/review_comment";
	}

	
	@GetMapping("top2")
	public String top2() {
		return "inc/top2";
	}
	
	@GetMapping("top2/searchbar")
	public String top2_search_bar() {
		return "inc/top2_search_bar";
	}


	@GetMapping("fail_back")
	public String fail_back(Model model) {
		model.addAttribute("msg", "잘못된 접근입니다.");
		return "fail_back";
	}
}