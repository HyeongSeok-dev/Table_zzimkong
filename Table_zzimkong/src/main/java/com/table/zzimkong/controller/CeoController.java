package com.table.zzimkong.controller;

import java.io.File;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.text.NumberFormat;
import java.time.LocalDate;
import java.time.LocalTime;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.table.zzimkong.service.CeoService;
import com.table.zzimkong.service.ProductService;
import com.table.zzimkong.vo.CompanyVO;
import com.table.zzimkong.vo.MemberVO;
import com.table.zzimkong.vo.MenuList;
import com.table.zzimkong.vo.MenuVO;
import com.table.zzimkong.vo.MypageInfo;
import com.table.zzimkong.vo.PageInfo;
import com.table.zzimkong.vo.PreOrderInfo;
import com.table.zzimkong.vo.ReservationVO;

@Controller
public class CeoController {

	@Autowired
	private CeoService service;
	@Autowired
	private ProductService servicePro;
	
	// 판매관리
	@GetMapping("ceo/sale")
	public String ceo_sale(
			@RequestParam(defaultValue = "1") int com_id,
			@RequestParam(defaultValue = "") String company_date,
			@ModelAttribute MenuList menuList,
			Map<String, Object> map, CompanyVO company, MenuVO menu,
			HttpSession session, Model model) {
		// 세션 아이디 접근 제한
		if(session.getAttribute("sId") == null) {
			model.addAttribute("msg", "접근권한이 없습니다!");
			model.addAttribute("targetURL", "../login");
			
			return "forward";
		}
		
		int sIdx = (Integer)session.getAttribute("sIdx");
//		sIdx = 75;	// 임시
//		sIdx = 76;	// 임시
//		sIdx = 79;	// 임시
        
	    // 업체 리스트
	    List<CompanyVO> storeList = service.getComList(sIdx);
	    model.addAttribute("storeList", storeList);
		
		// 일별 메뉴별 판매 현황(선주문)
		List<Map<String, Object>> storeMenuList = service.companyMenuSales(menu);
		model.addAttribute("storeMenuList", storeMenuList);

		map.put("com_id", com_id);
		map.put("company_date", company_date);
		
		if (!company_date.equals("")) {
			// 일별 판매금액(총 판매금액, 총 판매금액(선주문))
			// 일별 예약건수(총 예약수, 총 예약인원)
			map = service.companySales(map);
		}
		
		if(map != null) {
			model.addAttribute("com_id", map.get("com_id"));
			model.addAttribute("company_date", map.get("company_date"));
			model.addAttribute("total_sales", map.get("total_sales"));
			model.addAttribute("pre_order_sales", map.get("pre_order_sales"));
			model.addAttribute("total_res_count", map.get("total_res_count"));
			model.addAttribute("total_res_people", map.get("total_res_people"));
		} else {
			model.addAttribute("com_id", 0);
			model.addAttribute("company_date", 0);
			model.addAttribute("total_sales", 0);
			model.addAttribute("pre_order_sales", 0);
			model.addAttribute("total_res_count", 0);
			model.addAttribute("total_res_people", 0);
		}
		
		return "ceo/ceo_sale";
	}

	@GetMapping("ceo/black")
	public String ceoBlack() {
		return "ceo/ceo_black";
	}
	
	@GetMapping("ceo/black/register")
	public String ceoBlackRegister() {
		return "ceo/ceo_black_register";
	}
	
	@GetMapping("ceo/menu/list")
	public String ceoMenuList(HttpSession session, Model model, CompanyVO company) {
		int sIdx = (int)session.getAttribute("sIdx");
		
		System.out.println(sIdx);
		List<CompanyVO> myCompanyList = service.getMyCompanyList(sIdx);
		
		model.addAttribute("myCompanyList", myCompanyList);
		return "ceo/ceo_menu_list";
	}
	
