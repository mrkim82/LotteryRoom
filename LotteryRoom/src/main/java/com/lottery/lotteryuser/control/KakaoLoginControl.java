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

public class KakaoLoginControl implements Control {

	@Override
	public String execute(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String userId = req.getParameter("email");
		LotteryUserService service = new LotteryUserServiceImpl();
		LotteryUserVO vo = new LotteryUserVO();
		if(service.kakaoLogin(userId) == null) {
			vo.setUserId(userId);
			req.setAttribute("VOInfo", vo);
			return "WEB-INF/views/main/membership.jsp";
		} else {
			vo = service.kakaoLogin(userId);
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
		}
	}

}
