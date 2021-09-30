package com.gym.geonganghae.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import com.gym.geonganghae.dao.ChartDao;
import com.gym.geonganghae.dto.ChartDto;
import com.gym.geonganghae.util.Constant;

@Controller
public class CountController {

	
	private JdbcTemplate template;
	
	@Autowired
	public void setTemplate(JdbcTemplate template) {
		this.template = template;
		Constant.template = this.template;
	}	
	
	@RequestMapping(value="chart", method=RequestMethod.GET)
	public  String Chart(ChartDto chartDto,ChartDao ChartDao,Model model){
		
		/*
		model.addAttribute("memberCnt", ChartDao.getMemCnt(chartDto));
		model.addAttribute("centerCnt", ChartDao.getCentCnt(chartDto));
		model.addAttribute("recommCnt", ChartDao.getRecCnt(chartDto));
		*/
		model.addAttribute("memberChart", ChartDao.getMemberChart(chartDto));
		model.addAttribute("centerChart", ChartDao.getCenterChart(chartDto));
		model.addAttribute("interestChart",ChartDao.getInterestChart(chartDto));
		model.addAttribute("sportsChart", ChartDao.getSportsChart(chartDto));
		
		return "chart";
	}
	
	
}
