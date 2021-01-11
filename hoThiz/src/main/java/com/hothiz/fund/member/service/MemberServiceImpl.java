package com.hothiz.fund.member.service;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.Random;

import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.hothiz.fund.member.dao.MemberDAO;
import com.hothiz.fund.member.dto.MemberDTO;
import com.hothiz.fund.member.dto.Member_donateDTO;
import com.hothiz.fund.member.dto.Member_messageDTO;
import com.hothiz.fund.member.dto.Member_paymentDTO;
import com.hothiz.fund.project.dto.ProjectInfoDTO;

@Service
public class MemberServiceImpl implements MemberService{
   @Autowired
   MemberDAO dao;
   @Autowired
   private JavaMailSender mailSender;
   @Autowired
   MemberFileService mfs;

   @Override
   public int user_check(HttpServletRequest request) {
      System.out.println("id = " + request.getParameter("member_email"));
      MemberDTO dto = dao.user_check(request.getParameter("member_email"));
      System.out.println("dto = "+dto);
      if(dto != null) {
         if(request.getParameter("member_pwd").equals(dto.getMember_pwd())) {
        	if(dto.getMember_admin() == 1) {
        		return 2;
        	}else {
            return 0;
        	}
         }
      }
      return 1;
   }

   @Override
   public int register(MemberDTO member) {
      try {
         String url = null;
         boolean bool = true;
         while(bool) {
            url = urlmake();
            MemberDTO check = URLcheck(url);
            if(check == null) {
               bool = false;
            }
         }
         member.setMember_URL(url);
         member.setMember_admin(0);
         member.setMember_email_verify(0);
         System.out.println(member.getMember_email());
         System.out.println(member.getMember_pwd());
         System.out.println(member.getMember_name());
         System.out.println(member.getMember_profile_pic());
         System.out.println(member.getMember_phnum());
         System.out.println(member.getMember_addr());
         System.out.println(member.getMember_URL());
         System.out.println(member.getMember_admin());
         System.out.println(member.getMember_email_verify());
         dao.register(member);
         return 1;
      }catch (Exception e) {
         e.printStackTrace();
         return 0;
      }
   }
   
   public String urlmake() {
      Random r = new Random();

      StringBuilder sb = new StringBuilder(16);
      for(int i = 0; i<16; i++) {
         char tmp = (char) ('a' + r.nextInt('z' - 'a'));
         sb.append(tmp);
      }
      return sb.toString();
   }
   public MemberDTO URLcheck(String url) {
      return dao.urlcheck(url);
   }

   @Override
   public String sendEmail(String email) {
      MemberDTO dto = dao.user_check(email);
      int result = 0;
      String resultMessage = null;
      if(dto != null) {
      String mailMessage = mailMessage(email);
      MimeMessage message = mailSender.createMimeMessage();
         try {            
            MimeMessageHelper messageHelper = new MimeMessageHelper(message,true, "UTF-8");
            messageHelper.setSubject("핫디즈 비밀번호 변경");
            messageHelper.setTo(email);         
            messageHelper.setText(mailMessage,true);
            mailSender.send(message);
            result = 1;
            System.out.println(result);
         } catch (Exception e) {
            System.out.println(e);
         }
      }
      else {
         result = -1;
      }
      resultMessage = createResultMessage(result);
      return resultMessage;
   }
   private String mailMessage(String email) {
      StringBuffer sb = new StringBuffer();
      sb.append("<html><body>");
      sb.append("<meta http-equiv='Content-Type' content='text/html; charset=utf-8'>");
      sb.append("<span>핫디즈 비밀번호 초기화 메일입니다.</span><hr>");
      sb.append("<h3><a href='http://localhost:8086/fund/new_password?member_email="+email+"'>비밀번호 바꾸러 가기</a></h3>");
      sb.append("</body></html>");
      return sb.toString();
   }
   private String createResultMessage(int result) {
      String resultMessage="<script>";
      if(result == 1) {
         resultMessage+="alert('이메일을 전송했습니다.');";
         resultMessage+="location.href='login'";
      }else if(result == -1) {
         resultMessage+="alert('이메일을 다시 확인해 주세요.');";
         resultMessage+="location.href='forgot_password'";
      }else {
         resultMessage+="alert('문제가 발생하였습니다.');";
         resultMessage+="location.href='login'";
      }
      resultMessage+="</script>";
      return resultMessage;
   }

