package com.table.zzimkong.controller;

import javax.servlet.http.HttpSession;
import java.text.NumberFormat;
import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.table.zzimkong.service.PaymentService;
import com.table.zzimkong.service.SendMailService;
import com.table.zzimkong.vo.CompanyVO;
import com.table.zzimkong.vo.MailAuthInfoVO;
import com.table.zzimkong.vo.MemberVO;
import com.table.zzimkong.vo.PaymentInfo;
import com.table.zzimkong.vo.PaymentVO;
import com.table.zzimkong.vo.PreOrderInfo;
import com.table.zzimkong.vo.ReservationVO;

@Controller
public class PaymentController {
	
	@Autowired
	private PaymentService service;
	@Autowired
	private SendMailService mailService;
		
	@GetMapping("payment/agree")
	public String paymentAgree() {
		return"payment/payment_agree";
	}
	
	@GetMapping("payment")
	public ModelAndView payment(HttpSession session, Map<String, Object> map,
								 ReservationVO res, CompanyVO company) {
		System.out.println("payment");
		ModelAndView mav; 
		// 세션에 로그인이 안되어있다면 접근금지
		String sId = (String)session.getAttribute("sId");
		if(sId == null) {
			
			map.put("msg", "접근권한이 없습니다!");
			map.put("targetURL", "login");
			
			mav = new ModelAndView("forword", "map", map);
			return mav;
		}
		// session에 들어간  reservationVO 불러오기
		// 나중에 예약완성되면 확인하기
//		res = ((ReservationVO)session.getAttribute("res")
//		session.setAttribute("res", null);
		
		// [ 회원정보조회 ]
		MemberVO member = service.getMember(sId);
		
		// [ 예약정보조회 ]
		res = service.getReservation(res);
		System.out.println("res : " + res);
		//테이블 예약금액에 천단위 쉼표줌
		NumberFormat numberFormat = NumberFormat.getInstance();
		String res_table_price = numberFormat.format(res.getRes_table_price());
		
		// [예약정보중 사업장정보 조회]
		company = service.getCompany(res);
		System.out.println("company" + company);
		
		// [예약정보중 선주문정보 조회]
		// 1. PreOrderInfo객체를 생성해서 join문으로 메뉴테이블 정보까지 받아옴
		List<PreOrderInfo> poiList = service.getPreOrderInfo(res);
		System.out.println(poiList);
		// 2. 각 메뉴의 가격과 갯수를 곱한 결과를 저장함
		int eachMenuTotalPriceInt = 0;
		int menuTotalPriceInt = 0;
		for(PreOrderInfo preOrderInfo : poiList) {
			System.out.println("preOrderInfo : " + preOrderInfo);
			// [선주문정보와 메뉴정보를 이용해서 결제할 가격 구하기 ] 
//			System.out.println(" Integer.parseInt(preOrderInfo.getMenu_price()) : " + Integer.parseInt(preOrderInfo.getMenu_price()));
//			System.out.println("preOrderInfo.getPre_num() : " + preOrderInfo.getPre_num());
			eachMenuTotalPriceInt = (Integer.parseInt(preOrderInfo.getMenu_price()) * preOrderInfo.getPre_num());
			menuTotalPriceInt += eachMenuTotalPriceInt;
			String eachMenuTotalPrice = numberFormat.format(eachMenuTotalPriceInt);
			preOrderInfo.setEachMenuTotalPrice(eachMenuTotalPrice);
//			System.out.println("eachMenuTotalPriceInt : " + eachMenuTotalPriceInt);
//			System.out.println("count : " + count);
		}
		
		// 3. 선주문한 총 가격
		System.out.println("menuTotalPriceInt : " + menuTotalPriceInt);
		// 4. paymentInfo 객체로 넣기전에 정수인 수에 천단위로 쉼표를 넣어서 문자열타입으로 만듬
		String totalPrice = numberFormat.format(res.getRes_table_price() + menuTotalPriceInt);
		String menuTotalPrice = numberFormat.format(menuTotalPriceInt);
		System.out.println(poiList);
		//--------------------------------------------------------------------
		
		//[ 사용가능 포인트 조회 ]
		// 디비에서 가지고 올 때 String 타입으로 가지고 와서 변환해줌
		String dbPoint = service.getPoint(res);
		System.out.println("dbPoint" + dbPoint);
		String totalPoint = "";
		if(dbPoint == null  || Integer.parseInt(dbPoint) < 0) {
			totalPoint = "0";
		} else {
			totalPoint = numberFormat.format(Integer.parseInt(dbPoint));
		}
		
//		// 0.결제번호 무작위생성 -- api연결하면서 필요 없어짐
//		// 날짜 정보 가지고옴
//		LocalDate date = LocalDate.now();
//		// 년월일 따로 가지고옴
//		int year = date.getYear();
//		int month = date.getMonthValue();
//		int day = date.getDayOfMonth();
////		System.out.println("year : " + year);
////		System.out.println("month : " + month);
////		System.out.println("day : " + day);
//		// 무작위 번호앞에 년월일 붙여서 결제번호생성
//		String pay_num = "P" + year +( month + (day + UUID.randomUUID().toString().substring(0,7)));
//		System.out.println("payNum : " + pay_num);
		
		//--------------------------------------------------------------------
		// [ PaymentInfo 객체에 문자열 타입으로 파라미터 전달]
		PaymentInfo paymentInfo = new PaymentInfo(menuTotalPrice,totalPrice,totalPoint,res_table_price);
		System.out.println("-- " + paymentInfo);
		System.out.println("-- " + poiList);
		System.out.println("== " + res);
		
		// 예약조회, 포인트조회,사업장정보조회,선주문조회 
		map.put("res", res);
		map.put("paymentInfo", paymentInfo);
		map.put("com", company);
		map.put("poi", poiList);
		map.put("member", member);

		mav = new ModelAndView("payment/payment", "map", map);
		System.out.println(mav);
		return mav;
	}
	//============================================================================
	@ResponseBody
	@PostMapping("paymentPro")
	public String paymentPro(HttpSession session, @RequestParam Map<String, String> map, Model model) {
		
		// ajax로 파라미터를 받을 때 map객체를 사용해서 받음
		System.out.println("paymentPro");
		System.out.println("map : " + map);
		System.out.println("-");
		
		int sIdx = (int)session.getAttribute("sIdx");
		// 데이터베스에 들고갈 paymentVO객체 생성
		PaymentVO payment = new PaymentVO();
		
//		// 세션에 로그인이 안되어있다면 접근금지
//		if(session.getAttribute("sId") == null) {
//
//			model.addAttribute("msg", "접근권한이 없습니다!");
//			model.addAttribute("targetURL", "login");
//			
//			return "forward";
//		}
		
		// 무통장 입금시 결제번호 생성
//		int pay_method = Integer.parseInt(map.get("pay_method"));
//		if(pay_method == 4) {
//			// 결제번호 무작위생성
//			// 날짜 정보 가지고옴
//			LocalDate date = LocalDate.now();
//			// 년월일 따로 가지고옴
//			int year = date.getYear();
//			int month = date.getMonthValue();
//			int day = date.getDayOfMonth();
//		System.out.println("year : " + year);
//		System.out.println("month : " + month);
//		System.out.println("day : " + day);
			// 무작위 번호앞에 년월일 붙여서 결제번호생성
//			String pay_num = "P" + year +( month + (day + UUID.randomUUID().toString().substring(0,7)));
//			System.out.println("payNum : " + pay_num);
//			payment.setPay_num(pay_num);
//		}
//		payment.setPay_method(pay_method);
		
//		System.out.println("--payment : " + payment);
		// [ 예약번호로 예약정보 조회하기 ] --------------------------------
		ReservationVO res = new ReservationVO();
		res.setRes_num((String)map.get("res_num"));
		
		// payment 뷰페이 로딩시 사용하기 때문에 reservationVO객체에 넣어서 사용
		res = service.getReservation(res);
		System.out.println("---res : "+res);
		//---------------------------------------------------------------------
		
		
		// [ 결제정보를 데이터 베이스에 저장하기 위한 데이터정리 ] -------------
		
		// 2. 천단위 쉼표제거 후 형변환뒤 payment객체에 넣어줌
		System.out.println("pay_po_price_String 변환전 : " + (String)map.get("preOrderTotalPrice"));
		System.out.println("0원결제 : " + (((String)map.get("preOrderTotalPrice")).length() == 0));
		
		// controller에서만 판별하기 위한 pay_on_sit =1 : 선주문없음 pay_on_sit = 2 : 선주문있음 
		if(map.get("preOrderTotalPrice").equals("선주문 없음")) {
			payment.setPay_po_price(0); 
			payment.setPay_on_site(1); // 선주문 없음
		} else if(map.get("preOrderTotalPrice").equals("0")) {
			payment.setPay_po_price(0); 
			payment.setPay_on_site(2); // 선주문있는데 현장에서 결제함
		} else {
			if(((String)map.get("preOrderTotalPrice")).length() != 0) { //
				int pay_po_price = Integer.parseInt(((String)map.get("preOrderTotalPrice")).trim().replace(",", ""));
				payment.setPay_po_price(pay_po_price);
				payment.setPay_on_site(3); // 선주문있는데 선결제함
			} 
		}
		System.out.println("Pay_po_price : " + payment.getPay_po_price());
		System.out.println("Pay_on_site : " + payment.getPay_on_site());
		 
		payment.setPay_num((String)map.get("pay_num"));
		
		if(map.get("pay_method") != null) {
			payment.setPay_method(Integer.parseInt(map.get("pay_method")));
		} else {
			payment.setPay_method(0);
		}
		
		payment.setPay_per_price(Integer.parseInt(map.get("pay_per_price")));
		
		if(((String)map.get("per_info_consent")).equals("on")) {
			payment.setPer_info_consent(true);
		} else {
			payment.setPer_info_consent(false);
		}
		
		if(payment.getPay_method() == 2) {
			System.out.println("-----------------카드결제함");
			payment.setPay_card_co((String)map.get("pay_card_co"));
			System.out.println("z카드회사 : " + payment.getPay_card_co());
		}
		
		if(map.get("pay_num") == "") {
			// 결제번호 무작위생성
			// 날짜 정보 가지고옴
			LocalDate date = LocalDate.now();
			// 년월일 따로 가지고옴
			int year = date.getYear();
			int month = date.getMonthValue();
			int day = date.getDayOfMonth();
			System.out.println("year : " + year);
			System.out.println("month : " + month);
			System.out.println("day : " + day);
			// 무작위 번호앞에 년월일 붙여서 결제번호생성
			String pay_num = "P" + year +( month + (day + UUID.randomUUID().toString().substring(0,7)));
			System.out.println("payNum : " + pay_num);
			payment.setPay_num(pay_num);
		}
		
//		System.out.println(pay_po_price); // 0 => 현장결제가 있거나 선주문이 없음
		System.out.println(payment);
		System.out.println(res);
		System.out.println(map.get("discountPoint"));
		System.out.println(map.get("earnedPoints"));
		System.out.println("-----");
		System.out.println(map.get("pay_card_co"));
		
		// 3. paymentInfo 에서 discountPoint 와 earnedPoints가 String 타입이기 때문에 형변환을 하고 넣어줘야함
		int discountPoint = 0;
		int earnedPoints = 0;
		if(map.get("discountPoint") != "" && map.get("earnedPoints") != "") {
			discountPoint = Integer.parseInt("-"+((String)map.get("discountPoint")).replace(",", "").trim());
			earnedPoints = Integer.parseInt(((String)map.get("earnedPoints")).replace(",", "").trim());
		}
		System.out.println("사용포인트, 적립포인트 인트타입 변환 " + discountPoint + ", " + earnedPoints);
		System.out.println("-----포인트처리");
		
		// [ 결제정보 insert ]
		int insertCount = service.paymentSuccess(res,sIdx,payment); //res의 res_table_price와pay_per_price같음
			PaymentVO pay = service.getPayment(res);
		if(insertCount > 0) {
			// 1-1. 3번 성공시 예약테이블에서 결제완료상태로 표시 변경 update (res_pay_status = 1)

			int updateReservationStatus = service.payStatusChange(res);
			if(updateReservationStatus == 0) {
				System.out.println("예약상태변경 실패!");
				return "true";
			}
//			
//			// 1-2. 사용한 포인트 insert (point_category = 4) //discountPoint(paymentInfo 객체에서 int로 변환)
			if(discountPoint < 0) { //discountPoint값을 음수로 변경했음
				
				int insertSubUsedPoint = service.subUsedPoint(sIdx, discountPoint, pay.getPay_idx());
				if(insertSubUsedPoint == 0) {
					System.out.println("사용한 포인트 내역 변경실패!");
					return "true";
				}
			}
//			
			// 1-3. 결제로 인한 적립 포인트 insert  (point_category = 1) //earnedPoints(paymentInfo 객체에서 int로 변환)
			if(earnedPoints > 0) {
				
				int insertAddPoint = service.addPoint(sIdx, earnedPoints, pay.getPay_idx());
				if(insertAddPoint == 0) {
					System.out.println("적립포인트 적립 실패!");
					return "true";
				}
			}
//			mav = new ModelAndView();
//			mav.setViewName("redirect:/payment/info?res_num=" + res.getRes_num()
//			+ "&discountPoint=" + paymentInfo.getDiscountPoint() 
//			+ "&earnedPoints=" + paymentInfo.getEarnedPoints()
//			+ "&finalTotalPayment=" + paymentInfo.getTotalPayment()
//			+ "&pay_num=" + payment.getPay_num()
//			);
			return "true";
//		
		} else {
			return "false";
		}
	}
	//---------------------------------------------------------------------------------------------------------------
	@GetMapping("payment/info")
	public ModelAndView paymentInfo(HttpSession session, Map<String, Object> map
			,@RequestParam(defaultValue = "") String res_num,  @RequestParam(defaultValue = "")String discountPoint
			,@RequestParam(defaultValue = "")String earnedPoints, @RequestParam(defaultValue = "") String finalTotalPayment
			) {
//		session.setAttribute("sId", "user02");

		ModelAndView mav; 
		// 세션에 로그인이 안되어있다면 접근금지
		if(session.getAttribute("sId") == null) {
			
			map.put("msg", "접근권한이 없습니다!");
			map.put("targetURL", "login");
			
			mav = new ModelAndView("forword", "map", map);
			return mav;
		}
		
		String sId = (String)session.getAttribute("sId");
		// 1. 회원, 예약, 결제, 사업장정보 조회
		MemberVO member = service.getMember(sId);
		ReservationVO res = service.getResultRes(res_num);
		CompanyVO company = service.getCompany(res);
		PaymentVO payment = service.getPayment(res);
		System.out.println(payment.getPay_method());
		System.out.println("예약자 이름" + res.getRes_name());
		// 결제수단 넣기
		String payMethod = "";
		switch (payment.getPay_method()) {
		case 1:
			payMethod = "카카오페이";
			break;
		case 2:
			payMethod = "카드 결제";
			break;
		case 3:
			payMethod = "휴대폰 결제";
			break;
		}
		
		//테이블 예약금액에 천단위 쉼표줌
		NumberFormat numberFormat = NumberFormat.getInstance();
		String res_table_price = numberFormat.format(res.getRes_table_price());
		
		
		// [예약정보중 선주문정보 조회]
		// PreOrderInfo객체를 생성해서 join문으로 메뉴테이블 정보까지 받아옴
		List<PreOrderInfo> poiList = service.getPreOrderInfo(res);
		System.out.println(poiList);
		// 각 메뉴의 가격과 갯수를 곱한 결과를 저장함
		int eachMenuTotalPriceInt = 0;
		int menuTotalPriceInt = 0;
		for(PreOrderInfo preOrderInfo : poiList) {
			// [선주문정보와 메뉴정보를 이용해서 결제할 가격 구하기 ] 
			// [선주문 정보중 메뉴정보 조회]
			// 1. 개수를 곱한 메뉴가격 
			eachMenuTotalPriceInt = (Integer.parseInt(preOrderInfo.getMenu_price()) * preOrderInfo.getPre_num());
			menuTotalPriceInt += eachMenuTotalPriceInt;
			String eachMenuTotalPrice = numberFormat.format(eachMenuTotalPriceInt);
			preOrderInfo.setEachMenuTotalPrice(eachMenuTotalPrice);
		
//			System.out.println("preOrderInfo : " + preOrderInfo);
//			System.out.println(" Integer.parseInt(preOrderInfo.getMenu_price()) : " + Integer.parseInt(preOrderInfo.getMenu_price()));
//			System.out.println("preOrderInfo.getPre_num() : " + preOrderInfo.getPre_num());
//			System.out.println("count : " + count);
//			System.out.println("eachMenuTotalPriceInt : " + eachMenuTotalPriceInt);
		}
		
		// 2. 선주문한 총 가격
		// 3. paymentInfo 객체로 넣기전에 정수인 수에 천단위로 쉼표를 넣어서 문자열타입으로 만듬
		String totalPrice = numberFormat.format(res.getRes_table_price() + menuTotalPriceInt);
		String menuTotalPrice = numberFormat.format(menuTotalPriceInt);
//		System.out.println("menuTotalPriceInt : " + menuTotalPriceInt);
//		System.out.println(poiList);
		
		//--------------------------------------------------------------------
		// [날짜 형식 변환해서 뷰페이지 보내기]
		Date getPaymentDate = payment.getPay_date();
		String pattern = "yyyy/MM/dd(E) HH:mm:ss";
		SimpleDateFormat sdf = new SimpleDateFormat(pattern);
		String paymentDate = sdf.format(getPaymentDate);
		System.out.println("날짜 변환 완료 : " + paymentDate);
		
		//--------------------------------------------------------------------
		// [ PaymentInfo 객체에 문자열 타입으로 파라미터 전달]
		PaymentInfo paymentInfo = new PaymentInfo(menuTotalPrice,totalPrice,paymentDate,res_table_price,payMethod);
		// 예약조회, 포인트조회,사업장정보조회,선주문조회 
		
		map.put("res", res);
		map.put("member", member);
		map.put("paymentInfo", paymentInfo);
		map.put("com", company);
		map.put("payment", payment);
		map.put("poi", poiList);
		map.put("dPoint", discountPoint);
		map.put("ePoint", earnedPoints);
		map.put("ftp", finalTotalPayment);

		//예약결제완료 이메일 전송
		mailService.sendCheckInfoAuthMail(map);
		mav = new ModelAndView("payment/payment_info", "map", map);
		System.out.println(mav);
		return mav;
	}
	
//	@GetMapping("payment/checkInfoEmailAuth")
//	public String checkInfoEmailAuth(MailAuthInfoVO authInfoVO, HttpSession session, Model model, 
//														@RequestParam(defaultValue = "")String res_num) {
//
//		String sId = (String)session.getAttribute("sId");
//		// 세션에 로그인이 안되어있다면 접근금지
//		if(sId == null) {
//			
//			model.addAttribute("msg", "접근권한이 없습니다!");
//			model.addAttribute("targetURL", "login");
//			
//			return "forword";
//		}
//		// [ 회원 이메일 찾기 ]
//		MemberVO member = service.getMember(sId);
//		
//		// [ 예약정보 ]
//		ReservationVO res = service.getResultRes(res_num);
//		System.out.println("res : " + res);
//		
//		// [ 예약정보중  사업장정보 ]
//		CompanyVO company = service.getCompany(res);
//		System.out.println("company : " + company);
//		
//		// [ 결제정보 ] 
//		PaymentVO payment = service.getPayment(res);
//		
//		// 결제수단 넣기
//				String payMethod = "";
//				switch (payment.getPay_method()) {
//				case 1:
//					payMethod = "카카오페이";
//					break;
//				case 2:
//					payMethod = "네이버페이";
//					break;
//				case 3:
//					payMethod = "카드 결제";
//					break;
//				case 4:
//					payMethod = "무통장 입금";
//					break;
//				case 5:
//					payMethod = "휴대폰 결제";
//					break;
//				}
//		
//		// [ 선주문 정보 ]
//		//테이블 예약금액에 천단위 쉼표줌
//		NumberFormat numberFormat = NumberFormat.getInstance();
//		String res_table_price = numberFormat.format(res.getRes_table_price());
//		
//		// 정보 조회
//		List<PreOrderInfo> poiList = service.getPreOrderInfo(res);
//		System.out.println(poiList);
//		// 각 메뉴의 가격과 갯수를 곱한 결과를 저장함
//		int eachMenuTotalPriceInt = 0;
//		int menuTotalPriceInt = 0;
//		for(PreOrderInfo preOrderInfo : poiList) {
//			// [선주문정보와 메뉴정보를 이용해서 결제할 가격 구하기 ] 
//			// [선주문 정보중 메뉴정보 조회]
//			// 1. 개수를 곱한 메뉴가격 
//			eachMenuTotalPriceInt = (Integer.parseInt(preOrderInfo.getMenu_price()) * preOrderInfo.getPre_num());
//			menuTotalPriceInt += eachMenuTotalPriceInt;
//			String eachMenuTotalPrice = numberFormat.format(eachMenuTotalPriceInt);
//			preOrderInfo.setEachMenuTotalPrice(eachMenuTotalPrice);
//		
////			System.out.println("preOrderInfo : " + preOrderInfo);
////			System.out.println(" Integer.parseInt(preOrderInfo.getMenu_price()) : " + Integer.parseInt(preOrderInfo.getMenu_price()));
////			System.out.println("preOrderInfo.getPre_num() : " + preOrderInfo.getPre_num());
////			System.out.println("count : " + count);
////			System.out.println("eachMenuTotalPriceInt : " + eachMenuTotalPriceInt);
//		}
//		
//		// 2. 선주문한 총 가격
//		// 3. paymentInfo 객체로 넣기전에 정수인 수에 천단위로 쉼표를 넣어서 문자열타입으로 만듬
//		String totalPrice = numberFormat.format(res.getRes_table_price() + menuTotalPriceInt);
//		String menuTotalPrice = numberFormat.format(menuTotalPriceInt);
////		System.out.println("menuTotalPriceInt : " + menuTotalPriceInt);
////		System.out.println(poiList);
//		
//		//--------------------------------------------------------------------
//		// [날짜 형식 변환해서 뷰페이지 보내기]
//		Date getPaymentDate = payment.getPay_date();
//		String pattern = "yyyy/MM/dd(E) HH:mm:ss";
//		SimpleDateFormat sdf = new SimpleDateFormat(pattern);
//		String paymentDate = sdf.format(getPaymentDate);
//		System.out.println("날짜 변환 완료 : " + paymentDate);
//		
//		//--------------------------------------------------------------------
//		// [ PaymentInfo 객체에 문자열 타입으로 파라미터 전달]
//		PaymentInfo paymentInfo = new PaymentInfo(menuTotalPrice,totalPrice,paymentDate,res_table_price,payMethod);
//		// 예약조회, 포인트조회,사업장정보조회,선주문조회 
//		System.out.println(paymentInfo);
//		Map<String, Object> map = new HashMap<String, Object>();
//		
//		map.put("res", res);
//		map.put("member", member);
//		map.put("paymentInfo", paymentInfo);
//		map.put("com", company);
//		map.put("payment", payment);
//		
//		// 이메일발송
//		mailService.sendCheckInfoAuthMail(map);
//		
//		return "redirect:/";
//		
//	}
	
	
}
