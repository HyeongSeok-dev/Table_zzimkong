package com.table.zzimkong.controller;

import java.time.LocalDate;
import java.time.LocalTime;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashMap;
import java.util.HashSet;
import java.util.List;
import java.util.Map;
import java.util.Set;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.table.zzimkong.service.ProductService;
import com.table.zzimkong.vo.BookmarkVO;
import com.table.zzimkong.vo.CompanyVO;
import com.table.zzimkong.vo.MemberVO;
import com.table.zzimkong.vo.MenuVO;
import com.table.zzimkong.vo.ReservationVO;
import com.table.zzimkong.vo.ReviewVO;
import com.table.zzimkong.vo.SearchVO;

@Controller
public class ProductController {
	
	@Autowired
	private ProductService service;

	@RequestMapping("/product/searchResult")
	public ResponseEntity<?> search_result(@RequestBody SearchVO search, HttpSession session) {
		//검색결과 시간 형변환
		LocalDate localDate = LocalDate.parse(search.getDate());
		LocalTime localTime = LocalTime.parse(search.getTime());
		DateTimeFormatter formatter = DateTimeFormatter.ofPattern("h:mm");
		
		if (LocalDate.now().equals(localDate)) {
			search.setDisplayDate("오늘");
	    } else if (LocalDate.now().plusDays(1).equals(localDate)) {
	    	search.setDisplayDate("내일");
	    } else {
	    	search.setDisplayDate(localDate.toString());
	    }

		if (localTime.isBefore(LocalTime.NOON)) {
			search.setDisplayTime("오전 " + localTime.format(formatter));
	    } else {
	    	search.setDisplayTime("오후 " + localTime.format(formatter));
	    }
		
		session.setAttribute("search", search);
		search.setRedirectURL("/product/list");

		return ResponseEntity.ok(search);
	}

	@RequestMapping("product/list")
	public String product_list(Model model, HttpSession session) {
		
		SearchVO search = (SearchVO)session.getAttribute("search");
		
		if(search == null) {
			model.addAttribute("msg","잘못된 접근입니다!");
			return "fail_back";
		}
		
		System.out.println("세션에서 받음" + search);
		
		if(search != null && search.getSort() == null) {
			search.setSort("recommend");
		}
		
		List<CompanyVO> companyList = service.getCompanyList(search);
		
		
		int listCount = companyList.size();

		session.setAttribute("search", search);
		model.addAttribute("listCount", listCount);
		model.addAttribute("companyList", companyList);
		
		return "product/product_list";
	}
	
	@RequestMapping("product/detail")
	public String product_detail(Model model, HttpSession session, CompanyVO company, ReservationVO res, SearchVO search) {
		System.out.println("디테일전" + search);
		search = (SearchVO)session.getAttribute("search");
		System.out.println("디테일후" + search);
		
		if(search == null) {
			model.addAttribute("msg","서버가 재시작 되어서 세션이 없어졌어요");
			return "fail_back";
		}
		
		String selectTimeButton = company.getSelectedTime();
		if(selectTimeButton == null || selectTimeButton.equals("")) {
			selectTimeButton = search.getTime();
		}
		
		search.setTime(selectTimeButton);
		LocalTime localTime = LocalTime.parse(search.getTime());
		DateTimeFormatter formatter = DateTimeFormatter.ofPattern("h:mm");
		
		if (localTime.isBefore(LocalTime.NOON)) {
	        search.setDisplayTime("오전 " + localTime.format(formatter));
	    } else {
	        search.setDisplayTime("오후 " + localTime.format(formatter));
	    }
		session.setAttribute("search", search);
		System.out.println("변경된 시간" + search.getTime());
		
		int remainingPeople = service.getReservationInfo(search, company.getCom_id());
		if(remainingPeople - search.getPersons() <0) {
			model.addAttribute("msg"," 예약인원이 초과되었습니다!");
			return "fail_back";
		}
		System.out.println("디테일에서 받고 시간변경 " + search);
		
		CompanyVO dbCompany = service.getCompany(company);
		List<ReviewVO> reviews = service.getReviewInfo(company);
		ReviewVO reviewScore = service.getReviewScore(company);
		List<MenuVO> menuList = service.getMenuList(company);
		
		
		if(session.getAttribute("sIdx") != null) {
			BookmarkVO bookmark = service.getBookmark((int)session.getAttribute("sIdx"),dbCompany.getCom_id());
			if(bookmark != null) {
				model.addAttribute("isLiked", "true");
			}else {
				model.addAttribute("isLiked", "false");
			}
		}
		
		LocalTime openTime = LocalTime.parse(dbCompany.getCom_open_time());
		LocalTime closeTime = LocalTime.parse(dbCompany.getCom_close_time());
		if(LocalTime.now().isAfter(openTime) && LocalTime.now().isBefore(closeTime)) {
			model.addAttribute("isOnBusiness", true);
		}else {
			model.addAttribute("isOnBusiness", false);
		}
		
		if(session.getAttribute("sIdx") == null) {
			model.addAttribute("isvisited", false);
		}else {
			int user_idx = (int)session.getAttribute("sIdx");
			List<ReservationVO>resList = service.getVisitedPeople(user_idx);
			if(resList == null) {
				model.addAttribute("isvisited", false);
			}else {
				model.addAttribute("isvisited", true);
			}
		}
		
		System.out.println(res);
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
		model.addAttribute("tag_mood", tagMood);
		model.addAttribute("tag_facilities", tagFacilities);
		model.addAttribute("reviews", reviews);
		model.addAttribute("review_score", reviewScore);
		
		return "product/product_detail";
	}
	
