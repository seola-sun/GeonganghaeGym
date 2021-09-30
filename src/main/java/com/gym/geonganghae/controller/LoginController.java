package com.gym.geonganghae.controller;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.gym.geonganghae.command.Command;
import com.gym.geonganghae.dao.MemberDao;
import com.gym.geonganghae.dto.MemberDto;

/**
 * @author 설아
 * @summary 로그인 페이지를 보여주고, 로그인 입력을 받는 컨트롤러 클래스.
 */
@Controller
public class LoginController
{
	// by설아, GET방식으로 login 페이지가 요청된 경우,
	// 로그인 페이지를 보여주는 메소드이다.
	@RequestMapping(value = "/login", method = RequestMethod.GET)
	public String loginView()
	{
		return "login";
	}

	// by설아, 로그인 페이지에서 POST방식으로 아이디와 비밀번호가 입력된 경우,
	// 실행되는 메소드이다.
	@RequestMapping(value = "/login", method = RequestMethod.POST)
	public String login(MemberDto dto, MemberDao dao, HttpSession session)
	{
		// by설아, 아이디 또는 비밀번호 누락시 예외 처리
		if (dto.getId() == null || dto.getId().equals(""))
		{
			throw new IllegalArgumentException("아이디는 반드시 입력해야 합니다.");
		}
		else if (dto.getPassword() == null || dto.getPassword().equals(""))
		{
			throw new IllegalArgumentException("비밀번호는 반드시 입력해야 합니다.");
		}

		// by설아, 메소드의 매개변수로 받은 dao와 dto객체를 활용하여
		// 사용자가 입력한 아이디와 비밀번호에 해당하는 회원을 조회한다.
		MemberDto member = dao.getUser(dto);

		if (member != null)
		{
			// by설아, 로그인에 성공한 경우,
			// 세션에 속성을 설정하여, 각각 회원 아이디와 이름을 저장한다.
			session.setAttribute("userId", member.getId());
			session.setAttribute("userName", member.getName());
			session.setAttribute("admin", member.getAdmin());
			
			// by설아, 로그인 성공 후에는 index화면으로 이동한다.
			return "redirect:/";
		}
		else
		{
			// by설아, 로그인에 실패한 경우,
			// login화면을 다시 보여 준다.
			return "login";
		}
	}
}
