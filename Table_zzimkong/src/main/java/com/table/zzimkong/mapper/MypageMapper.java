package com.table.zzimkong.mapper;

import java.util.List;

import org.apache.ibatis.annotations.*;

import com.table.zzimkong.vo.*;

@Mapper
public interface MypageMapper {
	
	// 회원정보 조회
	MypageVO selectMypage(MypageVO mypage);
	
	// 회원정보 수정
	// => 주의! 파라미터가 복수개일 경우 @Param 어노테이션 사용하여 파라미터 이름 지정 필수!
	int updateMypage(@Param("mypage") MypageVO mypage, @Param("user_passwd1") String newPasswd);
	
	// 닉네임 중복확인
	MypageVO selectUserNick(MypageVO mypage);
	
	// 예약 내역 조회
	List<ReservationVO> selectResList(int sIdx);

//	CompanyVO selectCom(ReservationVO res);
}
