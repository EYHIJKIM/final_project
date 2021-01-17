package com.hothiz.fund.admin.Controller;

import java.io.File;
import java.io.FileInputStream;
import java.io.OutputStream;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.hothiz.fund.admin.dto.AdminDTO;
import com.hothiz.fund.admin.service.AdminService;
import com.hothiz.fund.board.dto.Member_qnaDTO;
import com.hothiz.fund.project.controller.ProjectUploadController;

@Controller

public class AdminController {
	@Autowired
	private AdminService as;
	
	//스토리에 들어가는 이미지
		private final String IMAGE_REPO2 = "C:\\javawork\\spring_workspace\\.metadata\\.plugins\\org.eclipse.wst.server.core\\tmp0\\wtpwebapps\\hoThiz\\resources\\img\\project\\story";
		
	
	
	@RequestMapping("notice_AllList")
	public String selectNoticeList(Model model, @RequestParam(value="num", required=false, defaultValue="1") int num) {
		
		as.selectNoticeList(model, num);
		return "admin_board/notice_AllList";
	}

	//관리자페이지 들어가는 매핑
	@RequestMapping("admin")
	public String admin(HttpSession session) {
		if(session.getAttribute("userId") == null) {
			return "redirect:/";
		}
	else if(!session.getAttribute("userId").equals("admin@hoThiz.com") || session.getAttribute("userId").equals("") ) {
			return "redirect:/";
			
		}else {
			return "admin_board/admin";
			
		}
		
		
		
		
	}
	
//	@RequestMapping("idSelect")
//	public String idSelect(Model model, @RequestParam("id") String id, @RequestParam(value="num", required=false, defaultValue="1") int num) {
//		as.idSelect(model, id, num);
//		return "admin_board/questionAd_list";
//	}
	
//	@RequestMapping("idSelect")
//	public String idSelect(Model model, @RequestParam("id") String id) {
//		as.idSelect(model, id);
//		return "admin_board/questionAd_list";
//	}
	
	
	
	//프로젝트승인페이지
	@RequestMapping("project_check")
	public String project_check(Model model) {
		as.project_check(model);
		return "admin_board/project_check";
	}
	
	//프로젝트승인 페이지에서 해당프로젝트 상세보기
	@RequestMapping("check_detail")			// get으로 project_id받아서 그거만함
	public String check_email(Model model, @RequestParam("project_id") int id) {
		as.check_detail(model, id);
		return "admin_board/check_detail";
	}
	
	//승인
	@RequestMapping("agree")
	public String agree(@RequestParam("project_id") int id , @RequestParam("member_email") String email) {
		
		as.agree(id,email);
		return "redirect:project_check";
	}
	
	//거부
	@RequestMapping("disagree")
	public String disagree(@RequestParam("project_id") int id, @RequestParam("member_email") String email) {
		//String userId =(String) session.getAttribute("userId");
		as.disagree(id, email);
		return "redirect:project_check";	
	}
	
	//공지사항 작성페이지
	@RequestMapping("notice_write")
	public String notice_write() {
		return "admin_board/notice_write";
	}
	
	//공지사항 저장
	@RequestMapping("notice_save")
	public String notice_save(AdminDTO dto) {
		as.notice_save(dto);
		return "redirect:notice_AllList";
	}
	
	   //공지사항에서 제목 클릭시 해당글 상세보기
	   @RequestMapping("notice_detail")
	   public String notice_detail(Model model, @RequestParam("notice_board_id") int id) {
	      as.notice_detail(model, id);
	      return "admin_board/notice_detail";
	   }
	
	
	
//	@RequestMapping("edit-project/download")
//	   public void getdownload(@RequestParam("imageFileName") String imageFileName,
//	                          HttpServletResponse response, HttpSession session)throws Exception {
//	      //System.out.println("다운로드 실행 됩니까???");
//	      String email = (String)session.getAttribute("userId");
//	      String path = IMAGE_REPO2+"\\"+email; //폴더 경로
//	      File Folder = new File(path);
//
//	      // 해당 디렉토리가 없을경우 디렉토리를 생성합니다.
//	      if (!Folder.exists()) {
//	         try{
//	             Folder.mkdir(); //폴더 생성합니다.
//	              } 
//	              catch(Exception e){
//	             e.getStackTrace();
//	         }        
//	      }
//	      OutputStream out = response.getOutputStream();
//	      String downFile = IMAGE_REPO2+"\\"+email+"\\"+fdID"+"\\"+imageFileName;
//	      File file = new File(downFile);
//	      //Content-disposition :파일 다운로드를 처리하는 HTTP헤더 중 하나다
//	      //Content-disposition : attachment : attachment는 파일을 다운로드하여 브라우저로 표현 하는 의미다
//	      //fileName는 파일을 다운로드할때의 이름을 지정해 준다.
//	      response.addHeader("Content-disposition", "attachment; fileName=" + imageFileName);
//	      FileInputStream in = new FileInputStream(file);
//	      byte[] buffer = new byte[1024 * 8];
//	      while (true) {//브라우저로 전송
//	         int count = in.read(buffer);  
//	         if (count == -1) 
//	            break;
//	         out.write(buffer, 0, count);
//	      }
//	      in.close(); out.close();
//	   }
//	
	
}
