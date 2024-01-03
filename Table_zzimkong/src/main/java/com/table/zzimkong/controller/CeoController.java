package com.table.zzimkong.controller;

import java.io.File;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.servlet.http.HttpSession;

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

import com.table.zzimkong.service.CeoService;
import com.table.zzimkong.service.ProductService;
import com.table.zzimkong.vo.CompanyVO;
import com.table.zzimkong.vo.MemberVO;
import com.table.zzimkong.vo.MenuList;
import com.table.zzimkong.vo.MenuVO;
import com.table.zzimkong.vo.ReservationVO;

@Controller
public class CeoController {

	@Autowired
	private CeoService service;
	@Autowired
	private ProductService servicePro;
	
	@GetMapping("ceo/sale")
	public String ceo_sale() {
		
		return "ceo/ceo_sale";
	}

	@GetMapping("ceo/black")
	public String ceo_black() {
		return "ceo/ceo_black";
	}
	
	@GetMapping("ceo/black/register")
	public String ceo_black_register() {
		return "ceo/ceo_black_register";
	}
	
	@GetMapping("ceo/menu/list")
	public String ceo_menu_list(HttpSession session, Model model, CompanyVO company) {
		int sIdx = (int)session.getAttribute("sIdx");
		
		System.out.println(sIdx);
		List<CompanyVO> myCompanyList = service.getMyCompanyList(sIdx);
		
		model.addAttribute("myCompanyList", myCompanyList);
		return "ceo/ceo_menu_list";
	}
	
