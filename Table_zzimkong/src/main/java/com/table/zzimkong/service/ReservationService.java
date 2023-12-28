package com.table.zzimkong.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.table.zzimkong.mapper.ReservationMapper;
import com.table.zzimkong.vo.CompanyVO;
import com.table.zzimkong.vo.MemberVO;
import com.table.zzimkong.vo.MenuVO;
import com.table.zzimkong.vo.PreOrderInfo;
import com.table.zzimkong.vo.PreOrderVO;
import com.table.zzimkong.vo.ReservationVO;

@Service
public class ReservationService {
	
	@Autowired
	private ReservationMapper mapper;

	public int registResvation(ReservationVO res, MenuVO menu) {
	      
//	      mapper.insertPreOrder(res, menu);

	      int resCnt = mapper.insertReservation(res);

	      return resCnt; 
	   }

//	public String getReservationInfo(CompanyVO com, ReservationVO res) {
//		return mapper.selectResInfo(com, res);
//	}

//	public String getResComName(CompanyVO com) {
//		return mapper.selectComName(com);
//	}
	//[가게이름]
	public CompanyVO getCompany(ReservationVO res) {
		return mapper.selectComName(res);
	}
//
//	public ReservationVO getReservation(ReservationVO res) {
//		return mapper.selectResInfo(res);
//	}
//
//	public List<PreOrderInfo> getPreInfo(ReservationVO res) {
//		return mapper.selectPreOrder(res);
//	}
//
	//[예약자 정보]
	public MemberVO getUserInfo(ReservationVO res) {
		return mapper.selectUserInfo(res);
	}
	
	//[예약정보 저장]
	public int registResvation(ReservationVO res) {
		return mapper.insertResInfo(res);
	}



//	public ReservationVO getreservation(ReservationVO res) {
//		return mapper.selectReservation(res);
//	}




}
