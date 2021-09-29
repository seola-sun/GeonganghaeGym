package com.gym.geonganghae.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.gym.geonganghae.dao.RecommendDao;

public class RecUpdate implements Action {

	public void execute(HttpServletRequest request, HttpServletResponse response) throws Exception {

		String centerCode = request.getParameter("center");
		String userId = request.getParameter("member");

		RecommendDao recDao = RecommendDao.getInstance();

		int result = recDao.recommendChk(centerCode, userId);

		if (result == 0) { // 추천하지 않았다면 추천 추가
			recDao.recUpdate(centerCode, userId);
			
		} else { // 추천을 하였다면 추천 삭제
			recDao.recDelete(centerCode, userId);
		}

	}

}
