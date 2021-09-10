package com.gym.geonganghae.command;

import java.util.ArrayList;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.ui.Model;

import com.gym.geonganghae.dao.CenterDAO;
import com.gym.geonganghae.dao.MemberDao;
import com.gym.geonganghae.dto.CenterDTO;

public class ListCommand implements Command {

	@Override
	public void execute(Model model) {
		
		CenterDAO centerDao = new CenterDAO();
		ArrayList<CenterDTO> dtos = centerDao.list();
		model.addAttribute("list", dtos);
	}

}
