package com.lottery.csboard.service;

import java.util.List;

import com.lottery.csboard.domain.CSVO;


public interface CSService {
	public List<CSVO> listBoard(CSVO vo); // 멀티게시판 전체 리스트 조회
	public CSVO getBoard(int cbId); // 멀티게시판 단건 조회
	public boolean addBoard(CSVO vo); // 멀티게시판 게시글 추가
	public boolean removeBoard(int cbId); // 멀티게시판 게시글 삭제
	public boolean modifyBoard(CSVO vo); // 멀티게시판 게시글 수정
	public int getCount(String cbGrade); // 게시물 갯수 확인
}
