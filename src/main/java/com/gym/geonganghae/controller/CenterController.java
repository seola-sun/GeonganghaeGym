package com.gym.geonganghae.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.gym.geonganghae.command.CenterCommand;
import com.gym.geonganghae.command.Command;
import com.gym.geonganghae.command.ListCommand;
import com.gym.geonganghae.dto.CenterDto;
import com.gym.geonganghae.dto.InterestDto;

@Controller
public class CenterController {
	// by설아, 비즈니스 로직을 구현할 Command 인터페이스 변수를 선언한다.
	Command command = null;

	// by설아, 센터 목록을 보여주는 메소드이다.
	@RequestMapping("/center_list")
	public String list(HttpServletRequest request, Model model) {
		// by설아, Command인터페이스를 구현한 ListCommand 객체를 생성하여
		// command변수를 초기화한다.
		// command = new ListCommand();

		// by설아, 센터 목록을 구해 model 객체의 속성값으로 저장한다.
		// command.execute(model);

		// by설아, 센터 목록 화면을 보여준다.
		return "center_list";
	}
	
	// by설아, 센터 목록을 보여주는 메소드이다.
	@ResponseBody
	@RequestMapping(value = "/center_list", method = RequestMethod.POST)
	public Object dataTablesList(HttpServletRequest request, Model model) {
		Map<String, Object> map = new HashMap<String, Object>();
		
		// by설아, Command인터페이스를 구현한 ListCommand 객체를 생성하여
		// command변수를 초기화한다.
		command = new ListCommand();

		// by설아, 센터 목록을 구해 model 객체의 속성값으로 저장한다.
		List<CenterDto> centerList = ((ListCommand) command).centerList(model);

		map.put("data", centerList);
		
		Object result = map;
		
		// by설아, 센터 목록 화면을 보여준다.
		return result;
	}

	// by설아, 센터 상세페이지를 보여주는 메소드이다.
	@RequestMapping("/center_view")
	public String content_view(HttpServletRequest request, Model model) {

		// by설아, GET방식으로 전달된 CenterCode를 Command객체에 전달하기 위해 model객체의
		// request 속성을 추가하여 값을 저장한다.
		model.addAttribute("request", request);

		// by설아, Command인터페이스를 구현한 CenterCommand 객체를 생성하여
		// command변수를 초기화한다.
		command = new CenterCommand();

		// by설아, model 객체에 저장된 request 속성에서 centerCode값으로 얻어낸
		// CenterDto를 model 객체의 속성값으로 저장한다.
		command.execute(model);

		// by설아, 센터 상세 페이지를 보여준다.
		return "center_view";
	}

}
