package com.table.zzimkong.mapper;


import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.table.zzimkong.vo.MenuList;

@Mapper
public interface MenuMapper {
	
	int insertMenu(@Param(value = "menuList") MenuList menuList, @Param(value = "com_id") int com_id);
}
