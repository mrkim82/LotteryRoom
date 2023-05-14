package com.lottery.lotteryuser.domain;

import java.util.Date;

import lombok.Data;

@Data
public class LotteryUserVO {
//  Lottery_User
//   USER_NO    NOT NULL NUMBER        
//   USER_NAME  NOT NULL VARCHAR2(15)  
//   USER_ID    NOT NULL VARCHAR2(30)  
//   USER_PW    NOT NULL VARCHAR2(30)  
//   ADDRESS    NOT NULL VARCHAR2(100) 
//   PHONE      NOT NULL VARCHAR2(13)  
//   MILEAGE    NOT NULL NUMBER        
//   USER_GRADE NOT NULL VARCHAR2(5)   
//   USER_DATE           DATE    
   
   private int userNo;
   private String userName;
   private String userId;
   private String userPw;
   private String address;
   private String phone;
   private int mileage;
   private String userGrade;
   private Date userDate;
   private int birthYear;
   private int birthMonth;
   private int birthDay;
   
//========Mypage========
   private Date ltDate;
   private int ltNo;
   private int ltTimes;
   private int ltFir;
   private int ltSec;
   private int ltThr;
   private int ltFour;
   private int ltFive;
   private int ltSix;
   private int page;
   
//===============Win=================   
   private int cumulativeAmount;
   
//=============Win_Board=============   
   private String winRank;
   private int winNum;
   private int winPrice;
   
//============Win_Num================   
   private int winFri;
   private int winSec;
   private int winThr;
   private int winFour;
   private int winFive;
   private int winSix;
   private int winBouns;
   
   private int totSum;
   
}