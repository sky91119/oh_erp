package com.kh.oherp.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller public class ErrorController{ 
	String path = "/error"; 

	@RequestMapping("/400") 
	public String error400() 
	{
		return path + "/400"; 
		}	
	
	
@RequestMapping("/500") 
public String error500() 
{
	return path + "/500"; 
	}

@RequestMapping("/404") 
public String error404() 
{
	return path + "/404"; 
	}

@RequestMapping("/405") 
public String error405() 
{
	return path + "/405"; 
	}
}

