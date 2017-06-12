package com.angularjstest.controller;

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
		
		mv.addObject("numvalue", 100);
		
		return mv;
	}
	
	@RequestMapping(value = "/onepage", method = RequestMethod.GET)
	public ModelAndView Onepageview(ModelAndView mv) {
		mv.setViewName("Onepage");
		
		return mv;
	}
	
	@RequestMapping(value = "/twopage", method = RequestMethod.GET)
	public ModelAndView Twopageview(ModelAndView mv) {
		mv.setViewName("Twopage");
		
		return mv;
	}
	
	@RequestMapping(value = "/header", method = RequestMethod.GET)
	public ModelAndView Headeroneview(ModelAndView mv) {
		mv.setViewName("headerview");
		
		return mv;
	}
	
	@RequestMapping(value = "/body", method = RequestMethod.GET)
	public ModelAndView Bodyview(ModelAndView mv) {
		mv.setViewName("bodyview");
		
		return mv;
	}
	
	@RequestMapping(value = "/footer", method = RequestMethod.GET)
	public ModelAndView Footerview(ModelAndView mv) {
		mv.setViewName("footerview");
		
		return mv;
	}
}
