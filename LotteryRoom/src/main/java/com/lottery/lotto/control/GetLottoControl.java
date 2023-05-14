package com.lottery.lotto.control;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.lottery.FrontControl.Control;
import com.lottery.lotto.domain.LottoVO;
import com.lottery.lotto.service.LottoService;
import com.lottery.lotto.service.LottoServiceImpl;

public class GetLottoControl implements Control {

	@Override
	public String execute(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		LottoService service = new LottoServiceImpl();
		LottoVO ltInfo = new LottoVO();

		ltInfo = service.lottoNumberList();
		
		String json = "";

		Map<String, Object> map = new HashMap<>();
		
		if(ltInfo != null) {
			map.put("retCode", "Success");
			map.put("ltInfo", ltInfo);
		}else {
			map.put("retCode", "Fail");
		}
		
		Gson gson = new GsonBuilder().create();
		json = gson.toJson(map);
		
		return json + ".json";
	}

}
