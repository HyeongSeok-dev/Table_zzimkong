package com.table.zzimkong.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.table.zzimkong.mapper.PaymentMapper;
import com.table.zzimkong.vo.PaymentVO;

@Service
public class PaymentService {
	
	@Autowired
	private PaymentMapper mapper;
	
	public int paymentReservation(PaymentVO payment) {
		
		return mapper.insertPayment();
	}
	
}
