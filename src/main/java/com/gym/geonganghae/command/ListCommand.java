package com.gym.geonganghae.command;

import java.util.ArrayList;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.ui.Model;

import com.gym.geonganghae.dao.CenterDao;
import com.gym.geonganghae.dao.MemberDao;
import com.gym.geonganghae.dto.CenterDto;

public class ListCommand implements Command {

	@Override
	public void execute(Model model) {
		
		CenterDao centerDao = new CenterDao();
		ArrayList<CenterDto> dtos = centerDao.list();
		model.addAttribute("list", dtos);
	}

}
