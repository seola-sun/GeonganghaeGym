package com.gym.geonganghae.command;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.ui.Model;

import com.gym.geonganghae.dao.MemberDao;
import com.gym.geonganghae.dto.MemberDto;

public class MyinfoModifyViewCommand implements Command {

	
	@Override
	public void execute(Model model) {

		Map<String, Object> map = model.asMap();
		HttpServletRequest request = (HttpServletRequest) map.get("request");
		
		HttpSession session = request.getSession();
		String id = (String) session.getAttribute("userId");
		
		MemberDao dao = new MemberDao();
		MemberDto dto = dao.memberView(id);
		
		model.addAttribute("infoModify_view", dto);
	}
}
