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

public class DeleteMemberControl implements Control {

	@Override
	public String execute(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		if(req.getMethod().equals("GET")) {
			String userNo = req.getParameter("userNo");
			
			LotteryUserService service = new LotteryUserServiceImpl();
			LotteryUserVO vo = service.myPage(Integer.parseInt(userNo));
			
			req.setAttribute("VOInfo", vo);
			
			return "mypage/deletemember.tiles";
			
		}else if(req.getMethod().equals("POST")) {
			HttpSession session = req.getSession();
			System.out.println("11111");
			String userNo = String.valueOf(session.getAttribute("UserNo"));
			
			LotteryUserService service = new LotteryUserServiceImpl();
							
			boolean result=service.deleteMember(Integer.parseInt(userNo));
			
			if(result) {
				return "logout.do";
		} else
			return "main.do";
	}
		return "main.do";
		}
	}