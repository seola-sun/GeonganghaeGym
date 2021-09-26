package com.gym.geonganghae.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.gym.geonganghae.command.Command;
import com.gym.geonganghae.command.InterestCommand;
import com.gym.geonganghae.command.ListCommand;
import com.gym.geonganghae.util.Constant;

@Controller
public class InterestController {

	Command command = null;

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

}