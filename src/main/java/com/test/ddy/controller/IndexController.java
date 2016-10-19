package com.test.ddy.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.test.ddy.dto.TripleVo;
import com.test.ddy.service.TripleService;

/**
 */
@Controller
@RequestMapping("/index")
public class IndexController {
	
	@Autowired
	private TripleService tripleService;

	@RequestMapping(value = "/charts", method = RequestMethod.GET)
	public String charts() {
		//return "charts-none";
		return "charts-force";
	}
	
	@RequestMapping(value="/triple", method = RequestMethod.GET)
	@ResponseBody
	public TripleVo getTriple(){
		TripleVo tripleVo = tripleService.getTripleVo();
		return tripleVo;
	}
	
}
