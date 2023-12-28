package com.table.zzimkong.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.table.zzimkong.mapper.CeoMapper;
import com.table.zzimkong.vo.MenuList;


@Service
public class CeoService {
	
	@Autowired 
	private CeoMapper mapper;

	public int insertMenu(MenuList menuList, int com_id) {
		// TODO Auto-generated method stub
		return mapper.insertMenu(menuList, com_id);
	}
	
}
