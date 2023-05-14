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
import com.lottery.reply.service.ReplyService;
import com.lottery.reply.service.ReplyServiceImpl;

public class RemoveReplyControl implements Control {

	@Override
	public String execute(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		String replyId = req.getParameter("replyId");
		
		ReplyService service = new ReplyServiceImpl();
		boolean result = service.replyRemove(Integer.parseInt(replyId));
		
		String json = "";

		Map<String, String> map = new HashMap<>();
		
		if(result) {
			map.put("retCode", "Success");

		} else {
			map.put("retCode", "Fail");
		}
		
		Gson gson = new GsonBuilder().create();
		json = gson.toJson(map);
		
		return json + ".json";
	}
}
