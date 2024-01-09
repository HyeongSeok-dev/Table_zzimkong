package com.table.zzimkong.service;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.table.zzimkong.handler.GenerateRandomCode;
import com.table.zzimkong.handler.SendMailClient;
import com.table.zzimkong.vo.CompanyVO;
import com.table.zzimkong.vo.MemberVO;
import com.table.zzimkong.vo.PaymentInfo;
import com.table.zzimkong.vo.PaymentVO;
import com.table.zzimkong.vo.ReservationVO;

@Service
public class SendMailService {
	@Autowired
	private SendMailClient mailClient;
	
	// 인증 메일 발송 요청을 위한 sendAuthMail() 메서드
	public String sendIdAuthMail(MemberVO member) {
		// 인증 메일에 포함시켜 전달할 난수 생성
		String auth_code = GenerateRandomCode.getRandomCode(50);
		System.out.println("생성된 난수 : " + auth_code);
		
		String subject = "[테이블 찜콩] 아이디 확인 메일입니다.";
		String content = "<a href='http://c5d2308t2.itwillbs.com/zzimkong/MemberIdEmailAuth?user_email=" + member.getUser_email() + "&auth_code=" + auth_code + "'>"
							+ "이메일 인증을 수행하려면 이 링크를 클릭해 주세요!</a>";
//		String content = "<a href='http://localhost:8081/zzimkong/MemberIdEmailAuth?user_email=" + member.getUser_email() + "&auth_code=" + auth_code + "'>"
//				+ "이메일 인증을 수행하려면 이 링크를 클릭해 주세요!</a>";
		new Thread(new Runnable() {
			@Override
			public void run() {
				mailClient.sendMail(member.getUser_email(), subject, content);
			}
		}).start();
		
		// 발송된 인증코드 리턴
		return auth_code;
	}
	
	// 인증 메일 발송 요청을 위한 sendAuthMail() 메서드
	public String sendPasswdAuthMail(MemberVO member) {
		// 인증 메일에 포함시켜 전달할 난수 생성
		String auth_code = GenerateRandomCode.getRandomCode(50);
		System.out.println("생성된 난수 : " + auth_code);
		
		String subject = "[테이블 찜콩] 비밀번호 확인 메일입니다.";
		String content = "<a href='http://c5d2308t2.itwillbs.com/zzimkong/MemberPasswdEmailAuth?user_id=" + member.getUser_id() + "&auth_code=" + auth_code + "'>"
				+ "이메일 인증을 수행하려면 이 링크를 클릭해 주세요!</a>";
//		String content = "<a href='http://localhost:8081/zzimkong/MemberPasswdEmailAuth?user_id=" + member.getUser_id() + "&auth_code=" + auth_code + "'>"
//				+ "이메일 인증을 수행하려면 이 링크를 클릭해 주세요!</a>";
		new Thread(new Runnable() {
			@Override
			public void run() {
				mailClient.sendMail(member.getUser_email(), subject, content);
			}
		}).start();
		
		// 발송된 인증코드 리턴
		return auth_code;
	}
	
	public void sendCheckInfoAuthMail(Map<String, Object> map) {
		// 인증 메일에 포함시켜 전달할 난수 생성
		System.out.println("sendEmail");
		MemberVO member =  (MemberVO)map.get("member");
		CompanyVO com = (CompanyVO)map.get("com");
		ReservationVO res = (ReservationVO)map.get("res");
		PaymentVO payment = (PaymentVO)map.get("payment");
		PaymentInfo paymentInfo = (PaymentInfo)map.get("paymentInfo");
		
		
		String subject = "[테이블 찜콩] 예약 완료 메일입니다.";
		String content = "<h1>[테이블 찜콩] 예약이 완료되었습니다.</h1>"
				+ "<h1>이용해 주셔서 감사합니다.</h1>"
				+ "<h2>[예약정보]</h2>"
				+ "<h3>업체명 : " + com.getCom_name() + "</h3>"
				+ "<h3>주소 : " + com.getCom_address() + "</h3>"
				+ "<h3>예약날짜 : " + res.getRes_date() + "</h3>"
				+ "<h3>시간 : " + res.getRes_time() + "</h3>"
				+ "<h3>방문자명 : " + res.getRes_name() + "</h3>"
				+ "<h3>전화번호 : " + res.getRes_phone() + "</h3>"
				+ "<h3>인원수 : " +  res.getRes_person() + "</h3>"
				+ "<h3>요청사항 : " +  res.getRes_request() + "</h3>"
				+ "<br>"
				+ "<h2>[결제정보]</h2>"
				+ "<h3>결제번호 : " +  payment.getPay_num() + "</h3>"
				+ "<h3>이름 : " +  member.getUser_name() + "</h3>"
				+ "<h3>결제일시 : " +  paymentInfo.getPaymentDate() + "</h3>"
				+ "<h3>결제수단 : " +  paymentInfo.getPayMethod() + "</h3>"
				+ "<h3>총 결제금액 : " +  paymentInfo.getMenuTotalPrice() + "</h3>"
				+ "<h3>결제금액 상세 내역</h3>"
				+ "&nbsp;&nbsp;<b>- 총 예약금 : " +  paymentInfo.getRes_table_price() + "</b><br>"
				+ "&nbsp;&nbsp;<b>- 총 선주문금 : " +  paymentInfo.getMenuTotalPrice() + "</b><br>"
				+ "<br><br>"
				+ "(주)테이블찜콩<br>"
				+ "대표 : 이형석<br>"
				+ "주소 : 부산광역시 부산진구 동천로 109 삼한골든게이트빌딩 7층<br>"
				+ "고객센터 : 1544-7070 (9:00 ~ 18:00) ";
//		System.out.println("email : " + member.getUser_email());
		new Thread(new Runnable() {
			@Override
			public void run() {
				mailClient.sendMail( member.getUser_email(), subject, content);
			}
		}).start();
		
	}
}