	@PostMapping("ceo/menu/listPro")
	public ResponseEntity<?> ceo_menu_listPro(@RequestBody Map<String, Object> map, HttpSession session, Model model, CompanyVO company) {
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
	public String ceo_menu_register() {
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
	
	@RequestMapping("ceo/reservation")
	public String ceo_reservation(HttpSession session, Model model, CompanyVO company, ReservationVO res) {
//		int sId = (int)session.getAttribute("sId");
		int sIdx = (Integer)session.getAttribute("sIdx");
		List<CompanyVO> storeList = service.getComList(sIdx);
		model.addAttribute("storeList", storeList);
		System.out.println("storeList" + storeList);
		
		 
		List<ReservationVO> comResList = service.getResInfoList(company);
		System.out.println("예약값" + comResList);
		model.addAttribute("comResList", comResList);
		return "ceo/ceo_reservation";
	}
	
	@GetMapping("ceo/reservation/detail")
	public String ceo_reservation_detail() {
		return "ceo/ceo_reservation_detail";
	}
	
	@GetMapping("ceo/reservation/info")	
	public String ceo_reservation_info(ReservationVO res, Model model) {
		res = service.getResDetailInfo(res);
		model.addAttribute("res", res);
		return "ceo/ceo_reservation_info";
	}
	
	// [company]=================================================================================
	
	@GetMapping("ceo/company/register")
	public String companyRegisterForm(HttpSession session,Model model) {
//		session.setAttribute("sId", "ceo123456");
		String sId = (String)session.getAttribute("sId");
//		if(session.getAttribute("sId") == null) {
//			
//			map.put("msg", "접근권한이 없습니다!");
//			map.put("targetURL", "login");
//			
//			mav = new ModelAndView("forward", "map", map);
//			return mav;
//		}
		System.out.println(sId);
		MemberVO dbmember = service.getUserInfo(sId);
		model.addAttribute("member",dbmember);
		return "ceo/ceo_company_register";
	}
	@PostMapping("ceo/company/registPro")
	public String companyRegistPro(HttpSession session, Model model, CompanyVO company) {
		
		System.out.println("companyVO" + company);
		String sId = (String)session.getAttribute("sId");
//		if(session.getAttribute("sId") == null) {
//			
//			model.addAttribute("msg", "접근권한이 없습니다!");
//			model.addAttribute("targetURL", "login");
//			
//			return "forward";
//		}
		//user_idx 
		company.setUser_idx(Integer.parseInt((String)session.getAttribute("sIdx")));
		
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
		company.setCom_breakStart_time(company.getStartHour() + " : " + company.getStartMin());
		company.setCom_breakEnd_time(company.getEndHour() + " : " + company.getEndMin());
		
		//------------------------------------------------------------------------------------------------
		//카테고리 boolea으로 변경하기
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
		}
		//------------------------------------------------------------------------------------------------------
		//검색태그 공백제거하기
		company.setCom_search_tag(company.getCom_search_tag().trim());
		System.out.println(company.getCom_search_tag());
		
		//----------------------------------------------------------------------------------------------------
		//주소 군구 추출해서 넣기
		String[] addressArr = company.getCom_address().split(" ");
		String si = "";
		if(addressArr[0].contains("특별시")) {
			si = addressArr[0].replace("특별시", "");
		} else if(addressArr[0].contains("광역시")) {
			si = addressArr[0].replace("광역시", "");
		} else if(addressArr[1].endsWith("시")) {
			si = addressArr[1].replace("시", "");
		} else if(addressArr[1].endsWith("군")) {
			si = addressArr[1].replace("군", "");
		}
		
		String gugun = "";
		if((addressArr[0].contains("특별시") || addressArr[0].contains("광역시")) && (addressArr[1].endsWith("구") || addressArr[1].endsWith("군"))) {
			gugun = si + "_" + addressArr[1];
		} else if((addressArr[1].endsWith("시")||addressArr[1].endsWith("군"))
					&& (addressArr[2].endsWith("구") || addressArr[2].endsWith("동") || addressArr[2].endsWith("읍"))) {
			gugun = si + "_" + addressArr[2];
		} 
		System.out.println("구군 : " +  gugun);
		company.setCom_gugun(gugun);
		
		// 등록
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
		
//		if(session.getAttribute("sId") == null) {
//		
//		model.addAttribute("msg", "접근권한이 없습니다!");
//		model.addAttribute("targetURL", "login");
//		
//		return "forward";
//	}
		session.setAttribute("sIdx", 76);
		int sIdx = (int)session.getAttribute("sIdx");
		
		System.out.println(sIdx);
		
		List<CompanyVO> myCompanyList = service.getMyCompanyList(sIdx);
		
		for(CompanyVO company : myCompanyList) {
			
			company.setOperatingTime(company.getCom_open_time() + " ~ " + company.getCom_close_time());
			company.setBreakTime(company.getCom_breakStart_time() + " ~ " + company.getCom_breakEnd_time());
			
		}
		
		System.out.println(myCompanyList);
		model.addAttribute("myCompanyList", myCompanyList);
		return "ceo/ceo_company_list";
	}
	
	@GetMapping("ceo/company/view")
	public String ceo_company_view(HttpSession session,Model model 
								,@RequestParam(defaultValue = "") String com_num	
								) {
//		if(session.getAttribute("sId") == null) {
//			model.addAttribute("msg", "접근권한이 없습니다!");
//			model.addAttribute("targetURL", "login");
//			return "forward";
//		}
	
		System.out.println("view : " + com_num);
		CompanyVO company = service.getEachCompany(com_num);
		
		company.setOperatingTime(company.getCom_open_time() + " ~ " + company.getCom_close_time());
		company.setBreakTime(company.getCom_breakStart_time() + " ~ " + company.getCom_breakEnd_time());
		company.setCom_reg_date(company.getCom_reg_date());
		
		model.addAttribute("com", company);
		return "ceo/ceo_company_view";
	}
	
	@ResponseBody
	@GetMapping("ceo/company/companyStatusChange")
	public String comStatusChange(@RequestParam(defaultValue = "") String com_status, @RequestParam(defaultValue = "0") String com_num) {
////		System.out.println(member.getId());
//
//		// MemberService - getMember() 메서드 호출하여 아이디 조회(기존 메서드 재사용)
//		// (MemberService - getMemberId() 메서드 호출하여 아이디 조회 메서드 정의 가능)
//		// => 파라미터 : MemberVO 객체 리턴타입 : MemberVO(dbMember)
//		MemberVO dbMember = service.getMember(member);
//
//		// 조회 결과 판별
//		// => MemberVO 객체가 존재할 경우 아이디 중복, 아니면 사용 가능한 아이디
//		if (dbMember == null) { // 사용 가능한 아이디
//			return "false"; // 중복이 아니라는 의미로 "false" 값 전달
//		} else { // 아이디 중복
//			return "true"; // 중복이라는 의미로 "true" 값 전달
//		}
		System.out.println("com_status : " + com_status + ", com_num : " + com_num);
		
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
	public String ceo_company_modify(HttpSession session, Model model, @RequestParam(defaultValue = "")String com_num) {
		String sId = (String)session.getAttribute("sId");
//		if(session.getAttribute("sId") == null) {
//			
//			model.addAttribute("msg", "접근권한이 없습니다!");
//			model.addAttribute("targetURL", "login");
//			
//			return "forward";
//		}
//		System.out.println(company.getCom_num());
		CompanyVO company = service.getEachCompany(com_num);
		
		System.out.println(company);
		
		company.setOpenHour(company.getCom_open_time().split(":")[0]);
		company.setOpenMin(company.getCom_open_time().split(":")[1]);
		company.setCloseHour(company.getCom_close_time().split(":")[0]);
		company.setCloseMin(company.getCom_close_time().split(":")[1]);
		company.setStartHour(company.getCom_breakStart_time().split(":")[0]);
		company.setStartMin(company.getCom_breakStart_time().split(":")[1]);
		company.setEndHour(company.getCom_breakEnd_time().split(":")[0]);
		company.setEndMin(company.getCom_breakEnd_time().split(":")[1]);
		
		
		model.addAttribute("com",company);
		return "ceo/ceo_company_modify";
	}
	
	@PostMapping("ceo/company/modifyPro")
	public String company_modifyPro(HttpSession session, Model model, CompanyVO company) {
		String sId = (String)session.getAttribute("sId");
//		if(session.getAttribute("sId") == null) {
//			
//			model.addAttribute("msg", "접근권한이 없습니다!");
//			model.addAttribute("targetURL", "login");
//			
//			return "forward";
//		}
		
		System.out.println("수정전 : " + company);
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
		company.setCom_breakStart_time(company.getStartHour() + ":" + company.getStartMin());
		company.setCom_breakEnd_time(company.getEndHour() + ":" + company.getEndMin());
		
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
		
		System.out.println("수정 후 : " + company);
		
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
	public String company_closeRegist(HttpSession session, Model model, @RequestParam(defaultValue = "")String com_num) {
		String sId = (String)session.getAttribute("sId");
//		if(session.getAttribute("sId") == null) {
//			
//			model.addAttribute("msg", "접근권한이 없습니다!");
//			model.addAttribute("targetURL", "login");
//			
//			return "forward";
//		}
		
		
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
	public String ceo_company_ad(HttpSession session, Model model, @RequestParam(defaultValue = "")String com_num) {
		String sId = (String)session.getAttribute("sId");
//		if(session.getAttribute("sId") == null) {
//			
//			model.addAttribute("msg", "접근권한이 없습니다!");
//			model.addAttribute("targetURL", "login");
//			
//			return "forward";
//		}
//		System.out.println(company.getCom_num());
		CompanyVO company = service.getEachCompany(com_num);
		
		model.addAttribute("com",company);
		
		return "ceo/ceo_company_ad";
	}
	
	@PostMapping("ceo/company/payAdPro")
	public String payAd(CompanyVO company, Model model, HttpSession session) {
		String sId = (String)session.getAttribute("sId");
//		if(session.getAttribute("sId") == null) {
//			
//			model.addAttribute("msg", "접근권한이 없습니다!");
//			model.addAttribute("targetURL", "login");
//			
//			return "forward";
//		}
		
		int updateAdGrade = service.registAd(company);
		
		if(updateAdGrade < 0) {
			model.addAttribute("msg", "광고 등록 실패!");
			return "fail_back";
		} else {
			return "redirect:view?com_num=" + company.getCom_num();
		}
	}
	
	
}
