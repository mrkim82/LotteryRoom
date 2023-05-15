package com.lottery.lotteryuser.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.lottery.lotteryuser.domain.LotteryUserVO;

public interface LotteryUserMapper {
   public LotteryUserVO loginCheck(LotteryUserVO vo);
   public LotteryUserVO getUserInfo(String userId);
   public int insertMembership(LotteryUserVO vo);
   public int plusMileage(@Param("mileage")int mileage , @Param("userId")String userId);
   public int minusMileage(LotteryUserVO vo);
   public int getMileage(String userId);
   public LotteryUserVO kakaoLogin(String userId);
   public LotteryUserVO myPage(int userNo);
   public int updateMember(LotteryUserVO vo);
   public int deleteMember(int userNo);
   public List<LotteryUserVO> searchLottery(LotteryUserVO vo);
   public int getLotteryCount(int userNo); 
   public List<LotteryUserVO> lotteryResult(int userNo);
   public List<LotteryUserVO> getUserId();
   public String forgetUserId(LotteryUserVO vo);
   public String forgetUserPw(String userId);
}