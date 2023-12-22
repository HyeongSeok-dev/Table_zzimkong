package com.table.zzimkong.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.table.zzimkong.mapper.ReservationMapper;
import com.table.zzimkong.vo.MenuVO;
import com.table.zzimkong.vo.PreOrderVO;
import com.table.zzimkong.vo.ReservationVO;

@Service
public class ReservationService {
	
	@Autowired
	private ReservationMapper mapper;

	public int registResvation(ReservationVO res, PreOrderVO pre, MenuVO menu) {
	      
	      mapper.insertPreOrder(res, pre, menu);

	      int resCnt = mapper.insertReservation(res, pre);

	      return resCnt; 
	   }




}
