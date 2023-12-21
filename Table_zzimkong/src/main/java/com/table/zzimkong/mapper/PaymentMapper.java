package com.table.zzimkong.mapper;

import org.apache.ibatis.annotations.Mapper;

import com.table.zzimkong.vo.MemberVO;
import com.table.zzimkong.vo.ReservationVO;

@Mapper
public interface PaymentMapper {
	
	int insertPayment();

	ReservationVO selectResForPay(int res_id);

	MemberVO selectPoint(int user_id);
	
}
