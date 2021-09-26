package com.gym.geonganghae.command;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;


public class LoginCommand  {

	public static String loginChk(HttpServletRequest request) 
	{
		// by설아, 매개변수로 전달받은 request객체로부터 session값을 구한다.
		HttpSession session = request.getSession();
		
		// by설아, session 속성의 userId를 구한다.
		String loginId = (String) session.getAttribute("userId");
		
		// by설아, 로그인 된 아이디가 없는 경우 빈문자열을 리턴한다.
		if (loginId == null || loginId.equals("")) 
		{
			return "";
		}
		
		// by설아, 로그인 상태인 아이디가 있는 경우, 유저아이디의 문자열을 리턴한다.
		return loginId;
	}

}
