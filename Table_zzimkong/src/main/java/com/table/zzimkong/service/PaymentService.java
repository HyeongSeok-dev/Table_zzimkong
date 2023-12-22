package com.table.zzimkong.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.table.zzimkong.mapper.PaymentMapper;
import com.table.zzimkong.vo.MemberVO;
import com.table.zzimkong.vo.PaymentVO;
import com.table.zzimkong.vo.ReservationVO;

@Service
public class PaymentService {
	
	@Autowired
	private PaymentMapper mapper;

	public ReservationVO getReservation(ReservationVO res) {
		
		return mapper.selectResForPay(res);
	}
	
	public int getPoint(ReservationVO res) {
		
		return mapper.selectPoint(res);
	}

	public int paymentReservation(PaymentVO payment) {
		
		return mapper.insertPayment();
	}
	
}
