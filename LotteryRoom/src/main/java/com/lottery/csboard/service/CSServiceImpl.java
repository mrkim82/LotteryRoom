package com.lottery.csboard.service;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.lottery.common.DataSource;
import com.lottery.csboard.domain.CSVO;
import com.lottery.csboard.mapper.CSMapper;


public class CSServiceImpl implements CSService {
	
	SqlSession session = DataSource.getInstance().openSession(true);
	CSMapper mapper = session.getMapper(CSMapper.class);
	
	@Override
	public List<CSVO> listBoard(CSVO vo) {
	//return mapper.listBoard(mbGrade);
		return mapper.csPage(vo);
	}
	
	@Override
	public boolean addBoard(CSVO vo) {
		return mapper.addBoard(vo) == 1;
	}
	
	@Override
	public CSVO getBoard(int cbId) {
		mapper.updateCount(cbId);
		return mapper.getBoard(cbId);
	}
	
	@Override
	public boolean removeBoard(int cbId) {
		return mapper.removeBoard(cbId) == 1;
	}
	
	@Override
	public boolean modifyBoard(CSVO vo) {
		return mapper.modifyBoard(vo) == 1;
	}
	
	@Override
	public int getCount(String cbGrade) {
		return mapper.getCount(cbGrade);
	}
}
