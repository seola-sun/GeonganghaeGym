package com.gym.geonganghae.controller;

import java.io.IOException;

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
import com.gym.geonganghae.dto.CenterDto;
import com.gym.geonganghae.dto.InterestDto;
import com.gym.geonganghae.service.Action;
import com.gym.geonganghae.service.ActionForward;
import com.gym.geonganghae.service.RecCount;
import com.gym.geonganghae.util.Constant;

@Controller
public class RecommendController {

	Command command = null;

	private JdbcTemplate template;

	Action action = null;

	ActionForward forward = null;

	@Autowired
	public void setTemplate(JdbcTemplate template) {
		this.template = template;
		Constant.template = this.template;
	}

	// by설아, 추천수 업데이트
//	@ResponseBody
//	@RequestMapping("/RecUpdate")
//	public void recUpdate(HttpServletRequest request, HttpServletResponse response, Model model)
//			throws ServletException, IOException {
//		try {
//			action = new RecUpdate();
//			action.execute(request, response, model);
//		} catch (Exception e) {
//			e.printStackTrace();
//		}
//	}

	// by설아, 추천수 검색
	@ResponseBody
	@RequestMapping(value = "/RecCount", method = RequestMethod.POST)
	public CenterDto recCount(HttpServletRequest request, HttpServletResponse response, Model model)
			throws ServletException, IOException {
		CenterDto dto = null;
		try {
			action = new RecCount();
			dto = action.execute(request, response, model);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return dto;
	}

//	/**
//	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
//	 *      response)
//	 */
//	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//		System.out.println("get");
//		doProcess(request, response);
//	}
//
//	/**
//	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
//	 *      response)
//	 */
//	protected void doPost(HttpServletRequest request, HttpServletResponse response)	throws ServletException, IOException {
//		System.out.println("post");
//		doProcess(request, response);
//	}

}
