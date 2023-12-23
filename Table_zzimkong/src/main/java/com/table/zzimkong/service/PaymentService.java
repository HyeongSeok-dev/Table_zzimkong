package com.table.zzimkong.service;

import java.text.NumberFormat;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.table.zzimkong.mapper.PaymentMapper;
import com.table.zzimkong.vo.CompanyVO;
import com.table.zzimkong.vo.MemberVO;
import com.table.zzimkong.vo.MenuVO;
import com.table.zzimkong.vo.PaymentVO;
import com.table.zzimkong.vo.PreOrderVO;
import com.table.zzimkong.vo.ReservationVO;
import com.table.zzimkong.vo.TotalPoint;

@Service
public class PaymentService {
	
	@Autowired
	private PaymentMapper mapper;

	public ReservationVO getReservation(ReservationVO res) {
		return mapper.selectResForPay(res);
	}
	
	public TotalPoint getPoint(ReservationVO res) {
		
		int dbTotalPoint = mapper.selectPoint(res);
		NumberFormat numberFormat = NumberFormat.getInstance();
		TotalPoint totalPoint = new TotalPoint(numberFormat.format(dbTotalPoint));
		
		return totalPoint;
	}

	public CompanyVO getCompany(ReservationVO res) {
		return mapper.selectResCom(res);
	}

	public PreOrderVO getPreOrder(ReservationVO res) {
		
		
		return mapper.selectPreOrder(res);
	}

	public MenuVO getMenu(PreOrderVO pre) {
		return mapper.selectPreMenu(pre);
	}

	
}
