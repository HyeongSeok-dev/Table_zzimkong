package com.table.zzimkong.mapper;

import org.apache.ibatis.annotations.*;

import com.table.zzimkong.vo.*;

@Mapper
public interface MypageMapper {
	
	// 회원정보 조회
	MemberVO selectMember(MemberVO member);
}
