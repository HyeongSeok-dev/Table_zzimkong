package com.table.zzimkong.controller;


import java.time.LocalDate;
import java.time.LocalTime;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {

	@GetMapping("/")
	public String main(Model model) {
		if(model.getAttribute("persons")==null) {
			model.addAttribute("persons", 2);
			model.addAttribute("display_date", "내일");
			model.addAttribute("date", LocalDate.now().plusDays(1));
			model.addAttribute("time", "오후 7시");
		}
		return "main";
	}

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
	
	@GetMapping("ceo/company/list")
	public String ceo_company_list() {
		return "ceo/ceo_company_list";
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
	
	@GetMapping("ceo/reservation")
	public String ceo_reservation() {
		return "ceo/ceo_reservation";
	}
	
	@GetMapping("ceo/reservation/detail")
	public String ceo_reservation_detail() {
		return "ceo/ceo_reservation_detail";
	}
	
	@GetMapping("ceo/cs/faq")
	public String ceo_cs() {
		return "ceo/ceo_cs_faq";
	}
	
	@GetMapping("payment/info")
	public String payment_info() {
		return "payment/payment_info";
	}
	
	@GetMapping("payment")
	public String payment() {
		return "payment/payment";
	}
	
	@GetMapping("admin/main")
	public String admin_main() {
		return "admin/admin_main";
	}
	
	@GetMapping("admin/user")
	public String admin_user() {
		return "admin/admin_user";
	}
	
	@GetMapping("admin/company")
	public String admin_company() {
		return "admin/admin_company";
	}
	
	@GetMapping("admin/company/info")
	public String admin_company_info() {
		return "admin/admin_company_info";
	}
	
	@GetMapping("admin/review")
	public String admin_review() {
		return "admin/admin_review";
	}
	
	@GetMapping("admin/review/detail")
	public String admin_review_detail() {
		return "admin/admin_review_detail";
	}
	
	@GetMapping("join")
	public String join() {
		return "join/join";
	}
	
	@GetMapping("join/ceo")
	public String join_ceo() {
		return "join/join_ceo";
	}
	
	@GetMapping("join/choice")
	public String join_choice() {
		return "join/join_choice";
	}
	
	@GetMapping("login")
	public String login() {
		return "login/login";
	}
	
	@GetMapping("login/find/id")
	public String login_find_id() {
		return "login/login_find_id";
	}
	
	@GetMapping("login/find/passwd")
	public String login_find_passwd() {
		return "login/login_find_passwd";
	}
	
	@GetMapping("my/list")
	public String my_list() {
		return "mypage/my_list";
	}
	
	@GetMapping("my/review")
	public String my_review() {
		return "mypage/my_review";
	}
	
	@GetMapping("my/report/shop")
	public String my_report_shop() {
		return "mypage/my_report_shop";
	}
	
	@GetMapping("my/report/reason")
	public String my_report_reason() {
		return "mypage/my_report_reason";
	}
	
	@GetMapping("my/modify/profile")
	public String my_modify_profile() {
		return "mypage/my_modify_profile";
	}
	
	@GetMapping("my/unregister")
	public String my_unregister() {
		return "mypage/my_unregister";
	}
	
	@GetMapping("my/check/passwd")
	public String my_check_passwd() {
		return "mypage/my_check_passwd";
	}
	
	@GetMapping("my/qna")
	public String my_qna() {
		return "mypage/my_qna";
	}
	
	@GetMapping("my/point")
	public String my_point() {
		return "mypage/my_point";
	}
	
	@GetMapping("review/detail")
	public String review_detail() {
		return "review/review_detail";
	}
	
	@GetMapping("review/write")
	public String review_write() {
		return "review/review_write";
	}
	
	@GetMapping("review/complete")
	public String review_complete() {
		return "review/review_complete";
	}
	
	@GetMapping("review/report")
	public String review_report() {
		return "review/review_report";
	}
	
	@GetMapping("reservation")
	public String reservation() {
		return "reservation/reservation";
	}
	
}
