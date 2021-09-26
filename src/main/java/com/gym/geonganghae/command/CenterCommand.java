package com.gym.geonganghae.command;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.ui.Model;

import com.gym.geonganghae.dao.CenterDao;
import com.gym.geonganghae.dto.CenterDto;

/**
 * @author 설아
 * @summary Command인터페이스를 구현한 클래스이다.
 * CenterController로부터 model객체를 전달받으며 호출된다.
 */
public class CenterCommand implements Command 
{
	// by설아, Command인터페이스의 execute메소드를 구현하고 있는 메소드이며,
	// 센터 상세페이지를 표시할 때 실행된다.
	@Override
	public void execute(Model model) 
	{
		// by설아, model의 속성과 값들을 Map형태로 가져온다.
		Map<String, Object> map = model.asMap();
		
		// by설아, map에서 request 속성의 값을 가져온다.
		HttpServletRequest request = (HttpServletRequest) map.get("request");
		
		// by설아, map에서 centerCode 속성의 값을 가져온다.
		String centerCode = request.getParameter("centerCode");

		// by설아, 센터 정보를 조회하기 위해 Dao객체를 생성한다.
		CenterDao dao = new CenterDao();
		
		// by설아, 센터 코드를 매개 변수로 Dao객체에 전달하여 센터 정보를 구한다. 
		CenterDto dto = dao.centerView(centerCode);

		// by설아, model의 속성에 위에서 구한 centerDto를 저장한다.
		model.addAttribute("center_view", dto);

		// by설아, 관심등록과 취소 및 추천과 취소 기능을 수행하기에 앞서,
		// 로그인 상태를 체크하고, 회원의 아이디를 리턴받는다.
		String loginId = loginChk(request);
		
		// by설아, 관심 등록 및 추천 기능을 ON/OFF한다.
		if (!loginId.equals("")) 
		{
			// by설아, Dao객체에 센터 코드와 로그인 아이디를 전달하여
			// 유저가 해당 센터를 이미 관심 등록 하고 있는지 확인한다.
			if (dao.chkInterest(centerCode, loginId))
			{
				// 관심 등록 기능 ON
				model.addAttribute("chkInterest", true);
			} 
			else 
			{
				// 관심 등록 기능 OFF
				model.addAttribute("chkInterest", false);
			}
			
			// by설아, Dao객체에 센터 코드와 로그인 아이디를 전달하여
			// 유저가 해당 센터를 이미 추천 하고 있는지 확인한다.
			if (dao.chkRecommend(centerCode, loginId)) 
			{
				// 추천 하기 기능 ON
				model.addAttribute("chkRecommend", true);
			} 
			else 
			{
				// 추천 하기 기능 OFF
				model.addAttribute("chkRecommend", false);
			}
		}
	}
	
	// by설아, 로그인을 체크하는 메소드이다.
	// 로그인 시, 세션에 저장한 유저아이디의 문자열을 리턴한다.
	private String loginChk(HttpServletRequest request) 
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

	// by설아, 관심 목록 등록 기능을 구현하는 메소드이다.
	public String addInterestCommand(Model model) 
	{
		// by설아, model의 속성과 값들을 Map형태로 가져온다.
		Map<String, Object> map = model.asMap();
		
		// by설아, map에서 request 속성의 값을 가져온다.
		HttpServletRequest request = (HttpServletRequest) map.get("request");
		
		// by설아, map에서 centerCode 속성의 값을 가져온다.
		String centerCode = request.getParameter("centerCode");

		// by설아, 로그인 상태를 체크하고, 회원의 아이디를 리턴받는다.
		String loginId = loginChk(request);

		// by설아, 센터 관심 등록을 하기 위해 Dao객체를 생성한다.
		CenterDao dao = new CenterDao();
		
		// by설아, 센터 코드와 아이디를 매개 변수로 전달한다.
		dao.addInterest(centerCode, loginId);

		// by설아,센터 코드 문자열을 리턴한다.
		return centerCode;
	}

	// by설아, 관심 목록 등록을 취소하는 기능을 구현하는 메소드이다.
	public String delInterestCommand(Model model) 
	{
		// by설아, model의 속성과 값들을 Map형태로 가져온다.
		Map<String, Object> map = model.asMap();
		
		// by설아, map에서 request 속성의 값을 가져온다.
		HttpServletRequest request = (HttpServletRequest) map.get("request");
		
		// by설아, map에서 centerCode 속성의 값을 가져온다.
		String centerCode = request.getParameter("centerCode");

		// by설아, 로그인 상태를 체크하고, 회원의 아이디를 리턴받는다.
		String loginId = loginChk(request);

		// by설아, 센터 관심 등록을 하기 위해 Dao객체를 생성한다.
		CenterDao dao = new CenterDao();
		
		// by설아, 센터 코드와 아이디를 매개 변수로 전달한다.
		dao.delInterest(centerCode, loginId);

		// by설아,센터 코드 문자열을 리턴한다.
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
