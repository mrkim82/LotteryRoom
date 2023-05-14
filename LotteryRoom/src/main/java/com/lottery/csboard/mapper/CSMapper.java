package com.lottery.csboard.mapper;

import java.util.List;

import com.lottery.csboard.domain.CSVO;

public interface CSMapper {
	public CSVO getBoard(int cbId); // 멀티게시판 단건 조회
	public int addBoard(CSVO vo); // 멀티게시판 게시글 추가
	public int removeBoard(int cbId); // 멀티게시판 게시글 삭제
	public int modifyBoard(CSVO vo); // 멀티게시판 게시글 수정
	
	public int updateCount(int cbId); // 조회수 증가
	
	public List<CSVO> csPage(CSVO vo); // 공지사항 게시글 페이지
	public int getCount(String cbGrade); // 공지사항 게시물 갯수 확인
}
