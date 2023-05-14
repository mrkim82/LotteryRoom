package com.lottery.multiboard.control;

import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.text.SimpleDateFormat;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.lottery.FrontControl.Control;
import com.lottery.multiboard.domain.MultiVO;
import com.lottery.multiboard.service.MultiService;
import com.lottery.multiboard.service.MultiServiceImpl;

public class GetMultiControl implements Control {

	@Override
	public String execute(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String mbId = req.getParameter("mbId");
		String page = req.getParameter("page");
		MultiService service = new MultiServiceImpl();
		MultiVO vo = service.getBoard(Integer.parseInt(mbId));
		SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy년 MM월 dd일"); 
		
		String mbDate = simpleDateFormat.format(vo.getMbDate()); 
		req.setAttribute("mbDate", mbDate);
		req.setAttribute("pageNum", page);
		req.setAttribute("VOInfo", vo);
		
		System.out.println(vo);
		
		
		if (vo.getMbAttach() != null) {
			String imgPath = req.getServletContext().getRealPath("images");
			System.out.println(imgPath);
			Path file = Paths.get(imgPath + "/" + vo.getMbAttach());
			System.out.println(file);
			System.out.println(Files.probeContentType(file));
			// image/jpg, image/png, text/plain,
			String fileType = Files.probeContentType(file);

			req.setAttribute("fileType", fileType.substring(0, fileType.indexOf("/")));
		}
		return "multi/getmulti.tiles";
	}

}
