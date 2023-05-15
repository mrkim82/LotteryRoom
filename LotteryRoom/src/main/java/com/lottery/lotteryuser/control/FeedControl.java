package com.lottery.lotteryuser.control;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.lottery.FrontControl.Control;
import com.lottery.lotteryuser.domain.LotteryUserVO;
import com.lottery.lotteryuser.service.LotteryUserService;
import com.lottery.lotteryuser.service.LotteryUserServiceImpl;

public class FeedControl implements Control {

	@Override
	public String execute(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String userId = req.getParameter("userId");
		System.out.println(userId);
		String xuserId = "";
		LotteryUserService service = new LotteryUserServiceImpl();
		List<LotteryUserVO> list = service.getUserId();
		System.out.println(list);
		LotteryUserVO vo = new LotteryUserVO();
		
		
		for(int i = 0 ; i < list.size() ; i++) {
			if (userId.equals(String.valueOf(list.get(i).getUserId())))
			{
				vo.setUserId(xuserId);
				break;
			} else {
				vo.setUserId(userId);
			}
		}
		req.setAttribute("Idfeed", vo);
		
		return "WEB-INF/views/main/membership.jsp";
	}

}
