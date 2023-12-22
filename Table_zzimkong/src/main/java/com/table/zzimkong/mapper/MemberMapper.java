package com.table.zzimkong.mapper;

import org.apache.ibatis.annotations.*;

import com.table.zzimkong.vo.*;

@Mapper
public interface MemberMapper {

	int insertMember(MemberVO member);

	MemberVO selectMember(MemberVO member);

	
} //MemberMapper
