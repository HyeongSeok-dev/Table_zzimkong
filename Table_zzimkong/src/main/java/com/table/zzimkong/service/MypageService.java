package com.table.zzimkong.service;

import java.util.List;

import org.springframework.beans.factory.annotation.*;
import org.springframework.stereotype.*;

import com.table.zzimkong.mapper.*;
import com.table.zzimkong.vo.*;

@Service
public class MypageService {
	// MypageMapper 객체 자동 주입
	@Autowired
	private MypageMapper mapper;
	
	// 회원정보 조회 요청
	public MypageVO getMypage(MypageVO mypage) {
		return mapper.selectMypage(mypage);
	}
	
	// 회원정보 수정 요청
	public int modifyMypage(MypageVO mypage, String newPasswd) {
		// TODO Auto-generated method stub
		return mapper.updateMypage(mypage, newPasswd);
	}
	
	// 닉네임 중복확인
	public MypageVO getUserNick(MypageVO mypage) {
		return mapper.selectUserNick(mypage);
	}
	
	// 예약 내역 목록
	public List<ReservationVO> getResList(int sIdx) {
		// TODO Auto-generated method stub
		return mapper.selectResList(sIdx);
	}

//	public CompanyVO getComName(ReservationVO res) {
		// TODO Auto-generated method stub
//		return mapper.selectCom(res);
//	}

}
