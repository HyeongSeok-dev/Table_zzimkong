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

	public int registMember(MemberVO member) {
		// MemberMapper(인터페이스) - insertMember()
		// => 파라미터 : MemberVO 객체   리턴타입 : int
		return mapper.insertMember(member);
	} //registMember()

	//회원 아이디정보 조회 요청
	public MemberVO getId(MemberVO member) {
		return mapper.selectId(member);
	}

	//회원 닉네임 조회 요청
	public MemberVO getNick(MemberVO member) {
		return mapper.selectNick(member);
	}
	
	
	
} //MemberService
