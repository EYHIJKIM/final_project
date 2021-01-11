package com.hothiz.fund.board.service;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.hothiz.fund.board.dao.BoardDAO;
import com.hothiz.fund.board.dto.Member_qnaDTO;
import com.hothiz.fund.board.dto.Qna_ReplyDTO;

@Service
public class BoardServiceImpl implements BoardService{
	
	@Autowired
	BoardDAO dao;

	@Override
	public void write_save(Member_qnaDTO dto) {
		dao.write_save(dto);	
	}
	
	@Override
	public void question_list(Model model, int num) {
		int pageLetter = 5;
		int allCount = dao.selectBoardCount();
		int repeat = allCount / pageLetter;
		if(allCount % pageLetter !=0) {
			repeat += 1;
		}
		int end = num*pageLetter;
		int start = end + 1 - pageLetter;
		model.addAttribute("repeat", repeat);
		 model.addAttribute("question_list", dao.question_list(start, end));
	}

	@Override
	public void question_View(int qna_board_id, Model model) {
		model.addAttribute("question_View", dao.question_View(qna_board_id));
		upHit(qna_board_id);
	}
	
	private void upHit(int qna_board_id) {
		dao.upHit(qna_board_id);
	}

	@Override
	public void modify(Member_qnaDTO dto) {
		dao.modify(dto);
	}

	@Override
	public String delete(int qna_board_id) {
		String message = "<script>";
		try {
			dao.delete(qna_board_id);
			message += "alert('글을 삭제 했습니다.');";
		}catch(Exception e) {
			message += "alert(문제가 발생했습니다.);";
			e.printStackTrace();
		}
		message += "location.href='question_list';";
		message += "</script>";
		return message;
	}

	@Override
	public void addReply(HttpServletRequest request) {
		String id = request.getParameter("reply_id");
		String title = request.getParameter("reply_title");
		String content = request.getParameter("reply_content");
		int qna_board_id = Integer.parseInt(request.getParameter("qna_board_id"));
		dao.addReply(id,title,content,qna_board_id);
	}
	
//	@Override
//	public void addReply(Qna_ReplyDTO dto) {
//		dao.addReply(dto);
//	}
	
	
}
