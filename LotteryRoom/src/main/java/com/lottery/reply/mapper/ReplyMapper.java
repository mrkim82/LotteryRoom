package com.lottery.reply.mapper;

import java.util.List;

import com.lottery.reply.domain.ReplyVO;

public interface ReplyMapper {
	public List<ReplyVO> replyList(ReplyVO vo); // 댓글 전체 조회
	public int replyMultiAdd(ReplyVO vo); // 댓글 추가
	public int replyCSAdd(ReplyVO vo); // 댓글 추가
	public int replyRemove(int replyId); // 댓글 삭제
	public ReplyVO replyGet(int replyId); // 댓글 단건 조회(댓글 수정 시 사용)
	public int replyUpdate(ReplyVO vo); // 댓글 수정
}
