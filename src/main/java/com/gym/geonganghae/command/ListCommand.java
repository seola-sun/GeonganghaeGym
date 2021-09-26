package com.gym.geonganghae.command;

import java.util.ArrayList;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.ui.Model;

import com.gym.geonganghae.dao.CenterDao;
import com.gym.geonganghae.dao.InterestDao;
import com.gym.geonganghae.dto.CenterDto;
import com.gym.geonganghae.dto.InterestDto;

public class ListCommand implements Command {

	// by 설아, 센터 목록 표시
	@Override
	public void execute(Model model) {
		CenterDao centerDao = new CenterDao();
		ArrayList<CenterDto> dtos = centerDao.list();
		model.addAttribute("list", dtos);
	}
	
	// by 희준, 관심 목록 표시
	public void interList(Model model) {
		InterestDao dao = new InterestDao();
		
		Map<String, Object> map = model.asMap();
		HttpServletRequest request = (HttpServletRequest) map.get("request");
		
		String loginId = LoginCommand.loginChk(request);
		
		ArrayList<InterestDto> dtos = dao.list(loginId);
		model.addAttribute("list", dtos);

	}

}
