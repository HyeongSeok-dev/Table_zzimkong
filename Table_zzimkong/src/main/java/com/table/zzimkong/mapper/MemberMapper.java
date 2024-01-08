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

	MailAuthInfoVO selectMailAuthInfo(String id);

	void insertMailAuthInfo(String id, String auth_code);

	void updateMailAuthInfo(String id, String auth_code);

	void updateMailAuthStatus(String user_id);

	void deleteMailAuthInfo(String user_id);


	
} //MemberMapper
