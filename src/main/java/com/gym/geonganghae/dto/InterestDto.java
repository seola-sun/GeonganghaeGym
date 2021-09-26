package com.gym.geonganghae.dto;

import java.sql.Date;

public class InterestDto {

	private String id;
	private String centerCode;
	private Date regDate;
	private int interest_cnt;
	private int usage_fee_min;

	public InterestDto() {
	}

	public InterestDto(String id, String centerCode, Date regDate, int interest_cnt, int usage_fee_min) {

		this.id = id;
		this.centerCode = centerCode;
		this.regDate = regDate;
		this.interest_cnt = interest_cnt;
		this.usage_fee_min = usage_fee_min;
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

}
