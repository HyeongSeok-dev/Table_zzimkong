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

	public ReservationVO getReservation(int res_idx) {
		
		return mapper.selectResForPay(res_idx);
	}
	
	public int paymentReservation(PaymentVO payment) {
		
		return mapper.insertPayment();
	}

	public MemberVO getPoint(int user_id) {
		
		return mapper.selectPoint(user_id);
	}

	
}
