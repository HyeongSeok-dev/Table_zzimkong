package com.table.zzimkong.controller;

import java.util.Map;
import java.io.File;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.List;
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
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.multipart.MultipartFile;

import com.google.protobuf.TextFormatParseInfoTree;
import com.table.zzimkong.service.CeoService;
import com.table.zzimkong.service.ProductService;
import com.table.zzimkong.vo.CompanyVO;
import com.table.zzimkong.vo.MenuList;
import com.table.zzimkong.vo.MenuVO;

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
	
	@GetMapping("ceo/reservation")
	public String ceo_reservation() {
		return "ceo/ceo_reservation";
	}
	
	@GetMapping("ceo/reservation/detail")
	public String ceo_reservation_detail() {
		return "ceo/ceo_reservation_detail";
	}
	
	@GetMapping("ceo/reservation/info")	
	public String ceo_reservation_info() {
		return "ceo/ceo_reservation_info";
	}
	
	// [company]--------------------------------------------------------------------------------------
	
	@GetMapping("ceo/company/register")
	public String companyRegisterForm(HttpSession session) {
//		if(session.getAttribute("sId") == null) {
//			
//			map.put("msg", "접근권한이 없습니다!");
//			map.put("targetURL", "login");
//			
//			mav = new ModelAndView("forward", "map", map);
//			return mav;
//		}
		return "ceo/ceo_company_register";
	}
	@GetMapping("ceo/company/registerPro")
	public String companyRegisterPro(HttpSession session, Model model, CompanyVO company) {
		
		String sId = (String)session.getAttribute("sId");
//		if(session.getAttribute("sId") == null) {
//			
//			model.addAttribute("msg", "접근권한이 없습니다!");
//			model.addAttribute("targetURL", "login");
//			
//			return "forward";
//		}
		
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
		
		// [영업시간/브레이크타임 시간분 합치기]
		company.setCom_open_time(company.getOpenHour() + " : " + company.getOpenMin());
		company.setCom_close_time(company.getCloseHour() + " : " + company.getCloseMin());
		company.setCom_breakStart_time(company.getStartHour() + " : " + company.getStartMin());
		company.setCom_breakEnd_time(company.getEndHour() + " : " + company.getEndMin());
		
		// 1.등록
		int insertCompany = service.registCompany(company, sId);
		
		if(insertCompany > 0) {
			
			try {
				// 업로드 된 파일들은 MultipartFile 객체에 의해 임시 디렉토리에 저장되며
				// 글쓰기 작업 성공 시 임시 디렉토리 -> 실제 디렉토리 이동 작업 필요
				// => MultipartFile 객체의 transferTo() 메서드를 호출하여 실제 위치로 이동(= 업로드)
				// => 파일이 선택되지 않은 경우(파일명이 널스트링) 이동이 불가능(예외 발생)하므로 제외
				// => transferTo() 메서드 파라미터로 java.io.File 타입 객체 전달
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
	public String comStatusChange(@RequestParam(defaultValue = "") String com_status, @RequestParam(defaultValue = "0") int com_num) {
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
	public String ceo_company_modify() {
		return "ceo/ceo_company_modify";
	}
	
	@GetMapping("ceo/company/ad")
	public String ceo_company_ad() {
		return "ceo/ceo_company_ad";
	}
	
	
}
