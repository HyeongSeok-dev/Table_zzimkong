package com.table.zzimkong.service;

import java.util.List;

import org.springframework.beans.factory.annotation.*;
import org.springframework.stereotype.*;

import com.table.zzimkong.mapper.*;
import com.table.zzimkong.vo.*;

@Service
public class MypageService {
	// MemberMapper 객체 자동 주입
	@Autowired
	private MypageMapper mapper;
	
	// 회원정보 조회 요청
	public MemberVO getMember(MemberVO member) {
		return mapper.selectMember(member);
	}
	
	// 회원정보 수정 요청
	public int modifyMember(MemberVO member, String newPasswd) {
		// TODO Auto-generated method stub
		return mapper.updateMember(member, newPasswd);
	}
	
	// 닉네임 중복확인
	public MemberVO getUserNick(MemberVO member) {
		return mapper.selectUserNick(member);
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
