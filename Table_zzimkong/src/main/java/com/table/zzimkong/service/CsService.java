package com.table.zzimkong.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.table.zzimkong.mapper.CsMapper;
import com.table.zzimkong.vo.CsVO;
import com.table.zzimkong.vo.MemberVO;


@Service
public class CsService {
	@Autowired 
	
	private CsMapper mapper;
	
	public MemberVO getmember(int sIdx) {
		// TODO Auto-generated method stub
		return mapper.selectMember(sIdx);
	}

	public List<CsVO> getBoard(CsVO board, MemberVO member, int boardCategory) {
		// TODO Auto-generated method stub
		return mapper.selectBoard(board, member, boardCategory);
	}

	public int registboard(CsVO board) {
		// TODO Auto-generated method stub
		return mapper.insertBoard(board);
	}

	public CsVO getQnaBoard(CsVO board) {
		// TODO Auto-generated method stub
		return mapper.selectQnaBoard(board);
	}

	public int modifyQnaBoard(CsVO board) {
		// TODO Auto-generated method stub
		return mapper.updateQnaBoard(board);
	}

	public int removeBoard(CsVO board) {
		// TODO Auto-generated method stub
		return mapper.deleteQnaBoard(board);
	}

}
