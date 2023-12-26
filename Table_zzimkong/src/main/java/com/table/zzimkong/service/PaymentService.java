package com.table.zzimkong.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.table.zzimkong.mapper.PaymentMapper;
import com.table.zzimkong.vo.CompanyVO;
import com.table.zzimkong.vo.MenuVO;
import com.table.zzimkong.vo.PaymentVO;
import com.table.zzimkong.vo.PreOrderInfo;
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

	public List<PreOrderInfo> getPreOrderInfo(ReservationVO res) {
		return mapper.selectPreOrder(res);
	}

	public int subUsedPoint(ReservationVO res, String discountPoint) {
		return mapper.insertSubUsedPoint(res, discountPoint);
	}

	public int addPoint(ReservationVO res, String earnedPoints) {
		// TODO Auto-generated method stub
		return mapper.insertAddPoint(res, earnedPoints);
	}

	public int paymentSuccess(ReservationVO res, int sIdx, String payNum, PaymentVO payment) {
		return mapper.insertPayment(res, sIdx, payNum, payment);
	}

	public int payStatusChange(ReservationVO res) {
		// TODO Auto-generated method stub
		return mapper.updateReservationStatus(res);
	}

	
}
