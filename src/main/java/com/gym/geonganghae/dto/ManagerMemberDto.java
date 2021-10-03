package com.gym.geonganghae.dto;

import java.sql.Date;

public class ManagerMemberDto {

	private String id;
	private String password;
	private String name;
	private String tel_number;
	private String email;
	private Date regdate;
	private Date moddate;
	private String searchCondition;
	private String serachKeyword;

	public ManagerMemberDto() {
		// TODO Auto-generated constructor stub
	}

	public ManagerMemberDto(String id, String password, String name, String tel_number, String email, 
			Date regdate, Date moddate) {
		super();
		this.id = id;
		this.password = password;
		this.name = name;
		this.tel_number = tel_number;
		this.email = email;
		this.regdate = regdate;
		this.moddate = moddate;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getTel_number() {
		return tel_number;
	}

	public void setTel_number(String tel_number) {
		this.tel_number = tel_number;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public Date getRegdate() {
		return regdate;
	}

	public void setRegdate(Date regdate) {
		this.regdate = regdate;
	}
	
	public Date getModdate() {
		return moddate;
	}

	public void setModdate(Date moddate) {
		this.moddate = moddate;
	}

	public String getSearchCondition() {
		return searchCondition;
	}

	public void setSearchCondition(String searchCondition) {
		this.searchCondition = searchCondition;
	}

	public String getSerachKeyword() {
		return serachKeyword;
	}

	public void setSerachKeyword(String serachKeyword) {
		this.serachKeyword = serachKeyword;
	}
}
