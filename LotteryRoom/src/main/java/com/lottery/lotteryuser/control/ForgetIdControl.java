package com.lottery.lotteryuser.control;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.lottery.FrontControl.Control;
import com.lottery.lotteryuser.domain.LotteryUserVO;
import com.lottery.lotteryuser.service.LotteryUserService;
import com.lottery.lotteryuser.service.LotteryUserServiceImpl;

public class ForgetIdControl implements Control {

	@Override
	public String execute(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		if (req.getMethod().equals("GET")) {
			return "WEB-INF/views/main/forgetid.jsp";
		} else if (req.getMethod().equals("POST")) {
			String userName = req.getParameter("userName");
			String phone = req.getParameter("phone");
			LotteryUserVO vo = new LotteryUserVO();
			vo.setUserName(userName);
			vo.setPhone(phone);
			LotteryUserService service = new LotteryUserServiceImpl();
			String userId = service.forgetUserId(vo);
			req.setAttribute("idInfo", userId);
			
		}
		return "WEB-INF/views/main/forgetid.jsp";
	}

}
