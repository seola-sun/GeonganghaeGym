package com.gym.geonganghae.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.gym.geonganghae.command.BWriteCommand;
import com.gym.geonganghae.command.Command;

@Controller
public class JoinController {
	
	Command command = null;
	
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

//		if("회원가입 성공시") {
//			return "login";
//		} else {
//			"회원가입 실패시(필수입력 누락, 올바르지 않은 형식으로 입력)"
//			return "write_view";
//		}

	}

}