   @Override
   public String new_password_commit(String pwdCh, MemberDTO member) {
      int result = 0;
      String resultMessage = null;
      String email = member.getMember_email();
      if(pwdCh.equals(member.getMember_pwd())) {
         if(member.getMember_pwd().length() < 10) {
            result = -1;
         }else if(member.getMember_pwd().length() > 30) {
            result = 3;
         }else {
            result = dao.new_password_commit(member);
         }
      }
      resultMessage = changePwdMessage(result, email);
      return resultMessage;
   }
   private String changePwdMessage(int result, String email) {
      String resultMessage="<script>";
      if(result == 1) {
         resultMessage+="alert('변경완료');";
         resultMessage+="location.href='login'";
      }else if(result == -1) {
         resultMessage+="alert('비밀번호가 너무 짧습니다.');";
         resultMessage+="location.href='http://localhost:8086/fund/new_password?member_email="+email+"'";
      }else if(result == 3){
         resultMessage+="alert('비밀번호가 너무 깁니다.');";
         resultMessage+="location.href='http://localhost:8086/fund/new_password?member_email="+email+"'";
      }else {
         resultMessage+="alert('비밀번호를 확인해 주세요');";
         resultMessage+="location.href='http://localhost:8086/fund/new_password?member_email="+email+"'";
      }
      resultMessage+="</script>";
      return resultMessage;
   }

   @Override
   public void allMessage(HttpSession session, Model model, int num) {
      int pageLetter = 3;//한페이지에 3개의 글씩
      Member_messageDTO dto = new Member_messageDTO();
      dto.setMember_email(session.getAttribute("userId").toString());
      int allCount = dao.selectBoardCount(dto); //글 총갯수 얻기
      System.out.println("총 글 갯수 = " + allCount);
      int repeat = allCount / pageLetter;      
      if(allCount % pageLetter != 0) { 
         repeat += 1; 
      }
      
      model.addAttribute("repeat",repeat);
      int end = num*pageLetter;
      int start = end + 1 - pageLetter;
      
      model.addAttribute("messageList",dao.message_all(dto,start, end));
   }

   @Override
   public ArrayList<Member_messageDTO> message_send(HttpSession session, Model model, int num) {
      System.out.println("num Impl = " + num);
      int pageLetter = 3;
      Member_messageDTO dto = new Member_messageDTO();
      dto.setMember_email(session.getAttribute("userId").toString());
      int allCount = dao.selectSendCount(dto);
      System.out.println("총 글 갯수 = " + allCount);
      int send_repeat = allCount / pageLetter;      
      if(allCount % pageLetter != 0) { 
         send_repeat += 1; 
      }
      System.out.println("send_repeat = " + send_repeat);
      session.setAttribute("send_repeat", send_repeat);
      int end = num*pageLetter;
      int start = end + 1 - pageLetter;
      ArrayList<Member_messageDTO> arr = new ArrayList<Member_messageDTO>();
      arr = dao.message_send(dto,start, end);
      return arr;
   }

