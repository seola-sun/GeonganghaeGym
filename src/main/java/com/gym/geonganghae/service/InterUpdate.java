package com.gym.geonganghae.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.gym.geonganghae.dao.InterestDao;

public class InterUpdate implements Action {

	public void execute(HttpServletRequest request, HttpServletResponse response) throws Exception {

		String centerCode = request.getParameter("center");
		String userId = request.getParameter("member");

		InterestDao interDao = InterestDao.getInstance();

		int result = interDao.interestChk(centerCode, userId);

		if (result == 0) { // 추천하지 않았다면 추천 추가
			interDao.interUpdate(centerCode, userId);
			
		} else { // 추천을 하였다면 추천 삭제
			interDao.interDelete(centerCode, userId);
		}

	}

}
