package com.gym.geonganghae.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.gym.geonganghae.command.Command;
import com.gym.geonganghae.command.ManagerCenterContentCommand;
import com.gym.geonganghae.command.ManagerCenterDeleteCommand;
import com.gym.geonganghae.command.ManagerCenterListCommand;
import com.gym.geonganghae.command.ManagerCenterModifyCommand;
import com.gym.geonganghae.command.ManagerCenterWriteCommand;
import com.gym.geonganghae.command.ManagerCenterModifyContentCommand;
import com.gym.geonganghae.util.Constant;

/**
 * Servlet implementation class BoardFrontController
 */

@Controller
public class ManagerCenterController {

	Command command = null;
	
	private JdbcTemplate template;
	
	@Autowired
	public void setTemplate(JdbcTemplate template) {
		this.template = template;
		Constant.template = this.template;
	}
	
	@RequestMapping("/manager_center_list")
	public String center_list(HttpServletRequest request, Model model) {
		
		System.out.println("manager_center_list()");
		model.addAttribute("request", request);
		command = new ManagerCenterListCommand();
		command.execute(model);
		
		return "manager_center_list";
	}
	
	@RequestMapping("/manager_center_write_view")
	public String center_write_view(Model model) {
		System.out.println("manager_center_write_view()");
		
		return "manager_center_write_view";
	}
	
	@RequestMapping("/manager_center_write")
	public String center_write(HttpServletRequest request, Model model) {
		System.out.println("manager_center_write()");
		
		model.addAttribute("request", request);
		command = new ManagerCenterWriteCommand();
		command.execute(model);
		
		return "redirect:manager_center_list";
	}
	
	@RequestMapping("/manager_center_content_view")
	public String center_content_view(HttpServletRequest request, Model model){
		System.out.println("manager_center_content_view()");
		model.addAttribute("request", request);
		command = new ManagerCenterContentCommand();
		command.execute(model);
		
		return "manager_center_content_view";
	}
	
	@RequestMapping("/manager_center_modify_view")
	public String center_modify_view(HttpServletRequest request, Model model) {
		System.out.println("manager_center_modify_view()");
		
		model.addAttribute("request", request);
		command = new ManagerCenterModifyContentCommand();
		command.execute(model);
		
		return "manager_center_modify_view";
	}
	
	@RequestMapping("/manager_center_modify")
	public String center_modify(HttpServletRequest request, Model model) {
		System.out.println("manager_center_modify()");
		
		model.addAttribute("request", request);
		command = new ManagerCenterModifyCommand();
		command.execute(model);
		
		return "redirect:manager_center_list";
	}
	
	@RequestMapping("/manager_center_delete")
	public String delete(HttpServletRequest request, Model model) {
		System.out.println("delete()");
	
		model.addAttribute("request", request);
		command = new ManagerCenterDeleteCommand();
		command.execute(model);
		
		return "redirect:manager_center_list";
	}
	
//	@RequestMapping("/test")
//	public String test(Model model) {
//		System.out.println("test()");
//		
//		return "test";
//	}
//	
//	@RequestMapping("/test01")
//	public String test01(Model model) {
//		System.out.println("test01()");
//		
//		return "test01";
//	}
}
