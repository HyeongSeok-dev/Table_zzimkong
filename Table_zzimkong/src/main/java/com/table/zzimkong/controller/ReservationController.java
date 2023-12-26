package com.table.zzimkong.controller;

import java.util.List;
import java.util.Map;
import java.util.Random;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;

import com.table.zzimkong.service.ReservationService;
import com.table.zzimkong.vo.MenuList;
import com.table.zzimkong.vo.MenuVO;
import com.table.zzimkong.vo.PreOrderVO;
import com.table.zzimkong.vo.ReservationVO;

@Controller
public class ReservationController {
	
	@Autowired
	private ReservationService service;
	
	
	@RequestMapping("reservation")
	public String reservation(HttpSession session, Model model) {
		// 세션 아이디가 없을 경우 "fail_back" 페이지를 통해 "잘못된 접근입니다" 출력 처리
		ReservationVO res = (ReservationVO) session.getAttribute("res");
	    List<MenuVO> menuList = (List<MenuVO>) session.getAttribute("menuList");
	    session.setAttribute("res", null);
	    session.setAttribute("menuList", null);
		
		session.setAttribute("sId", "이재환");
		session.setAttribute("sPhone", "010-46744-772");
		
		String sId = (String) session.getAttribute("sId");
		if(session.getAttribute("sId") == null) {
			model.addAttribute("msg", "로그인이 필요합니다");
			// targetURL 속성명으로 로그인 폼 페이지 서블릿 주소 저장
			model.addAttribute("targetURL", "MemberLoginForm");
			return "login/login";
		}
		

        
		res.setRes_idx(1);
		res.setRes_num("dsada");
		res.setCom_id(1);
		res.setUser_idx(1);
		res.setRes_table_price(20000);
		res.setRes_person(2);
		res.setRes_status(false);
		res.setRes_name("이재환");
		res.setRes_phone("010-1234-1234");
		
		model.addAttribute("res", res);
		
		System.out.println(res);
		
		return"reservation/reservation";
	}
	
	@RequestMapping("reservationPro")
	public String reservationPro(HttpSession session, ReservationVO res, Model model, PreOrderVO pre, MenuVO menu) {
		
		String alphanumeric = "ABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789";
        StringBuilder sb = new StringBuilder();
        Random random = new Random();
        
//        menu.setMenu_idx(1);
        
        for (int i = 0; i < 7; i++) {
            int index = random.nextInt(alphanumeric.length());
            char randomChar = alphanumeric.charAt(index);
            sb.append(randomChar);
        }
        
        String res_num = sb.toString();
        System.out.println(res_num);
        res.setRes_num(res_num);
        
        int insertCount = service.registResvation(res, pre, menu);
//        int insertCount = service.insertReservation(res);
        

		return"";
	}
}
