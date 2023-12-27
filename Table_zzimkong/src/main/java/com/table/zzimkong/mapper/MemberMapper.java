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


	
} //MemberMapper
