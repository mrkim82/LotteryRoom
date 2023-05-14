package com.lottery.lotto.service;

import java.util.List;

import com.lottery.lotto.domain.LottoVO;

public interface LottoService {

	// 로또 회차 등록 (추첨 일자 등)
	public boolean addLottoRound(int cumulativeAmount);
	
	// 로또 번호 추첨 및 등록
	public boolean addRandomLotto(LottoVO vo);
	
	// 로또 결과 등록
	public boolean addWinBoard(LottoVO vo);
	
	// 로또 회차 정보 조회
	public LottoVO lottoNumberList();	
	
	// 로또 당첨금 세부 조회
	public List<LottoVO> lottoMoneyList(int ltTimes); 
	
	// 최신 회차정보 조회
	public int getLtTimes();
	
	// 회차 정보 조회
	public LottoVO selLtTimes (int ltTimes);
	
	// 회차 리스트만
	public List<LottoVO> showLtTimes(); 
	
	// 구매복권 수량 조회
	public int cumulativeReward(int ltTimes);
	
	// 자동 구매하기.
	public boolean insertAutoLottery(LottoVO vo);
	
	//최신 생성 로또 번호 조회
	public int getAutoNum();
	
	//자동 복권번호
	public boolean insertAutoNum(LottoVO vo);
	
}
