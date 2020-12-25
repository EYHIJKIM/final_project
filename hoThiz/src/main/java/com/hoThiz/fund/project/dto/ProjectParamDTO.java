package com.hothiz.fund.project.dto;



public class ProjectParamDTO {
	private String sort; //1.sort의 경우 orderby로 끊어주면 된다.(총 
	private String ongoing; //2. ongoing or prelaunching. 끝난 펀딩의 경우는 제외하려고 만든 파라미터 같다.
	private String category;
	private int page;
	private String query;
	

	//
	private int currentMoney;
	private int maxMoney;
	private int minMoney;
	
	
	private int achieveRate;
	private int maxAchieveRate;
	private int minAchieveRate;

	
	
	public void setting() {
		if(sort==null || sort.equals("")) {this.sort="popular";}
		if(ongoing==null || ongoing.equals("")) {this.ongoing="ongoing";}
		if(category==null || category.equals("")) {this.category="none";}
		if(query==null || query.equals("")) {this.query="none";}
		
		//디폴트라면

		if(achieveRate==1) { this.minAchieveRate=0; this.maxAchieveRate =75;}
		else if(achieveRate==2) { this.minAchieveRate=75; this.maxAchieveRate=100; } 
		else if(achieveRate==3) { this.minAchieveRate=100; }
		
		
		//직접 입력한게 아니라면, 즉 current도 없고 max도 없으면.. -> 디폴트로

		if(currentMoney==1) {this.minMoney=0; this.maxMoney = 1000000;} 
		
		else if(currentMoney==2) {
			this.minMoney = 1000000;
			this.maxMoney = 10000000;
			
		} else if(currentMoney==3) {
			this.minMoney = 10000000;
			this.maxMoney = 50000000;
			
		}else if(currentMoney==4) {
			this.minMoney = 50000000;
			this.maxMoney = 100000000;
			
		}else if(currentMoney==5) {
			
			this.minMoney = 100000000;
		}
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



	public String getCategory() {
		return category;
	}



	public void setCategory(String category) {
		this.category = category;
	}



	public int getPage() {
		return page;
	}



	public void setPage(int page) {
		this.page = page;
	}



	public String getQuery() {
		return query;
	}



	public void setQuery(String query) {
		this.query = query;
	}



	public int getCurrentMoney() {
		return currentMoney;
	}



	public void setCurrentMoney(int currentMoney) {
		this.currentMoney = currentMoney;
	}



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



	public int getAchieveRate() {
		return achieveRate;
	}



	public void setAchieveRate(int achieveRate) {
		this.achieveRate = achieveRate;
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
