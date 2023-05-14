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

public class UpdateReplyControl implements Control {

	@Override
	public String execute(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		String replyId = req.getParameter("replyId");
//		String userName = req.getParameter("UserName");
		ReplyService service = new ReplyServiceImpl();

		ReplyVO vo = service.replyGet(Integer.parseInt(replyId));

		String replySubject = req.getParameter("replySubject");		
		
//		vo.setUserName(userName);
		vo.setReplySubject(replySubject);
		boolean result = service.replyUpdate(vo);
				
		String json = "";
		
		Map<String, Object> map = new HashMap<>();
		
		if(result) {
			map.put("retCode", "Success");
			map.put("data", vo);
			
		} else {
			map.put("retCode", "Fail");
		}
		
		Gson gson = new GsonBuilder().create();
		json = gson.toJson(map);
		
		return json + ".json";
	}
}
