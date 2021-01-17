package com.hothiz.fund.project.controller;

import java.io.File;
import java.io.FileInputStream;
import java.io.OutputStream;
import java.io.UnsupportedEncodingException;
import java.sql.Date;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Enumeration;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.tools.FileObject;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.google.gson.JsonObject;
import com.hothiz.fund.member.dto.MemberDTO;
import com.hothiz.fund.project.dto.AjaxTypeDTO;
import com.hothiz.fund.project.dto.ProjectGiftDTO;
import com.hothiz.fund.project.dto.ProjectInfoDTO;
import com.hothiz.fund.project.service.ProjectUploadService;

@Controller
public class ProjectUploadController {
	//대표이미지
	   private final String IMAGE_REPO = "C:\\javawork\\spring_workspace\\.metadata\\.plugins\\org.eclipse.wst.server.core\\tmp0\\wtpwebapps\\hoThiz\\resources\\img\\project\\title";
		
	   //스토리에 들어가는 이미지
	   private final String IMAGE_REPO2 = "C:\\javawork\\spring_workspace\\.metadata\\.plugins\\org.eclipse.wst.server.core\\tmp0\\wtpwebapps\\hoThiz\\resources\\img\\project\\story";
		
   @Autowired
   ProjectUploadService service;
   /*
   @RequestMapping("edit-project/smarteditor2")
   public String smarteditor2() {
      return "smarteditor2/SmartEditor2Skin.html";
   }*/
   
   
   
   
   @GetMapping("agreements")
   public String agreements(HttpSession session) {
      if(session.getAttribute("userId") == null) {
            return "redirect:login";
         }
      return "project/agreements";
   }
   
   
   @GetMapping("edit-project/startEdit")
   public String startEdit(Model model, HttpSession session) {
      if(session.getAttribute("userId") == null) {
            return "redirect:login";
         }
      ProjectInfoDTO dto = new ProjectInfoDTO();
      MemberDTO mem = new MemberDTO();
      
      String email = (String)session.getAttribute("userId");
      
      mem.setMember_email(email);
      dto.setMember_email(email);
      dto.setMember_name(service.get_member_name(mem));
      
      
      service.editProject(dto);
      int project_id = service.editId();
      model.addAttribute("project_id",project_id);
      
      return "project/edit-project/startEdit";
   }
   @GetMapping("edit-project/outline")
   public String outline(HttpSession session) {
      if(session.getAttribute("userId") == null) {
            return "redirect:login";
         }
      return "project/edit-project/outline";
   }
   @GetMapping("edit-project/gift")
   public String gift(HttpSession session) {
      if(session.getAttribute("userId") == null) {
            return "redirect:login";
         }
      return "project/edit-project/gift";
   }
   @GetMapping("edit-project/story")
   public String story(HttpSession session) {
      if(session.getAttribute("userId") == null) {
            return "redirect:login";
         }
      return "project/edit-project/story";
   }
   
   @RequestMapping(value="edit-project/getTitle",
   produces="application/Integer;charset=utf-8")
   @ResponseBody
   public String getTitle(ProjectInfoDTO dto) {
      return service.getTitle(dto);
   }
   @RequestMapping(value="edit-project/insert_title",
            produces="application/text;charset=utf-8")
   @ResponseBody
   public String insert_title(ProjectInfoDTO dto) {
      String title = dto.getProject_title();
      service.insert_title(dto);
      return title;
   }
   @RequestMapping(value="edit-project/insert_summary",
         produces="application/text;charset=utf-8")
   @ResponseBody
   public void insert_summary(ProjectInfoDTO dto) {
      service.insert_summary(dto);
   }
   @RequestMapping(value="edit-project/insert_tag",
         produces="application/text;charset=utf-8")
   @ResponseBody
   public String insert_tag(ProjectInfoDTO dto) {
      service.insert_tag(dto);
      return service.get_tag(dto);
   }

   @RequestMapping(value="edit-project/get_tag",
         produces="application/text;charset=utf-8")
   @ResponseBody
   public String get_tag(ProjectInfoDTO dto) {
      return service.get_tag(dto);
   }

   
   @RequestMapping(value="edit-project/get_video",
         produces="application/text;charset=utf-8")
   @ResponseBody
   public String get_video(ProjectInfoDTO dto) {
      return service.get_video(dto);
   }
   
