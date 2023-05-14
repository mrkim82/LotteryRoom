package com.lottery.multiboard.control;

import java.io.IOException;
import java.util.Enumeration;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.lottery.FrontControl.Control;
import com.lottery.multiboard.domain.MultiVO;
import com.lottery.multiboard.service.MultiService;
import com.lottery.multiboard.service.MultiServiceImpl;
import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

public class UpdateMultiControl implements Control {

	@Override
	public String execute(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		if (req.getMethod().equals("GET")) {
			String mbId = req.getParameter("mbId");
			MultiService service = new MultiServiceImpl();
			MultiVO vo = service.getBoard(Integer.parseInt(mbId));
			req.setAttribute("VOInfo", vo);
			
			return "multi/updatemulti.tiles";
			
		} else if (req.getMethod().equals("POST")) {
			String saveDir = req.getServletContext().getRealPath("images");
			int maxSize = 5 * 1024 * 1024;
			String encoding = "UTF-8";
			DefaultFileRenamePolicy rn = new DefaultFileRenamePolicy();
			MultipartRequest multi = new MultipartRequest(req, saveDir, maxSize, encoding, rn);
			
			Enumeration<?> enu = multi.getFileNames();
			while (enu.hasMoreElements()) {
				String file = (String) enu.nextElement();
				System.out.println("file : " + file);
			}
			String mbId = multi.getParameter("mbId");
			String mbTitle = multi.getParameter("mbTitle");
			String mbSubject = multi.getParameter("mbSubject");
			String mbAttach = multi.getFilesystemName("mbAttach");
			String mbGrade = multi.getParameter("mbGrade");
			
			MultiVO vo = new MultiVO();
			
			vo.setMbId(Integer.parseInt(mbId));
			vo.setMbTitle(mbTitle);
			vo.setMbSubject(mbSubject);
			vo.setMbAttach(mbAttach);

			HttpSession session = req.getSession();
			session.setAttribute("mbGrade", mbGrade);
			
			MultiService service = new MultiServiceImpl();
			service.modifyBoard(vo);
		}
		
		return "listMulti.do";
	}

}
