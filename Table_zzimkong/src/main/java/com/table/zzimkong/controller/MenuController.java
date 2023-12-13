package com.table.zzimkong.controller;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.table.zzimkong.service.MenuService;
import com.table.zzimkong.vo.MenuList;

@Controller
public class MenuController {
	
	@Autowired
	private MenuService service;

	@GetMapping("menuForm")
	public String menuForm() {
		return "company/com_menu_form";
	}
	
	@PostMapping("menuFormPro")
	public String menuFormPro(@ModelAttribute MenuList menuList, Model model, @RequestParam int com_id) {
		 
		int updateCount = service.insertMenu(menuList, com_id);
		
		System.out.println(menuList);
		
		if(updateCount == 0) {
			model.addAttribute("msg","메뉴입력 실패!");
			return "fail_back";
		}
		return "redirect:/main";
	}

}
