package com.table.zzimkong.mapper;

import org.apache.ibatis.annotations.Mapper;

import com.table.zzimkong.vo.ReservationVO;

@Mapper
public interface PaymentMapper {
	
//	int insertPayment();

	ReservationVO selectResForPay(ReservationVO res);

	int selectPoint(ReservationVO res);
	
}
