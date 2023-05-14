package com.lottery.lotto.control;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.lottery.FrontControl.Control;
import com.lottery.lotto.domain.LottoVO;
import com.lottery.lotto.service.LottoService;
import com.lottery.lotto.service.LottoServiceImpl;

public class ListLottoControl implements Control {

	@Override
	public String execute(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		// 최신 회차 세션 정보 저장(로그인 & 추첨 업데이트 할 때마다) 후 당첨 결과 단건 조회
		LottoVO vo = new LottoVO();
		LottoService service = new LottoServiceImpl();
		
		String ltTimes = req.getParameter("selectRound");
		HttpSession session = req.getSession();
			
		if(ltTimes!=null) {
			vo = service.selLtTimes(Integer.parseInt(ltTimes));
		}else {
			ltTimes = String.valueOf(session.getAttribute("LtTimes"));
			vo = service.selLtTimes(Integer.parseInt(ltTimes));
			
		}
		
		SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy년 MM월 dd일");
		String winDate = simpleDateFormat.format(vo.getWinDate());
		
		req.setAttribute("winDate", winDate);
		req.setAttribute("lottoResult", vo);
		
		// select box에 들어갈 회차 정보 값 가져오기
		List<LottoVO> list = new ArrayList<>();
		list = service.showLtTimes();
		System.out.println(list);
		req.setAttribute("list", list);
		
		// 최신 회차의 등수별 세부 당첨 정보 조회
		List<LottoVO> wnInfo = new ArrayList<>();
		wnInfo = service.lottoMoneyList(Integer.parseInt(ltTimes));
		
		System.out.println("리스트 조회:" + wnInfo);
		req.setAttribute("Info", wnInfo);

		
		return "lottoresult/perround.tiles";
	}

}
