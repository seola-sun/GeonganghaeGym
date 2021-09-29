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
	}

}
