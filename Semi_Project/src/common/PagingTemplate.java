package common;

public class PagingTemplate {
	public PagingTemplate() {
	}

	public PageInfo getPageInfo(String page, int listCount, int board) {
		int pageLimit; // 한 페이지에 표시될 페이지 수
		int boardLimit; // 한 페이지에 보일 게시글 최대 개수
		int maxPage; // 전체 페이지 중 가장 마지막 페이지
		int startPage; // 페이징 된 페이지 중 시작 페이지
		int endPage; // 페이징 된 페이지 중 마지막 페이지

		int currentPage = 1;
		if (page != null)
			currentPage = Integer.parseInt(page);

		pageLimit = 6;
		boardLimit = board;

		maxPage = (int) Math.ceil((double) listCount / boardLimit);

		startPage = (currentPage - 1) / pageLimit * pageLimit + 1;

		endPage = startPage + pageLimit - 1;
		if (endPage > maxPage)
			endPage = maxPage;

		PageInfo pi = new PageInfo(currentPage, listCount, pageLimit, boardLimit, maxPage, startPage, endPage);

		return pi;
	}

	public PageInfo getPageInfo(String page, int listCount) {
		int pageLimit; // 한 페이지에 표시될 페이지 수
		int boardLimit; // 한 페이지에 보일 게시글 최대 개수
		int maxPage; // 전체 페이지 중 가장 마지막 페이지
		int startPage; // 페이징 된 페이지 중 시작 페이지
		int endPage; // 페이징 된 페이지 중 마지막 페이지

		int currentPage = 1;
		if (page != null)
			currentPage = Integer.parseInt(page);

		pageLimit = 10;
		boardLimit = 10;

		maxPage = (int) Math.ceil((double) listCount / boardLimit);

		startPage = (currentPage - 1) / pageLimit * pageLimit + 1;

		endPage = startPage + pageLimit - 1;
		if (endPage > maxPage)
			endPage = maxPage;

		PageInfo pi = new PageInfo(currentPage, listCount, pageLimit, boardLimit, maxPage, startPage, endPage);

		return pi;
	}
}
