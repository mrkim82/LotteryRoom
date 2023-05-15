package com.lottery.lotteryuser.control;

import java.io.IOException;
import java.util.ArrayList;
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

public class MypageControl implements Control {

   @Override
   public String execute(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
      
      HttpSession session = req.getSession();
      
      int userNo = (int)session.getAttribute("UserNo");
      String pageStr = req.getParameter("page");
      pageStr = pageStr == null ? "1" : pageStr;
      int page = Integer.parseInt(pageStr);
      
      LotteryUserService service = new LotteryUserServiceImpl();
      int total = service.getLotteryCount(userNo);
      LotteryUserVO pt = new LotteryUserVO();
      pt.setUserNo(userNo);
      pt.setPage(page);

      List<LotteryUserVO> vo1 = service.lotteryResult(userNo);
      req.setAttribute("fir", vo1);
      System.out.println(vo1);
      List<LotteryUserVO> vo = service.searchLottery(pt);
      PageDTO dto = new PageDTO(page, total);
      req.setAttribute("listInfo", vo);
      req.setAttribute("pageInfo", dto);
      req.setAttribute("totalcount", total);
      
      return "mypage/mypage.tiles";
   }
}