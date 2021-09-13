package com.gym.geonganghae.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.gym.geonganghae.command.CenterCommand;
import com.gym.geonganghae.command.Command;
import com.gym.geonganghae.command.ListCommand;
import com.gym.geonganghae.dao.CenterDao;

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
	
	@RequestMapping("/addInterest")
	public String addInterest(HttpServletRequest request, Model model, CenterDao dao) {

		model.addAttribute("request", request);
		command = new CenterCommand();
		String centerCode = ((CenterCommand) command).addInterestCommand(model);

		return "redirect:center_view?centerCode=" + centerCode;
	}
	
	@RequestMapping("/delInterest")
	public String delInterest(HttpServletRequest request, Model model, CenterDao dao) {

		model.addAttribute("request", request);
		command = new CenterCommand();
		String centerCode = ((CenterCommand) command).delInterestCommand(model);

		return "redirect:center_view?centerCode=" + centerCode;
	}
	
	@RequestMapping("/addRecommend")
	public String addRecommend(HttpServletRequest request, Model model, CenterDao dao) {

		model.addAttribute("request", request);
		command = new CenterCommand();
		String centerCode = ((CenterCommand) command).addRecommendCommand(model);

		return "redirect:center_view?centerCode=" + centerCode;
	}
	
	@RequestMapping("/delRecommend")
	public String delRecommend(HttpServletRequest request, Model model, CenterDao dao) {

		model.addAttribute("request", request);
		command = new CenterCommand();
		String centerCode = ((CenterCommand) command).delRecommendCommand(model);

		return "redirect:center_view?centerCode=" + centerCode;
	}

}