   @RequestMapping(value="edit-project/insert_category",
   produces="application/text;charset=utf-8")
   @ResponseBody
   public String insert_category(ProjectInfoDTO dto) {
      service.insert_category(dto);
      return service.get_category(dto);
   }
   
   @RequestMapping(value="edit-project/insert_price",
   produces="application/Integer;charset=utf-8")
   @ResponseBody
   public String insert_price(ProjectInfoDTO dto) {
      service.insert_price(dto);
      return get_price(dto);
   }
   
   @RequestMapping(value="edit-project/insert_release_date",
   produces="application/json;charset=utf-8")
   @ResponseBody
   public String insert_release_date(AjaxTypeDTO ajaxDto) throws Exception {
      ProjectInfoDTO dto = new ProjectInfoDTO();
      SimpleDateFormat date = new SimpleDateFormat("MM/dd/yyyy");
      
      java.util.Date utilDate = date.parse(ajaxDto.getDate());
      Date release = new Date(utilDate.getTime());
      
      dto.setProject_release_date(release);
      dto.setProject_id(ajaxDto.getId());
      service.insert_release_date(dto);
      
      String returnDate = get_release_date(ajaxDto);
      return "\""+returnDate+"\"";
   }
   
   @RequestMapping(value="edit-project/insert_deadline",
   produces="application/json;charset=utf-8")
   @ResponseBody
   public String insert_deadline_date(AjaxTypeDTO ajaxDto) throws Exception {
      ProjectInfoDTO dto = new ProjectInfoDTO();
      SimpleDateFormat date = new SimpleDateFormat("MM/dd/yyyy");
      
      java.util.Date utilDate = date.parse(ajaxDto.getDate());
      Date deadline = new Date(utilDate.getTime());
      
      dto.setProject_deadline(deadline);
      dto.setProject_id(ajaxDto.getId());
      service.insert_deadline(dto);
      
      String returnDate = get_deadline(ajaxDto);
      return "\""+returnDate+"\"";
   }
   
   @RequestMapping(value="edit-project/insert_image",
   produces="application/json;charset=utf-8")
   @ResponseBody
   public void insert_image(ProjectInfoDTO dto) throws Exception {
      service.insert_image(dto);
   }
   
   public static String fdId = null;
   public static String userEmail = null;
   @RequestMapping(value="edit-project/java_save_image",
   produces="application/json;charset=utf-8")
   @ResponseBody
   public ModelAndView java_save_image(MultipartHttpServletRequest mul,
         HttpServletResponse response, HttpSession session) throws Exception {
      try {
         mul.setCharacterEncoding("utf-8");
      } catch (UnsupportedEncodingException e) {
         e.printStackTrace();
      }
      Map map = new HashMap();
      Enumeration enu = mul.getParameterNames();
      while(enu.hasMoreElements()) {
         String name = (String)enu.nextElement();
         String value = mul.getParameter(name);
         System.out.println(name + ":" + value);
         map.put(name, value);
      }
      List fileList = fileProcess(mul,session);
      map.put("fileList", fileList);
      ModelAndView mv = new ModelAndView();
      mv.addObject("map",map);
      mv.setViewName("result");
      return mv;
   }
   
   private List<String> 
   
   fileProcess(MultipartHttpServletRequest mul, HttpSession session){
      String email = (String)session.getAttribute("userId");
      String path = IMAGE_REPO+"\\"+email; //폴더 경로
      File Folder = new File(path);

      // 해당 디렉토리가 없을경우 디렉토리를 생성합니다.
      if (!Folder.exists()) {
         try{
             Folder.mkdir(); //폴더 생성합니다.
              } 
              catch(Exception e){
             e.getStackTrace();
         }        
      }
      
      
      
      //System.out.println(fdId);
      
      List<String> fileList = new ArrayList<String>();
      Iterator<String> fileNames = mul.getFileNames();
      while(fileNames.hasNext()) {
         String fileName = fileNames.next();
         MultipartFile mFile = mul.getFile(fileName);
         String originFile = mFile.getOriginalFilename();
         fileList.add(originFile);        // imagerepo+ /계정이메일/프로젝트id/이미지
         File file = new File(IMAGE_REPO+"\\"+email+"\\"+fdId+"\\"+fileName);
         file.getParentFile().mkdir();
         if(mFile.getSize() != 0) {
            try {
               mFile.transferTo(new File(IMAGE_REPO+"\\"+email+"\\"+fdId+"\\"+originFile));
            } catch (Exception e) {
               e.printStackTrace();
            }
         }
      }
      return fileList;
   }
   @RequestMapping(value="edit-project/insert_gift_list",
   produces="application/json;charset=utf-8")
   @ResponseBody
   public String insert_gift_list(ProjectGiftDTO dto) throws Exception {
      service.insert_gift_list(dto);
      ArrayList<ProjectGiftDTO> list = service.get_gift(dto);
      ObjectMapper mapper = new ObjectMapper();
      String giftList = mapper.writeValueAsString(list);
      return giftList;
   }
   
