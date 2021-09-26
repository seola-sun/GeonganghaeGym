package com.gym.geonganghae.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class OpenstoreController {

	@RequestMapping("/openstore")
	public String openstore_view(Model model) {

		return "openstore";
	}

}
