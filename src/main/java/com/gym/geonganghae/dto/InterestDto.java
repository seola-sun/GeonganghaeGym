package com.gym.geonganghae.dto;

import java.sql.Date;

public class InterestDto {

	private String seq;
	private String id;
	private String centerCode;
	private String centerName;
	private String sportsCode;
	private String sportsName;
	private Date regDate;
	private int interest_cnt;
	private int recommend_cnt;
	private int usage_fee_min;
	

	public InterestDto() {
	}

	public InterestDto(String seq, String id, String centerCode, String centerName, String sportsCode, String sportsName, Date regDate,
			int interest_cnt, int recommend_cnt, int usage_fee_min) {
		super();
		this.seq = seq;
		this.id = id;
		this.centerCode = centerCode;
		this.centerName = centerName;
		this.sportsCode = sportsCode;
		this.sportsName = sportsName;
		this.regDate = regDate;
		this.interest_cnt = interest_cnt;
		this.recommend_cnt = recommend_cnt;
		this.usage_fee_min = usage_fee_min;
	}

	public String getSeq() {
		return seq;
	}

	public void setSeq(String seq) {
		this.seq = seq;
	}

	public int getUsage_fee_min() {
		return usage_fee_min;
	}

	public void setUsage_fee_min(int usage_fee_min) {
		this.usage_fee_min = usage_fee_min;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getCenterCode() {
		return centerCode;
	}

	public void setCenterCode(String center_Code) {
		this.centerCode = center_Code;
	}

	public Date getRegDate() {
		return regDate;
	}

	public void setRegDate(Date regDate) {
		this.regDate = regDate;
	}

	public int getInterest_cnt() {
		return interest_cnt;
	}

	public void setInterest_cnt(int interest_cnt) {
		this.interest_cnt = interest_cnt;
	}

	public String getCenterName() {
		return centerName;
	}

	public void setCenterName(String centerName) {
		this.centerName = centerName;
	}

	public int getRecommend_cnt() {
		return recommend_cnt;
	}

	public void setRecommend_cnt(int recommend_cnt) {
		this.recommend_cnt = recommend_cnt;
	}

	public String getSportsCode() {
		return sportsCode;
	}

	public void setSportsCode(String sportsCode) {
		this.sportsCode = sportsCode;
	}
	
	public String getSportsName() {
		return sportsName;
	}

	public void setSportsName(String sportsName) {
		this.sportsName = sportsName;
	}

}
