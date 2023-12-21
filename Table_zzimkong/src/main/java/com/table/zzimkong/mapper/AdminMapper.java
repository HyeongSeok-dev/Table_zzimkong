package com.table.zzimkong.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.table.zzimkong.vo.MemberVO;

@Mapper
public interface AdminMapper {

	// 관리자 - 회원목록 조회
	List<MemberVO> selectAdminMemberList();


	




}
