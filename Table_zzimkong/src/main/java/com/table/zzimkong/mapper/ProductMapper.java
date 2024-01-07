package com.table.zzimkong.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.table.zzimkong.vo.BookmarkVO;
import com.table.zzimkong.vo.CompanyVO;
import com.table.zzimkong.vo.MenuVO;
import com.table.zzimkong.vo.ReservationVO;
import com.table.zzimkong.vo.ReviewVO;
import com.table.zzimkong.vo.SearchVO;

@Mapper
public interface ProductMapper {

	List<CompanyVO> selectCompanyList(SearchVO search);

	List<MenuVO> selectMenuList(CompanyVO company);

	CompanyVO selectCompany(CompanyVO company);

	int selectReservationInfo(@Param("search") SearchVO search, @Param("com_id")int comId);

	List<ReservationVO> selectVisitedPeople(int user_idx);

	List<CompanyVO> selectSimilarCompanyList(@Param("sort") String sort, @Param("company")CompanyVO company, @Param("tagList")List<String> tagList,@Param("individualTags") List<String> individualTags);

	//메인화면에 추천순 뿌리기=====================================
	//위생순
	List<CompanyVO> selectCleanList(SearchVO search);
	//위생순 지역선택에따른 정렬
	List<CompanyVO> selectAreaCleanList(SearchVO search);
	//추천순(광고등급순)
	List<CompanyVO> selectRecommendList(SearchVO search);
	//별점순
	List<CompanyVO> selectReviewList(SearchVO search);

	List<ReviewVO> selectReviewInfo(CompanyVO company);

	ReviewVO selectReviewScore(CompanyVO company);

	BookmarkVO selectBookmark(@Param("sIdx") int sIdx, @Param("com_id") int com_id);

	int insertBookmark(@Param("sIdx") int sIdx, @Param("com_id") int com_id);

	int deleteBookmark(@Param("sIdx") int sIdx, @Param("com_id") int com_id);

}
