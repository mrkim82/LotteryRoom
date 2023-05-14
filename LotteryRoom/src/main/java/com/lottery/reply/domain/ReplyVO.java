package com.lottery.reply.domain;

import java.util.Date;

import lombok.Data;

@Data
public class ReplyVO {
	
	private String userName;
	private String userId;
	private String userGrade;
	private String mbGrade;
	private String cbGrade;
	
	private int replyId;
	private int userNo;
	private int mbId;
	private int cbId;
	private String replySubject;
	private Date replyDate;
}