   @Override
   public ArrayList<Member_messageDTO> message_receive(HttpSession session, Model model, int num) {
      System.out.println("num Impl = " + num);
      int pageLetter = 3;
      Member_messageDTO dto = new Member_messageDTO();
      dto.setMember_email(session.getAttribute("userId").toString());
      int allCount = dao.selectReceiveCount(dto);
      System.out.println("총 글 갯수 = " + allCount);
      int receive_repeat = allCount / pageLetter;      
      if(allCount % pageLetter != 0) { 
         receive_repeat += 1; 
      }
      System.out.println("receive_repeat = " + receive_repeat);
      session.setAttribute("receive_repeat", receive_repeat);
      int end = num*pageLetter;
      int start = end + 1 - pageLetter;
      ArrayList<Member_messageDTO> arr = new ArrayList<Member_messageDTO>();
      arr = dao.message_receive(dto,start, end);
      return arr;
   }

   @Override
   public ArrayList<Member_messageDTO> message_all(HttpSession session, Model model, int num) {
      int pageLetter = 3;
      Member_messageDTO dto = new Member_messageDTO();
      dto.setMember_email(session.getAttribute("userId").toString());
      int allCount = dao.selectBoardCount(dto); //총 게시글 수
      System.out.println("총 글 갯수 = " + allCount);
      int all_repeat = allCount / pageLetter;      
      if(allCount % pageLetter != 0) { 
         all_repeat += 1; 
      }
      System.out.println("all_repeat = " + all_repeat);
      session.setAttribute("all_repeat", all_repeat);
      int end = num*pageLetter;
      int start = end + 1 - pageLetter;
      ArrayList<Member_messageDTO> arr = new ArrayList<Member_messageDTO>();
      arr = dao.message_all(dto,start, end);
      return arr;
   }

   @Override
   public void message_context(int message_num, Model model) {      
      model.addAttribute("message_send_member", dao.message_context(message_num).get(0).getMessage_send_member());
      model.addAttribute("message_context", dao.message_context(message_num));
   }

   @Override
   public void boardDelete(int message_num) {
      dao.boardDelete(message_num);
   }

   @Override
   public void message_modify_update(Member_messageDTO dto) {
      dao.message_modify_update(dto);
   }

   @Override
   public void boardReplyView(int message_num, Model model) {
      model.addAttribute("boardReplyView",dao.boardReplyView(message_num));
   }
   
   @Override
   public void message_reply(Member_messageDTO dto) {
      String message_type = "re:"+dto.getMessage_type();
      dto.setMessage_type(message_type);
      System.out.println("문의유형 = "+dto.getMessage_type());
      
      dao.message_reply(dto);
   }

   @Override
   public void my_donate(Model model, HttpSession session) {
      Member_donateDTO dto = new Member_donateDTO();
      dto.setMember_email(session.getAttribute("userId").toString());
      model.addAttribute("total_donate",dao.my_donate_cnt(dto));
      model.addAttribute("my_donate",dao.donate_project(dto));
      model.addAttribute("donate_price",dao.donate_price(dto));
   }

   @Override
   public String member_email_check(MemberDTO dto) {
      String result = "1";
      if(dto.getMember_email().contains("@")) {
         if(dao.member_email_check(dto) == null) {
            result = "0";
         }
      }else {
         result = "3";
      }
      return result;
   }

   @Override
   public String member_phnum_chk(MemberDTO dto) {
      String result = "0";
      if(dao.member_phnum_chk(dto) == null) {
         result = "1";
      }
      return result;
   }
   
   @Override
   public void setting(Model model, String id) {
      model.addAttribute("list", dao.setting(id));
      
   }

   @Override
   public int updateSetting(String val,String col , String id) {
      System.out.println("서비스");
      System.out.println();
      System.out.println(id);
      //MemberDTO dto = new MemberDTO();
      //dto.setMember_URL(url);
      //dto.setMember_email(id);
      System.out.println(val);
      System.out.println(col);
      int check = dao.updateSetting(val,col,id);
      return check;
   }

   @Override
   public int pwdCheck(String pwd, String id) {
      System.out.println("서비스실행");
      MemberDTO dto = new MemberDTO();
   
      if(dao.pwdCheck(pwd, id) == null) {
         System.out.println("널이래요");
         return 0;
      }else {
         System.out.println("정상가동");
         return 1;
      }
      
   
   }

