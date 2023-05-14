package com.lottery.lotteryuser.control;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.lottery.FrontControl.Control;
import com.lottery.lotteryuser.domain.LotteryUserVO;
import com.lottery.lotteryuser.service.LotteryUserService;
import com.lottery.lotteryuser.service.LotteryUserServiceImpl;

public class MinusMileageControl implements Control {

	@Override
	public String execute(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String userId = req.getParameter("userId");
		String mileage = req.getParameter("mileage");
		HttpSession session = req.getSession();
		String userMileage = String.valueOf(session.getAttribute("Mileage"));
		LotteryUserService service = new LotteryUserServiceImpl();
		LotteryUserVO vo = new LotteryUserVO();
		vo.setUserId(userId);
		vo.setMileage(Integer.parseInt(mileage));
		
		Map<String , Object> map = new HashMap<>();
		String json = "";
		if(service.minusMileage(vo)) {
			map.put("retCode", "Success");
			int realMileage = service.getMileage(userId);
			map.put("real",realMileage);
			session.removeAttribute("Mileage");
			session.setAttribute("Mileage", userMileage + mileage);
		}else {
			map.put("retCode", "Fail");
		}
		Gson gson = new GsonBuilder().create();
		json = gson.toJson(map);
		
		return json+".json";
	}
}
