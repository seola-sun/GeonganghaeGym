package com.gym.geonganghae.command;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.ui.Model;

import com.gym.geonganghae.dao.MemberDao;
import com.gym.geonganghae.dto.MemberDto;

public class MyinfoCommand implements Command {

	@Override
	public void execute(Model model) {
		// TODO Auto-generated method stub

		Map<String, Object> map = model.asMap();
		HttpServletRequest request = (HttpServletRequest) map.get("request");
		//String id = request.getParameter("id");
		
		HttpSession session = request.getSession();
		String loginId = (String) session.getAttribute("userId");
		
		MemberDao dao = new MemberDao();
		MemberDto dto = dao.memberView(loginId);
		
		model.addAttribute("member", dto);
		
	}
	
}
