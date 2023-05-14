package com.lottery.lotto.control;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.lottery.FrontControl.Control;
import com.lottery.lotteryuser.domain.LotteryUserVO;
import com.lottery.lotteryuser.service.LotteryUserService;
import com.lottery.lotteryuser.service.LotteryUserServiceImpl;
import com.lottery.lotto.domain.LottoVO;
import com.lottery.lotto.service.LottoService;
import com.lottery.lotto.service.LottoServiceImpl;

public class AddAutoControl implements Control {

	@Override
	public String execute(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		LottoService service = new LottoServiceImpl();
		LottoVO vo1 = new LottoVO();
		LottoVO vo2 = new LottoVO();
		LottoVO vo3 = new LottoVO();
		LottoVO vo4 = new LottoVO();
		LottoVO vo5 = new LottoVO();
		String userNo = req.getParameter("UserNo");
		String count = req.getParameter("count");
		String realPrice = req.getParameter("price");
		realPrice = realPrice.substring(0,realPrice.length() -1); 
		String[] strArr = realPrice.split(",");
		String realrealPrice ="";
		for(int i = 0 ; i<strArr.length ; i++) {
			realrealPrice += strArr[i];
		}
		int price = Integer.parseInt(realrealPrice);
		HttpSession session = req.getSession();
		session.removeAttribute("Mileage");
		String realMileage = req.getParameter("realMileage");
		int intRealMileage = Integer.parseInt(realMileage);
		intRealMileage = intRealMileage - price;
		LotteryUserService userServ = new LotteryUserServiceImpl();
		String userId = req.getParameter("userId");
		LotteryUserVO userVo = new LotteryUserVO();
		userVo.setMileage(price);
		userVo.setUserId(userId);
		userServ.minusMileage(userVo);
		session.setAttribute("Mileage", intRealMileage);
		
		int ltTimes = Integer.parseInt(req.getParameter("LtTimes")) + 1;
		LottoVO vo = new LottoVO();
		vo.setUserNo(Integer.parseInt(userNo));
		vo.setLtPrice(price);
		int countNum = (Integer.parseInt(count));
		int ltNo1=0;
		int ltNo2=0;
		int ltNo3=0;
		int ltNo4=0;
		int ltNo5=0;
		for(int i = 1 ; i<= countNum ; i++) {
			if(i==1) {
			service.insertAutoLottery(vo);
			ltNo1 = service.getAutoNum();
			}else if(i==2) {
			service.insertAutoLottery(vo);
			ltNo2 = service.getAutoNum();
			}else if(i==3) {
			service.insertAutoLottery(vo);
			ltNo3 = service.getAutoNum();
			}else if(i==4) {
			service.insertAutoLottery(vo);
			ltNo4 = service.getAutoNum();
			}else if(i==5) {
			service.insertAutoLottery(vo);
			ltNo5 = service.getAutoNum();
			}
			
		}
		
		
		String ltFir = req.getParameter("btnA1");
		System.out.println(ltFir);
		System.out.println(countNum);
		for(int i=1; i<=countNum; i++) {
			if(i == 1) {
//				String ltFir = req.getParameter("btnA1");
				String ltSec = req.getParameter("btnA2");
				String ltThr = req.getParameter("btnA3");
				String ltFour = req.getParameter("btnA4");
				String ltFive = req.getParameter("btnA5");
				String ltSix = req.getParameter("btnA6");
				vo1.setLtNo(ltNo1);
				vo1.setLtTimes(ltTimes);
				vo1.setLtFir(Integer.parseInt(ltFir));
				vo1.setLtSec(Integer.parseInt(ltSec));
				vo1.setLtThr(Integer.parseInt(ltThr));
				vo1.setLtFour(Integer.parseInt(ltFour));
				vo1.setLtFive(Integer.parseInt(ltFive));
				vo1.setLtSix(Integer.parseInt(ltSix));
				service.insertAutoNum(vo1);
			} else if(i == 2) {
				String ltFir2 = req.getParameter("btnB1");
				String ltSec2 = req.getParameter("btnB2");
				String ltThr2 = req.getParameter("btnB3");
				String ltFour2 = req.getParameter("btnB4");
				String ltFive2 = req.getParameter("btnB5");
				String ltSix2 = req.getParameter("btnB6");
				vo2.setLtNo(ltNo2);
				vo2.setLtTimes(ltTimes);
				vo2.setLtFir(Integer.parseInt(ltFir2));
				vo2.setLtSec(Integer.parseInt(ltSec2));
				vo2.setLtThr(Integer.parseInt(ltThr2));
				vo2.setLtFour(Integer.parseInt(ltFour2));
				vo2.setLtFive(Integer.parseInt(ltFive2));
				vo2.setLtSix(Integer.parseInt(ltSix2));
				service.insertAutoNum(vo2);
			} else if(i == 3) {
				String ltFir3 = req.getParameter("btnC1");
				String ltSec3 = req.getParameter("btnC2");
				String ltThr3 = req.getParameter("btnC3");
				String ltFour3 = req.getParameter("btnC4");
				String ltFive3 = req.getParameter("btnC5");
				String ltSix3 = req.getParameter("btnC6");
				vo3.setLtNo(ltNo3);
				vo3.setLtTimes(ltTimes);
				vo3.setLtFir(Integer.parseInt(ltFir3));
				vo3.setLtSec(Integer.parseInt(ltSec3));
				vo3.setLtThr(Integer.parseInt(ltThr3));
				vo3.setLtFour(Integer.parseInt(ltFour3));
				vo3.setLtFive(Integer.parseInt(ltFive3));
				vo3.setLtSix(Integer.parseInt(ltSix3));
				service.insertAutoNum(vo3);
			} else if(i == 4) {
				String ltFir4 = req.getParameter("btnD1");
				String ltSec4 = req.getParameter("btnD2");
				String ltThr4 = req.getParameter("btnD3");
				String ltFour4 = req.getParameter("btnD4");
				String ltFive4 = req.getParameter("btnD5");
				String ltSix4 = req.getParameter("btnD6");
				vo4.setLtNo(ltNo4);
				vo4.setLtTimes(ltTimes);
				vo4.setLtFir(Integer.parseInt(ltFir4));
				vo4.setLtSec(Integer.parseInt(ltSec4));
				vo4.setLtThr(Integer.parseInt(ltThr4));
				vo4.setLtFour(Integer.parseInt(ltFour4));
				vo4.setLtFive(Integer.parseInt(ltFive4));
				vo4.setLtSix(Integer.parseInt(ltSix4));
				service.insertAutoNum(vo4);
			} else if(i == 5) {
				String ltFir5 = req.getParameter("btnE1");
				String ltSec5 = req.getParameter("btnE2");
				String ltThr5 = req.getParameter("btnE3");
				String ltFour5 = req.getParameter("btnE4");
				String ltFive5 = req.getParameter("btnE5");
				String ltSix5 = req.getParameter("btnE6");
				vo5.setLtNo(ltNo5);
				vo5.setLtTimes(ltTimes);
				vo5.setLtFir(Integer.parseInt(ltFir5));
				vo5.setLtSec(Integer.parseInt(ltSec5));
				vo5.setLtThr(Integer.parseInt(ltThr5));
				vo5.setLtFour(Integer.parseInt(ltFour5));
				vo5.setLtFive(Integer.parseInt(ltFive5));
				vo5.setLtSix(Integer.parseInt(ltSix5));
				service.insertAutoNum(vo5);
			}
		}
		
		LottoService service1 = new LottoServiceImpl();
	      int nextLtTimes = (int) session.getAttribute("LtTimes") + 1;
	      int ltPayNum = service1.cumulativeReward(nextLtTimes);
	      int cuReward = ltPayNum * 1000; 
	      if(session.getAttribute("CuReward")!=null) {
	         session.removeAttribute("CuReward");
	         session.setAttribute("CuReward", cuReward);
	      }else {
	         session.setAttribute("CuReward", cuReward);
	      }
		
		return "buyLottery.do";
	}

}
