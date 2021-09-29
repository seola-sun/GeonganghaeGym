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
import com.gym.geonganghae.command.InterestCommand;
import com.gym.geonganghae.command.ListCommand;
import com.gym.geonganghae.dao.InterestDao;
import com.gym.geonganghae.service.Action;
import com.gym.geonganghae.service.InterCount;
import com.gym.geonganghae.service.InterUpdate;
import com.gym.geonganghae.util.Constant;

@Controller
public class InterestController {

	Command command = null;
	Action action = null;
	private JdbcTemplate template;

	@Autowired
	public void setTemplate(JdbcTemplate template) {
		this.template = template;
		Constant.template = this.template;
	}

	@RequestMapping("/interest_list")
	public String list(HttpServletRequest request, Model model) {

		System.out.println("list()");
		
		model.addAttribute("request", request);
		command = new ListCommand();
		((ListCommand) command).interList(model);

		return "interest_list";
	}

	@RequestMapping("/InterDelete")
	public String delete(HttpServletRequest request, Model model) {
		System.out.println("delete()");

		model.addAttribute("request", request);
		command = new InterestCommand();
		command.execute(model);

		return "redirect:interest_list";
	}
	
	// by설아, 관심등록수 업데이트
		@ResponseBody
		@RequestMapping(value = "/InterUpdate", method = RequestMethod.POST)
		public void interUpdate(HttpServletRequest request, HttpServletResponse response)
				throws ServletException, IOException {
			try {
				action = new InterUpdate();
				action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}

		// by설아, 관심등록수 검색
		@ResponseBody
		@RequestMapping(value = "/InterCount", method = RequestMethod.POST)
		public void interCount(HttpServletRequest request, HttpServletResponse response)
				throws ServletException, IOException {
			try {
				action = new InterCount();
				action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}

		// by설아, 관심 등록 체크
		@RequestMapping(value = "/InterCheck", method = RequestMethod.POST)
		public void interCheck(HttpServletRequest request, HttpServletResponse response)
				throws ServletException, IOException {
			try {
				String centerCode = request.getParameter("center");
				String loginId = request.getParameter("member");

				InterestDao interDao = new InterestDao();

				PrintWriter out = response.getWriter();
				out.print(interDao.interestChk(centerCode, loginId) + "");
				out.close();

			} catch (Exception e) {
				e.printStackTrace();
			}
		}

}