   @RequestMapping(value="edit-project/gift_list",
   produces="application/json;charset=utf-8")
   @ResponseBody
   public String gift_list(ProjectGiftDTO dto) throws Exception {
      ArrayList<ProjectGiftDTO> list = service.get_gift(dto);
      ObjectMapper mapper = new ObjectMapper();
      String giftList = mapper.writeValueAsString(list);
      return giftList;
   }
   
   @RequestMapping(value="edit-project/get_deadline",
   produces="application/text;charset=utf-8")
   @ResponseBody
   public String get_deadline(AjaxTypeDTO ajaxDto) {
      ProjectInfoDTO dto = new ProjectInfoDTO();
      dto.setProject_id(ajaxDto.getId());
      try {
         Date deadline = service.get_deadline(dto).getProject_deadline();
         SimpleDateFormat dateFoemat = new SimpleDateFormat("yyyy년 MM월 dd일");
         String date = dateFoemat.format(deadline);
         return date;
      }catch (Exception e) {
         return null;
      }
   }
   
   @RequestMapping(value="edit-project/get_release_date",
   produces="application/text;charset=utf-8")
   @ResponseBody
   public String get_release_date(AjaxTypeDTO ajaxDto) {
      ProjectInfoDTO dto = new ProjectInfoDTO();
      dto.setProject_id(ajaxDto.getId());
      try {
      Date release_date = service.get_release_date(dto).getProject_release_date();
      SimpleDateFormat dateFoemat = new SimpleDateFormat("yyyy년 MM월 dd일");
      String date = dateFoemat.format(release_date);
      return date;
      }catch (Exception e) {
         return null;
      }
   }
   @RequestMapping(value="edit-project/get_price",
   produces="application/text;charset=utf-8")
   @ResponseBody
   public String get_price(ProjectInfoDTO dto) {
      int price = 0;
      try {
         price = service.get_price(dto).getProject_target_price();
      }catch (Exception e) {
         return null;
      }
      String target = price+" 원";
      return target;
   }
   @RequestMapping(value="edit-project/delete_gift",
   produces="application/text;charset=utf-8")
   @ResponseBody
   public void gift_delete(ProjectGiftDTO dto) {
      //System.out.println(dto.getGift_id());
      service.gift_delete(dto);
   }
   @RequestMapping(value="edit-project/insert_video",
   produces="application/text;charset=utf-8")
   @ResponseBody
   public String insert_video(ProjectInfoDTO dto) {
      service.insert_video(dto);
      //System.out.println(service.get_video(dto));
      return service.get_video(dto);
   }   
   
   @RequestMapping(value="edit-project/insert_story",
   produces="application/text;charset=utf-8")
   @ResponseBody
   public void insert_story(ProjectInfoDTO dto) {
      service.insert_story(dto);
   }
   
