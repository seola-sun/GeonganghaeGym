package com.gym.geonganghae.service;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.gym.geonganghae.dao.MemberDao;

public class IdExist implements Action {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		PrintWriter out = response.getWriter();

		String id = request.getParameter("id");
		String password = request.getParameter("password");

		MemberDao memDao = MemberDao.getInstance();

		int result = memDao.idExistCheck(id, password);

		out.println(result);
		out.close();

	}

}
