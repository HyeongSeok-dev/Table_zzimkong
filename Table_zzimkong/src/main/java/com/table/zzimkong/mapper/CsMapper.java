package com.table.zzimkong.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.table.zzimkong.vo.CsVO;
import com.table.zzimkong.vo.MemberVO;

@Mapper
public interface CsMapper {

	MemberVO selectMember(int sIdx);

	List<CsVO> selectBoard(@Param("board") CsVO board, @Param("member") MemberVO member,@Param("category") int boardCategory);

	int insertBoard(CsVO board);

	CsVO selectQnaBoard(CsVO board);

	int updateQnaBoard(CsVO board);

	int deleteQnaBoard(CsVO board);

}
