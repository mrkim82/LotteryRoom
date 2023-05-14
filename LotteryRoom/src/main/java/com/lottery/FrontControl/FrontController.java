package com.lottery.FrontControl;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.lottery.csboard.control.AddCSControl;
import com.lottery.csboard.control.GetCSControl;
import com.lottery.csboard.control.ListCSControl;
import com.lottery.csboard.control.RemoveCSControl;
import com.lottery.csboard.control.UpdateCSControl;
import com.lottery.lotteryuser.control.BuyAutoControl;
import com.lottery.lotteryuser.control.BuyLotteryControl;
import com.lottery.lotteryuser.control.BuyManualControl;
import com.lottery.lotteryuser.control.DeleteMemberControl;
import com.lottery.lotteryuser.control.IntroduceLotteryControl;
import com.lottery.lotteryuser.control.KakaoLoginControl;
import com.lottery.lotteryuser.control.LoginControl;
import com.lottery.lotteryuser.control.LogoutControl;
import com.lottery.lotteryuser.control.MembershipControl;
import com.lottery.lotteryuser.control.MinusMileageControl;
import com.lottery.lotteryuser.control.MypageControl;
import com.lottery.lotteryuser.control.PlusMileageControl;
import com.lottery.lotteryuser.control.SearchLotteryControl;
import com.lottery.lotteryuser.control.UpdateMemberControl;
import com.lottery.lotto.control.AddAutoControl;
import com.lottery.lotto.control.AddLottoControl;
import com.lottery.lotto.control.GetLottoControl;
import com.lottery.lotto.control.ListLottoControl;
import com.lottery.lotto.control.LiveRewardControl;
import com.lottery.main.control.mainBoardControl;
import com.lottery.multiboard.control.AddMultiControl;
import com.lottery.multiboard.control.GetMultiControl;
import com.lottery.multiboard.control.ListMultiControl;
import com.lottery.multiboard.control.RemoveMultiControl;
import com.lottery.multiboard.control.UpdateMultiControl;
import com.lottery.reply.control.AddReplyControl;
import com.lottery.reply.control.ListReplyControl;
import com.lottery.reply.control.RemoveReplyControl;
import com.lottery.reply.control.UpdateReplyControl;
import com.lottery.store.control.StoreListControl;
import com.lottery.store.control.StoreMapControl;
import com.lottery.store.control.StoreSearchControl;



public class FrontController extends HttpServlet {

	private Map<String, Control> map;
	String encoding;

	public FrontController() {
		map = new HashMap<>();
	}

	@Override
	public void init(ServletConfig config) throws ServletException {
		encoding = config.getInitParameter("enc");
		// 메인화면
		map.put("/main.do", new MainControl());
		map.put("/mainBoard.do", new mainBoardControl()); // 메인게시판 리스트 조회
		// 멀티게시판(공지사항(E), 언론보도(K), 커뮤니티(J))
		map.put("/listMulti.do", new ListMultiControl()); // 멀티게시판 리스트 조회
		map.put("/getMulti.do", new GetMultiControl()); // 멀티게시판 단건조회
		map.put("/addMulti.do", new AddMultiControl()); // 멀티게시판 게시글 추가
		map.put("/removeMulti.do", new RemoveMultiControl()); // 멀티게시판 게시글 삭제
		map.put("/updateMulti.do", new UpdateMultiControl()); // 멀티게시판 게시글 수정
		
		// 고객센터 게시판(FAQ(F), 1:1문의(C))
		map.put("/listCS.do", new ListCSControl()); // 고객센터 게시판 리스트 조회
		map.put("/getCS.do", new GetCSControl()); // 고객센터 게시판 단건조회
		map.put("/addCS.do", new AddCSControl()); // 고객센터 게시판 게시글 추가
		map.put("/removeCS.do", new RemoveCSControl()); // 고객센터 게시판 게시글 삭제
		map.put("/updateCS.do", new UpdateCSControl()); // 고객센터 게시판 게시글 수정
		
		// 댓글 기능
		map.put("/listReply.do", new ListReplyControl()); // 댓글 리스트 조회
		map.put("/addReply.do", new AddReplyControl()); //  댓글 추가
		map.put("/removeReply.do", new RemoveReplyControl()); // 댓글 삭제
		map.put("/updateReply.do", new UpdateReplyControl()); // 댓글 수정		
		
		// 당첨내역
		map.put("/addLotto.do", new AddLottoControl()); // 로또번호 랜덤 생성 및 회차 데이터 등록
		map.put("/getLotto.do", new GetLottoControl()); // 메인홈페이지 회차정보 조회
		map.put("/listLotto.do", new ListLottoControl()); // 당첨내역 회차별 정보 조회 
		map.put("/liveReward.do", new LiveRewardControl()); // 실시간 당첨금 조회
		
		// 로그인
		map.put("/login.do", new LoginControl()); // 로그인화면 및 로그인 기능
		map.put("/logout.do", new LogoutControl()); // 로그아웃
		map.put("/kakaologin.do", new KakaoLoginControl()); // 카카오 로그인 기능
		
		// 회원가입
		map.put("/membership.do", new MembershipControl()); // 회원가입 기능
		
		//예담복권
		map.put("/introduce.do", new IntroduceLotteryControl()); //예담복권 소개.
		map.put("/plusMileage.do", new PlusMileageControl()); // 충전하기
		map.put("/minusMileage.do", new MinusMileageControl());// 출금하기
		
		// 판매점
		map.put("/storelist.do", new StoreListControl()); // 판매점 리스트
		map.put("/storemap.do", new StoreMapControl()); // 판매점 위치 
		map.put("/storesearch.do", new StoreSearchControl()); // 현재 위치 기준 판매점 리스트
		
		//마이페이지
		map.put("/mypage.do",new MypageControl()); //마이페이지 정보 조회
		map.put("/updatemember.do",new UpdateMemberControl());	//개인정보 수정
		map.put("/deletemember.do", new DeleteMemberControl()); // 회원탈퇴
		
		//복권구매
		map.put("/buyLottery.do", new BuyLotteryControl()); // 복권구매 선택창.
		map.put("/buyAuto.do", new BuyAutoControl()); //자동복권구매 창 띄우기
		map.put("/buyManual.do", new BuyManualControl()); //수동복권구매 창 띄우기
		map.put("/addAuto.do", new AddAutoControl());
		
	}

	
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("UTF-8");

		String uri = req.getRequestURI();
		String context = req.getContextPath();
		String path = uri.substring(context.length());
		System.out.println(path);

		Control control = map.get(path);
		String viewPage = control.execute(req, resp);
		System.out.println(viewPage);

		if (viewPage.endsWith(".do")) {
			resp.sendRedirect(viewPage);
			return;
		}

		if (viewPage.endsWith(".json")) {
			resp.setContentType("text/json;charset=UTF-8");
			resp.getWriter().print(viewPage.substring(0,viewPage.length() - 5));
			return;
		}
		
		
		RequestDispatcher rd = req.getRequestDispatcher(viewPage);
		rd.forward(req, resp);
	}
}