package com.lottery.lotteryuser.service;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.lottery.common.DataSource;
import com.lottery.lotteryuser.domain.LotteryUserVO;
import com.lottery.lotteryuser.mapper.LotteryUserMapper;

public class LotteryUserServiceImpl implements LotteryUserService{
   SqlSession session = DataSource.getInstance().openSession(true);
   LotteryUserMapper mapper = session.getMapper(LotteryUserMapper.class);
   @Override
   public LotteryUserVO loginCheck(LotteryUserVO vo) {
      return mapper.loginCheck(vo);
   }
   
   @Override
   public LotteryUserVO getUserInfo(String userId) {
      return mapper.getUserInfo(userId);
   }
   
   @Override
   public boolean insertMembership(LotteryUserVO vo) {
      return mapper.insertMembership(vo) == 1;
   }

   @Override
   public boolean plusMileage(int mileage , String userId) {
      return mapper.plusMileage(mileage, userId) == 1;
   }

   @Override
   public boolean minusMileage(LotteryUserVO vo) {
      return mapper.minusMileage(vo) == 1;
   }

   @Override
   public int getMileage(String userId) {
      return mapper.getMileage(userId);
   }
   
   @Override
   public LotteryUserVO kakaoLogin(String userId) {
      return mapper.kakaoLogin(userId);
   }
   @Override
   public LotteryUserVO myPage(int userNo) {
      return mapper.myPage(userNo);
   }
   
   @Override
   public boolean updateMember(LotteryUserVO vo) {
      return mapper.updateMember(vo)==1;
   }
   
   @Override
   public boolean deleteMember(int userNo) {
      return mapper.deleteMember(userNo)==1;
   }
   
   @Override
   public List<LotteryUserVO> searchLottery(LotteryUserVO vo) {
      return mapper.searchLottery(vo);
   }
   
   @Override
   public int getLotteryCount(int userNo) {
      return mapper.getLotteryCount(userNo);
   }
   
   @Override
   public List<LotteryUserVO> lotteryResult(int userNo) {
      return mapper.lotteryResult(userNo);
   }
   
   @Override
	public List<LotteryUserVO> getUserId() {
		return mapper.getUserId();
	}
   
   @Override
	public String forgetUserId(LotteryUserVO vo) {
		return mapper.forgetUserId(vo);
	}
   
   @Override
	public String forgetUserPw(String userId) {
		return mapper.forgetUserPw(userId);
	}
}