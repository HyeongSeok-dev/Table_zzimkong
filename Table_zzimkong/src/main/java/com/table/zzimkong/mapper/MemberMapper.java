package com.table.zzimkong.mapper;

import org.apache.ibatis.annotations.*;

import com.table.zzimkong.vo.*;

@Mapper
public interface MemberMapper {

	//일반회원가입
	int insertMember(MemberVO member);
	
	//로그인
	MemberVO selectMember(MemberVO member);

	//회원탈퇴
	int updateWithdrawMember(MemberVO member);

	//업주회원가입
	int insertCeoMember(MemberVO member);
	
	//정보찾기
	MemberVO selectValidMember(MemberVO member);

	MailAuthInfoVO selectMailAuthInfo(String param);

	void insertMailAuthInfo(@Param("param") String param, @Param("auth_code")String auth_code);

	void updateMailAuthInfo(@Param("param") String param, @Param("auth_code")String auth_code);

	// 기존 인증정보 삭제
	void deleteMailAuthInfo(String param);

	int updatePasswd(MemberVO member);

	MailAuthInfoVO selectVailidMailAuthInfo(MailAuthInfoVO authInfo);

	void selectIdAuthInfo(MailAuthInfoVO authInfo);
	
	// 아이디 가져와서 이메일 매칭
	MemberVO selectIdAuth(MailAuthInfoVO authInfo);






	
} //MemberMapper
