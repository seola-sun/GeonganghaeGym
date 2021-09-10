package com.gym.geonganghae.command;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.ui.Model;

import com.gym.geonganghae.dao.CenterDAO;
import com.gym.geonganghae.dto.CenterDTO;

public class CenterCommand implements Command {

	@Override
	public void execute(Model model) {
		Map<String, Object> map = model.asMap();
		HttpServletRequest request = (HttpServletRequest) map.get("request");
		String centerCode = request.getParameter("centerCode");
		
		CenterDAO dao = new CenterDAO();
		CenterDTO dto = dao.centerView(centerCode);
		
		model.addAttribute("center_view", dto);
	}

}
