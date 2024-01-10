package com.table.zzimkong.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.table.zzimkong.mapper.ProductMapper;
import com.table.zzimkong.vo.BookmarkVO;
import com.table.zzimkong.vo.CompanyVO;
import com.table.zzimkong.vo.MenuVO;
import com.table.zzimkong.vo.ReservationVO;
import com.table.zzimkong.vo.ReviewVO;
import com.table.zzimkong.vo.SearchVO;


@Service
public class ProductService {
	
	@Autowired
	private ProductMapper mapper;

	public List<CompanyVO> getCompanyList(SearchVO search) {
		// TODO Auto-generated method stub
		return mapper.selectCompanyList(search);
	}

	public List<MenuVO> getMenuList(CompanyVO company) {
		// TODO Auto-generated method stub
		return mapper.selectMenuList(company);
	}

	public CompanyVO getCompany(CompanyVO company) {
		// TODO Auto-generated method stub
		return mapper.selectCompany(company);
	}

	public int getReservationInfo(SearchVO search, int comId) {
		// TODO Auto-generated method stub
		return mapper.selectReservationInfo(search, comId);
	}

	public List<ReservationVO> getVisitedPeople(int user_idx, int com_id) {
		// TODO Auto-generated method stub
		return mapper.selectVisitedPeople(user_idx, com_id);
	}

	public List<CompanyVO> getsimilarCompanyList(String sort, CompanyVO company, List<String> tagList, List<String> individualTags) {
		// TODO Auto-generated method stub
		return mapper.selectSimilarCompanyList(sort, company, tagList, individualTags);
	}

	//메인 화면에 추천 뿌리기====================================
	//위생순
	public List<CompanyVO> getCleanList(SearchVO search) {
		return mapper.selectCleanList(search);
	}
	
	
	//추천순(광고등급순)
	public List<CompanyVO> getRecommendList(SearchVO search) {
		return mapper.selectRecommendList(search);
	}
	//별점순
	public List<CompanyVO> getReviewList(SearchVO search) {
		return mapper.selectReviewList(search);
	}

	public List<ReviewVO> getReviewInfo(CompanyVO company) {
		// TODO Auto-generated method stub
		return mapper.selectReviewInfo(company);
	}

	public ReviewVO getReviewScore(CompanyVO company) {
		// TODO Auto-generated method stub
		return mapper.selectReviewScore(company);
	}

	public BookmarkVO getBookmark(int sIdx, int com_id) {
		// TODO Auto-generated method stub
		return mapper.selectBookmark(sIdx,com_id);
	}

	public int registBookmark(int sIdx, int com_id) {
		// TODO Auto-generated method stub
		return mapper.insertBookmark(sIdx,com_id);
	}

	public int removeBookmark(int sIdx, int com_id) {
		// TODO Auto-generated method stub
		return mapper.deleteBookmark(sIdx,com_id);
	}

	public boolean getValidTime(int comId, String time) {
		// TODO Auto-generated method stub
		return mapper.selectValidTime(comId, time);
	}


	
}
