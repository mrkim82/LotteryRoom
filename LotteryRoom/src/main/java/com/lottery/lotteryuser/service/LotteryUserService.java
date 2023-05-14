package com.lottery.lotteryuser.service;

import java.util.List;

import com.lottery.lotteryuser.domain.LotteryUserVO;

public interface LotteryUserService {
   public LotteryUserVO loginCheck(LotteryUserVO vo);
   public LotteryUserVO getUserInfo(String userId);
   public boolean insertMembership(LotteryUserVO vo);
   public boolean plusMileage(int mileage , String userId);
   public boolean minusMileage(LotteryUserVO vo);
   public int getMileage(String userId);
   public LotteryUserVO kakaoLogin(String userId);
   public LotteryUserVO myPage(int userNo);
   public boolean updateMember(LotteryUserVO vo);
   public boolean deleteMember(int userNo);
   public List<LotteryUserVO> searchLottery(LotteryUserVO vo);
   public int getLotteryCount(int userNo); 
   public List<LotteryUserVO> lotteryResult(int userNo);
   
}