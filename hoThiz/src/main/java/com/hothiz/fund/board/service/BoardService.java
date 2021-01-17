package com.hothiz.fund.board.service;

import javax.servlet.http.HttpServletRequest;

import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.hothiz.fund.board.dto.Member_qnaDTO;
import com.hothiz.fund.board.dto.Qna_ReplyDTO;

public interface BoardService {
	public void write_save(Member_qnaDTO dto);
	public void question_list(Model model, int num);
	public void question_View(int qna_board_id, Model model);
	public void modify(Member_qnaDTO dto);
	public String delete(int qna_board_id);
	public void addReply(HttpServletRequest request);
	//public void addReply(Qna_ReplyDTO dto);
}

 