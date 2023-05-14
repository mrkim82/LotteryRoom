package com.lottery.multiboard.service;

import java.util.List;

import com.lottery.multiboard.domain.MultiVO;

public interface MultiService {
	public List<MultiVO> listBoard(MultiVO vo); // 멀티게시판 전체 리스트 조회
	public MultiVO getBoard(int mbId); // 멀티게시판 단건 조회
	public boolean addBoard(MultiVO vo); // 멀티게시판 게시글 추가
	public boolean removeBoard(int mbId); // 멀티게시판 게시글 삭제
	public boolean modifyBoard(MultiVO vo); // 멀티게시판 게시글 수정
	public int getCount(String mbGrade); // 게시물 갯수 확인
}
