package com.table.zzimkong.handler;

import javax.mail.Authenticator;
import javax.mail.PasswordAuthentication;

public class GoogleMailAuthenticator extends Authenticator {
	// 인증정보(아이디, 패스워드(앱 비밀번호))를 관리할 javax.mail.PasswordAuthentication 타입 변수 선언
	PasswordAuthentication passwordAuthentication;
	
	// 기본 생성자 정의
	public GoogleMailAuthenticator() {
		/*
		 * 인증에 사용될 아이디와 패스워드를 갖는 PasswordAuthentication 객체 생성
		 * - 파라미터 : 메일 서버 계정명, 패스워드
		 *   => Gmail 기준 2단계 인증 미사용 시 : Gmail 계정명(@Gmail.com 생략), Gmail 계정 패스워드
		 *   => Gmail 기준 2단계 인증 사용 시 : Gmail 계정명(@Gmail.com 생략), 2단계 인증 우회 앱 비밀번호
		 *   => 구글 계정 설정 - 보안 - 2단계 인증 - 앱 비밀번호 설정 필요
		 *      (설정 시 나타나는 16자리 앱 비밀번호를 계정 패스워드 대신 사용(로그인 시에는 사용 불가)
		 */
		passwordAuthentication = new PasswordAuthentication("tablezzimkong", "xocjrunmvykqlrxx");
	}

	// 인증 정보 관리 객체(PasswordAuthentication)를 외부로 리턴하는 getPasswordAuthentication() 메서드 정의
	// => 주의! Getter 메서드 정의 시 멤버변수명에 따라 메서드명이 달라질 수 있는데
	//    외부에서 이 메서드를 직접 호출하는 것이 아니라 객체 내에서 자동으로 호출되므로
	//    미리 약속된 메서드명으로 메서드 정의 필수!
	// => Authenticator 클래스의 getPasswordAuthentication() 메서드 오버라이딩하여 정의할 것!
	@Override
	protected PasswordAuthentication getPasswordAuthentication() {
		return passwordAuthentication;
	}
}
