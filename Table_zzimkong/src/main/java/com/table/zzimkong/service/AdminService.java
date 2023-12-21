package com.table.zzimkong.service;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.table.zzimkong.mapper.AdminMapper;
import com.table.zzimkong.vo.CompanyVO;
import com.table.zzimkong.vo.MemberVO;

@Service
public class AdminService {
	@Autowired
	private AdminMapper mapper;

	// 관리자 페이지 접근 제한
	public boolean checkAdminAccess(HttpSession session) {
        String sId = (String) session.getAttribute("sId");
        if (sId == null || !sId.equals("admin")) {
        	session.setAttribute("sId", "admin");	// 세션 아이디 test
            return false;
        }
        return true;
    }
	 
	// 관리자 - 회원 목록 조회
	public List<MemberVO> adminMemberList() {
		return mapper.selectAdminMemberList();
	}

	// 관리자 - 업체 목록 조회
	public List<CompanyVO> adminCompanyList() {
		return mapper.selectAdminCompanyList();
	}









	
	

}
