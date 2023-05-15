package com.lottery.lotteryuser.control;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.lottery.FrontControl.Control;
import com.lottery.lotteryuser.domain.LotteryUserVO;
import com.lottery.lotteryuser.service.LotteryUserService;
import com.lottery.lotteryuser.service.LotteryUserServiceImpl;

public class MembershipControl implements Control {

	@Override
	public String execute(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		if (req.getMethod().equals("GET")) {
			return "WEB-INF/views/main/membership.jsp";

		} else if (req.getMethod().equals("POST")) {
			String userName = req.getParameter("userName");
			String userId = req.getParameter("userId");
			String userPw = req.getParameter("userPw");
			String address1 = req.getParameter("address1");
			String address2 = req.getParameter("address2");
			String address = address1 + " " + address2;
			String phone = req.getParameter("phone");
			String birthYear = req.getParameter("birthYear");
			String birthMonth = req.getParameter("birthMonth");
			String birthDay = req.getParameter("birthDay");

			LotteryUserVO vo = new LotteryUserVO();
			LotteryUserService service = new LotteryUserServiceImpl();
			vo.setUserName(userName);
			vo.setUserId(userId);
			vo.setUserPw(userPw);
			vo.setAddress(address);
			vo.setPhone(phone);
			vo.setBirthYear(Integer.parseInt(birthYear));
			vo.setBirthMonth(Integer.parseInt(birthMonth));
			vo.setBirthDay(Integer.parseInt(birthDay));
			service.insertMembership(vo);
		}
		return "main.do";
	}

}
