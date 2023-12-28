package com.table.zzimkong.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.table.zzimkong.service.CeoService;
import com.table.zzimkong.vo.MenuList;

@Controller
public class CeoController {

	@Autowired
	private CeoService service;
	
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
	public String ceo_menu_list() {
		return "ceo/ceo_menu_list";
	}
	
	@GetMapping("ceo/menu/modify")
	public String ceo_menu_modify() {
		return "ceo/ceo_menu_modify";
	}
	
	@GetMapping("ceo/menu/register")
	public String ceo_menu_register() {
		return "ceo/ceo_menu_register";
	}
	
	@PostMapping("ceo/menu/registerPro")
	public String menuFormPro(@ModelAttribute MenuList menuList, Model model, @RequestParam int com_id) {
		 
		int updateCount = service.insertMenu(menuList, com_id);
		
		System.out.println(menuList);
		
		if(updateCount == 0) {
			model.addAttribute("msg","메뉴입력 실패!");
			return "fail_back";
		}
		return "redirect:/";
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
	public String ceo_company_register() {
		
		return "ceo/ceo_company_register";
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
