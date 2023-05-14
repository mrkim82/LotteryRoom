package com.lottery.multiboard.mapper;

import java.util.List;

import com.lottery.multiboard.domain.MultiVO;

public interface MultiMapper {
	public List<MultiVO> listBoard(String mbGrade); // 멀티게시판 전체 리스트 조회
	public MultiVO getBoard(int mbId); // 멀티게시판 단건 조회
	public int addBoard(MultiVO vo); // 멀티게시판 게시글 추가
	public int removeBoard(int mbId); // 멀티게시판 게시글 삭제
	public int modifyBoard(MultiVO vo); // 멀티게시판 게시글 수정
	
	public int updateCount(int mbId); // 조회수 증가
	
	public List<MultiVO> multiPage(MultiVO vo); // 공지사항 게시글 페이지
	public int getCount(String mbGrade); // 공지사항 게시물 갯수 확인
}
