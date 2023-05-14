package com.lottery.csboard.control;

import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.text.SimpleDateFormat;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.lottery.FrontControl.Control;
import com.lottery.csboard.domain.CSVO;
import com.lottery.csboard.service.CSService;
import com.lottery.csboard.service.CSServiceImpl;


public class GetCSControl implements Control {

	@Override
	public String execute(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String cbId = req.getParameter("cbId");
		String page = req.getParameter("page");
		CSService service = new CSServiceImpl();
		CSVO vo = service.getBoard(Integer.parseInt(cbId));
		SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy년 MM월 dd일"); 
		
		String cbDate = simpleDateFormat.format(vo.getCbDate()); 
		req.setAttribute("cbDate", cbDate);
		req.setAttribute("pageNum", page);
		req.setAttribute("VOInfo", vo);
		
		System.out.println(vo);
		
		
		if (vo.getCbAttach() != null) {
			String imgPath = req.getServletContext().getRealPath("images");
			System.out.println(imgPath);
			Path file = Paths.get(imgPath + "/" + vo.getCbAttach());
			System.out.println(file);
			System.out.println(Files.probeContentType(file));
			// image/jpg, image/png, text/plain,
			String fileType = Files.probeContentType(file);

			req.setAttribute("fileType", fileType.substring(0, fileType.indexOf("/")));
		}
		return "cs/getcs.tiles";
	}
}
