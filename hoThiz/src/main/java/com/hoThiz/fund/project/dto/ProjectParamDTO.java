package com.hothiz.fund.project.dto;

import org.springframework.web.bind.annotation.ModelAttribute;

public class ProjectParamDTO {
	private String sort;
	private String ongoing;

	private String category;
	private int page;
	private String query;
	
	
	public int getMaxMoney() {
		return maxMoney;
	}




	public void setMaxMoney(int maxMoney) {
		this.maxMoney = maxMoney;
	}




	public int getMinMoney() {
		return minMoney;
	}




	public void setMinMoney(int minMoney) {
		this.minMoney = minMoney;
	}
	private int currentMoney;
	private int maxMoney;
	private int minMoney;
	
	
	private int achieveRate;
	private int maxAchieveRate;
	private int minAchieveRate;


	public int getCurrentMoney() {
		return currentMoney;
	}




	public void setCurrentMoney(int currentMoney) {
		this.currentMoney = currentMoney;
	}




	public int getAchieveRate() {
		return achieveRate;
	}




	public void setAchieveRate(int achieveRate) {
		this.achieveRate = achieveRate;
	}




	public ProjectParamDTO() {
		if(this.sort==null || sort.equals("")) {this.sort="none";}
		if(this.ongoing==null || ongoing.equals("")) {this.ongoing="none";}
		if(this.category==null || category.equals("")) {this.category="none";}
		if(this.query==null || query.equals("")) {this.query="none";}
		
		if(achieveRate==1) {
			this.maxAchieveRate = 75;
		} else if(achieveRate==2) {
			this.minAchieveRate=75;
			this.maxAchieveRate=100;
		} else if(achieveRate==3) {
			this.minAchieveRate=100;
			
		}
		
		if(currentMoney==1) {
			maxMoney = 1000000;
			
		} else if(currentMoney==2) {
			minMoney = 1000000;
			maxMoney = 10000000;
			
		} else if(currentMoney==3) {
			minMoney = 10000000;
			maxMoney = 50000000;
			
		}else if(currentMoney==4) {
			minMoney = 50000000;
			maxMoney = 100000000;
			
		}else if(currentMoney==5) {
			
			minMoney = 100000000;
		}
		
		
		
	}
	
	
	
	
	public String getQuery() {
		return query;
	}
	public void setQuery(String query) {
		this.query = query;
	}
	public int getPage() {
		return page;
	}
	public void setPage(int page) {
		this.page = page;
	}
	public String getCategory() {
		return category;
	}
	public void setCategory(String category) {
		this.category = category;
	}
	public String getSort() {
		return sort;
	}
	public void setSort(String sort) {
		this.sort = sort;
	}

	public String getOngoing() {
		return ongoing;
	}
	public void setOngoing(String ongoing) {
		this.ongoing = ongoing;
	}
	public int getMaxAchieveRate() {
		return maxAchieveRate;
	}
	public void setMaxAchieveRate(int maxAchieveRate) {
		this.maxAchieveRate = maxAchieveRate;
	}
	public int getMinAchieveRate() {
		return minAchieveRate;
	}
	public void setMinAchieveRate(int minAchieveRate) {
		this.minAchieveRate = minAchieveRate;
	}

	
	
}
