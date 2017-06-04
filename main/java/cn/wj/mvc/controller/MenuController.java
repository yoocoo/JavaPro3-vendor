package cn.wj.mvc.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Created by ThinkPad on 2017/6/4.
 */
@Controller
@RequestMapping("/menuAction")
public class MenuController {

	@RequestMapping(value = "/manger",
			method = RequestMethod.POST,
			produces = "application/json;charset=utf-8")
	@ResponseBody
	public Object update(HttpServletRequest request, HttpServletResponse response) throws Exception {
		//Object result;
		//result = result;
		//return result;
		return null;
	}
}