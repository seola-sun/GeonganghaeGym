package com.gym.geonganghae.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.gym.geonganghae.command.Command;
import com.gym.geonganghae.command.InterestCommand;
import com.gym.geonganghae.command.ListCommand;
import com.gym.geonganghae.dao.InterestDao;
import com.gym.geonganghae.dto.InterestDto;
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

	// GET 방식 (링크, URL을 통한 리퀘스트시 jsp파일 리턴
	@RequestMapping("/interest_list")
	public String list(HttpServletRequest request, Model model) {
		System.out.println("list()");
		
		// by설아, dataTablesList POST메소드로 옮김
//		model.addAttribute("request", request);
//		command = new ListCommand();
//		((ListCommand) command).interList(model);

		return "interest_list";
	}

	// by설아, 
	@ResponseBody
	@RequestMapping(value = "/interest_list", method = RequestMethod.POST)
	public Object dataTablesList(HttpServletRequest request, Model model) {
		System.out.println("list()");

		Map<String, Object> map = new HashMap<String, Object>();

		model.addAttribute("request", request);
		command = new ListCommand();
		List<InterestDto> listInterest = ((ListCommand) command).interList(model);

		map.put("data", listInterest);

		Object result = map;

		return result;
	}
	
	// by설아, DataTables 삭제 기능, ajax 통신
	@ResponseBody
	@RequestMapping(value = "/InterDelete", method = RequestMethod.POST)
	public void delete(HttpServletRequest request, Model model) {
		System.out.println("delete()");

		model.addAttribute("request", request);
		command = new InterestCommand();
		command.execute(model);
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