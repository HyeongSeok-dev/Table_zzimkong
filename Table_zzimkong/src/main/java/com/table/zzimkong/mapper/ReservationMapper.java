package com.table.zzimkong.mapper;

import org.apache.ibatis.annotations.Mapper;

import com.table.zzimkong.vo.MenuVO;
import com.table.zzimkong.vo.PreOrderVO;
import com.table.zzimkong.vo.ReservationVO;

@Mapper
public interface ReservationMapper {

	void insertPreOrder(ReservationVO res, PreOrderVO pre, MenuVO menu);

	int insertReservation(ReservationVO res, PreOrderVO pre);



}
