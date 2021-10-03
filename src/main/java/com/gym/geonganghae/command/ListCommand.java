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
		
		//by 하니, request 객체를 이용해서 get으로 넘겨 
		//받은 p값을 구한다.
		Map<String, Object> map = model.asMap();
		HttpServletRequest request = (HttpServletRequest) map.get("request");
		String page = request.getParameter("p");
		String centerName = request.getParameter("centerName");
		
		//by,하니 getCenterList 함수를 호출하기 위한 
		//ceterDao 객체를 생성한다.
		CenterDao centerDao = new CenterDao();
		
		//by,하니 첫번째 페이지를 불러올경우 파라미터 값이
		//null일 것을 대비하여, if문으로 page값을 이용 취사 선택
		ArrayList<CenterDto> dtos;
		if(page == null)
			dtos = centerDao.getCenterList();
		else if (centerName == null)
			dtos = centerDao.getCenterList(Integer.parseInt(page));
<<<<<<< HEAD
		else
			dtos = centerDao.getCenterList(centerName,Integer.parseInt(page));
			
		
		
		//by,하니 총 center 레코드 개수를 구하기위한 int 변수 생성
		int centerTotal;
		if(centerName == null)
		 centerTotal =centerDao.getTotal();
		else
		 centerTotal =centerDao.getTotal(centerName);
 
		 model.addAttribute("centerTotal",centerTotal);
		 model.addAttribute("list", dtos);
=======
			
		model.addAttribute("list", dtos);
>>>>>>> 583ab0f2a51edbb853636b744fe979b18fd47707
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

