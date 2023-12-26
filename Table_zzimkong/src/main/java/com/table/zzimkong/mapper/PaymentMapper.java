package com.table.zzimkong.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.table.zzimkong.vo.CompanyVO;
import com.table.zzimkong.vo.MenuVO;
import com.table.zzimkong.vo.PreOrderInfo;
import com.table.zzimkong.vo.PreOrderVO;
import com.table.zzimkong.vo.ReservationVO;

@Mapper
public interface PaymentMapper {
	
//	int insertPayment();

	ReservationVO selectResForPay(ReservationVO res);

	int selectPoint(ReservationVO res);

	CompanyVO selectResCom(ReservationVO res);

	List<PreOrderInfo> selectPreOrder(ReservationVO res);

	int insertSubUsedPoint(ReservationVO res, String discountPoint);

	int insertAddPoint(ReservationVO res, String earnedPoints);

	
}
