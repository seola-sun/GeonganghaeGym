package com.gym.geonganghae.command;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.ui.Model;

import com.gym.geonganghae.dao.MemberDao;

public class DeleteCommand implements Command {

	@Override
	public void execute(Model model) {
		Map<String, Object> map = model.asMap();
		HttpServletRequest request = (HttpServletRequest) map.get("request");

		HttpSession session = request.getSession();
		String id = (String) session.getAttribute("userId");

		MemberDao dao = new MemberDao();
		dao.delete(id);

		session.invalidate();
	}

}