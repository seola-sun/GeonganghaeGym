package com.gym.geonganghae.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.gym.geonganghae.command.BWriteCommand;
import com.gym.geonganghae.command.CenterCommand;
import com.gym.geonganghae.command.Command;
import com.gym.geonganghae.command.ListCommand;
import com.gym.geonganghae.dao.MemberDao;
import com.gym.geonganghae.dto.MemberDto;
import com.gym.geonganghae.util.Constant;

@Controller
public class CenterController {

	Command command = null;

	@RequestMapping("/center_list")
	public String list(Model model) {
		System.out.println("center_list()");

		command = new ListCommand();
		command.execute(model);

		return "center_list";
	}

	@RequestMapping("/center_view")
	public String content_view(HttpServletRequest request, Model model) {
		System.out.println("center_view()");

		model.addAttribute("request", request);
		command = new CenterCommand();
		command.execute(model);

		return "center_view";
	}

}