   @Override
   public void pwdChange(String pwd, String id) {
      dao.pwdChange(pwd, id);
      
   }

   @Override
   public void likeProject(Model model, String id) {
	   
	   List<ProjectInfoDTO> prjList = dao.likeProject(id);
	      for(ProjectInfoDTO p : prjList) {
	         p.setCategory_trans(cateSet(p.getProject_sub_category()));
	      }
	   
	   
	   
	   
      model.addAttribute("likeList", prjList );
      
   }

   @Override
   public void myProject(Model model, String id) {
   
      model.addAttribute("myProjectList", dao.myProject(id));
   }

   @Override
   public void setAlarmAgree(int agree, String id) {
      dao.setAlarmAgree(agree, id);
      
   }

   @Override
   public void paymethod(Member_paymentDTO dto) {
      dao.paymethod(dto);
      dao.mydonatedInsert(dto);
      dao.projectDonatedUpdate(dto);
      dao.percentRefresh(dto);
      
   }

   @Override
   public void payInfo(Model model, int money, int pid,String ptitle,  String id) {
      Member_paymentDTO dto = new Member_paymentDTO();
      dto.setPaid_amount(money);
      dto.setProject_id(pid);
      dto.setProject_title(ptitle);
      dto.setMember_email(id);
      
      model.addAttribute("list", dto);
      
   }

   @Override
   public String saveProfile(MultipartHttpServletRequest request) throws Exception {
       Map<String, Object> writeMap = mfs.getData(request);
       System.out.println(writeMap.get("user_email"));
       System.out.println(writeMap.get("image_file_name"));
       String user_id = (String)writeMap.get("user_email");
      // int idx = mail.indexOf("@");
     //  String user_id = mail.substring(0,idx);
       writeMap.put("user_id", user_id);
       System.out.println(writeMap.get("originalFileName"));
       System.out.println((String)writeMap.get("image_file_name"));
       String ori = (String)writeMap.get("originalFileName");
       //최초실행
       if(writeMap.get("originalFileName") == null ||ori.equals("") ) {
          //------
            int result = -1;
            System.out.println("널이래");
            try {
               String img = (String)writeMap.get("image_file_name");
               String emails = (String)writeMap.get("user_email");
               result = dao.saveProfile(img,emails);
               
            }catch (Exception e) {
               e.printStackTrace();
            }
            return mfs.getMessage(result,user_id,writeMap.get("image_file_name").toString());
       }else {
          
          String originalFileName = (String)writeMap.get("originalFileName");
         String newFileName = (String)writeMap.get("image_file_name");
         System.out.println("오리지널 파일 : "+originalFileName);
       
         int result = -1;
         try {
            if(newFileName.length()==0) {
               writeMap.replace("image_file_name", originalFileName);
            }    
            String img = (String)writeMap.get("image_file_name");
            String emails = (String)writeMap.get("user_email");
            result = dao.saveProfile(img,emails);
         }catch (Exception e) {
            e.printStackTrace();
         }
         return mfs.getMessage(result,user_id,originalFileName,newFileName);
      
       }
   }

