package com.lottery.lotteryuser.control;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.lottery.FrontControl.Control;
import com.lottery.common.PageDTO;
import com.lottery.lotteryuser.domain.LotteryUserVO;
import com.lottery.lotteryuser.service.LotteryUserService;
import com.lottery.lotteryuser.service.LotteryUserServiceImpl;

public class SearchLotteryControl implements Control {

	@Override
	public String execute(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		String pageStr = req.getParameter("page");
		pageStr = pageStr == null ? "1" : pageStr;
		int page = Integer.parseInt(pageStr);
		HttpSession session = req.getSession();
		String userNo;
		
		if(session.getAttribute("UserNo")!=null) {
			userNo=String.valueOf(session.getAttribute("userNo"));
			session.removeAttribute("userNo");
		}else {
			userNo = req.getParameter("userNo");
		}
		
		LotteryUserService service = new LotteryUserServiceImpl();
		LotteryUserVO vo = new LotteryUserVO();
		vo.setPage(page);
//		vo.setUserNo(userNo);
//		List<LotteryUserVO> vv = service.searchLottery(vv);
		
//		PageDTO dto = new PageDTO(page);
//		req.setAttribute("listInfo", vo);
//		req.setAttribute("pageInfo", vv);
		
		return "mypage/mypage.tiles";
	}

}
