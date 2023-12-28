package com.table.zzimkong.controller;

import java.util.ArrayList;
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
//	    session.setAttribute("res", null);
//	    session.setAttribute("menuList", null);
//        for (MenuVO menu : menuList) {
//            int total_price = menu.getMenu_price() * menu.getOrder_amount();
//            System.out.println(menu.getMenu_name() + "의 총 가격: " + total_price);
//        }
	    map.put("com", com);
        map.put("res", res);
	    map.put("menu", menuList);
	    
	    
	    System.out.println("업체정보" + com);
	    System.out.println("예약정보" + res);
	    System.out.println("메뉴" + menuList);
	    
	    
	    //[가게 ]
	    int sIdx = (Integer)session.getAttribute("sIdx");
	    res.setUser_idx(sIdx);
	    System.out.println(sIdx);
	    
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
//		res.setCom_id(1);
        com = service.getCompany(res);
        System.out.println(com);
        map.put("com", com);
        System.out.println("업체정보2" + com);
        
        // [예약선택정보 조회]

		
//		List<PreOrderInfo> poiList = service.getPreInfo(res);
//		
//		//[예약자 정보 조회]
		member = service.getUserInfo(res);
		System.out.println(res);
		map.put("member", member);
		
		
//		res = service.getreservation(res);

		
		
		mav = new ModelAndView("reservation/reservation", "map", map);
		return mav;
	}
	
	@RequestMapping("reservationPro")
	public ModelAndView reservationPro(HttpSession session, ReservationVO res, Map<String, Object> map, PreOrderVO pres, CompanyVO com, MenuVO menu) {
		ModelAndView mav;
		String alphanumeric = "ABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789";
        StringBuilder sb = new StringBuilder();
        Random random = new Random();
        
        
        for (int i = 0; i < 7; i++) {
            int index = random.nextInt(alphanumeric.length());
            char randomChar = alphanumeric.charAt(index);
            sb.append(randomChar);
        }
        
        String res_num = sb.toString();
        System.out.println(res_num);
        res.setRes_num(res_num);
        
        
        int insertCount = service.registResvation(res);
        
     
        map.put("res", res);
        map.put("com", com);
//        List<MenuVO> menuList = new ArrayList<MenuVO>();
//        menuList = (List<MenuVO>) map.get("menus");
//        session.setAttribute("res", res);
//	    session.setAttribute("menuList", menuList);
        mav = new ModelAndView("redirect:/payment", map);
		return mav;
	}
}
