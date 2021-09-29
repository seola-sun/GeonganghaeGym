//package com.gym.geonganghae.service;
//
//import javax.servlet.http.HttpServletRequest;
//import javax.servlet.http.HttpServletResponse;
//
//import org.springframework.ui.Model;
//
//import com.gym.geonganghae.command.LoginCommand;
//import com.gym.geonganghae.dao.InterestDao;
//import com.gym.geonganghae.dto.InterestDto;
//
//public class RecUpdate implements Action {
//
//	public InterestDto execute(HttpServletRequest request, HttpServletResponse response, Model model) throws Exception {
//		// request.setCharacterEncoding("utf-8");
//
//		// center와 member값을 map에 저장
////		Map<String, Object> m = new HashMap<>();
////		m.put("center", request.getParameter("center"));
////		m.put("member", request.getParameter("member"));
//
//		String centerCode = request.getParameter("center");
//		String userId = request.getParameter("member");
//
//		InterestDao manager = InterestDao.getInstance();
//
//		String id = LoginCommand.loginChk(request);
//
//		InterestDto dto = manager.getInterestDto(id, centerCode);
//
//		// 동일 센터에 대한 이전 추천 여부 검색
//		int result = manager.recCheck(centerCode, userId);
//
//		if (result == 0) { // 추천하지 않았다면 추천 추가
//			manager.recUpdate(centerCode, userId);
//		} else { // 추천을 하였다면 추천 삭제
//			manager.recDelete(centerCode, userId);
//		}
//		return dto;
//	}
//}
