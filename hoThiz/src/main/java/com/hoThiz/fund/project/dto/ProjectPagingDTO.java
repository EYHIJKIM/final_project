package com.hothiz.fund.project.dto;

import org.springframework.beans.factory.annotation.Autowired;

public class ProjectPagingDTO {
	

	
	private static final int PER_PAGE_PROJECT = 30;//뽑아낼 글 수
	private int totalPrjAmount; //전체 글의 갯수
	private int locatedPage; //현재 위치하고있는 페이지(1페이지,,2페이지,,)
	private int startRownum; //시작 rownum
	private int endRownum; //시작 rownum
	
	
	
	public void pagingSetting(int locatedPage) {
		this.locatedPage = locatedPage;
		setStartRownum();setEndRownum();
		
		
		
	}


	
	
	public int getTotalPrjAmount() {
		return totalPrjAmount;
	}


	public void setTotalPrjAmount(int totalPrjAmount) {
		this.totalPrjAmount = totalPrjAmount;
	}


	public int getLocatedPage() {
		return locatedPage;
	}


	public void setLocatedPage(int locatedPage) {
		if(locatedPage<=0) {
			this.locatedPage=1;
			return;
		}
			
		this.locatedPage = locatedPage;
	}




	public int getStartRownum() {
		return startRownum;
	}




	public void setStartRownum() {
		//처음엔 page값이 0이므로 자동으로 1부터 시작.
		this.startRownum = this.locatedPage*(PER_PAGE_PROJECT)+1;
		//0페이지->1 / 1페이지->31
	}




	public int getEndRownum() {
		return endRownum;
	}




	public void setEndRownum() {
		this.endRownum = (this.startRownum+PER_PAGE_PROJECT-1);
		//0페이지-> 30 / 1페이지 -> 60
	}



	
	
	
	
	

	
	

}