	@PostMapping("ceo/menu/listPro")
	public ResponseEntity<?> ceoMenuListPro(@RequestBody Map<String, Object> map, HttpSession session, Model model, CompanyVO company) {
		company.setCom_id(Integer.parseInt((String)map.get("com_id")));
		List<MenuVO> menuList = servicePro.getMenuList(company);
		
		return ResponseEntity.ok(menuList);
	}
	
	
	@GetMapping("ceo/menu/modify")
	public String ceoMenuModify(MenuVO menu, Model model, CompanyVO company) {
		
		menu = service.getMenu(menu);
		company.setCom_id(menu.getCom_id());
		company = servicePro.getCompany(company);
		
		model.addAttribute("company", company);
		model.addAttribute("menu", menu);
		return "ceo/ceo_menu_modify";
	}
	@PostMapping("ceo/menu/modifyPro")
	public String ceoMenuModifyPro(Model model, MenuVO menu, @RequestParam("menuImages")MultipartFile menuImg, HttpSession session) {
		
		String uploadDir = "/resources/upload"; 
		String saveDir = session.getServletContext().getRealPath(uploadDir);
		String subDir = "";
		String fileName = null;
		LocalDate now = LocalDate.now();
		DateTimeFormatter dtf = DateTimeFormatter.ofPattern("yyyy/MM/dd");
		subDir = now.format(dtf);
		
		saveDir += File.separator + subDir;

		try {
			Path path = Paths.get(saveDir); // 파라미터로 업로드 경로 전달
			Files.createDirectories(path); // 파라미터로 Path 객체 전달
		} catch (IOException e) {
			e.printStackTrace();
		}
		
		System.out.println(menu.toString());
		System.out.println(menuImg);
		System.out.println(menuImg.getOriginalFilename());
		if(menuImg != null && !menuImg.getOriginalFilename().equals("")) {
			menu.setMenu_img("");
			fileName = "";
			fileName = UUID.randomUUID().toString().substring(0, 8) + "_" + menuImg.getOriginalFilename();
			menu.setMenu_img(subDir + "/" + fileName);
		}
		
		System.out.println("수정" + menu);
		int updateCount = service.modifyMenu(menu);
		
		if(updateCount > 0) {
        	try {
				if(!menuImg.getOriginalFilename().equals("")) {
					menuImg.transferTo(new File(saveDir, fileName));
				}
			} catch (IllegalStateException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
        }else {
        	model.addAttribute("msg","메뉴입력 실패!");
        	return "fail_back";
        }
		
		
		model.addAttribute("msg", "메뉴 수정완료!");
		return "popup_close";
	}
	
	@GetMapping("ceo/menu/register")
	public String ceoMenuRegister() {
		return "ceo/ceo_menu_register";
	}
	
	@PostMapping("ceo/menu/registerPro")
	public String menuFormPro(@ModelAttribute MenuList menuList, Model model, @RequestParam("com_id") int com_id,  @RequestParam("menuImages") List<MultipartFile> menuImages, HttpSession session) {
		
		String uploadDir = "/resources/upload"; // 실제 파일이 저장될 경로
		String saveDir = session.getServletContext().getRealPath(uploadDir);
		String subDir = "";
		LocalDate now = LocalDate.now();
		DateTimeFormatter dtf = DateTimeFormatter.ofPattern("yyyy/MM/dd");
		subDir = now.format(dtf);
		saveDir += File.separator + subDir; 
		try {
			Path path = Paths.get(saveDir); // 파라미터로 업로드 경로 전달
			Files.createDirectories(path); // 파라미터로 Path 객체 전달
			System.out.println("Directory created at: " + path.toString());
		} catch (IOException e) {
			e.printStackTrace();
		}
		
		for(int i = 0; i < menuList.getMenuList().size(); i++) {
	        MultipartFile menuImage = menuImages.get(i);
	        MenuVO menu = menuList.getMenuList().get(i);
	        System.out.println(menuImage);
	        System.out.println(menuImage.getOriginalFilename());
	        menu.setMenu_img("");
	        String fileName = UUID.randomUUID().toString().substring(0, 8) + "_" + menuImage.getOriginalFilename();
	        if(!menuImage.getOriginalFilename().equals("")) {
	        	menu.setMenu_img(subDir + "/" + fileName);
	        }
	        int insertCount = service.insertMenu(menu, com_id);
	        
	        if(insertCount > 0) {
	        	try {
					if(!menuImage.getOriginalFilename().equals("")) {
						menuImage.transferTo(new File(saveDir, fileName));
					}
				} catch (IllegalStateException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				} catch (IOException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
	        }else {
	        	model.addAttribute("msg","메뉴입력 실패!");
	        	return "fail_back";
	        }
	        
	        model.addAttribute("msg", "메뉴입력완료!");
		}
		return "popup_close";
	}
	@GetMapping("ceo/menu/deletePro")
	public String deleteMenu(MenuVO menu, HttpSession session, Model model) {
		
		menu = service.getMenu(menu);
		int removeCount = service.removeMenu(menu);
		System.out.println(menu);
		try {
			if(removeCount > 0) { // 레코드의 파일명 삭제(수정) 성공 시
				// 서버에 업로드 된 실제 파일 삭제
				String uploadDir = "/resources/upload"; // 가상의 경로(이클립스 프로젝트 상에 생성한 경로)
				String saveDir = session.getServletContext().getRealPath(uploadDir);
				
				// 파일명이 널스트링이 아닐 경우에만 삭제 작업 수행
				if(!menu.getMenu_img().equals("")) {
					Path path = Paths.get(saveDir + "/" + menu.getMenu_img());
					Files.deleteIfExists(path);
					
				}
			}
		} catch (IOException e) {
			e.printStackTrace();
		}
		
		model.addAttribute("msg", "메뉴삭제완료!");
		return "popup_close";
	}
	
	
	
	//>>>>>>>>>>>>[ceo/reservation]<<<<<<<<<<<<<<<
	
	@PostMapping("ceo/updateStatus")
	public ResponseEntity<?> updateStatus(@RequestBody Map<String, Object> params) {
		int resIdx = (int) params.get("res_idx");
		int status = (int) params.get("status");
		boolean result = service.updateStatus(resIdx, status);
		return result ? ResponseEntity.ok().build() : ResponseEntity.badRequest().build();
	}
	
	@GetMapping("ceo/reservation")
	public String ceo_reservation(HttpSession session, Model model,  CompanyVO company) {
//		//로그인 아이디의 업체별 목록 조회
		int sIdx = (Integer)session.getAttribute("sIdx");
		List<CompanyVO> storeList = service.getComList(sIdx);
		System.out.println("업체별 목록" + storeList);
		model.addAttribute("storeList", storeList);
		return "ceo/ceo_reservation";
	}
	
	@RequestMapping("ceo/reservation/all")
	public ModelAndView getAllReservations(@RequestParam("com_id") String com_id, Map<String, Object> map) {
		System.out.println("ddd" + com_id);
	    List<ReservationVO> reservations = service.getResAll(com_id);
	    System.out.println("리스트" + reservations);
	    map.put("reservations", reservations);
	    ModelAndView mav = new ModelAndView("ceo/ceo_reservation_all", "map", map);
	    return mav;
	}
	
	@ResponseBody
	@PostMapping("ceo/reservation/resPro")
	public String ceo_reservation_resPro( Map<String, Object> map, HttpSession session, Model model, CompanyVO company, @RequestParam int com_id) {
		company.setCom_id(com_id);
//		com_id에 해당하는 예약정보 조회 
		List<ReservationVO> comResList = service.getResInfoList(com_id);
		System.out.println("예약값" + comResList);
		//예약이 없을 경우 예외 처리
//		if(comResList.size()!=0) {
		map = new HashMap<String, Object>();
		if(!comResList.isEmpty()) {
			int res_idx = comResList.get(0).getRes_idx();
			//당일예약 합계
			int resTotal = comResList.size();
			System.out.println("예약합계" + resTotal);
			//당일 예약 인원수
			int totalPersons = comResList.stream()
                    .mapToInt(ReservationVO::getRes_person)
                    .sum();
			//예약취소
			int cancelCount = 0;
			for (ReservationVO res : comResList) {
			    if (res.getRes_status() == 2) {
			    	cancelCount++;
			    }
			}
			map.put("comResList", comResList);
			map.put("cancelCount", cancelCount);
			map.put("resTotal", resTotal);
			map.put("totalPersons", totalPersons);
		}
		System.out.println("제이슨" + map);
		JSONObject jsonObject = new JSONObject(map);
		
		
//		return ResponseEntity.ok(map);
		return jsonObject.toString();
	}
	
	
//	@GetMapping("ceo/reservation/detail")
//	public String ceo_reservation_detail(CompanyVO com, Model model) {
//		com = service.getComTimeInfo(com);
//		System.out.println("com" + com);
//		
//		String com_open_time = com.getCom_open_time();
//        String com_close_time = com.getCom_close_time();
//
//        DateTimeFormatter fmt = DateTimeFormatter.ofPattern("HH:mm");
//        LocalTime openTime = LocalTime.parse(com_open_time, fmt);
//        LocalTime closeTime = LocalTime.parse(com_close_time, fmt);
//        
//        List<String> intervals = new ArrayList<>();
//        while (openTime.isBefore(closeTime)) {
//            openTime = openTime.plusMinutes(30);
//            intervals.add(openTime.format(fmt));
//        }
//        model.addAttribute("intervals", intervals);
//
//        System.out.println(intervals);
//
//		
//		return "ceo/ceo_reservation_detail";
//	}
//	//테스트1
//	@GetMapping("ceo/reservation/detail")
//	public String ceo_reservation_detail(CompanyVO com, Model model) {
//	    com = service.getComTimeInfo(com);
//	    System.out.println("com" + com);
//	    
//	    String com_open_time = com.getCom_open_time();
//	    String com_close_time = com.getCom_close_time();
//
//	    String com_breakStart_time = com.getCom_breakStart_time(); // 휴식 시작 시간
//	    String com_breakEnd_time = com.getCom_breakEnd_time(); // 휴식 끝 시간
//
//	    DateTimeFormatter fmt = DateTimeFormatter.ofPattern("HH:mm");
//	    LocalTime openTime = LocalTime.parse(com_open_time, fmt);
//	    LocalTime closeTime = LocalTime.parse(com_close_time, fmt);
//
//	    LocalTime breakStartTime = LocalTime.parse(com_breakStart_time, fmt); // 휴식 시작 시간을 LocalTime으로 변환
//	    LocalTime breakEndTime = LocalTime.parse(com_breakEnd_time, fmt); // 휴식 끝 시간을 LocalTime으로 변환
//
//	    List<String> intervals = new ArrayList<>();
//	    while (openTime.isBefore(closeTime)) {
//
//	        // 휴식시간 동안은 리스트에 추가하지 않음
//	        if (!(openTime.isAfter(breakStartTime) && openTime.isBefore(breakEndTime))) {
//	            intervals.add(openTime.format(fmt));
//	        }
//
//	        openTime = openTime.plusMinutes(30);
//	    }
//	    model.addAttribute("intervals", intervals);
//
//	    System.out.println(intervals);
//
//	    return "ceo/ceo_reservation_detail";
//	}
	
	//테스트2
	@RequestMapping("ceo/reservation/detail")
	public String ceo_reservation_detail(CompanyVO com, Model model) {
	    com = service.getComTimeInfo(com);
	    System.out.println("com" + com);
	    
	    String com_open_time = com.getCom_open_time();
	    String com_close_time = com.getCom_close_time();
	    int maxPeople = com.getCom_max_people(); // 최대 예약 가능 인원

	    DateTimeFormatter fmt = DateTimeFormatter.ofPattern("HH:mm");
	    LocalTime openTime = LocalTime.parse(com_open_time, fmt);
	    LocalTime closeTime = LocalTime.parse(com_close_time, fmt);
	    
	    List<ReservationVO> reservations = service.getResPerson(com); // 예약 정보 가져오기
	    Map<LocalTime, Integer> reservedPeopleMap = new HashMap<>(); // 각 시간대별 예약된 인원 저장할 Map

	    for (ReservationVO res : reservations) {
	        LocalTime resTime = LocalTime.parse(res.getRes_time(), fmt);
	        int resPeople = res.getRes_person();
	        reservedPeopleMap.put(resTime, reservedPeopleMap.getOrDefault(resTime, 0) + resPeople);
	    }

	    List<Map<String, Object>> intervals = new ArrayList<>();
	    while (openTime.isBefore(closeTime)) {
	        Map<String, Object> interval = new HashMap<>();
	        interval.put("time", openTime.format(fmt));

	        // 예약된 인원 계산하고, 최대 가능 인원에서 빼서 남은 인원 계산
	        int reservedPeople = reservedPeopleMap.getOrDefault(openTime, 0);
	        int availablePeople = maxPeople - reservedPeople;
	        
	        interval.put("reservedPeople", reservedPeople);
	        interval.put("availablePeople", availablePeople);

	        openTime = openTime.plusMinutes(30);
	        intervals.add(interval);
	    }
	    model.addAttribute("intervals", intervals);

	    System.out.println(intervals);

	    
	    return "ceo/ceo_reservation_detail";
	}
	
	@GetMapping("ceo/reservation/info")	
	public String ceo_reservation_info(ReservationVO res, Model model, MenuVO menu, HttpSession session, PreOrderInfo poi) {
		res = service.getResDetailInfo(res);
		System.out.println("info에서 받는거" + res);
		model.addAttribute("res", res);

		
		
		List<PreOrderInfo> preInfo = service.getPreOrderInfo(res);
		model.addAttribute("preInfo", preInfo);
		System.out.println("정보" + preInfo);
		
	    NumberFormat numberFormat = NumberFormat.getInstance();

		
	    //메뉴가격 합계변수만들기
	    int count = 0;
	    int eachMenuTotalPriceInt = 0;
		int menuTotalPriceInt = 0;
		for(PreOrderInfo preOrderInfo : preInfo) {
			eachMenuTotalPriceInt = (Integer.parseInt(preOrderInfo.getMenu_price()) * preOrderInfo.getPre_num());
			menuTotalPriceInt += eachMenuTotalPriceInt;
			String eachMenuTotalPrice = numberFormat.format(eachMenuTotalPriceInt);
			preOrderInfo.setEachMenuTotalPrice(eachMenuTotalPrice);
			count++;
		}
		String totalPrice = numberFormat.format(res.getRes_table_price() + menuTotalPriceInt);
		String menuTotalPrice = numberFormat.format(menuTotalPriceInt);
		
		model.addAttribute("totalPrice", totalPrice);
		model.addAttribute("menuTotalPrice", menuTotalPrice);
		
		
		return "ceo/ceo_reservation_info";
	}

	
	// [company]=================================================================================
	
	@GetMapping("ceo/company/register")
	public String companyRegisterForm(HttpSession session,Model model) {
		String sId = (String)session.getAttribute("sId");
		if(sId == null) {
			
			model.addAttribute("msg", "접근권한이 없습니다!");
			model.addAttribute("targetURL", "login");
			
			return "forward";
		}
		// 사업자의 정보를 뷰페이지로 전송(사업자 등록번호 조회시 이름 사용)
		System.out.println(sId);
		MemberVO dbmember = service.getUserInfo(sId);
		model.addAttribute("member",dbmember);
		return "ceo/ceo_company_register";
	}
	
	@ResponseBody
	@GetMapping("ceo/company/ceoCheckDupComNum")
	public String checkDupComNum(HttpSession session, Model model, CompanyVO com) {
		if(session.getAttribute("sId") == null) {
			
			model.addAttribute("msg", "접근권한이 없습니다!");
			model.addAttribute("targetURL", "login");
			
			return "forward";
		}
		// 사업자 등록번호가 이미 등록된 번호인지 확인하는 작업
		System.out.println(com.getCom_num());
		CompanyVO comNum = service.getComNum(com);
		if(comNum == null) {
			System.out.println("등록가능");
			return"true";
		} else {
			return"false";
		}
		
	}
	
	@PostMapping("ceo/company/registPro")
	public String companyRegistPro(HttpSession session, Model model, CompanyVO company) {
		
		System.out.println("companyVO" + company);
		String sId = (String)session.getAttribute("sId");
		if(sId == null) {
			
			model.addAttribute("msg", "접근권한이 없습니다!");
			model.addAttribute("targetURL", "login");
			
			return "forward";
		}
		//user_idx 
		company.setUser_idx((int)session.getAttribute("sIdx"));
		
		// [사업장 이미지 업로드]
		String uploadDir = "/resources/upload";
		String saveDir = session.getServletContext().getRealPath(uploadDir);
		String subDir = "";
		LocalDate now = LocalDate.now();
		DateTimeFormatter dtf = DateTimeFormatter.ofPattern("yyyy/MM/dd");
		subDir = now.format(dtf);
		saveDir += File.separator + subDir;
		
		try {
			Path path = Paths.get(saveDir); // 파라미터로 업로드 경로 전달
			Files.createDirectories(path); // 파라미터로 Path 객체 전달
		} catch (IOException e) {
			e.printStackTrace();
		}
		MultipartFile mFile = company.getFile();
		System.out.println("원본파일명1 : " + mFile.getOriginalFilename());
		
		company.setCom_img("");
		
		String imgName = UUID.randomUUID().toString().substring(0, 8) + "_" + mFile.getOriginalFilename();
		
		if(!mFile.getOriginalFilename().equals("")) {
			company.setCom_img(subDir + "/" + imgName);
		}
		System.out.println("실제 업로드 파일명 : " + company.getCom_img());
		//----------------------------------------------------------------------------------------------
		// [영업시간/브레이크타임 시간분 합치기]
		company.setCom_open_time(company.getOpenHour() + " : " + company.getOpenMin());
		company.setCom_close_time(company.getCloseHour() + " : " + company.getCloseMin());
		
		if(company.getStartHour() == "" || company.getStartMin() == "" || company.getEndHour() == "" || company.getEndMin() == "") {
			company.setCom_breakStart_time("");
			company.setCom_breakEnd_time("");
		} else {
			company.setCom_breakStart_time(company.getStartHour() + " : " + company.getStartMin());
			company.setCom_breakEnd_time(company.getEndHour() + " : " + company.getEndMin());
		}
		
		//------------------------------------------------------------------------------------------------
		//카테고리 나눠서 boolean으로 변경하기
		String[] tagArr = company.getCom_tag().split(",");
		for(int i = 0; i < tagArr.length; i++) {
			String tag = tagArr[i];
			switch (tag) {
			case "데이트":
				company.setCom_tag_date(true);
				break;
			case "가족모임":
				company.setCom_tag_family(true);
				break;
			case "단체회식":
				company.setCom_tag_party(true);
				break;
			case "조용한":
				company.setCom_tag_quiet(true);
				break;
			case "주차가능":
				company.setCom_tag_park(true);
				break;
			case "노키즈존":
				company.setCom_tag_kids(true);
				break;
			case "장애인편의시설":
				company.setCom_tag_disabled(true);
				break;
			case "반려동물":
				company.setCom_tag_pet(true);
				break;
			case "홀":
				company.setCom_tag_hall(true);
				break;
			case "룸":
				company.setCom_tag_room(true);
				break;
			case "테라스":
				company.setCom_tag_terrace(true);
				break;
			case "창가자리":
				company.setCom_tag_window(true);
				break;
			}
		}
		//-------------------------------------------------------------------------------------------
		//전화번호 "-" 넣기
		if(!company.getCom_tel().contains("-")) {
			switch (company.getCom_tel().length()) { //전화번호 자리수에 따라 - 위치가 달라짐
			case 8:
				String tel = company.getCom_tel().substring(0,4) + "-" + company.getCom_tel().substring(4);
				System.out.println(tel+company.getCom_tel().length());
				company.setCom_tel(tel);
				break;
			case 10:
				tel = company.getCom_tel().substring(0,3) + "-" + company.getCom_tel().substring(3,6) + "-" + company.getCom_tel().substring(6);
				System.out.println(tel+company.getCom_tel().length());
				company.setCom_tel(tel);
				break;
			case 11:
				tel = company.getCom_tel().substring(0,3) + "-" + company.getCom_tel().substring(3,7) + "-" + company.getCom_tel().substring(7);
				System.out.println(tel+company.getCom_tel().length());
				company.setCom_tel(tel);
				break;
			case 12:
				tel = company.getCom_tel().substring(0,4) + "-" + company.getCom_tel().substring(4,8) + "-" + company.getCom_tel().substring(8);
				System.out.println(tel+company.getCom_tel().length());
				company.setCom_tel(tel);
				break;
			}
		}
		//------------------------------------------------------------------------------------------------------
		//검색태그 공백제거하기
		company.setCom_search_tag(company.getCom_search_tag().trim());
		System.out.println(company.getCom_search_tag());
		
		//----------------------------------------------------------------------------------------------------
		//주소 군구 추출해서 넣기
		String[] addressArr = company.getCom_address().split(" ");
		String si= "";
		if(addressArr[0].contains("특별자치시")) {
			si = addressArr[0].replace("특별자치시", "");
		} else if(addressArr[0].contains("특별시")) {
			si = addressArr[0].replace("특별시", "");
		} else if(addressArr[0].contains("광역시")) {
			si = addressArr[0].replace("광역시", "");
		} else if(addressArr[1].endsWith("시")) {
			si = addressArr[1].replace("시", "");
		} else if(addressArr[1].endsWith("군")) {
			si = addressArr[1].replace("군", "");
		}
		System.out.println("포함여부 : " + addressArr[0].contains("특별시"));
		String gugun = "";
		if((addressArr[0].contains("특별시") || addressArr[0].contains("광역시") || addressArr[0].contains("특별자치시"))
				&& (addressArr[1].endsWith("구") || addressArr[1].endsWith("군"))) {
			gugun = si + "_" + addressArr[1];
		} else if((addressArr[1].endsWith("시")||addressArr[1].endsWith("군"))
					&& (addressArr[2].endsWith("구") || addressArr[2].endsWith("동") || addressArr[2].endsWith("읍"))) {
			gugun = si + "_" + addressArr[2];
		} 
		System.out.println("구군 : " +  gugun);
		company.setCom_gugun(gugun);
		
		// [ 등록 ]
		int insertCompany = service.registCompany(company, sId);
		
		if(insertCompany > 0) {
			
			try {
				if(!mFile.getOriginalFilename().equals("")) {
					mFile.transferTo(new File(saveDir, imgName));
				}
				
			} catch (IllegalStateException e) {
				e.printStackTrace();
			} catch (IOException e) {
				e.printStackTrace();
			}
			
			
			return "redirect:/ceo/company/list";
			
		} else {
			model.addAttribute("msg","사업장 등록 실패!");     
			return "fail_back";
		}
				
				
	}
	
	@GetMapping("ceo/company/list")
	public String companyListForm(HttpSession session,Model model) {
		
		if(session.getAttribute("sId") == null) {
		
		model.addAttribute("msg", "접근권한이 없습니다!");
		model.addAttribute("targetURL", "login");
		
		return "forward";
	}
//		session.setAttribute("sIdx", 76);
		int sIdx = (int)session.getAttribute("sIdx");
		
		
		System.out.println(sIdx);
		
		List<CompanyVO> myCompanyList = service.getMyCompanyList(sIdx);
		
		for(CompanyVO company : myCompanyList) {
			company.setOperatingTime(company.getCom_open_time() + " ~ " + company.getCom_close_time());
			
			if(company.getCom_breakStart_time().isEmpty() || company.getCom_breakEnd_time().isEmpty()) {
				System.out.println("비었음");
				company.setBreakTime("");
			} else {
				System.out.println("정보있음");
				company.setBreakTime(company.getCom_breakStart_time() + " ~ " + company.getCom_breakEnd_time());
			}
//			company.setBreakTime(company.getCom_breakStart_time() + " ~ " + company.getCom_breakEnd_time());
			
		}
		
		System.out.println(myCompanyList);
		model.addAttribute("myCompanyList", myCompanyList);
		return "ceo/ceo_company_list";
	}
	
	
	
	@GetMapping("ceo/company/view")
	public String ceoCompanyView(HttpSession session,Model model 
								,@RequestParam(defaultValue = "") String com_num	
								) {
		if(session.getAttribute("sId") == null) {
			model.addAttribute("msg", "접근권한이 없습니다!");
			model.addAttribute("targetURL", "login");
			return "forward";
		}
	
		System.out.println("view : " + com_num);
		CompanyVO company = service.getEachCompany(com_num);
		
		// 디비에서 가지고온 사업장 정보중 영업시간 브레이크타임 결합
		company.setOperatingTime(company.getCom_open_time() + " ~ " + company.getCom_close_time());
		System.out.println("time" + company.getCom_breakStart_time());
		if(company.getCom_breakStart_time().isEmpty() || company.getCom_breakEnd_time().isEmpty()) {
			System.out.println("비었음");
			company.setBreakTime("");
		} else {
			System.out.println("정보있음");
			company.setBreakTime(company.getCom_breakStart_time() + " ~ " + company.getCom_breakEnd_time());
		}
		company.setCom_reg_date(company.getCom_reg_date());
		
		System.out.println(company.getBreakTime());
		
		model.addAttribute("com", company);
		return "ceo/ceo_company_view";
	}
	
	@ResponseBody
	@GetMapping("ceo/company/companyStatusChange")
	public String comStatusChange(HttpSession session, Model model,
			@RequestParam(defaultValue = "") String com_status, @RequestParam(defaultValue = "0") String com_num) {
		if(session.getAttribute("sId") == null) {
			model.addAttribute("msg", "접근권한이 없습니다!");
			model.addAttribute("targetURL", "login");
			return "forward";
		}
		
		System.out.println("com_status : " + com_status + ", com_num : " + com_num);
		
		// 사업장상태변경
		CompanyVO company = new CompanyVO();
		company.setCom_num(com_num);
		int updateComStatus = 0;
		
		if(com_status.equals("영업중지")) {
			company.setCom_status(3);
			updateComStatus = service.changeStatus(company);
			
		} else if(com_status.equals("정상영업")) {
			company.setCom_status(1);
			updateComStatus = service.changeStatus(company);
		}
		
		System.out.println("수정 결과 : " + updateComStatus);
		if(updateComStatus > 0) {
			return "ture";
		} else {
			return "false";
		}
		
		
	}

	@GetMapping("ceo/company/modify")
	public String ceoCompanyModify(HttpSession session, Model model, @RequestParam(defaultValue = "")String com_num) {
		String sId = (String)session.getAttribute("sId");
		if(sId == null) {
			
			model.addAttribute("msg", "접근권한이 없습니다!");
			model.addAttribute("targetURL", "login");
			
			return "forward";
		}
		CompanyVO company = service.getEachCompany(com_num);
		
		// 시간 분할해서 select태그에 맞게 변경
		System.out.println(company.getCom_open_time().split(":")[0]);
		System.out.println("breakStart_time : " + company.getCom_breakStart_time());
		System.out.println("breakEnd_time : " + company.getCom_breakEnd_time());
		company.setOpenHour(company.getCom_open_time().split(":")[0].trim());
		company.setOpenMin(company.getCom_open_time().split(":")[1].trim());
		company.setCloseHour(company.getCom_close_time().split(":")[0].trim());
		company.setCloseMin(company.getCom_close_time().split(":")[1].trim());
		
		if(!company.getCom_breakStart_time().isBlank() || !company.getCom_breakEnd_time().isBlank()) {
			company.setStartHour(company.getCom_breakStart_time().split(":")[0].trim());
			company.setStartMin(company.getCom_breakStart_time().split(":")[1].trim());
			company.setEndHour(company.getCom_breakEnd_time().split(":")[0].trim());
			company.setEndMin(company.getCom_breakEnd_time().split(":")[1].trim());
		} else {
			System.out.println("널스트링 맞음");
			company.setStartHour("");
			company.setStartMin("");
			company.setEndHour("");
			company.setEndMin("");
		}
		
		
		model.addAttribute("com",company);
		return "ceo/ceo_company_modify";
	}
	
	@PostMapping("ceo/company/modifyPro")
	public String companyModifyPro(HttpSession session, Model model, CompanyVO company) {
		if(session.getAttribute("sId") == null) {
			
			model.addAttribute("msg", "접근권한이 없습니다!");
			model.addAttribute("targetURL", "login");
			
			return "forward";
		}
		
		System.out.println("수정1 : " + company);
		// [사업장 이미지 업로드]
		String uploadDir = "/resources/upload";
		String saveDir = session.getServletContext().getRealPath(uploadDir);
		String subDir = "";
		LocalDate now = LocalDate.now();
		DateTimeFormatter dtf = DateTimeFormatter.ofPattern("yyyy/MM/dd");
		subDir = now.format(dtf);
		saveDir += File.separator + subDir;
		
		try {
			Path path = Paths.get(saveDir); // 파라미터로 업로드 경로 전달
			Files.createDirectories(path); // 파라미터로 Path 객체 전달
		} catch (IOException e) {
			e.printStackTrace();
		}
		MultipartFile mFile = company.getFile();
		System.out.println("원본파일명1 : " + mFile.getOriginalFilename());
		
		company.setCom_img("");
		
		String imgName = UUID.randomUUID().toString().substring(0, 8) + "_" + mFile.getOriginalFilename();
		
		if(!mFile.getOriginalFilename().equals("")) {
			company.setCom_img(subDir + "/" + imgName);
		}
		System.out.println("실제 업로드 파일명 : " + company.getCom_img());
		
		//시간정보 db 테이터로 수정함
		company.setCom_open_time(company.getOpenHour() + ":" + company.getOpenMin());
		company.setCom_close_time(company.getCloseHour() + ":" + company.getCloseMin());
		System.out.println("-> : " + company.getCom_breakStart_time());
		System.out.println("-> : " + company.getCom_breakEnd_time());
		
		// 브레이크타임이 수정폼에서 입력한 값이 있으면 문자열 결합 없으면 널스트링 처리
		if(!company.getStartHour().isEmpty() || !company.getStartMin().isEmpty()) {
			System.out.println("브레이크타임 시작 수정");
			company.setCom_breakStart_time(company.getStartHour() + ":" + company.getStartMin());
		} else {
			company.setCom_breakStart_time("");
		}
		
		if(!company.getEndHour().isEmpty() || !company.getEndMin().isEmpty()) {
			System.out.println("브레이크타임 종료 수정");
			company.setCom_breakEnd_time(company.getEndHour() + ":" + company.getEndMin());
		} else {
			company.setCom_breakEnd_time("");
		}
		
		//카테고리 boolea으로 변경하기
		if(company.getCom_tag().contains("데이트")) {
			company.setCom_tag_date(true);
		} 
		if(company.getCom_tag().contains("가족모임")) {
			 company.setCom_tag_family(true);
		}
		if(company.getCom_tag().contains("단체회식")) {
			 company.setCom_tag_party(true);
		}
		if(company.getCom_tag().contains("조용한")) {
			 company.setCom_tag_quiet(true);
		}
		if(company.getCom_tag().contains("주차가능")) {
			 company.setCom_tag_park(true);
		}
		if(company.getCom_tag().contains("노키즈존")) {
			 company.setCom_tag_kids(true);
		}
		if(company.getCom_tag().contains("장애인편의시설")) {
			 company.setCom_tag_disabled(true);
		}
		if(company.getCom_tag().contains("반려동물")) {
			 company.setCom_tag_pet(true);
		}
		if(company.getCom_tag().contains("홀")) {
		     company.setCom_tag_hall(true);
		}
		if(company.getCom_tag().contains("룸")) {
			 company.setCom_tag_room(true);
		}
		if(company.getCom_tag().contains("테라스")) {
			 company.setCom_tag_terrace(true);
		}
		if(company.getCom_tag().contains("창가자리")) {
			 company.setCom_tag_window(true);
		}
		
		//검색태그 공백제거하기
		company.setCom_search_tag(company.getCom_search_tag().trim());
		
				
		//전화번호 '-' 주기
		if(!company.getCom_tel().contains("-")) {
			switch (company.getCom_tel().length()) {
			case 8:
				String tel = company.getCom_tel().substring(0,4) + "-" + company.getCom_tel().substring(4);
				System.out.println(tel+company.getCom_tel().length());
				company.setCom_tel(tel);
				break;
			case 10:
				tel = company.getCom_tel().substring(0,3) + "-" + company.getCom_tel().substring(3,6) + "-" + company.getCom_tel().substring(6);
				System.out.println(tel+company.getCom_tel().length());
				company.setCom_tel(tel);
				break;
			case 11:
				tel = company.getCom_tel().substring(0,3) + "-" + company.getCom_tel().substring(3,7) + "-" + company.getCom_tel().substring(7);
				System.out.println(tel+company.getCom_tel().length());
				company.setCom_tel(tel);
				break;
			case 12:
				tel = company.getCom_tel().substring(0,4) + "-" + company.getCom_tel().substring(4,8) + "-" + company.getCom_tel().substring(8);
				System.out.println(tel+company.getCom_tel().length());
				company.setCom_tel(tel);
				break;
			}
		
//			if(company.getCom_tel().length() == 8) {
//				String tel = company.getCom_tel().substring(0,3) + "-" + company.getCom_tel().substring(4);
//				System.out.println(tel);
//				company.setCom_tel(tel);
//			} else if(company.getCom_tel().length() == 10) {
//				String tel = company.getCom_tel().substring(0,2) + "-" + company.getCom_tel().substring(3,5) + "-" + company.getCom_tel().substring(6);
//				System.out.println(tel);
//				company.setCom_tel(tel);
//			} else if(company.getCom_tel().length() == 11) {
//				String tel = company.getCom_tel().substring(0,2) + "-" + company.getCom_tel().substring(3,6) + "-" + company.getCom_tel().substring(7);
//				System.out.println(tel);
//				company.setCom_tel(tel);
//			} else if(company.getCom_tel().length() == 12) {
//				String tel = company.getCom_tel().substring(0,2) + "-" + company.getCom_tel().substring(3,6) + "-" + company.getCom_tel().substring(7);
//				System.out.println(tel);
//				company.setCom_tel(tel);
//					}
		}
		
		System.out.println("수정 : " + company);
		
		int updateCompany = service.companyModify(company);
		
		
		if(updateCompany < 0) {
			model.addAttribute("msg", "사업장 정보 수정 실패!");
			return "fail_back";
		} else {
			try {
				if(!mFile.getOriginalFilename().equals("")) {
					mFile.transferTo(new File(saveDir, imgName));
				}
			} catch (IllegalStateException e) {
				e.printStackTrace();
			} catch (IOException e) {
				e.printStackTrace();
			}
			return "redirect:view?com_num=" + company.getCom_num();
		}
		
	}
	
	@PostMapping("ceo/company/closeRegist")
	public String companyCloseRegist(HttpSession session, Model model, @RequestParam(defaultValue = "")String com_num) {
		if(session.getAttribute("sId") == null) {
			
			model.addAttribute("msg", "접근권한이 없습니다!");
			model.addAttribute("targetURL", "login");
			
			return "forward";
		}
		
		int updateStatusClose = service.closeRegist(com_num);
		
		
		if(updateStatusClose < 0) {
			model.addAttribute("msg", "폐점 신청 실패!");
			return "fail_back";
		} else {
			System.out.println("com num: " + com_num);
			return "redirect:view?com_num=" + com_num;
		}
	}
	
	@GetMapping("ceo/company/ad")
	public String ceoCompanyAd(HttpSession session, Model model, @RequestParam(defaultValue = "")String com_num) {
		if(session.getAttribute("sId") == null) {
			
			model.addAttribute("msg", "접근권한이 없습니다!");
			model.addAttribute("targetURL", "login");
			
			return "forward";
		}
//		System.out.println(company.getCom_num());
		CompanyVO company = service.getEachCompany(com_num);
		
		model.addAttribute("com",company);
		
		return "ceo/ceo_company_ad";
	}
	
	@PostMapping("ceo/company/payAdPro")
	public String payAd(CompanyVO company, Model model, HttpSession session) {
		if(session.getAttribute("sId") == null) {
			
			model.addAttribute("msg", "접근권한이 없습니다!");
			model.addAttribute("targetURL", "login");
			
			return "forward";
		}
		
		int updateAdGrade = service.registAd(company);
		
		if(updateAdGrade < 0) {
			model.addAttribute("msg", "광고 등록 실패!");
			return "fail_back";
		} else {
			return "redirect:view?com_num=" + company.getCom_num();
		}
	}
	
	
}
