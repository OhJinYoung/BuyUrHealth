package notice.model.vo;

public class PageInfo {
	private int currentPage; 	// 현재 페이지
	private int listCount;		// 해당 게시판에 대한 총 게시글 개수
	private int pageLimit;		// 한 페이지에 표시될 페이지 수 
	private int noticeLimit; 	// 한 페이지에 보일 게시글 최대 개수 
	private int maxPage; 		// 전체 페이지 중 가장 마지막 페이지 
	private int	startPage; 		// 페이징 된 페이지 중 시작 페이지
	private int endPage;  		// 페이
	
	
	public PageInfo() {}


	public PageInfo(int currentPage, int listCount, int pageLimit, int noticeLimit, int maxPage, int startPage,
			int endPage) {
		super();
		this.currentPage = currentPage;
		this.listCount = listCount;
		this.pageLimit = pageLimit;
		this.noticeLimit = noticeLimit;
		this.maxPage = maxPage;
		this.startPage = startPage;
		this.endPage = endPage;
	}


	public int getCurrentPage() {
		return currentPage;
	}


	public void setCurrentPage(int currentPage) {
		this.currentPage = currentPage;
	}


	public int getListCount() {
		return listCount;
	}


	public void setListCount(int listCount) {
		this.listCount = listCount;
	}


	public int getPageLimit() {
		return pageLimit;
	}


	public void setPageLimit(int pageLimit) {
		this.pageLimit = pageLimit;
	}


	public int getNoticeLimit() {
		return noticeLimit;
	}


	public void setNoticeLimit(int noticeLimit) {
		this.noticeLimit = noticeLimit;
	}


	public int getMaxPage() {
		return maxPage;
	}


	public void setMaxPage(int maxPage) {
		this.maxPage = maxPage;
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


	@Override
	public String toString() {
		return "PageInfo [currentPage=" + currentPage + ", listCount=" + listCount + ", pageLimit=" + pageLimit
				+ ", noticeLimit=" + noticeLimit + ", maxPage=" + maxPage + ", startPage=" + startPage + ", endPage="
				+ endPage + "]";
	}
	
	
	
	

}
