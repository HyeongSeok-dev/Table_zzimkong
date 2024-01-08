package com.table.zzimkong.mapper;

import org.apache.ibatis.annotations.*;

import com.table.zzimkong.vo.*;

@Mapper
public interface MemberMapper {

	//일반회원가입
	int insertMember(MemberVO member);

	MemberVO selectMember(MemberVO member);

	//회원탈퇴
	int updateWithdrawMember(MemberVO member);

	//업주회원가입
	int insertCeoMember(MemberVO member);
	
	//아이디 찾기
	MemberVO selectUserEmail(MemberVO member);
	
	// 메일 인증정보 조회
	MailAuthInfoVO selectMailAuthInfo(String id);
	
	// 새 인증정보 등록
	void insertMailAuthInfo(@Param("param")String param, @Param("auth_code")String auth_code, @Param("method")int method);
	
	// 기존 인증정보 갱신
	void updateMailAuthInfo(@Param("param")String param, @Param("auth_code")String auth_code, @Param("method")int method);
	
	// 기존 인증정보 갱신
	void updateMailAuthStatus(String user_id);
	
	// 기존 인증정보 삭제
	void deleteMailAuthInfo(String user_id);


	
} //MemberMapper
