package com.lottery.lotto.service;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.lottery.common.DataSource;
import com.lottery.lotto.domain.LottoVO;
import com.lottery.lotto.mapper.LottoMapper;

public class LottoServiceImpl implements LottoService{

	SqlSession session = DataSource.getInstance().openSession(true);
	LottoMapper mapper = session.getMapper(LottoMapper.class);
	
	@Override
	public boolean addLottoRound(int cumulativeAmount) {
		return mapper.addLottoRound(cumulativeAmount)>0;
	}
	
	@Override
	public boolean addRandomLotto(LottoVO vo) {
		return mapper.addRandomLotto(vo)>0;
	}
	
	@Override
	public boolean addWinBoard(LottoVO vo) {
		return mapper.addWinBoard(vo)>0;
	}
	
	@Override
	public LottoVO lottoNumberList() {
		return mapper.lottoNumberList();
	}
	
	@Override
	public List<LottoVO> lottoMoneyList(int ltTimes) {
		return mapper.lottoMoneyList(ltTimes);
	}
	
	@Override
	public int getLtTimes() {
		return mapper.getLtTimes();
	}
	
	@Override
	public LottoVO selLtTimes(int ltTimes) {
		return mapper.selLtTimes(ltTimes);
	}
	
	@Override
	public List<LottoVO> showLtTimes() {
		return mapper.showLtTimes();
	}

	@Override
	public int cumulativeReward(int ltTimes) {
		return mapper.cumulativeReward(ltTimes);
	}

	@Override
	public boolean insertAutoLottery(LottoVO vo) {
		return mapper.insertAutoLottery(vo) == 1;
	}

	@Override
	public boolean insertAutoNum(LottoVO vo) {
		return mapper.insertAutoNum(vo) == 1;
	}

	@Override
	public int getAutoNum() {
		return mapper.getAutoNum();
	}
	
	
	
}
