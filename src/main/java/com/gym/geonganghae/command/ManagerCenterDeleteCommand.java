package com.gym.geonganghae.command;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.ui.Model;

import com.gym.geonganghae.dao.ManagerCenterDAO;

public class ManagerCenterDeleteCommand implements Command {

	@Override
	public void execute(Model model) {
		// TODO Auto-generated method stub
		
		Map<String, Object> map = model.asMap();
		HttpServletRequest request = (HttpServletRequest) map.get("request");
		
		String centerCode = request.getParameter("centerCode");
		ManagerCenterDAO dao = new ManagerCenterDAO();
		dao.centerDelete(centerCode);
		
	}

}
