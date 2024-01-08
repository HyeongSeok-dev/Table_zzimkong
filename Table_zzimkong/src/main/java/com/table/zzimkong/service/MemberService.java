package com.table.zzimkong.service;

import org.springframework.beans.factory.annotation.*;
import org.springframework.stereotype.*;

import com.table.zzimkong.mapper.*;
import com.table.zzimkong.vo.*;

@Service
public class MemberService {
	
	// MemberMapper 객체 자동 주입
	@Autowired
	private MemberMapper mapper;

	//일반회원가입
	public int registMember(MemberVO member) {
		// MemberMapper(인터페이스) - insertMember()
		// => 파라미터 : MemberVO 객체   리턴타입 : int
		return mapper.insertMember(member);
	} //registMember()


	//회원 상세정보 조회 요청
	public MemberVO getMember(MemberVO member) {
		return mapper.selectMember(member);
	}

	//회원 탈퇴 요청
	public int withdrawMember(MemberVO member) {
		return mapper.updateWithdrawMember(member);
	}

	//업주회원가입
	public int registCeoMember(MemberVO member) {
		return mapper.insertCeoMember(member);
	}

	// 아이디 찾기
	public MemberVO getUserEmail(MemberVO member) {
		return mapper.selectUserEmail(member);
	}

	
	
	
} //MemberService
