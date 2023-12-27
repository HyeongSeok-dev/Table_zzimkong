package com.table.zzimkong.controller;

import java.util.List;
import java.util.Map;
import java.util.Random;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.table.zzimkong.service.ReservationService;
import com.table.zzimkong.vo.CompanyVO;
import com.table.zzimkong.vo.MemberVO;
import com.table.zzimkong.vo.MenuVO;
import com.table.zzimkong.vo.PreOrderInfo;
import com.table.zzimkong.vo.PreOrderVO;
import com.table.zzimkong.vo.ReservationVO;

@Controller
public class ReservationController {
	
	@Autowired
	private ReservationService service;
	
	
	@RequestMapping("reservation")
	public ModelAndView reservation(HttpSession session, Map<String, Object> map,
			ReservationVO res, PreOrderVO pre, MenuVO menu, CompanyVO com, MemberVO member) {
		

		res = (ReservationVO) session.getAttribute("res");
	    List<MenuVO> menuList = (List<MenuVO>) session.getAttribute("menuList");
	    session.setAttribute("res", null);
	    session.setAttribute("menuList", null);
	    
		// 임의의 값 넣어 접근권한 확인
		session.setAttribute("sId", "이재환");
		
		ModelAndView mav; 
		if(session.getAttribute("sId") == null) {
			map.put("msg", "로그인 후 사용가능!");
			map.put("targetURL", "login");
			mav = new ModelAndView("forward", "map", map);
			return mav;
		}
		
		
		//[가게이름 조회]
		res.setCom_id(1);
        com = service.getCompany(res);
        System.out.println(com);
        map.put("com", com);
        
        // [예약선택정보 조회]
//		res.setRes_idx(1);
//		res.setRes_num("dsada");
		res.setCom_id(1);
		res.setUser_idx(1);
//		res.setRes_date("12월 31일");
//		res.setRes_time("19시");
//		res.setRes_table_price(20000);
//		res.setRes_person(2);
//		res.setRes_status(false);
//		res.setRes_name("이재환");
//		res.setRes_phone("010-1234-1234");
		res = service.getReservation(res);
		System.out.println(res);
		map.put("res", res);
		
		List<PreOrderInfo> poiList = service.getPreInfo(res);
		
		
		member = service.getUserInfo(res);
		System.out.println(res);
		map.put("member", member);
		
		
//		res = service.getreservation(res);
//		model.addAttribute("com", com);
//		model.addAttribute("menu", menu);
//		model.addAttribute("pre", pre);
//		model.addAttribute("res", res);
		
		
		mav = new ModelAndView("reservation/reservation", "map", map);
		return mav;
	}
	
	@RequestMapping("reservationPro")
	public ModelAndView reservationPro(HttpSession session, ReservationVO res, Map<String, Object> map, PreOrderVO pres) {
		ModelAndView mav;
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
        
        
        int insertCount = service.registResvation(res);
//        int insertCount = service.insertReservation(res);
        
        mav = new ModelAndView("redirect:/payment", "map", map);
		return mav;
	}
}
