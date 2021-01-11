package com.hothiz.fund.member.controller;

import java.io.File;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Set;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.hothiz.fund.member.dto.MemberDTO;
import com.hothiz.fund.member.dto.Member_messageDTO;
import com.hothiz.fund.member.service.MemberFileService;
import com.hothiz.fund.member.service.MemberService;

@Controller
public class MemberController {

	@Autowired
	MemberService ms;
	
	@Autowired
	MemberFileService mfs;

	
//	@RequestMapping("login")
//	public String login(HttpServletRequest request) {
//		System.out.println(request.getSession().getServletContext().getRealPath("/"));
//		HttpSession session = request.getSession();
//		session.setAttribute("userId", "bj11077@gmail.com");
//		// session.setAttribute("userId", "abc@naver.com");
//		return "member/login";
//	}
	
	//-----------------------------------------------------------------------------------		
	
	//login페이지
	   @RequestMapping("login")
	   public String login() {
		  
	      return "member/login";
	   }
	
	   @PostMapping(value = "user_check")
	   public String user_check(HttpServletRequest request,RedirectAttributes rs, HttpSession session) {
		   System.out.println(request.getSession().getServletContext().getRealPath("/"));
	      int result = ms.user_check(request);
	      
	      
	      
	      
	      if(result == 0) {
	         rs.addAttribute("member_email", request.getParameter("member_email"));
	         
	         return "redirect:successLogin";
	      }else if(result == 2) {
	    	  session.setAttribute("userId", "admin@hoThiz.com");
	    	  return "redirect:admin";
	      }
	      return "redirect:login";
	   }
	   //
	   @RequestMapping("successLogin")
	   public String successLogin(@RequestParam("member_email") String id,HttpSession session) {
	      session.setAttribute("userId", id);
	      return "redirect:/";
	   }
	   //
	   @RequestMapping("index")
	   public String index(HttpSession session) {
	    
	      return "index";
	      
	   }
	   
	   //동작함
	   
//-----------------------------------------------------------------------------------	
	
	   @RequestMapping("new_membership")
	   public String new_membership() {
	      return "member/new_membership";
	   }
	   

	      //카카오톡
	      @RequestMapping("success")
	      public String success(@RequestParam("code") String code, HttpSession session) {
	         System.out.println("code : " + code);
	         System.out.println("로그인 성공 success 연결 되었습니다");
	         GetKakao kakao = new GetKakao();
	         String accessToken = kakao.getAccessToken(code);
	         HashMap<String, Object> userInfo = kakao.getUserInfo(accessToken);
	         session.setAttribute("userId", userInfo.get("nickname"));
	         return "redirect:index";
	      }
	   
	   
	   //ȸ           
	   @PostMapping(value = "register")
	   public String register(MultipartHttpServletRequest mul, MemberDTO member) throws Exception{
		   System.out.println(member.getMember_profile_pic());
		   
	      System.out.println("mul = " + mul.getFileNames());
	      System.out.println("이메일이메일 : " +member.getMember_email());
	      String fileList = mfs.fileProcess(mul, member.getMember_email());
	      System.out.println("fileList = " + fileList);
	      
	     
	     

	      member.setMember_profile_pic(fileList);
	      System.out.println("================================");
	      System.out.println("member_email = " + member.getMember_email());
	      System.out.println("member_name = " + member.getMember_name());
	      System.out.println("member_prof_pic = " + member.getMember_profile_pic());
	      System.out.println("member_addr = " + member.getMember_addr());
	      System.out.println("================================");
	      int result = ms.register(member);
	      if(result == 1)   
	         return "redirect:login";  
	      return "redirect:new_membership";
	   }
	   
	
	   @GetMapping("project_delete")
	   public String project_delete(@RequestParam int project_id) {
	      System.out.println("project_id = " + project_id);
	      ms.project_delete(project_id);
	      return "redirect:my_project";
	   }
	   
	   
	   
	   
	   
//-----------------------------------------------------------------------------------	
	   @RequestMapping("forgot_password")
	   public String forgot_password() {
	      return "member/forgot_password";
	   }
	   //  й ȣ  缳     ũ  ̸  Ϸ      
	   @RequestMapping(value = "find_pwd")
	   public ResponseEntity  mailSending(@RequestParam("findPwd") String email) {
	      System.out.println(email);
	      String result = ms.sendEmail(email);
	      
	      ResponseEntity resEnt=null;
	      HttpHeaders responseHeaders = new HttpHeaders();
	      responseHeaders.add("Content-Type", "text/html; charset=utf-8");
	      resEnt = new ResponseEntity(result, responseHeaders, HttpStatus.CREATED);
	      return resEnt;
	   }
	   //   ο    й ȣ       
	   @RequestMapping("new_password")
	   public String new_password(@RequestParam("member_email") String email, Model model, HttpServletRequest request) {
	      
	      model.addAttribute("member_email", email);
	      return "member/profile/new_password";
	      
	   }
	   //   ο    й ȣ     
	   @RequestMapping(value="new_password_commit")
	   public ResponseEntity new_password_commit(@RequestParam("pwdCh") String pwdCh, MemberDTO member){
	      
	      String result = ms.new_password_commit(pwdCh, member);
	      ResponseEntity resEnt=null;
	      HttpHeaders responseHeaders = new HttpHeaders();
	      responseHeaders.add("Content-Type", "text/html; charset=utf-8");
	      resEnt = new ResponseEntity(result, responseHeaders, HttpStatus.CREATED);
	      return resEnt;
	   }
	   
