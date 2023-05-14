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

public class LoginControl implements Control {

	@Override
	public String execute(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		if (req.getMethod().equals("GET")) {
			return "WEB-INF/views/main/loginForm.jsp";
			
		} else if (req.getMethod().equals("POST")) {
			String userId = req.getParameter("userId");
			String userPw = req.getParameter("userPw");
			
			LotteryUserVO vo = new LotteryUserVO();
			LotteryUserService service = new LotteryUserServiceImpl();
			vo.setUserId(userId);
			vo.setUserPw(userPw);
			vo = service.loginCheck(vo);
			if (vo != null) {
				HttpSession session = req.getSession(); // 다른 화면에 넘어갔을 때에도 로그인 정보 유지하기 위함
				session.setAttribute("UserNo", vo.getUserNo());
				session.setAttribute("UserId", vo.getUserId());
				session.setAttribute("UserPw", vo.getUserPw());
				session.setAttribute("Mileage", vo.getMileage());
				session.setAttribute("UserName", vo.getUserName());
				session.setAttribute("UserGrade", vo.getUserGrade());
				session.setAttribute("Address", vo.getAddress());
				session.setAttribute("Phone", vo.getPhone());
				
				return "main.do";
			} else {
				return "login.do";
			}
		}
		return "WEB-INF/views/main/loginForm.jsp";
	}

}