   @RequestMapping(value="edit-project/insert_prelaunching",
   produces="application/text;charset=utf-8")
   @ResponseBody
   public void insert_prelaunching(ProjectInfoDTO dto) {
      service.insert_prelaunching(dto);
   }   
   
   
   
   
   //메타데이터 경로확인
   @RequestMapping("test")
   public void test(HttpServletRequest request) {
      System.out.println(request.getSession().getServletContext().getRealPath("/"));
   }
   
   
   
   
   @PostMapping("edit-project/write")
   public String write(@RequestParam String title, @RequestParam String content, @RequestParam String project_id, HttpSession session) {
      //System.out.println(title);
      System.out.println("넘어오는 값"+content);
      ProjectInfoDTO dto = new ProjectInfoDTO();
      //String id = project_id;
      int id = Integer.parseInt(project_id);
      dto.setProject_id(id);
      dto.setProject_story(content);
      service.insert_story(dto);
      //처리되는 코드는 실제 서버에 올라온 파일을 저장하는 역할을 만들고 데이터 처리하면 된다.
      //System.out.println(content.indexOf("imageFileName="));
      //System.out.println(content.lastIndexOf("."));
      //System.out.println(content.substring(content.indexOf("imageFileName=")+14,content.lastIndexOf(">")-1));
      String imgName = "";
      String newContent = "";
      int i=0;
      for(i=content.indexOf("imageFileName=")+14; i < content.length();i++) {
         if(content.charAt(i) == '"') break;
         imgName += content.charAt(i);
      }
      //newContent = content.substring(i+2,content.lastIndexOf("</p>"));
      //System.out.println("newContent : "+newContent);
      //System.out.println("imgName : "+imgName);
      //해당 이미지 이름은 이전에 저장한 위치에 있으므로 해당 위치의 값을 폴더에 실제로 저장하고
      //내용들은 디비에 따로 저장한다.
      return "redirect:story?id="+project_id;
   }
   private String uploadFile(MultipartFile mFile, String id) throws Exception{
      ProjectInfoDTO dto = new ProjectInfoDTO();
      dto.setProject_id(Integer.parseInt(id));
      String email = service.get_email(dto);
      
      String path = IMAGE_REPO2+"\\"+email; //폴더 경로
      File Folder = new File(path);

      // 해당 디렉토리가 없을경우 디렉토리를 생성합니다.
      if (!Folder.exists()) {
         try{
             Folder.mkdir(); //폴더 생성합니다.
              } 
              catch(Exception e){
             e.getStackTrace();
         }        
      }
      String imageFileName= null;
         imageFileName=mFile.getOriginalFilename();//실제 파일명을 가져온다
         File file = new File(IMAGE_REPO2 +"\\"+email+"\\"+fdId+"\\"+ imageFileName);
         file.getParentFile().mkdirs(); //해당 경로 디렉터리 생성(존재하면 생성하지 않음)
         if(mFile.getSize()!=0){ //File Null Check
            //임시로 저장된 multipartFile을 실제 파일로 전송
            //mFile.transferTo(new File(IMAGE_REPO2 + "\\temp\\" + imageFileName));
            mFile.transferTo(new File(IMAGE_REPO2+"\\"+email+"\\"+fdId+"\\"+imageFileName));
         }
      return imageFileName;
   }
   @RequestMapping("edit-project/edit-project/download")
   public void download(@RequestParam("imageFileName") String imageFileName,
                          HttpServletResponse response, @RequestParam("id") String id)throws Exception {
      //System.out.println("다운로드 실행 됩니까???");
      ProjectInfoDTO dto = new ProjectInfoDTO();
      dto.setProject_id(Integer.parseInt(id));;
      String email = service.get_email(dto);
      String path = IMAGE_REPO2+"\\"+email; //폴더 경로
      File Folder = new File(path);
      System.out.println("ㅇ긴?"+id);
      // 해당 디렉토리가 없을경우 디렉토리를 생성합니다.
      if (!Folder.exists()) {
         try{
             Folder.mkdir(); //폴더 생성합니다.
              } 
              catch(Exception e){
             e.getStackTrace();
         }        
      }
      OutputStream out = response.getOutputStream();
      String downFile = IMAGE_REPO2+"\\"+email+"\\"+dto.getProject_id()+"\\"+imageFileName;
      File file = new File(downFile);
      //Content-disposition :파일 다운로드를 처리하는 HTTP헤더 중 하나다
      //Content-disposition : attachment : attachment는 파일을 다운로드하여 브라우저로 표현 하는 의미다
      //fileName는 파일을 다운로드할때의 이름을 지정해 준다.
      response.addHeader("Content-disposition", "attachment; fileName=" + imageFileName);
      FileInputStream in = new FileInputStream(file);
      byte[] buffer = new byte[1024 * 8];
      while (true) {//브라우저로 전송
         int count = in.read(buffer);  
         if (count == -1) 
            break;
         out.write(buffer, 0, count);
      }
      in.close(); out.close();
   }
   @PostMapping(value="edit-project/image", produces = "application/json;charset=utf8")
   @ResponseBody
   public String uploadSummernoteImageFile(@RequestParam("file") MultipartFile multipartFile, HttpSession session) throws Exception {
      JsonObject jsonObject = new JsonObject();
      String email = (String)session.getAttribute("userId");
      String pdId = fdId;
      String savedFileName = uploadFile(multipartFile, pdId);
      try {
         jsonObject.addProperty("url", "/fund/edit-project/edit-project/download?id="+pdId+"&imageFileName="+savedFileName);
         jsonObject.addProperty("sponseCode", "success");
      } catch (Exception e) {
         e.printStackTrace();
      }
      return jsonObject.toString();
   }

