package com.gym.geonganghae.controller;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.gym.geonganghae.command.Command;
import com.gym.geonganghae.dao.MemberDao;
import com.gym.geonganghae.dto.MemberDto;

@Controller
public class LoginController {

	Command command = null;

	@RequestMapping(value = "/login", method = RequestMethod.GET)
	public String loginView() {
		System.out.println("login_view()");
		return "login";
	}

	@RequestMapping(value = "/login", method = RequestMethod.POST)
	public String login(MemberDto dto, MemberDao dao, HttpSession session) {

		// 아이디, 비밀번호 유효성 검사 (예외 처리)
		if (dto.getId() == null || dto.getId().equals("")) {
			throw new IllegalArgumentException("아이디는 반드시 입력해야 합니다.");
		} else if (dto.getPassword() == null || dto.getPassword().equals("")) {
			throw new IllegalArgumentException("비밀번호는 반드시 입력해야 합니다.");
		}

		MemberDto member = dao.getUser(dto);

		if (member != null) {
			session.setAttribute("userName", member.getName());
			session.setAttribute("userId", member.getId());
			return "redirect:index";
		} else {
			return "login";
		}
		
	}

}
