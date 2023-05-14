package com.lottery.multiboard.service;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.lottery.common.DataSource;
import com.lottery.multiboard.domain.MultiVO;
import com.lottery.multiboard.mapper.MultiMapper;


public class MultiServiceImpl implements MultiService {
	
	SqlSession session = DataSource.getInstance().openSession(true);
	MultiMapper mapper = session.getMapper(MultiMapper.class);
	
	@Override
	public List<MultiVO> listBoard(MultiVO vo) {
	//return mapper.listBoard(mbGrade);
		return mapper.multiPage(vo);
	}
	
	@Override
	public boolean addBoard(MultiVO vo) {
		return mapper.addBoard(vo) == 1;
	}
	
	@Override
	public MultiVO getBoard(int mbId) {
		mapper.updateCount(mbId);
		return mapper.getBoard(mbId);
	}
	
	@Override
	public boolean removeBoard(int mbId) {
		return mapper.removeBoard(mbId) == 1;
	}
	
	@Override
	public boolean modifyBoard(MultiVO vo) {
		return mapper.modifyBoard(vo) == 1;
	}
	
	@Override
	public int getCount(String mbGrade) {
		return mapper.getCount(mbGrade);
	}
}
