package com.lottery.reply.control;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.lottery.FrontControl.Control;
import com.lottery.reply.domain.ReplyVO;
import com.lottery.reply.service.ReplyService;
import com.lottery.reply.service.ReplyServiceImpl;

public class AddReplyControl implements Control {

	@Override
	public String execute(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
				ReplyService service = new ReplyServiceImpl();	
				String userName = req.getParameter("userName");
				String userNo = req.getParameter("userNo");
				String replySubject = req.getParameter("replySubject");
				String mbId = req.getParameter("mbId");
				String cbId = req.getParameter("cbId");
				ReplyVO vo = new ReplyVO();
				System.out.println("mbId:"+mbId);
				System.out.println("cbId:"+cbId);
				vo.setUserName(userName);
				vo.setUserNo(Integer.parseInt(userNo));
				vo.setReplySubject(replySubject);
				boolean result = false;
				if(mbId != null) {
					vo.setMbId(Integer.parseInt(mbId));
					result = service.replyMultiAdd(vo);
				}else {
					vo.setCbId(Integer.parseInt(cbId));
					result = service.replyCSAdd(vo);
				}
							
				String json = "";
				
				Map<String, Object> map = new HashMap<>();
				
				if(result) {
					map.put("retCode", "Success");
					map.put("data", vo);
					
				} else {
					map.put("retCode", "Fail");
				}
				
				Gson gson = new GsonBuilder().create(); // gson 객체.
				json = gson.toJson(map);
				
				return json + ".json";
			}
}
