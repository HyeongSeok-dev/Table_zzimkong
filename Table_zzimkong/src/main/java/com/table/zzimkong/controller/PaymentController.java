package com.table.zzimkong.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

@Controller
public class PaymentController {

	@GetMapping("payment/info")
	public String payment_info() {
		
		return "payment/payment_info";
	}
	
	@GetMapping("payment")
	public String payment() {
		
		return "payment/payment";
	}
}
