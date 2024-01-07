package com.table.zzimkong.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.table.zzimkong.vo.CompanyVO;
import com.table.zzimkong.vo.MemberVO;
import com.table.zzimkong.vo.MenuVO;
import com.table.zzimkong.vo.PreOrderVO;
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

	ReservationVO selectResIdx(ReservationVO res);

	//pre insert!!!!!!!!!!!!
	int insertPreOrder(@Param("res_idx") int res_idx, @Param("menuList") List<MenuVO> menuList);


//	int insertPreOrder(@Param("res") int res_idx, @Param("menu_idx") int menu_idx, @Param("pre") PreOrderVO pre);
//	int insertPreOrder(@Param("res_idx") int res_idx, @Param("pre") PreOrderVO pre, @Param("menuList") List<MenuVO> menuList);

//	int insertMenu(PreOrderVO pre);


//	ReservationVO selectReservation(ReservationVO res);

//	String selectResInfo(CompanyVO com, ReservationVO res);




}
