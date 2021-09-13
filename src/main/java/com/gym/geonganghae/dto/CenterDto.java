package com.gym.geonganghae.dto;

import java.sql.Date;

public class CenterDto {

	private String centerCode;
	private String centerName;
	private String sportsCode;
	private String sportsName;
	private String telNumber;
	private String zipCode;
	private String address;
	private float latitude;
	private float longitude;
	private String dayoff;
	private String operatingTime;
	private int usageFeeMin;
	private int usageFeeMax;
	private int regFee;
	private Date openDate;
	private String thumbnail;
	private String image;
	private String detail;
	private int interestCnt;
	private int recommendCnt;
	private Date regDate;

	public CenterDto() {
		// TODO Auto-generated constructor stub
	}

	public String getCenterCode() {
		return centerCode;
	}

	public void setCenterCode(String centerCode) {
		this.centerCode = centerCode;
	}

	public String getCenterName() {
		return centerName;
	}

	public void setCenterName(String centerName) {
		this.centerName = centerName;
	}

	public String getSportsCode() {
		return sportsCode;
	}

	public void setSportsCode(String sportsCode) {
		this.sportsCode = sportsCode;
	}

	public String getTelNumber() {
		return telNumber;
	}

	public void setTelNumber(String telNumber) {
		this.telNumber = telNumber;
	}

	public String getZipCode() {
		return zipCode;
	}

	public void setZipCode(String zipCode) {
		this.zipCode = zipCode;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public float getLatitude() {
		return latitude;
	}

	public void setLatitude(float latitude) {
		this.latitude = latitude;
	}

	public float getLongitude() {
		return longitude;
	}

	public void setLongitude(float longitude) {
		this.longitude = longitude;
	}

	public String getDayoff() {
		return dayoff;
	}

	public void setDayoff(String dayoff) {
		this.dayoff = dayoff;
	}

	public String getOperatingTime() {
		return operatingTime;
	}

	public void setOperatingTime(String operTime) {
		this.operatingTime = operTime;
	}

	public int getUsageFeeMin() {
		return usageFeeMin;
	}

	public void setUsageFeeMin(int usageFeeMin) {
		this.usageFeeMin = usageFeeMin;
	}

	public int getUsageFeeMax() {
		return usageFeeMax;
	}

	public void setUsageFeeMax(int usageFeeMax) {
		this.usageFeeMax = usageFeeMax;
	}

	public int getRegFee() {
		return regFee;
	}

	public void setRegFee(int regFee) {
		this.regFee = regFee;
	}

	public Date getOpenDate() {
		return openDate;
	}

	public void setOpenDate(Date openDate) {
		this.openDate = openDate;
	}

	public String getThumbnail() {
		return thumbnail;
	}

	public void setThumbnail(String thumbnail) {
		this.thumbnail = thumbnail;
	}

	public String getImage() {
		return image;
	}

	public void setImage(String image) {
		this.image = image;
	}

	public String getDetail() {
		return detail;
	}

	public void setDetail(String detail) {
		this.detail = detail;
	}

	public int getInterestCnt() {
		return interestCnt;
	}

	public void setInterestCnt(int interestCnt) {
		this.interestCnt = interestCnt;
	}

	public int getRecommendCnt() {
		return recommendCnt;
	}

	public void setRecommendCnt(int recommendCnt) {
		this.recommendCnt = recommendCnt;
	}

	public Date getRegDate() {
		return regDate;
	}

	public void setRegDate(Date regDate) {
		this.regDate = regDate;
	}

	public String getSportsName() {
		return sportsName;
	}

	public void setSportsName(String sportsName) {
		this.sportsName = sportsName;
	}

}
