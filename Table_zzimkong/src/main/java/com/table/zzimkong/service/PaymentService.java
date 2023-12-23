package com.table.zzimkong.service;

import java.text.NumberFormat;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.table.zzimkong.mapper.PaymentMapper;
import com.table.zzimkong.vo.CompanyVO;
import com.table.zzimkong.vo.MemberVO;
import com.table.zzimkong.vo.MenuVO;
import com.table.zzimkong.vo.PaymentInfo;
import com.table.zzimkong.vo.PaymentVO;
import com.table.zzimkong.vo.PreOrderVO;
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

	public CompanyVO getCompany(ReservationVO res) {
		return mapper.selectResCom(res);
	}

	public List<PreOrderVO> getPreOrder(ReservationVO res) {
		return mapper.selectPreOrder(res);
	}

	public MenuVO getMenu(PreOrderVO pre) {
		return mapper.selectPreMenu(pre);
	}

	
}
