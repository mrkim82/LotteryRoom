
package com.lottery.FrontControl;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.HttpSession;

import com.lottery.lotto.domain.LottoVO;
import com.lottery.lotto.service.LottoService;
import com.lottery.lotto.service.LottoServiceImpl;

public class MainControl implements Control {

	@Override
	public String execute(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		//희영 - 지우면 안됨!!
		LottoService service = new LottoServiceImpl();
		LottoVO vo = new LottoVO();
		
		vo = service.lottoNumberList();
		
		int ltTimes = vo.getLtTimes();
		
		HttpSession session = req.getSession();
		if(session.getAttribute("LtTimes")!=null) {
			session.removeAttribute("LtTimes");
			session.setAttribute("LtTimes", ltTimes);
		}else {
			session.setAttribute("LtTimes", ltTimes);
		}
		System.out.println("ltTimes : " + ltTimes);
		
		int nextLtTimes = (int) session.getAttribute("LtTimes") + 1;
		int ltPayNum = service.cumulativeReward(nextLtTimes);
		int cuReward = ltPayNum * 1000; 
		if(session.getAttribute("CuReward")!=null) {
			session.removeAttribute("CuReward");
			session.setAttribute("CuReward", cuReward);
		}else {
			session.setAttribute("CuReward", cuReward);
		}
		System.out.println("cuReward : " + cuReward);
		// 희영 - 여기까지!!
		
	// return "WEB-INF/views/main/timer.jsp";

	 return "main/main.tiles";
		//return "yedamlottery/buymanual.tiles"; 욱환꺼
		//return "yedamlottery/buyauto.tiles";

		//return "main/main.tiles";

	 //return "WEB-INF/views/main/timer.jsp";
	//return "yedamlottery/buylotto.tiles";
	 
	}
}


		//return "WEB-INF/views/yedamlottery/recharge.jsp";
		//return "main/main.tiles";
		//return "WEB-INF/views/yedamLottery/recharge.jsp";
		//return "WEB-INF/views/main/kakaologin.jsp";
