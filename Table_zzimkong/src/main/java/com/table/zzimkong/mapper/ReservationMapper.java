package com.table.zzimkong.mapper;

import org.apache.ibatis.annotations.Mapper;

import com.table.zzimkong.vo.CompanyVO;
import com.table.zzimkong.vo.MemberVO;
import com.table.zzimkong.vo.ReservationVO;

@Mapper
public interface ReservationMapper {

//	void insertPreOrder(ReservationVO res, MenuVO menu);

	int insertReservation(ReservationVO res);

	CompanyVO selectComName(ReservationVO res);

	ReservationVO selectResInfo(ReservationVO res);

//	List<PreOrderInfo> selectPreOrder(ReservationVO res);

	MemberVO selectUserInfo(ReservationVO res);

	int insertResInfo(ReservationVO res);


//	ReservationVO selectReservation(ReservationVO res);

//	String selectResInfo(CompanyVO com, ReservationVO res);




}
