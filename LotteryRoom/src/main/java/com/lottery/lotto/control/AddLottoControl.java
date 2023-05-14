package com.lottery.lotto.control;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.lottery.FrontControl.Control;
import com.lottery.lotto.domain.LottoVO;
import com.lottery.lotto.service.LottoService;
import com.lottery.lotto.service.LottoServiceImpl;

public class AddLottoControl implements Control{

	@Override
	public String execute(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		
		LottoService service = new LottoServiceImpl();
		
		// 복권 구매 기능이 정상 작동 할 경우, 이 부분 수정 필요함 
		// (오프라인 복권도 있다는 가정하에 온라인 구매내역 추가해주면 될 듯)
		String cumulativeAmount = req.getParameter("cumulativeAmount");
		boolean win = service.addLottoRound(Integer.parseInt(cumulativeAmount));
		if(win) {
			System.out.println("회자정보 등록 완료.");
		}
		
		int lotto[] = new int[7];
		
		System.out.println("당첨 로또 번호 : ");
		for(int i=0; i<lotto.length; i++) {
			int num = (int)(Math.random() * 45) + 1;
			lotto[i] = num;
			for(int j=0; j<i; j++) {
				if(lotto[i] == lotto[j]) {
					i--;
					break;
				}
			}
			System.out.println(i + ": " + lotto[i] + ", ");
		}
		
		int ltTimes = service.getLtTimes();
		System.out.println("ltTimes : " + ltTimes);
		
		LottoVO round = new LottoVO();
		round.setLtTimes(ltTimes);
		round.setWinFir(lotto[0]);
		round.setWinSec(lotto[1]);
		round.setWinThr(lotto[2]);
		round.setWinFour(lotto[3]);
		round.setWinFive(lotto[4]);
		round.setWinSix(lotto[5]);
		round.setWinBonus(lotto[6]);
		
		boolean winNum = service.addRandomLotto(round);
		
		if(winNum) {
			System.out.println("로또번호 등록 완료.");
		}
		
		int rank=0;
		int totsum=0;
		double proportion=0;
		
		boolean winBoard=false;
		
		for(int i=1; i<=5; i++) {
			rank = i;
			if(rank==1) {
				totsum = 12;
				proportion = 0.6;
			}else if(rank==2) {
				totsum = 11;
				proportion = 0.25;
			}else if(rank==3) {
				totsum = 10;
				proportion = 0.1;
			}else if(rank==4) {
				totsum = 8;
				proportion = 0.04;
			}else if(rank==5) {
				totsum = 6;
				proportion = 0.01;
			}
			
			LottoVO vo = new LottoVO();
			vo.setLtTimes(ltTimes);
			vo.setRank(rank);
			vo.setTotsum(totsum);
			vo.setProportion(proportion);
			
			winBoard = service.addWinBoard(vo); 
			
			HttpSession session = req.getSession();
			session.removeAttribute("LtTimes");
			System.out.println(session.getAttribute("LtTimes"));
			session.setAttribute("LtTimes", vo.getLtTimes());
			System.out.println("최신회차 확인 :" + session.getAttribute("LtTimes"));
			
			// 회차정보 초기화 후 다음 회차의 복권구매를 위한 세션 값 넣고 누적금액 초기화
			int nextLtTimes = (int) session.getAttribute("LtTimes") + 1;
			int lottoCount = service.cumulativeReward(nextLtTimes);
			int cuReward = lottoCount * 1000;
			if(session.getAttribute("CuReward")!=null) {
				session.removeAttribute("CuReward");
				session.setAttribute("CuReward", cuReward);
			}else {
				session.setAttribute("CuReward", cuReward);
			}
			System.out.println("cuReward : " + cuReward);
			
		}
		
		String json = "";
		
		Map<String, String> map = new HashMap<>();
		
		if(win && winNum && winBoard) {
			map.put("retCode", "Success");
		}else {
			map.put("retCode", "Fail");
		}
		
		Gson gson = new GsonBuilder().create();
		json = gson.toJson(map);
		
		return json + ".json";
	}

}
