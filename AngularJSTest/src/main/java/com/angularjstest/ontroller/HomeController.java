package com.angularjstest.ontroller;

import java.text.DateFormat;
import java.util.Date;
import java.util.Locale;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class HomeController {
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public ModelAndView home(ModelAndView mv) {
		String name = null;
		name = "good better!!";
		
		mv.setViewName("home");
		
		mv.addObject("testvalue", "seochangwook developer");
		mv.addObject("testvalue2", name);
		
		mv.addObject("onevalue", 1);
		mv.addObject("twovalue", 1);
		
		return mv;
	}
}
