package com.gym.geonganghae.command;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.ui.Model;

import com.gym.geonganghae.dao.InterestDao;

public class InterestCommand implements Command {

	@Override
	public void execute(Model model) {

		Map<String, Object> map = model.asMap();
		HttpServletRequest request = (HttpServletRequest) map.get("request");
		
		String loginId = LoginCommand.loginChk(request);
		
		String centerCode = request.getParameter("centerCode");
		System.out.println("command에서 centercode : "+centerCode);
		InterestDao dao = new InterestDao();
		dao.delete(loginId, centerCode);

	}

}
