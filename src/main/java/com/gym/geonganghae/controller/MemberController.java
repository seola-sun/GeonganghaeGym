package com.gym.geonganghae.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.gym.geonganghae.command.Command;
import com.gym.geonganghae.command.DeleteCommand;
import com.gym.geonganghae.command.MemberModCommand;
import com.gym.geonganghae.command.MyinfoCommand;
import com.gym.geonganghae.command.MyinfoModifyViewCommand;
import com.gym.geonganghae.util.Constant;

@Controller
public class MemberController {

	Command command = null;
	
	private JdbcTemplate template;
	
	@Autowired
	public void setTemplate(JdbcTemplate template) {
		this.template = template;
		Constant.template = this.template;
	}
	
	@RequestMapping("/myinfo_view")
	public String content_view(HttpServletRequest request, Model model){
		System.out.println("myinfo_view()");
		
		model.addAttribute("request", request);
		command = new MyinfoCommand();
		command.execute(model);
		
		return "myinfo_view";
	}
	
	@RequestMapping("/myinfoModify_view")
	public String modify_view(HttpServletRequest request, Model model){
		System.out.println("myinfoModify_view()");
		
		model.addAttribute("request", request);
		command = new MyinfoModifyViewCommand();
		command.execute(model);
		
		return "myinfoModify_view";
	}
	
	@RequestMapping(value="/modify", method=RequestMethod.POST )
	public String modify(HttpServletRequest request, Model model){
		System.out.println("modify()");
		
		model.addAttribute("request", request);
		command = new MemberModCommand();
		command.execute(model);
		
		return "redirect:myinfo_view";
	}	
	
	
	@ResponseBody
	@RequestMapping(value = "/delete", method = RequestMethod.POST)
	public void delete(HttpServletRequest request, Model model) {
		System.out.println("delete()");
		
		model.addAttribute("request", request);
		command = new DeleteCommand();
		command.execute(model);
		
	}

}
