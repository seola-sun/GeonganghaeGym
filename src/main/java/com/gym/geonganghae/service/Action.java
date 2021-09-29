package com.gym.geonganghae.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.ui.Model;

import com.gym.geonganghae.dto.CenterDto;
import com.gym.geonganghae.dto.InterestDto;

public interface Action {
	public void execute(HttpServletRequest request, HttpServletResponse response) throws Exception;
}