	@GetMapping("product/map")
	public String product_map() {
		
		return "product/product_map";
	}
	
	
	@RequestMapping("product/detailPro")
	public ResponseEntity<?> detail_pro(@RequestBody Map<String, Object> map, HttpSession session, ReservationVO res, MenuVO menu, Model model) {
		String sId = (String) session.getAttribute("sId");
		if(sId == null) {
		    Map<String, Object> response = new HashMap<>();
		    response.put("error", true);
		    response.put("message", "로그인이 필요합니다!");
		    response.put("redirectURL", "../login");
		    return ResponseEntity.badRequest().body(response);
		}
		
		System.out.println(map);
		SearchVO search = (SearchVO)session.getAttribute("search");
		System.out.println(search);
		res.setCom_id(Integer.parseInt((String)map.get("com_id")));
		res.setRes_person(search.getPersons());
		res.setRes_table_price(search.getPersons()*20000);
		res.setRes_time(search.getTime());
		res.setRes_date(search.getDate());
		
		int remainingPeople = service.getReservationInfo(search, res.getCom_id());
		if(remainingPeople - search.getPersons() <0) {
			Map<String, Object> response = new HashMap<>();
	        response.put("error", true);
	        response.put("message", "예약 인원이 초과되었습니다!");
	        return ResponseEntity.badRequest().body(response);
			
		}
		List<MenuVO> menuList = new ArrayList<MenuVO>();
		menuList = (List<MenuVO>) map.get("menus");

		System.out.println("프로에서 찍음" + res); 
		System.out.println("프로에서 찍음" + menuList); 
		
		session.setAttribute("res", res);
	    session.setAttribute("menuList", menuList);
	    search.setRedirectURL("/reservation");
		return ResponseEntity.ok(search);
	}
	
	@PostMapping("product/similarList")
	public ResponseEntity<?> similarList(@RequestBody Map<String, Object> map, CompanyVO company) {
		String sort = (String) map.get("similarSort");
	    int com_id = Integer.parseInt((String)map.get("com_id"));
		company.setCom_id(com_id);
	    company = service.getCompany(company);
	    List<String> tagList = new ArrayList<>();
	    if(company.isCom_tag_date()) {
	        tagList.add("com_tag_date");
	    }
	    if(company.isCom_tag_family()) {
	        tagList.add("com_tag_family");
	    }
	    if(company.isCom_tag_party()) {
	        tagList.add("com_tag_party");
	    }
	    if(company.isCom_tag_quiet()) {
	        tagList.add("com_tag_quiet");
	    }
	    if(company.isCom_tag_park()) {
	        tagList.add("com_tag_park");
	    }
	    if(company.isCom_tag_kids()) {
	        tagList.add("com_tag_kids");
	    }
	    if(company.isCom_tag_disabled()) {
	        tagList.add("com_tag_disabled");
	    }
	    if(company.isCom_tag_pet()) {
	        tagList.add("com_tag_pet");
	    }
	    
	    List<String> individualTags = null;
	    if(company.getCom_search_tag() != null) {
		    	
			String[] tagsArray = company.getCom_search_tag().split("#");
			
			// 분리된 태그를 셋으로 변환하고 중복 및 빈 문자열 제거
			Set<String> tagsSet = new HashSet<>(Arrays.asList(tagsArray));
			tagsSet.remove("");  // 빈 문자열 제거
			
			// 다시 리스트로 변환
			individualTags = new ArrayList<>(tagsSet);
			
			// 결과 출력 (디버깅용)
			for (String tag : individualTags) {
			    System.out.println(tag);
			}
	    }
	 
		List<CompanyVO> companyList = service.getsimilarCompanyList(sort, company, tagList, individualTags);
		
		return ResponseEntity.ok(companyList);
	}
	
	@ResponseBody
	@PostMapping("product/favor")
	public String favor(HttpSession session, BookmarkVO bookmark, @RequestParam int com_id) {
		
		int sIdx = 0;
		
		if(session.getAttribute("sIdx") == null) {
			return "notLogin";
		}
		sIdx = (int)session.getAttribute("sIdx");
		
		bookmark = service.getBookmark(sIdx,com_id);
		if(bookmark == null) {
			int insertCount  = service.registBookmark(sIdx,com_id);
			return "true";
		}else {
			int deleteCount =  service.removeBookmark(sIdx,com_id);
			return "false";
		}
		
		
	}
	
}
