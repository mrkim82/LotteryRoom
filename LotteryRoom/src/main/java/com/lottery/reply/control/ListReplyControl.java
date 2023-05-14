package com.lottery.reply.control;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.lottery.FrontControl.Control;
import com.lottery.reply.domain.ReplyVO;
import com.lottery.reply.service.ReplyService;
import com.lottery.reply.service.ReplyServiceImpl;

public class ListReplyControl implements Control {

	@Override
	public String execute(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String mbId = req.getParameter("mbId");
		String cbId = req.getParameter("cbId");
		ReplyService service = new ReplyServiceImpl();
		ReplyVO vo = new ReplyVO();
		if(cbId == null)
			vo.setMbId(Integer.parseInt(mbId));
		else
			vo.setCbId(Integer.parseInt(cbId));
		System.out.println(vo);
		String json = "[";
		List<ReplyVO> list = service.replyList(vo);
		System.out.println(service.replyList(vo));
		for(int i = 0; i < list.size(); i++) {
			json += "{\"replyId\":\""+list.get(i).getReplyId() +  "\",";
			json += "\"mbId\":\"" + list.get(i).getMbId() +  "\",";
			json += "\"cbId\":\"" + list.get(i).getCbId() +  "\",";
			json += "\"userName\":\"" + list.get(i).getUserName() +  "\",";
			json += "\"userNo\":\"" + list.get(i).getUserNo() + "\",";
			json += "\"replySubject\":\"" + list.get(i).getReplySubject() + "\",";
			json += "\"replyDate\":\"" + list.get(i).getReplyDate() + "\"}";
			
			if(i+1 != list.size()) {
				json += ",";
			}
		}
		json += "]";
		return json + ".json";
	}


}