   @Override
   public void likeCancel(int pid, String id) {
      
      dao.likeCancel(pid,id);
      dao.likeMinus(pid);
      
   }

@Override
public MemberDTO member_info( String url) {

	return dao.member_info(url);
	
}

@Override
public void searchUser(String email, Model model) {
	model.addAttribute("list", dao.searchUser(email));
	
}

@Override
public void project_delete(int project_id) {
   dao.project_delete(project_id);
}


public String cateSet(String category) {

    if(category == null) {
          return "";
       }else if(category.equals("game")) {
          return "게임";
       }else if(category.equals("mobile-game")) {
          return "게임/모바일게임";
       }else if(category.equals("video-game")) {
          return "게임/비디오게임";
       }else if(category.equals("board-game")) {
          return "게임/보드게임";
       }else if(category.equals("show")) {
          return "공연";
       }else if(category.equals("dance")) {
          return "공연/무용";
       }else if(category.equals("musical")) {
          return "공연/뮤지컬";
       }else if(category.equals("theater")) {
          return "공연/연극";
       }else if(category.equals("design")) {
          return "디자인";
       }else if(category.equals("architecture")) {
          return "디자인/건축, 공간";
       }else if(category.equals("graphic-design")) {
          return "디자인/그래픽 디자인";
       }else if(category.equals("product-design")) {
          return "디자인/제품 디자인";
       }else if(category.equals("comics")) {
          return "만화";
       }else if(category.equals("web-comics")) {
          return "만화/웹툰";
       }else if(category.equals("comic-books")) {
          return "만화/만화책";
       }else if(category.equals("art")) {
          return "예술";
       }else if(category.equals("exhibitions")) {
          return "예술/전시";
       }else if(category.equals("sculpture-and-action-figures")) {
          return "예술/조소, 피규어";
       }else if(category.equals("illustration")) {
          return "예술/일러스트레이션";
       }else if(category.equals("crafts")) {
          return "공예";
       }else if(category.equals("candles-and-diffusers-and-soaps")) {
          return "공예/캔들, 조향, 비누";
       }else if(category.equals("leather-and-metal-and-woodworking")) {
          return "공예/가죽, 금속, 목 공예";
       }else if(category.equals("pottery")) {
          return "공예/도예";
       }else if(category.equals("photography")) {
          return "사진";
       }else if(category.equals("people-photography")) {
          return "사진/인물";
       }else if(category.equals("space-and-urban-photography")) {
          return "사진/배경";
       }else if(category.equals("animals-photography")) {
          return "사진/동물";
       }else if(category.equals("video")) {
          return "영상";
       }else if(category.equals("film")) {
          return "영상/영화";
       }else if(category.equals("documentary")) {
          return "영상/다큐";
       }else if(category.equals("animation")) {
          return "영상/애니메이션";
       }else if(category.equals("music-videos")) {
          return "영상/뮤직비디오";
       }else if(category.equals("food")) {
          return "푸드";
       }else if(category.equals("appetizer")) {
          return "푸드/에피타이저";
       }else if(category.equals("main-dish")) {
          return "푸드/메인";
       }else if(category.equals("dessert")) {
          return "푸드/디저트";
       }else if(category.equals("music")) {
          return "음악";
       }else if(category.equals("classical-music")) {
          return "음악/클래식";
       }else if(category.equals("popular-music")) {
          return "음악/대중음악";
       }else if(category.equals("Independent-music")) {
          return "음악/인디음악";
       }else if(category.equals("publication")) {
          return "출판";
       }else if(category.equals("zines")) {
          return "출판/잡지";
       }else if(category.equals("literature-and-essay")) {
          return "출판/문학, 에세이";
       }else if(category.equals("picture-books")) {
          return "출판/그림책";
       }else if(category.equals("technology")) {
          return "테크";
       }else if(category.equals("software")) {
          return "테크/소프트웨어";
       }else if(category.equals("hardware")) {
          return "테크/하드웨어";
       }else if(category.equals("apps")) {
          return "테크/앱";
       }else if(category.equals("web")) {
          return "테크/웹";
       }else if(category.equals("fashion")) {
          return "패션";
       }else if(category.equals("apparels")) {
          return "패션/의류";
       }else if(category.equals("accessories")) {
          return "패션/악세서리";
       }else if(category.equals("beauty")) {
          return "패션/뷰티";
       }else if(category.equals("journalism")) {
          return "저널리즘";
       }else if(category.equals("audio-journals")) {
          return "저널리즘/오디오";
       }else if(category.equals("video-journals")) {
          return "저널리즘/비디오";
       }else if(category.equals("web-journals")) {
          return "저널리즘/웹(개인방송)";
       }
 
    return"";
 
	
	
}


   
}//DD