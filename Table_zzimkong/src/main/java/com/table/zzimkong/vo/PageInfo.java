package com.table.zzimkong.vo;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
@AllArgsConstructor
@NoArgsConstructor
public class PageInfo {
	private int listCount;		// 총 게시물 수
	private int pageListLimit;	// 페이지 당 표시할 페이지 번호 갯수
	private int maxPage;		// 전체 페이지 수(최대 페이지 번호)
	private int startPage;		// 시작 페이지 번호
	private int endPage;		// 끝 페이지 번호
}

