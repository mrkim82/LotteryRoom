package com.lottery.store.control;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.lottery.FrontControl.Control;
import com.lottery.store.domain.StoreVO;

public class StoreMapControl implements Control {

	@Override
	public String execute(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String address = req.getParameter("addr");
		String sname = req.getParameter("sname");
		System.out.println(address);
		System.out.println(sname);
		StoreVO vo = new StoreVO();
		vo.setAddress(address);
		vo.setSname(sname);
		req.setAttribute("VOInfo", vo);
		
		
		return "store/map.tiles";
	}

}
