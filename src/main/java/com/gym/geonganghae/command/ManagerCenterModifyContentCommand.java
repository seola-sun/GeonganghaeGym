package com.gym.geonganghae.command;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.ui.Model;

import com.gym.geonganghae.dao.ManagerCenterDAO;
import com.gym.geonganghae.dto.ManagerCenterDTO;

public class ManagerCenterModifyContentCommand implements Command {

	@Override
	public void execute(Model model) {
		// TODO Auto-generated method stub

		Map<String, Object> map = model.asMap();
		HttpServletRequest request = (HttpServletRequest) map.get("request");
		String centerCode = request.getParameter("centerCode");
		
		ManagerCenterDAO dao = new ManagerCenterDAO();
		ManagerCenterDTO dto = dao.centermodifyView(centerCode);
		
		model.addAttribute("manager_center_modify_view", dto);
		
	}

}
