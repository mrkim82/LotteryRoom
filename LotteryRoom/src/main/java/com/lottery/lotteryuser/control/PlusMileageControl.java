package com.lottery.lotteryuser.control;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.lottery.FrontControl.Control;
import com.lottery.lotteryuser.domain.LotteryUserVO;
import com.lottery.lotteryuser.service.LotteryUserService;
import com.lottery.lotteryuser.service.LotteryUserServiceImpl;

public class PlusMileageControl implements Control{

	@Override
	public String execute(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		LotteryUserService service = new LotteryUserServiceImpl();

			LotteryUserVO vo = new LotteryUserVO();
			String payStr = req.getParameter("payment");
			String userId = req.getParameter("userId");
			int mileage = service.getMileage(userId);
			payStr = payStr == null ? "0" : payStr;
			
			int payment = Integer.parseInt(payStr);
			if(service.plusMileage(payment,userId)) {
				System.out.println("성공");
				HttpSession session = req.getSession();
				vo.setMileage(mileage+payment);
				session.removeAttribute("Mileage");
				session.setAttribute("Mileage", vo.getMileage());
			}
			req.setAttribute("realMileage", mileage);
			req.setAttribute("payment", payment);
			return "yedamlottery/getmoney.tiles";

		}

	}
	