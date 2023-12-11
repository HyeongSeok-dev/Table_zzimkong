package com.table.zzimkong.service;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.table.zzimkong.mapper.MenuMapper;
import com.table.zzimkong.vo.MenuList;

@Service
public class MenuService {

	@Autowired 
	private MenuMapper mapper;
	
	public int insertMenu(MenuList menuList, int com_id) {
		// TODO Auto-generated method stub
		return mapper.insertMenu(menuList, com_id);
	}

}
