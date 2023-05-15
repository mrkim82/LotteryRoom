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

public class UpdateMemberControl implements Control {

	@Override
	public String execute(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
								
	    if (req.getMethod().equals("GET")) {
	    	HttpSession session = req.getSession();
	    	String userNo = String.valueOf(session.getAttribute("UserNo"));
	    	
	    	LotteryUserService service = new LotteryUserServiceImpl();
	    	LotteryUserVO vo = service.myPage(Integer.parseInt(userNo));
	    	
	    	req.setAttribute("VOInfo", vo);
	    	
	        return "WEB-INF/views/mypage/updatemember.jsp";

	    } else if (req.getMethod().equals("POST")) {
	    	HttpSession session = req.getSession();
	    	String userNo = String.valueOf(session.getAttribute("UserNo"));
	    	String userPw = req.getParameter("userPw");
	    	String address = req.getParameter("address");
	    	String phone = req.getParameter("phone");
	    	System.out.println("1"+userNo);
	    	System.out.println("2"+userPw);
	    	System.out.println("3"+address);
	    	System.out.println("4"+phone);
	    	LotteryUserService service = new LotteryUserServiceImpl();
	    	LotteryUserVO vo = new LotteryUserVO();
	    	
	    	vo.setAddress(address);
	    	vo.setPhone(phone);
	    	vo.setUserPw(userPw);
	    	vo.setUserNo(Integer.parseInt(userNo));
	    	System.out.println();
	    	boolean result=service.updateMember(vo);
	    	
	    	if(result) {
	    		session.removeAttribute("UserPw");
	    		session.removeAttribute("Phone");
	    		
	    		session.setAttribute("UserPw", userPw);
	    		session.setAttribute("Phone", phone);
	    		
	    		return "main.do";
	    	} else {
	    		return "mypage.do";
	    	}
	    }
	    return "main.do";
	}
}