	   @RequestMapping(value="my_message",method= {RequestMethod.GET, RequestMethod.POST})
	   public String message(HttpSession session ,Model model, @RequestParam(value="num", required = false, defaultValue = "1") int num) {
	      if(session.getAttribute("userId") == null) {
	         return "redirect:login";
	      }else {
	         ms.allMessage(session, model, num);
	         return "member/profile/my_message";
	      }
	   }
	   
	   @RequestMapping(value="message_context",method= RequestMethod.GET)
	   public String message_context(HttpSession session ,int message_num, Model model) {
	      if(session.getAttribute("userId") == null) {
	         return "redirect:login";
	      }else {
	         ms.message_context(message_num, model);
	         return "member/profile/message_context";
	      }
	   }
	   @RequestMapping("boardDelete")
	   public String boardDelete(int message_num) {
	      ms.boardDelete(message_num);
	      return "redirect:my_message";
	   }
	      
	   @RequestMapping("message_context_modify")
	   public String message_context_modify(HttpSession session ,int message_num, Model model) {
	      if(session.getAttribute("userId") == null) {
	         return "redirect:login";
	      }else {
	         ms.message_context(message_num, model);
	         System.out.println("message_num = " + message_num);
	         return "member/profile/message_context_modify";
	      }
	   }
	   @RequestMapping("message_modify_update")
	   public String message_modify_update(Member_messageDTO dto) {
	      ms.message_modify_update(dto);
	      return "redirect:my_message";
	   }
	      
	   @RequestMapping("boardReplyView")
	   public String boardReplyView(HttpSession session ,int message_num, Model model) {
	      if(session.getAttribute("userId") == null) {
	         return "redirect:login";
	      }else {
	         ms.boardReplyView(message_num, model);
	         return "member/profile/boardReplyView";
	      }
	   }
	   @PostMapping(value="message_reply")
	   public String message_reply(Member_messageDTO dto) {
	      System.out.println("테스트 = " + dto.getMember_email());
	      ms.message_reply(dto);
	      return "redirect:my_message";
	   }
	   
