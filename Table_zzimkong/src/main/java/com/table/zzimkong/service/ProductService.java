package com.table.zzimkong.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.table.zzimkong.mapper.ProductMapper;
import com.table.zzimkong.vo.CompanyVO;
import com.table.zzimkong.vo.MenuVO;
import com.table.zzimkong.vo.SearchVO;


@Service
public class ProductService {
	
	@Autowired
	private ProductMapper mapper;

	public List<CompanyVO> getCompanyList(SearchVO search) {
		// TODO Auto-generated method stub
		return mapper.selectCompanyList(search);
	}

	public List<MenuVO> getMenuList(List<CompanyVO> companyList) {
		// TODO Auto-generated method stub
		return mapper.selectMenuList(companyList);
	}
	
}
