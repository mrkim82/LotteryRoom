package com.lottery.reply.service;

import java.util.List;

import com.lottery.reply.domain.ReplyVO;

public interface ReplyService {
	
	public List<ReplyVO> replyList(ReplyVO vo); // 댓글 전체 조회
	public boolean replyMultiAdd(ReplyVO vo); // 댓글 추가
	public boolean replyCSAdd(ReplyVO vo); // 댓글 추가
	public boolean replyRemove(int replyId); // 댓글 삭제
	public ReplyVO replyGet(int replyId); // 댓글 단건 조회(댓글 수정 시 사용)
	public boolean replyUpdate(ReplyVO vo); // 댓글 수정
}
