package com.hothiz.fund.project.dto;

import org.springframework.web.bind.annotation.ModelAttribute;

public class ProjectParamDTO {
	private String sort;
	private String ongoing;
	private int maxAchieveRate;
	private int minAchieveRate;
	private String category;
	private int page;
	private String query;



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
