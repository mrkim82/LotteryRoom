package com.lottery.FrontControl;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public interface Control {
	public String execute(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException; 
	}
// test1
// test2
