package com.table.zzimkong.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.table.zzimkong.mapper.CeoMapper;
import com.table.zzimkong.vo.CompanyVO;
import com.table.zzimkong.vo.MemberVO;
import com.table.zzimkong.vo.MenuList;
import com.table.zzimkong.vo.MenuVO;
import com.table.zzimkong.vo.ReservationVO;


@Service
public class CeoService {
	
	@Autowired 
	private CeoMapper mapper;

	public int insertMenu(MenuVO menu, int com_id) {
		// TODO Auto-generated method stub
		return mapper.insertMenu(menu, com_id);
	}

	public List<CompanyVO> getMyCompanyList(int sIdx) {
		// TODO Auto-generated method stub
		return mapper.selectMycompanyList(sIdx);
	}

	public MenuVO getMenu(MenuVO menu) {
		// TODO Auto-generated method stub
		return mapper.selectMenu(menu);
	}

	public int modifyMenu(MenuVO menu) {
		// TODO Auto-generated method stub
		return mapper.updateMenu(menu);
	}

	public int removeMenu(MenuVO menu) {
		// TODO Auto-generated method stub
		return mapper.deleteMenu(menu);
	}

	public int registCompany(CompanyVO company, String sId) {
		// TODO Auto-generated method stub
		return mapper.insertCompanyInfo(company, sId);
	}

	public CompanyVO getEachCompany(String com_num) {
		// TODO Auto-generated method stub
		return mapper.selectEachCompany(com_num);
	}

	public int changeStatus(CompanyVO company) {
		// TODO Auto-generated method stub
		return mapper.updateComStatus(company);
	}

	public int registAd(CompanyVO company) {
		// TODO Auto-generated method stub
		return mapper.updateAdGrade(company);
	}

	public CompanyVO getCompanyAdInfo(String com_num) {
		// TODO Auto-generated method stub
		return mapper.selectEachCompany(com_num);
	}

	public int closeRegist(String com_num) {
		// TODO Auto-generated method stub
		return mapper.updateStatusClose(com_num);
	}

	public List<CompanyVO> getComList(int sIdx) {
		return mapper.selectCeoList(sIdx);
	}

	public List<ReservationVO> getResInfoList(CompanyVO company) {
		return mapper.selectResInfo(company);
	}
	
	public int companyModify(CompanyVO company) {
		// TODO Auto-generated method stub
		return mapper.updateCompany(company);
	}

	public ReservationVO getResDetailInfo(ReservationVO res) {
		return mapper.selectResDetailInfo(res);
	}

	public MemberVO getUserInfo(String sId) {
		// TODO Auto-generated method stub
		return mapper.selectUser(sId);
	}

	
}
