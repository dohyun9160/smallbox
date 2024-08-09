package com.box.small.user.movie;

import lombok.Data;

@Data
public class PageDTO {
	private int startPage; // 시작페이지
	private int endPage;	// 페이지의 끝 
	private boolean prev, next;
	
	private int total;
	private int pageNum;
	
	private int start = 1; //페이지 시작 
	private int end = 5; // 페이지 끝(나눌 분량)

	public PageDTO(int pageNum, int total) {
		this.pageNum = pageNum;
		this.endPage = (int)(Math.ceil(pageNum/(end*1.0)))*end;
		this.startPage = this.endPage - (this.end-1);
		
//		int realEnd = (int)(Math.ceil(total*1.0)/end);
//		if(realEnd < this.endPage) {
//			this.endPage = realEnd;
//		}
		
		System.out.println("to1"+total);
		System.out.println(endPage);
		if(total < this.endPage) {
			this.endPage = total;
		}
		System.out.println("to2"+total);
		
		this.prev = this.startPage > 1;
		
		this.next = this.endPage < total;
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

	public boolean isPrev() {
		return prev;
	}

	public void setPrev(boolean prev) {
		this.prev = prev;
	}

	public boolean isNext() {
		return next;
	}

	public void setNext(boolean next) {
		this.next = next;
	}

	public int getTotal() {
		return total;
	}

	public void setTotal(int total) {
		this.total = total;
	}

	public int getPageNum() {
		return pageNum;
	}

	public void setPageNum(int pageNum) {
		this.pageNum = pageNum;
	}

	public int getStart() {
		return start;
	}

	public void setStart(int start) {
		this.start = start;
	}

	public int getEnd() {
		return end;
	}

	public void setEnd(int end) {
		this.end = end;
	}

	@Override
	public String toString() {
		return "PageDTO [startPage=" + startPage + ", endPage=" + endPage + ", prev=" + prev + ", next=" + next
				+ ", total=" + total + ", pageNum=" + pageNum + ", start=" + start + ", end=" + end + "]";
	}

	
	
	
}
