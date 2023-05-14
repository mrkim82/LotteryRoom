package com.lottery.lotto.domain;

import java.util.Date;

import lombok.Data;

@Data

public class LottoVO {

//	LT_TIMES  NOT NULL NUMBER 
//	WIN_FIR   NOT NULL NUMBER 
//	WIN_SEC   NOT NULL NUMBER 
//	WIN_THR   NOT NULL NUMBER 
//	WIN_FOUR  NOT NULL NUMBER 
//	WIN_FIVE  NOT NULL NUMBER 
//	WIN_SIX   NOT NULL NUMBER 
//	WIN_BONUS NOT NULL NUMBER 
	
	private int ltTimes;
	private int cumulativeAmount;
	private Date winDate;

	private int winFir;
	private int winSec;
	private int winThr;
	private int winFour;
	private int winFive;
	private int winSix;
	private int winBonus;
	
	private String winRank;
	private int winNum;
	private int winPrice;
	
	private int rank;
	private int totsum;
	private double proportion;
	private int cuReward;

	//김욱환
	private int ltNo;
	private int ltFir;
	private int ltSec;
	private int ltThr;
	private int ltFour;
	private int ltFive;
	private int ltSix;
	
	private int userNo;
	private int ltPrice;
	private Date ltDate;
	
}
