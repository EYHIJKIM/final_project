package com.hothiz.fund.admin.service;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.hothiz.fund.admin.dao.AdminDAO;
import com.hothiz.fund.admin.dto.AdminDTO;
import com.hothiz.fund.board.dto.Admin_noticeDTO;
import com.hothiz.fund.board.dto.Member_qnaDTO;

@Service
public class AdminServiceImpl implements AdminService{

	@Autowired
	AdminDAO dao;
	
	

	@Override
	public void selectNoticeList(Model model, int num) {
		int pageLetter = 10;
		int allCount = dao.selectNoticeAllCount();
		int repeat = allCount / pageLetter;
		if(allCount % pageLetter != 0) {
			repeat += 1;
		}
		int end = num*pageLetter;
		int start = end + 1 - pageLetter;
		model.addAttribute("repeat", repeat);
		model.addAttribute("adminList", dao.selectNoticeList(start, end));
	}
	
	@Override
	public void notice_save(AdminDTO dto) {
		dao.notice_save(dto);
	}

	
	   @Override
	   public void notice_detail(Model model, int id) {
	      model.addAttribute("noticelist", dao.notice_detail(id));
	   }


//	@Override
//	public void idSelect(Model model, String id, int num) {
//		int pageLetter = 5;
//		int allCount = dao.selectNoticeCount();
//		int repeat = allCount / pageLetter;
//		if(allCount % pageLetter != 0) {
//			repeat += 1;
//		}
//		int end = num*pageLetter;
//		int start = end +1 - pageLetter;
//		model.addAttribute("repeat", repeat);
//		model.addAttribute("idSelect", dao.idSelect(id, start, end));
//	}

	@Override
	public void project_check(Model model) {
		model.addAttribute("list",dao.project_check());
	}

	@Override
	public void check_detail(Model model, int id) {
		//특정id의정보만가져옴
		model.addAttribute("list",dao.check_detail(id));
		
	}

	@Override
	public void agree(int id, String email) {
		System.out.println("======");
		System.out.println(id);
		System.out.println("======");
		System.out.println(email);
		System.out.println("======");
		dao.agree(id);
		dao.agreeMessage(email);
		
	}

	@Override
	public void disagree(int id, String email) {
		dao.disagree(id);
		
		dao.disagreeMessage(email);
		//여기추가로 메시지를보냄 --> 귀하의프로젝트재승인받아라
	}

}
