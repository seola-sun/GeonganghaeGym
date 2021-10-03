package com.gym.geonganghae.controller;

import java.util.Map;
import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ModelAttribute;

import com.gym.geonganghae.command.Command;
import com.gym.geonganghae.command.ManagerMemberContentCommand;
import com.gym.geonganghae.command.ManagerMemberDeleteCommand;
import com.gym.geonganghae.command.ManagerMemberListCommand;
import com.gym.geonganghae.command.ManagerMemberModifyCommand;
import com.gym.geonganghae.command.ManagerMemberModifyContentCommand;
import com.gym.geonganghae.util.Constant;

/**
 * Servlet implementation class BoardFrontController
 */

@Controller
public class ManagerMemberController {

	Command command = null;
	
	private JdbcTemplate template;
	
	@Autowired
	public void setTemplate(JdbcTemplate template) {
		this.template = template;
		Constant.template = this.template;
	}
	
	@ModelAttribute("conditionMap") 
	public Map<String, String> searchConditionMap() {
		Map<String, String> conditionMap = new HashMap<String, String>();
		conditionMap.put("아이디", "id");
		conditionMap.put("이름", "name");
		return conditionMap;
	}
	
	@RequestMapping("/manager_member_list")
	public String list(HttpServletRequest request, Model model) {
		
		System.out.println("manager_member_list()");
		model.addAttribute("request", request);
		command = new ManagerMemberListCommand();
		command.execute(model);
		
		return "manager_member_list";
	}
	
	@RequestMapping("/manager_member_content_view")
	public String content_view(HttpServletRequest request, Model model){
		System.out.println("manager_member_content_view()");
		
		model.addAttribute("request", request);
		command = new ManagerMemberContentCommand();
		command.execute(model);
		
		return "manager_member_content_view";
	}
	
	@RequestMapping("/manager_member_modify_view")
	public String modify_view(HttpServletRequest request, Model model){
		System.out.println("manager_member_modify_view()");
		
		model.addAttribute("request", request);
		command = new ManagerMemberModifyContentCommand();
		command.execute(model);
		
		return "manager_member_modify_view";
	}
	
	
	
	@RequestMapping(value="/manager_member_modify", method=RequestMethod.POST )
	public String modify(HttpServletRequest request, Model model){
		System.out.println("manager_member_modify()");
		
		model.addAttribute("request", request);
		command = new ManagerMemberModifyCommand();
		command.execute(model);
		
		return "redirect:manager_member_list";
	}	
	
	@RequestMapping("/manager_member_delete")
	public String delete(HttpServletRequest request, Model model) {
		System.out.println("manager_member_delete()");
		
		model.addAttribute("request", request);
		command = new ManagerMemberDeleteCommand();
		command.execute(model);
		
		return "redirect:manager_member_list";
	}
	
}
