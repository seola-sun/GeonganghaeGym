package com.gym.geonganghae.command;

import java.util.ArrayList;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.ui.Model;

import com.gym.geonganghae.dao.ManagerCenterDAO;
import com.gym.geonganghae.dto.ManagerCenterDTO;

public class ManagerCenterListCommand implements Command {
	
	@Override
	public void execute(Model model) {
		// TODO Auto-generated method stub
		Map<String, Object> map = model.asMap();
		HttpServletRequest request = (HttpServletRequest) map.get("request");

		String centerNameKeyword = request.getParameter("centerNameKeyword");
		String[] sportsNameKeyword = request.getParameterValues("sportsNameKeyword");
		String sidoKeyword = request.getParameter("sidoKeyword");
		String sigunguKeyword = request.getParameter("sigunguKeyword");
		String roKeyword = request.getParameter("roKeyword");
		String usageMinFeeKeyword = request.getParameter("usageMinFeeKeyword");
		String usageMaxFeeKeyword = request.getParameter("usageMaxFeeKeyword");

		ManagerCenterDAO dao = new ManagerCenterDAO();
		ArrayList<ManagerCenterDTO> dtos = dao.list(centerNameKeyword, sportsNameKeyword, sidoKeyword, sigunguKeyword, usageMinFeeKeyword, usageMaxFeeKeyword);
		model.addAttribute("manager_center_list", dtos);
		
	}

}