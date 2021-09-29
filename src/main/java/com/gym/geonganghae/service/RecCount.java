package com.gym.geonganghae.service;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.ui.Model;

import com.gym.geonganghae.dao.CenterDao;
import com.gym.geonganghae.dao.InterestDao;
import com.gym.geonganghae.dto.CenterDto;

public class RecCount implements Action {

	@Override
	public CenterDto execute(HttpServletRequest request, HttpServletResponse response, Model model) throws Exception {
//		request.setCharacterEncoding("utf-8");
//		response.setContentType("text/html;charset=utf-8");
		PrintWriter out = response.getWriter();

		String centerCode = request.getParameter("center");
		String userId = request.getParameter("member");

		CenterDao centerDao = new CenterDao();
		CenterDto centerDto = centerDao.centerView(centerCode);
		
		// 로그인한 회원이 해당 센터를 추천하고 있는지 체크
		InterestDao interDao = new InterestDao();
		int result = interDao.recCheck(centerCode, userId);
		
		model.addAttribute("recommend", result);
		
		System.out.println("속성값 : " + model.asMap().get("recommend"));
		
		// 센터 총 추천수를 구함
		int count = centerDto.getRecommendCnt();

		// 뷰페이지(center_view.jsp)에 추천수를 출력하도록 하는 역할
		out.println(count);
		out.close();

		return centerDto;
	}
}