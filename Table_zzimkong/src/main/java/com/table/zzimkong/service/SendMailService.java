package com.table.zzimkong.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.table.zzimkong.handler.GenerateRandomCode;
import com.table.zzimkong.handler.SendMailClient;
import com.table.zzimkong.vo.MemberVO;

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
		String content = "<a href='http://c5d2308t2.itwillbs.com/Table_zzimkong/MemberEmailAuth?user_email=" + member.getUser_email() + "&auth_code=" + auth_code + "'>"
							+ "이메일 인증을 수행하려면 이 링크를 클릭해 주세요!</a>";
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
		String content = "<a href='http://c5d2308t2.itwillbs.com/Table_zzimkong/MemberEmailAuth?user_id=" + member.getUser_id() + "&auth_code=" + auth_code + "'>"
				+ "이메일 인증을 수행하려면 이 링크를 클릭해 주세요!</a>";
		new Thread(new Runnable() {
			@Override
			public void run() {
				mailClient.sendMail(member.getUser_email(), subject, content);
			}
		}).start();
		
		// 발송된 인증코드 리턴
		return auth_code;
	}
}
