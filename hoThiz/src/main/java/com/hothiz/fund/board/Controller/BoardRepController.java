package com.hothiz.fund.board.Controller;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;


import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.hothiz.fund.board.dao.BoardDAO;
import com.hothiz.fund.board.dto.Qna_ReplyDTO;

@RestController
public class BoardRepController {
	 
	@Autowired BoardDAO dao;
	
	   @GetMapping(value="replyData/{qna_board_id}", produces="application/json;charset=utf-8")
	   public String replyData(@PathVariable int qna_board_id) throws JsonProcessingException {
	      ArrayList<Qna_ReplyDTO> list = dao.getRepList(qna_board_id);
	      ObjectMapper mapper = new ObjectMapper();
	      String listJson = mapper.writeValueAsString(list);
	      return listJson;
	   }
}
