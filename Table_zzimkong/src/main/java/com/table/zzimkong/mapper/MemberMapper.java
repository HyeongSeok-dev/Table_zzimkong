package com.table.zzimkong.mapper;

import org.apache.ibatis.annotations.*;

import com.table.zzimkong.vo.*;

@Mapper
public interface MemberMapper {

	int insertMember(MemberVO member);

	//회원 상제정보 조회 요청
	MemberVO selectMember(MemberVO member);
	
} //MemberMapper
