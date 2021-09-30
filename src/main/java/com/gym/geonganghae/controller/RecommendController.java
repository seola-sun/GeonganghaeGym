package com.gym.geonganghae.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.gym.geonganghae.command.Command;
import com.gym.geonganghae.dao.RecommendDao;
import com.gym.geonganghae.dto.CenterDto;
import com.gym.geonganghae.service.Action;
import com.gym.geonganghae.service.RecCount;
import com.gym.geonganghae.service.RecUpdate;
import com.gym.geonganghae.util.Constant;

@Controller
public class RecommendController {

	private JdbcTemplate template;

	Action action = null;

	@Autowired
	public void setTemplate(JdbcTemplate template) {
		this.template = template;
		Constant.template = this.template;
	}

	// by설아, 추천수 업데이트
	@ResponseBody
	@RequestMapping(value = "/RecUpdate", method = RequestMethod.POST)
	public void recUpdate(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		try {
			action = new RecUpdate();
			action.execute(request, response);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	// by설아, 추천수 검색
	@ResponseBody
	@RequestMapping(value = "/RecCount", method = RequestMethod.POST)
	public void recCount(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		try {
			action = new RecCount();
			action.execute(request, response);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	// by설아, 추천 체크
	@RequestMapping(value = "/RecCheck", method = RequestMethod.POST)
	public void recCheck(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		try {
			String centerCode = request.getParameter("center");
			String loginId = request.getParameter("member");

			RecommendDao recDao = new RecommendDao();

			PrintWriter out = response.getWriter();
			out.print(recDao.recommendChk(centerCode, loginId) + "");
			out.close();

		} catch (Exception e) {
			e.printStackTrace();
		}
	}

}
