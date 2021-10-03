package com.gym.geonganghae.command;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.ui.Model;

import com.gym.geonganghae.dao.ManagerMemberDao;
import com.gym.geonganghae.dto.ManagerMemberDto;

public class ManagerMemberContentCommand implements Command {

	@Override
	public void execute(Model model) {
		// TODO Auto-generated method stub

		Map<String, Object> map = model.asMap();
		HttpServletRequest request = (HttpServletRequest) map.get("request");
		String id = request.getParameter("id");
		
		ManagerMemberDao dao = new ManagerMemberDao();
		ManagerMemberDto dto = dao.contentView(id);
		
		model.addAttribute("manager_member_content_view", dto);
		
	}

}
