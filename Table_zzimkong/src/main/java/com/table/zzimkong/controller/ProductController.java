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
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;

import com.table.zzimkong.service.ProductService;
import com.table.zzimkong.vo.CompanyVO;
import com.table.zzimkong.vo.MenuVO;
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

		session.setAttribute("search", null);
		session.setAttribute("search", searchInfo);
		searchInfo.setRedirectURL("/product/list");

		System.out.println(searchInfo.toString());
		
		return ResponseEntity.ok(searchInfo);
	}

	@RequestMapping("product/list")
	public String product_list(Model model, SearchVO search, HttpSession session) {
		
		if(search == null) {
			model.addAttribute("msg","잘못된 접근입니다!");
			return "fail_back";
		}
		
		search = (SearchVO)session.getAttribute("search");
		
		System.out.println("리스트에서 받음" + search);
		
		if(search != null && search.getSort() == null) {
			search.setSort("recommend");
		}
		
		List<CompanyVO> companyList = service.getCompanyList(search);
		
		
		int listCount = companyList.size();

		
		model.addAttribute("search", search);
		model.addAttribute("listCount", listCount);
		model.addAttribute("companyList", companyList);
		
		return "product/product_list";
	}
	
	@PostMapping("product/detail")
	public String product_detail(Model model, SearchVO search, HttpSession session, CompanyVO company) {
		
		if(search == null) {
			model.addAttribute("msg","잘못된 접근입니다!");
			return "fail_back";
		}
		search = (SearchVO)session.getAttribute("search");
		System.out.println("디테일에서 받음" + search);
		System.out.println("디테일에서 받음" +company);
		CompanyVO dbCompany = service.getCompany(company);
		List<MenuVO> menuList = service.getMenuList(company);
		
		String tagMood ="";
		String tagFacilities ="";
		
		if(dbCompany.isCom_tag_date()) {
			tagMood += " 데이트 ";
		}
		if(dbCompany.isCom_tag_family()) {
			tagMood += " 가족모임 ";
		}
		if(dbCompany.isCom_tag_party()) {
			tagMood += " 단체회식 ";
		}
		if(dbCompany.isCom_tag_quiet()) {
			tagMood += " 조용한 ";
		}
		
		if(dbCompany.isCom_tag_park()) {
			tagFacilities += " 주차가능 ";
		}
		if(dbCompany.isCom_tag_kids()) {
			tagFacilities += " 노키즈존 ";
		}
		if(dbCompany.isCom_tag_disabled()) {
			tagFacilities += " 장애인 편의시설 ";
		}
		if(dbCompany.isCom_tag_pet()) {
			tagFacilities += " 반려동물 동반 ";
		}
		
		model.addAttribute("menuList", menuList);
		model.addAttribute("company", dbCompany);
		model.addAttribute("company_info", company);
		model.addAttribute("tag_mood", tagMood);
		model.addAttribute("tag_facilities", tagFacilities);
		
		return "product/product_detail";
	}
}
