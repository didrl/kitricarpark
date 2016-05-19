package com.parkingshare.util;

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
	
	public void setNavigator() {
		StringBuffer tmpNavigator = new StringBuffer();
		
		int listSize = BoardConstance.BOARD_LIST_SIZE;
		int pageSize = BoardConstance.BOARD_PAGE_SIZE;
		int prePage = (pageNo - 1) / pageSize * pageSize;

		tmpNavigator.append("<table cellpadding='0' cellspacing='0' border='0'>\n");
		tmpNavigator.append(" <tr>\n");
		if (this.isNowFirst()) {//첫번째 범위에 있을 때
			tmpNavigator.append("  <td><font color='#999999'>\n<a href='javascript:firstarticle()'>");
			tmpNavigator.append("   <img src='" + root + "/img/board/icon_prev02.gif' width='7' height='11' border='0' align='absmiddle' hspace='3'>최신목록</a>\n");
			tmpNavigator.append("   <img src='" + root + "/img/board/icon_prev01_dim.gif' width='3' height='11' border='0' align='absmiddle' hspace='3'>\n");
			tmpNavigator.append("   이전</font>\n");//이전에 링크가 없음
		} else {//첫번째 범위에 없을 때
			tmpNavigator.append("  <td>\n<a href='javascript:firstarticle()'>");
			tmpNavigator.append("   <img src='" + root + "/img/board/icon_prev02.gif' width='7' height='11' border='0' align='absmiddle' hspace='3'>최신목록 </a>\n");
			tmpNavigator.append("   <a href='javascript:listarticle(" + prePage + ")'>");
			tmpNavigator.append("   <img src='" + root + "/img/board/icon_prev01_dim.gif' width='3' height='11' border='0' align='absmiddle' hspace='3'>\n");
			tmpNavigator.append("   이전</a>");//이전에 링크가 있음
		}
		tmpNavigator.append("  \n</td>\n");
		tmpNavigator.append("  <td style='padding: 0 5 0 5'>\n");
		tmpNavigator.append("   <table cellpadding='0' cellspacing='0' border='0'>\n");
		tmpNavigator.append("    <tr>\n");
		tmpNavigator.append("     <td width='1' nowrap><img src='" + root + "/img/board/n_tab.gif' width='1'");
		tmpNavigator.append(" height='11' border='0' align='absmiddle'><br>");
		tmpNavigator.append("     </td>\n");
		
		int startPage = prePage + 1;
		int endPage = prePage + pageSize;
		if(endPage > totalPageCount)
			endPage = totalPageCount;
		
		for (int i = startPage; i <= endPage; i++) {
			if (pageNo == i) {//현재 페이지는 링크없고 강조 표시
				tmpNavigator.append("     <td style='padding:0 7 0 7;' nowrap><font class='text_acc_02'><b>" + i + "</b></font></td>\n");
				tmpNavigator.append("     <td width='1' nowrap><img src='" + root + "/img/board/n_tab.gif' width='1'");
				tmpNavigator.append(" height='11' border='0' align='absmiddle'><br>\n");
			} else {//현재 페이지가 아닌것은 링크가 있고 강조 표시 없음
				tmpNavigator.append("     <td style='padding:0 7 0 7;' nowrap><a href='javascript:listarticle(" + i + ")'>" + i + "</td>\n");
				tmpNavigator.append("     <td width='1' nowrap><img src='" + root + "/img/board/n_tab.gif' width='1'");
				tmpNavigator.append(" height='11' border='0' align='absmiddle'><br>\n");
			}
		}
		tmpNavigator.append("     </td>\n");
		tmpNavigator.append("    </tr>\n");
		tmpNavigator.append("   </table>\n");
		tmpNavigator.append("  </td>\n");
		tmpNavigator.append("  <td>\n");
		
		if (this.isNowEnd()) {
			tmpNavigator.append("   <font color='#999999'>다음<img");
			tmpNavigator.append("   src='" + root + "/img/board/icon_next01_dim.gif' width='3' height='11'");
			tmpNavigator.append(" border='0' align='absmiddle' hspace='3'> \n");
			tmpNavigator.append("   끝목록<img src='" + root + "/img/board/icon_next02_dim.gif' width='7' height='11'");
			tmpNavigator.append(" border='0' align='absmiddle' hspace='3'></font>\n");
		} else {
			tmpNavigator.append("   <a href='javascript:listarticle(" + (endPage + 1) + ")'>다음<img");
			tmpNavigator.append(" src='" + root + "/img/board/icon_next01_dim.gif' width='3' height='11'");
			tmpNavigator.append(" border='0' align='absmiddle' hspace='3'></a>\n");
			tmpNavigator.append("   <a href='javascript:listarticle(" + totalPageCount + ")'>끝목록<img src='" + root + "/img/board/icon_next02_dim.gif' width='7' height='11'");
			tmpNavigator.append(" border='0' align='absmiddle' hspace='3'>\n");
		}

		tmpNavigator.append("  </td>\n");
		tmpNavigator.append(" </tr>\n");
		tmpNavigator.append("</table>\n");

		this.navigator = tmpNavigator.toString();
	}
	
}
