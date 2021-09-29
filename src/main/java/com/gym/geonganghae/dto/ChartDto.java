package com.gym.geonganghae.dto;

public class ChartDto {
	private int 	value;
	private String  index;


	public ChartDto() {
		// TODO Auto-generated constructor stub
	}


	public ChartDto(int value, String index) {
		super();
		this.value = value;
		this.index = index;
	}


	public int getValue() {
		return value;
	}


	public void setValue(int value) {
		this.value = value;
	}


	public String getIndex() {
		return index;
	}


	public void setIndex(String index) {
		this.index = index;
	}

	
}	