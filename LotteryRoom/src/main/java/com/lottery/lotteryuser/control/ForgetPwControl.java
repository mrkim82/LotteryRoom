package com.lottery.lotteryuser.control;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.lottery.FrontControl.Control;
import com.lottery.lotteryuser.domain.LotteryUserVO;
import com.lottery.lotteryuser.service.LotteryUserService;
import com.lottery.lotteryuser.service.LotteryUserServiceImpl;

public class ForgetPwControl implements Control {

	@Override
	public String execute(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		if (req.getMethod().equals("GET")) {
			return "WEB-INF/views/main/forgetpw.jsp";
		} else if (req.getMethod().equals("POST")) {
			String userId = req.getParameter("userId");
			LotteryUserService service = new LotteryUserServiceImpl();
			String userPw = service.forgetUserPw(userId);
			req.setAttribute("pwInfo", userPw);
			
		}
		return "WEB-INF/views/main/forgetpw.jsp";
	}
}
