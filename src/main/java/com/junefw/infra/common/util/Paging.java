package com.junefw.infra.common.util;

import com.junefw.infra.common.constants.Constants;

public class Paging {

	private int thisPage = 1;								// 현재 페이지
	private int rowNumToShow = Constants.RowNumToShow;		// 화면에 보여줄 데이터 줄 갯수
	private int pageNumToShow = Constants.PageNumToShow;	// 화면에 보여줄 페이징 번호 갯수

	private int totalRows;									// 전체 데이터 갯수
	private int totalPages;									// 전체 페이지 번호
	private int startPage;									// 시작 페이지 번호
	private int endPage;									// 마지막 페이지 번호
	
	private int startRnum = 0;								// 쿼리 시작 row
	private int endRnum;									// 쿼리 끝 row

	public void setParamsPaging(int totalRows) {

		setTotalRows(totalRows);

		setTotalPages(getTotalRows() / getRowNumToShow());

		if (getTotalRows() % getRowNumToShow() > 0) {
			setTotalPages(getTotalPages() + 1);
		}

		if (getTotalPages() < getThisPage()) {
			setThisPage(getTotalPages());
		}

		setStartPage(((getThisPage() - 1) / getPageNumToShow()) * getPageNumToShow() + 1);

		setEndPage(getStartPage() + getPageNumToShow() - 1);

		if (getEndPage() > getTotalPages()) {
			setEndPage(getTotalPages());
		}
		
		setEndRnum((getRowNumToShow() * getThisPage()));
		setStartRnum((getEndRnum() - getRowNumToShow()) + 1);
		if (getStartRnum() < 1) setStartRnum(1);
		
//		 int thisPage = 1; 
//		 int rowNumToShow = 10; 
//		 int pageNumToShow = 5; 
//		 int totalPages = totalRows / rowNumToShow; 
//		 if (totalRows % rowNumToShow > 0) { totalPages++; }
//		 if (totalPages < thisPage){ thisPage = totalPages; } 
//		 int startPage = ((thisPage - 1) / pageNumToShow) * pageNumToShow + 1; 
//		 int endPage = startPage + pageNumToShow - 1; 
//		 if (endPage > totalPages) { endPage = totalPages; }
		
	}

	public int getThisPage() {
		return thisPage;
	}

	public void setThisPage(int thisPage) {
		this.thisPage = thisPage;
	}

	public int getRowNumToShow() {
		return rowNumToShow;
	}

	public void setRowNumToShow(int rowNumToShow) {
		this.rowNumToShow = rowNumToShow;
	}

	public int getPageNumToShow() {
		return pageNumToShow;
	}

	public void setPageNumToShow(int pageNumToShow) {
		this.pageNumToShow = pageNumToShow;
	}

	public int getTotalRows() {
		return totalRows;
	}

	public void setTotalRows(int totalRows) {
		this.totalRows = totalRows;
	}

	public int getTotalPages() {
		return totalPages;
	}

	public void setTotalPages(int totalPages) {
		this.totalPages = totalPages;
	}

	public int getStartPage() {
		return startPage;
	}

	public void setStartPage(int startPage) {
		this.startPage = startPage;
	}

	public int getEndPage() {
		return endPage;
	}

	public void setEndPage(int endPage) {
		this.endPage = endPage;
	}

	public int getStartRnum() {
		return startRnum;
	}

	public void setStartRnum(int startRnum) {
		this.startRnum = startRnum;
	}

	public int getEndRnum() {
		return endRnum;
	}

	public void setEndRnum(int endRnum) {
		this.endRnum = endRnum;
	}
}
