package com.gym.geonganghae.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.gym.geonganghae.command.BWriteCommand;
import com.gym.geonganghae.command.Command;
import com.gym.geonganghae.service.Action;
import com.gym.geonganghae.service.IdCheck;

@Controller
public class JoinController {

	Command command = null;
	Action action = null;

	@RequestMapping("/write_view")
	public String write_view(Model model) {
		System.out.println("write_view()");

		return "write_view";
	}

	@RequestMapping("/write")
	public String write(HttpServletRequest request, Model model) {
		System.out.println("write()");

		model.addAttribute("request", request);
		command = new BWriteCommand();
		command.execute(model);

		return "redirect:login";
	}

	@RequestMapping(value = "/idCheck", method = RequestMethod.POST)
	public void idCheck(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("idCheck()");

		try {
			action = new IdCheck();
			action.execute(request, response);

		} catch (Exception e) {
			e.printStackTrace();
		}

	}

}
