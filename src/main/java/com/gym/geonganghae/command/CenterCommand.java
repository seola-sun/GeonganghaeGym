package com.gym.geonganghae.command;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.ui.Model;

import com.gym.geonganghae.dao.CenterDao;
import com.gym.geonganghae.dto.CenterDto;

public class CenterCommand implements Command {

	// 로그인 체크, 리턴값 : 세션의 로그인 아이디 문자열
	private String loginChk(HttpServletRequest request) {
		HttpSession session = request.getSession();
		String loginId = (String) session.getAttribute("userId");
		if (loginId == null || loginId.equals("")) {
			return "";
		}
		return loginId;
	}

	@Override
	public void execute(Model model) {
		Map<String, Object> map = model.asMap();
		HttpServletRequest request = (HttpServletRequest) map.get("request");
		String centerCode = request.getParameter("centerCode");

		CenterDao dao = new CenterDao();
		CenterDto dto = dao.centerView(centerCode);

		model.addAttribute("center_view", dto);

		String loginId = loginChk(request);

		if (!loginId.equals("")) {
			// 관심등록 기능 ON/OFF
			if (dao.chkInterest(centerCode, loginId)) {
				model.addAttribute("chkInterest", true);
			} else {
				model.addAttribute("chkInterest", false);
			}
			
			// 추천하기 기능 ON/OFF
			if (dao.chkRecommend(centerCode, loginId)) {
				model.addAttribute("chkRecommend", true);
			} else {
				model.addAttribute("chkRecommend", false);
			}
		}
	}

	public String addInterestCommand(Model model) {

		Map<String, Object> map = model.asMap();
		HttpServletRequest request = (HttpServletRequest) map.get("request");
		String centerCode = request.getParameter("centerCode");

		String loginId = loginChk(request);

		CenterDao dao = new CenterDao();
		dao.addInterest(centerCode, loginId);

		return centerCode;

	}

	public String delInterestCommand(Model model) {

		Map<String, Object> map = model.asMap();
		HttpServletRequest request = (HttpServletRequest) map.get("request");
		String centerCode = request.getParameter("centerCode");

		String loginId = loginChk(request);

		CenterDao dao = new CenterDao();
		dao.delInterest(centerCode, loginId);

		return centerCode;

	}
	
	public String addRecommendCommand(Model model) {

		Map<String, Object> map = model.asMap();
		HttpServletRequest request = (HttpServletRequest) map.get("request");
		String centerCode = request.getParameter("centerCode");

		String loginId = loginChk(request);

		CenterDao dao = new CenterDao();
		dao.addRecommend(centerCode, loginId);

		return centerCode;

	}

	public String delRecommendCommand(Model model) {

		Map<String, Object> map = model.asMap();
		HttpServletRequest request = (HttpServletRequest) map.get("request");
		String centerCode = request.getParameter("centerCode");

		String loginId = loginChk(request);

		CenterDao dao = new CenterDao();
		dao.delRecommend(centerCode, loginId);

		return centerCode;

	}

}