	   @RequestMapping(value="my_donate",method= {RequestMethod.GET, RequestMethod.POST})
	   public String my_donate(Model model, HttpSession session) {
	      if(session.getAttribute("userId") == null) {
	         return "redirect:login";
	      }else {
	         ms.my_donate(model,session);
	         return "member/profile/my_donate";
	      }
	   }
	   
//-----------------------------------------------------------------
	@RequestMapping("setting")
	public String setting(Model model, HttpSession session) {

		// 세션값으로설정된 id(email) 이 널이면 로그인창으로보내버림
		if (session.getAttribute("userId") == null) {
			return "redirect:login";

			// 세션값이 존재한다면 세션값을통해 dto생성하는로직
		} else {
			String id = (String) session.getAttribute("userId");
			ms.setting(model, id);
			return "member/profile/settings/setting";
		}

	}

	@RequestMapping("my_likeproject")
	public String likeProject(Model model, HttpServletRequest request) {
		HttpSession session = request.getSession();
		// 세션값으로설정된 id(email) 이 널이면 로그인창으로보내버림
		if (session.getAttribute("userId") == null) {
			return "redirect:login";

			// 세션값이 존재한다면 세션값을통해 dto생성하는로직
		} else {
			String id = (String) session.getAttribute("userId");

			ms.likeProject(model, id);

			return "member/profile/my_likeproject";
		}
	}

	@RequestMapping("my_project")
	public String myProject(Model model, HttpServletRequest request) {
		HttpSession session = request.getSession();

		// 세션값으로설정된 id(email) 이 널이면 로그인창으로보내버림
		if (session.getAttribute("userId") == null) {
			return "redirect:login";

			// 세션값이 존재한다면 세션값을통해 dto생성하는로직
		} else {
			String id = (String) session.getAttribute("userId");

			ms.myProject(model, id);

			return "member/profile/my_project";
		}
	}

	@RequestMapping("paymethod")
	public String paymethod(Model model, @RequestParam("money") int money, @RequestParam("project_id") int pid,
			@RequestParam("project_title") String ptitle, HttpServletRequest request) {

		HttpSession session = request.getSession();
		// 세션값으로설정된 id(email) 이 널이면 로그인창으로보내버림
		if (session.getAttribute("userId") == null) {
			return "redirect:login";

			// 세션값이 존재한다면 세션값을통해 dto생성하는로직
		} else {
			String id = (String) session.getAttribute("userId");

			ms.payInfo(model, money, pid,ptitle , id);

			return "member/profile/settings/paymethod";
		}
	}
	

	

	@PostMapping("saveProfile")
	public ResponseEntity saveProfile(MultipartHttpServletRequest request, HttpServletResponse response)
			throws Exception {
		String message = ms.saveProfile(request);
		ResponseEntity resEnt = null;
		HttpHeaders responseHeaders = new HttpHeaders();

		responseHeaders.add("Content-Type", "text/html; charset=utf-8");

		resEnt = new ResponseEntity(message, responseHeaders, HttpStatus.CREATED);
		return resEnt;
	}


	@RequestMapping("logout")
	public String logout(HttpSession session) {
		session.invalidate();
		return "redirect:login";
	}
	
	@RequestMapping("likeCancel")
	public String likeCancel(@RequestParam("project_id") int pid,HttpServletRequest request) {
		HttpSession session = request.getSession();
		String id = (String)session.getAttribute("userId");
		
		ms.likeCancel(pid,id);
		
		return "redirect:my_likeproject";
		
	}
	
	
	@RequestMapping("idx")
	public String iww() {
		return "index2";
	}
	
	
	@GetMapping("member_info/{member_url}")
	public ModelAndView memberInfo(@PathVariable("member_url") String url, ModelAndView mv ) {
		String path = "member/profile/member_info";
		MemberDTO dto = ms.member_info(url);
		
		mv.addObject("member_email", dto.getMember_email());
		mv.addObject("member_profile_pic", dto.getMember_profile_pic());
		mv.addObject("member_name", dto.getMember_name());
		mv.addObject("member_introduce", dto.getMember_introduce());
		
		mv.setViewName(path);
		
		
		return mv;
	}
	
	
	@RequestMapping("search")
	public String searchUser(@RequestParam("member_email") String email, Model model) {
		
		ms.searchUser(email,model);
		
		return "member/search";
	}
	
	
	
	
	
}// dd
