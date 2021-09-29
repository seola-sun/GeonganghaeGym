package com.gym.geonganghae.dto;

import java.sql.Date;

public class RecommendDto {

	private String seq;
	private String id;
	private String centerCode;
	private Date regDate;

	public RecommendDto() {
	}

	public RecommendDto(String seq, String id, String centerCode, Date regDate) {

		this.seq = seq;
		this.id = id;
		this.centerCode = centerCode;
		this.regDate = regDate;
	}

	public String getSeq() {
		return seq;
	}

	public void setSeq(String seq) {
		this.seq = seq;
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
}
