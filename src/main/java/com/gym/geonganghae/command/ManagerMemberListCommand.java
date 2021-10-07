package com.gym.geonganghae.command;

import java.util.ArrayList;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.ui.Model;

import com.gym.geonganghae.dao.ManagerMemberDao;
import com.gym.geonganghae.dto.ManagerMemberDto;

public class ManagerMemberListCommand implements Command {
	
	@Override
	public void execute(Model model) {
		// TODO Auto-generated method stub
		Map<String, Object> map = model.asMap();
		HttpServletRequest request = (HttpServletRequest) map.get("request");
		
		String searchCondition = request.getParameter("searchCondition");
		String searchKeyword = request.getParameter("searchKeyword");
		
		ManagerMemberDao dao = new ManagerMemberDao();
		ArrayList<ManagerMemberDto> dtos = dao.list(searchCondition, searchKeyword);
		model.addAttribute("manager_member_list", dtos);
		
	}

}