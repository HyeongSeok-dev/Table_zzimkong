package com.table.zzimkong.mapper;

import org.apache.ibatis.annotations.*;

import com.table.zzimkong.vo.*;

@Mapper
public interface MemberMapper {

	int insertMember(MemberVO member);

	//회원 아이디정보 조회 요청
	MemberVO selectId(MemberVO member);

	//회원 닉네임정보 조회 요청
	MemberVO selectNick(MemberVO member);
	
} //MemberMapper
