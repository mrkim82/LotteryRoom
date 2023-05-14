package com.lottery.reply.service;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.lottery.common.DataSource;
import com.lottery.reply.domain.ReplyVO;
import com.lottery.reply.mapper.ReplyMapper;

public class ReplyServiceImpl implements ReplyService {
	
	SqlSession session = DataSource.getInstance().openSession(true);
	ReplyMapper mapper = session.getMapper(ReplyMapper.class);
	
	@Override
	public List<ReplyVO> replyList(ReplyVO vo) {
		return mapper.replyList(vo);
	}
	
	@Override
	public boolean replyMultiAdd(ReplyVO vo) {
		return mapper.replyMultiAdd(vo) == 1;
	}
	
	@Override
	public boolean replyCSAdd(ReplyVO vo) {
		return mapper.replyCSAdd(vo) == 1;
	}
	
	@Override
	public boolean replyRemove(int replyId) {
		return mapper.replyRemove(replyId) == 1;
	}
	
	@Override
	public ReplyVO replyGet(int replyId) {
		return mapper.replyGet(replyId);
	}
	
	@Override
	public boolean replyUpdate(ReplyVO vo) {
		return mapper.replyUpdate(vo) == 1;
	}
}
