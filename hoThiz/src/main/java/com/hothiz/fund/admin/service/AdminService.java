package com.hothiz.fund.admin.service;

import javax.servlet.http.HttpSession;

import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestParam;

import com.hothiz.fund.admin.dto.AdminDTO;
import com.hothiz.fund.board.dto.Member_qnaDTO;

public interface AdminService {

	public void selectNoticeList(Model model, int num);
	public void notice_save(AdminDTO dto);
	//public void idSelect(Model model, String id, int num);
	//public void idSelect(Model model, String id);

	//그거 프로젝트승인대기목록
	public void project_check(Model model);
	
	//승인대기목록에서 특정프로젝트제목누르면 그프로젝트id타고가서 그정보봄
	public void check_detail(Model model, int id);
	
	//승인
	public void agree(int id, String email);
	
	//거부  거부하면   작성중인상태로돌리고 메시지로 재검토받아라보냄
	public void disagree(int id, String email);
	
	//공지사항에서 제목 누르면 상세정보
	   public void notice_detail(Model model, int id);
	
	
	
}
