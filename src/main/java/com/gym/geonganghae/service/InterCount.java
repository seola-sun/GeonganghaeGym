package com.gym.geonganghae.service;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.ui.Model;

import com.gym.geonganghae.dao.CenterDao;
import com.gym.geonganghae.dao.InterestDao;
import com.gym.geonganghae.dto.CenterDto;

public class InterCount implements Action {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		PrintWriter out = response.getWriter();

		String centerCode = request.getParameter("center");

		CenterDao centerDao = new CenterDao();
		CenterDto centerDto = centerDao.centerView(centerCode);
		
		// 센터 총 관심등록수를 구함
		int count = centerDto.getInterestCnt();

		// 뷰페이지(center_view.jsp)에 추천수를 출력하도록 하는 역할
		out.println(count);
		out.close();
	}
}