package com.gym.geonganghae.command;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.ui.Model;

import com.gym.geonganghae.dao.ManagerMemberDao;

public class ManagerMemberModifyCommand implements Command {

	@Override
	public void execute(Model model) {
		// TODO Auto-generated method stub

		Map<String, Object> map = model.asMap();
		HttpServletRequest request = (HttpServletRequest) map.get("request");
		String id = request.getParameter("id");
		String name = request.getParameter("name");
		String tel_number = request.getParameter("tel_number");
		String email = request.getParameter("email");
		
		ManagerMemberDao  dao = new ManagerMemberDao();
		dao.modify(id, name, tel_number, email);
			
	}

}
