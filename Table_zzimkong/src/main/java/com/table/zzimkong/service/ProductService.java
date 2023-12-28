package com.table.zzimkong.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.table.zzimkong.mapper.ProductMapper;
import com.table.zzimkong.vo.CompanyVO;
import com.table.zzimkong.vo.MenuVO;
import com.table.zzimkong.vo.ReservationVO;
import com.table.zzimkong.vo.SearchVO;


@Service
public class ProductService {
	
	@Autowired
	private ProductMapper mapper;

	public List<CompanyVO> getCompanyList(SearchVO search) {
		// TODO Auto-generated method stub
		return mapper.selectCompanyList(search);
	}

	public List<MenuVO> getMenuList(CompanyVO company) {
		// TODO Auto-generated method stub
		return mapper.selectMenuList(company);
	}

	public CompanyVO getCompany(CompanyVO company) {
		// TODO Auto-generated method stub
		return mapper.selectCompany(company);
	}

	public int getReservationInfo(SearchVO search, int comId) {
		// TODO Auto-generated method stub
		return mapper.selectReservationInfo(search, comId);
	}

	public List<ReservationVO> getVisitedPeople(int user_idx) {
		// TODO Auto-generated method stub
		return mapper.selectVisitedPeople(user_idx);
	}

	public List<CompanyVO> getsimilarCompanyList(String sort, CompanyVO company, List<String> tagList) {
		// TODO Auto-generated method stub
		return mapper.selectSimilarCompanyList(sort, company, tagList);
	}
	
}
