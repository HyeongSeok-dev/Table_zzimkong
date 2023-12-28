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
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.multipart.MultipartFile;
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
	
	@GetMapping("ceo/company/list")
	public String ceo_company_list() {
		return "ceo/ceo_company_list";
	}
	
	@GetMapping("ceo/company/view")
	public String ceo_company_view() {
		return "ceo/ceo_company_view";
	}
	
	@GetMapping("ceo/company/register")
	public ModelAndView ceo_company_register(HttpSession session, Map<String,Object> map) {
		ModelAndView mav;
//		if(session.getAttribute("sId") == null) {
//			
//			map.put("msg", "접근권한이 없습니다!");
//			map.put("targetURL", "login");
//			
//			mav = new ModelAndView("forward", "map", map);
//			return mav;
//		}
		
		// 1.등록
		
		
		mav = new ModelAndView("ceo/ceo_company_register", "map", map);
		return mav;
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
