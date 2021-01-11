package com.hothiz.fund.board.Controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.hothiz.fund.board.dto.Member_qnaDTO;
import com.hothiz.fund.board.dto.Qna_ReplyDTO;
import com.hothiz.fund.board.service.BoardService;


@Controller
public class BoardController {
	@Autowired
	private BoardService bs;
	
	@RequestMapping("questionReply")
	public String addReply(HttpServletRequest request, RedirectAttributes red, HttpSession session ) {
		 if(session.getAttribute("userId") == null) {
	            return "redirect:login";
	         }
				bs.addReply(request);
				red.addAttribute("qna_board_id", request.getParameter("qna_board_id"));
		return "redirect:question_View";
	}
	
//	@RequestMapping("questionReply")
//	public String addReply(Qna_ReplyDTO dto, Model model, HttpServletRequest request) {
//		int qna_board_id = Integer.parseInt(request.getParameter("qna_board_id"));
//		model.addAttribute("qna_board_id");
//				bs.addReply(dto);
//		return "redirect:http://localhost:8086/fund/question_View?qna_board_id="+qna_board_id;
//	}
	
	@GetMapping("questionReplyView")
	public String question_Reply(@RequestParam("qna_board_id") int qna_board_id, 
			Model model, HttpSession session ) {
		 if(session.getAttribute("userId") == null) {
	            return "redirect:login";
	         }
		model.addAttribute("qna_board_id", qna_board_id);
		return "member_qna/question_Reply";
	}
	
	@RequestMapping(value="question_list")
	public String question_list(Model model, @RequestParam(value="num", required=false, defaultValue="1") int num, HttpSession session ) {
		 if(session.getAttribute("userId") == null) {
	            return "redirect:login";
	         }
		 bs.question_list(model, num);
		return "member_qna/question_list";
	}
	
	@GetMapping("question_write")
	public String question_write(HttpServletRequest request, HttpSession session ) {
		session = request.getSession();	
		session.setAttribute("userId", "hahaha@naver.com");
		if(session.getAttribute("userId") == null) {
            return "redirect:login";
         }
		return "member_qna/question_write";
	}
	
	@PostMapping(value="write_save") //method= {RequestMethod.POST}
	public String write_save(@RequestParam(value="qna_board_title", required=false) String qna_board_title,
								@RequestParam(value="qna_board_content", required=false) String qna_board_content, HttpServletRequest request, HttpSession session ) {
		 if(session.getAttribute("userId") == null) {
	            return "redirect:login";
	         }
		session = request.getSession();
		String email = (String)session.getAttribute("userId");
		Member_qnaDTO dto = new Member_qnaDTO();
		dto.setMember_email(email);
		dto.setQna_board_title(qna_board_title);
		dto.setQna_board_content(qna_board_content);
		bs.write_save(dto);
		return "redirect:question_list";
	}
	
	@GetMapping("question_View")
	public String question_View(@RequestParam("qna_board_id") int qna_board_id, Model model, HttpSession session ) {
		 if(session.getAttribute("userId") == null) {
	            return "redirect:login";
	         }
		bs.question_View(qna_board_id, model);
		return "member_qna/question_View";
	}
	
	@RequestMapping("delete")
	public String delete(@RequestParam("qna_board_id") int qna_board_id, HttpSession session ) {
		 if(session.getAttribute("userId") == null) {
	            return "redirect:login";
	         }
		bs.delete(qna_board_id);
		return "redirect:question_list";
	}
	
	
	@PostMapping("question_modify")
	public String modify(Member_qnaDTO dto, HttpSession session ) {
		 if(session.getAttribute("userId") == null) {
	            return "redirect:login";
	         }
		bs.modify(dto);
		//ra.addAttribute("qna_board_id", dto.getQna_board_id()); RedirectAttributes ra
		return "redirect:question_list";
	}
}
