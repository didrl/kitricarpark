package com.carpark.util;

public class PageNavigator {//Dto와 비슷하지만 조금 다름
	
	private String root;
	private boolean nowFirst;//현재 첫번째 범위에 속해있는지?(1~10까지 일 때 1인지 아닌지 구분)
	private boolean nowEnd;//현재 마지막 범위에 속해있는지?
	private int totalArticleCount;//전체 글 갯수
	private int newArticleCount;//새 글 갯수
	private int totalPageCount;//전체 페이지
	private int pageNo;//현재 페이지
	private String navigator;//처음 이전 1 2 3 4 5 6 7 8 9 10 다음 끝
	
	public String getRoot() {
		return root;
	}
	
	public void setRoot(String root) {
		this.root = root;
	}
	
	public boolean isNowFirst() {
		return nowFirst;
	}
	
	public void setNowFirst(boolean nowFirst) {
		this.nowFirst = nowFirst;
	}
	
	public boolean isNowEnd() {
		return nowEnd;
	}
	
	public void setNowEnd(boolean nowEnd) {
		this.nowEnd = nowEnd;
	}
	
	public int getTotalArticleCount() {
		return totalArticleCount;
	}
	
	public void setTotalArticleCount(int totalArticleCount) {
		this.totalArticleCount = totalArticleCount;
	}
	
	public int getNewArticleCount() {
		return newArticleCount;
	}
	
	public void setNewArticleCount(int newArticleCount) {
		this.newArticleCount = newArticleCount;
	}
	
	public int getTotalPageCount() {
		return totalPageCount;
	}
	
	public void setTotalPageCount(int totalPageCount) {
		this.totalPageCount = totalPageCount;
	}
	
	public int getPageNo() {
		return pageNo;
	}
	
	public void setPageNo(int pageNo) {
		this.pageNo = pageNo;
	}
	
	public String getNavigator() {
		return navigator;
	}
	
	public void setNavigatorSend() {
		StringBuffer tmpNavigator = new StringBuffer();
		
		int listSize = BoardConstance.BOARD_LIST_SIZE;
		int pageSize = BoardConstance.BOARD_PAGE_SIZE;
		int prePage = (pageNo - 1) / pageSize * pageSize;

		if (this.isNowFirst()) {//첫번째 범위에 있을 때
			tmpNavigator.append("  <li><a href='#' aria-label=\"Previous\"><span aria-hidden=\"true\">&laquo;</span></a></li> \n");
		} else {//첫번째 범위에 없을 때
			tmpNavigator.append(" <li><a href='javascript:messageSendList(" + prePage + ")' aria-label=\"Previous\"><span aria-hidden=\"true\">&laquo;</span></a></li> \n");
		}
		
		int startPage = prePage + 1;
		int endPage = prePage + pageSize;
		if(endPage > totalPageCount)
			endPage = totalPageCount;
		
		for (int i = startPage; i <= endPage; i++) {
			if (pageNo == i) {//현재 페이지는 링크없고 강조 표시
				tmpNavigator.append("  <li><a href=\"#\"><b> " + i + " </b></a></li> \n");
			} else {//현재 페이지가 아닌것은 링크가 있고 강조 표시 없음
				tmpNavigator.append("  <li><a href='javascript:messageSendList(" + i + ")'>" + i + "</a></li> \n");
			}
		}
		
		if (this.isNowEnd()) {
			tmpNavigator.append(" <li><a href='#'><span aria-hidden=\"true\">&raquo;</span></a></li> \n");
		} else {
			tmpNavigator.append("  <li><a href='javascript:messageSendList(" + (endPage + 1) + ")' aria-label=\"Next\"><span aria-hidden=\"true\">&raquo;</span></a></li> \n");
		}

		this.navigator = tmpNavigator.toString();


	}
	
	public void setNavigatorReceive() {
		StringBuffer tmpNavigator = new StringBuffer();
		
		int listSize = BoardConstance.BOARD_LIST_SIZE;
		int pageSize = BoardConstance.BOARD_PAGE_SIZE;
		int prePage = (pageNo - 1) / pageSize * pageSize;

		if (this.isNowFirst()) {//첫번째 범위에 있을 때
			tmpNavigator.append("  <li><a href='#' aria-label=\"Previous\"><span aria-hidden=\"true\">&laquo;</span></a></li> \n");
		} else {//첫번째 범위에 없을 때
			tmpNavigator.append(" <li><a href='javascript:messageReceiveList(" + prePage + ")' aria-label=\"Previous\"><span aria-hidden=\"true\">&laquo;</span></a></li> \n");
		}
		
		int startPage = prePage + 1;
		int endPage = prePage + pageSize;
		if(endPage > totalPageCount)
			endPage = totalPageCount;
		
		for (int i = startPage; i <= endPage; i++) {
			if (pageNo == i) {//현재 페이지는 링크없고 강조 표시
				tmpNavigator.append("  <li><a href=\"#\"><b> " + i + " </b></a></li> \n");
			} else {//현재 페이지가 아닌것은 링크가 있고 강조 표시 없음
				tmpNavigator.append("  <li><a href='javascript:messageReceiveList(" + i + ")'>" + i + "</a></li> \n");
			}
		}
		
		if (this.isNowEnd()) {
			tmpNavigator.append(" <li><a href='#'><span aria-hidden=\"true\">&raquo;</span></a></li> \n");
		} else {
			tmpNavigator.append("  <li><a href='javascript:messageSendList(" + (endPage + 1) + ")' aria-label=\"Next\"><span aria-hidden=\"true\">&raquo;</span></a></li> \n");
		}

		this.navigator = tmpNavigator.toString();


	}
	
	public void setNavigator(String javascript) {
		StringBuffer tmpNavigator = new StringBuffer();
		
		int listSize = BoardConstance.BOARD_LIST_SIZE;
		int pageSize = BoardConstance.BOARD_PAGE_SIZE;
		int prePage = (pageNo - 1) / pageSize * pageSize;

		if (this.isNowFirst()) {//첫번째 범위에 있을 때
			tmpNavigator.append("  <li><a href='#' aria-label=\"Previous\"><span aria-hidden=\"true\">&laquo;</span></a></li> \n");
		} else {//첫번째 범위에 없을 때
			tmpNavigator.append(" <li><a href='javascript:" + javascript + "(" + prePage + ")' aria-label=\"Previous\"><span aria-hidden=\"true\">&laquo;</span></a></li> \n");
		}
		
		int startPage = prePage + 1;
		int endPage = prePage + pageSize;
		if(endPage > totalPageCount)
			endPage = totalPageCount;
		System.out.println("prePage:" + prePage + " pageSize:" + pageSize + " endPage:" + endPage);
		for (int i = startPage; i <= endPage; i++) {
			if (pageNo == i) {//현재 페이지는 링크없고 강조 표시
				tmpNavigator.append("  <li><a href=\"#\"><b> " + i + " </b></a></li> \n");
			} else {//현재 페이지가 아닌것은 링크가 있고 강조 표시 없음
				tmpNavigator.append("  <li><a href='javascript:" + javascript + "(" + i + ")'>" + i + "</a></li> \n");
			}
		}
		
		if (this.isNowEnd()) {
			tmpNavigator.append(" <li><a href='#'><span aria-hidden=\"true\">&raquo;</span></a></li> \n");
		} else {
			tmpNavigator.append("  <li><a href='javascript:" + javascript + "(" + (endPage + 1) + ")' aria-label=\"Next\"><span aria-hidden=\"true\">&raquo;</span></a></li> \n");
		}

		this.navigator = tmpNavigator.toString();


	}
	
}