   @RequestMapping(value="edit-project/project_check",
   produces="application/text;charset=utf-8")
   @ResponseBody
   public String project_check(ProjectInfoDTO dto) {
      int check = service.get_project_check(dto);
      if(check==0) {
         dto.setProject_check(1);
         service.set_check_num(dto);
         return "1";
      }else {
         dto.setProject_check(0);
         service.set_check_num(dto);
         return "0";
      }
      
   }   
   
   @RequestMapping(value="edit-project/header_project_check",
   produces="application/text;charset=utf-8")
   @ResponseBody
   public String header_project_check(ProjectInfoDTO dto) {
      int check = service.get_project_check(dto);
      if(check==0) {
         return "0";
      }else {
         return "1";
      }
      
   }
   
   @RequestMapping(value="edit-project/get_story",
   produces="application/text;charset=utf-8")
   @ResponseBody
   public String get_story(ProjectInfoDTO dto) {
      //System.out.println(service.get_storyget_story(dto));
      return service.get_story(dto);
      
   }   
   
   @RequestMapping(value="edit-project/get_summary",
   produces="application/text;charset=utf-8")
   @ResponseBody
   public String get_summary(ProjectInfoDTO dto) {
      return service.get_summary(dto);
   }   
   

   
   @RequestMapping(value="edit-project/get_category",
   produces="application/text;charset=utf-8")
   @ResponseBody
   public String get_category(ProjectInfoDTO dto) {
      return service.get_category(dto);
   }   
   
   

   @RequestMapping(value="edit-project/getImage",
   produces="application/text;charset=utf-8")
   @ResponseBody
   public String getImage(ProjectInfoDTO dto) {
      ProjectInfoDTO img = service.getImage(dto);
      String path = "/fund/resources/img/project/title/"+img.getMember_email()+"/"+img.getProject_id()+"/"+img.getProject_main_image();
      return path;
      
   }   
   
   
   @RequestMapping("edit-project/download")
   public void getdownload(@RequestParam("imageFileName") String imageFileName,
                          HttpServletResponse response, HttpSession session)throws Exception {
      //System.out.println("다운로드 실행 됩니까???");
      String email = (String)session.getAttribute("userId");
      String path = IMAGE_REPO2+"\\"+email; //폴더 경로
      File Folder = new File(path);

      // 해당 디렉토리가 없을경우 디렉토리를 생성합니다.
      if (!Folder.exists()) {
         try{
             Folder.mkdir(); //폴더 생성합니다.
              } 
              catch(Exception e){
             e.getStackTrace();
         }        
      }
      OutputStream out = response.getOutputStream();
      String downFile = IMAGE_REPO2+"\\"+email+"\\"+fdId+"\\"+imageFileName;
      File file = new File(downFile);
      //Content-disposition :파일 다운로드를 처리하는 HTTP헤더 중 하나다
      //Content-disposition : attachment : attachment는 파일을 다운로드하여 브라우저로 표현 하는 의미다
      //fileName는 파일을 다운로드할때의 이름을 지정해 준다.
      response.addHeader("Content-disposition", "attachment; fileName=" + imageFileName);
      FileInputStream in = new FileInputStream(file);
      byte[] buffer = new byte[1024 * 8];
      while (true) {//브라우저로 전송
         int count = in.read(buffer);  
         if (count == -1) 
            break;
         out.write(buffer, 0, count);
      }
      in.close(); out.close();
   }
   
   
   
   
}