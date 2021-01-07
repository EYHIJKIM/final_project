package com.hothiz.fund.member.service;

import java.io.File;
import java.io.FileInputStream;
import java.io.OutputStream;
import java.util.ArrayList;
import java.util.Enumeration;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Set;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.io.FileUtils;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.multipart.MultipartRequest;


@Service
public class MemberFileService {
	
private final String IMAGE_REPO = "C:\\javawork\\spring_workspace\\.metadata\\.plugins\\org.eclipse.wst.server.core\\tmp0\\wtpwebapps\\hoThiz\\resources\\img";
	

		   
	
	
	   public Map<String, Object> getData(MultipartHttpServletRequest multipartRequest) throws Exception{
		   System.out.println(multipartRequest.getSession().getServletContext().getRealPath("/"));
		   String path = multipartRequest.getSession().getServletContext().getRealPath("/");
	      multipartRequest.setCharacterEncoding("utf-8");
	      Map<String, Object> writeMap = new HashMap<String, Object>();
	      Enumeration enu = multipartRequest.getParameterNames();
	      while(enu.hasMoreElements()) {
	         String name = (String)enu.nextElement();
	         String value = multipartRequest.getParameter(name);
	         System.out.println("이름 : "  + name);
	         System.out.println("value : " + value);
	         writeMap.put(name, value);
	      }
	      String imageFileName = uploadFile(multipartRequest);
	      System.out.println("업로드파일이름 :" + imageFileName);
	      writeMap.put("image_file_name", imageFileName);
	     // writeMap.put("path",path );
	      return writeMap;
	   }
	   
	   private String uploadFile(MultipartHttpServletRequest multipartRequest) throws Exception{
	      String imageFileName= null;
	      Iterator<String> fileNames = multipartRequest.getFileNames();
	      while(fileNames.hasNext()){
	         String fileName = fileNames.next();//name을 가져온다(file1, file2...)
	         MultipartFile mFile = multipartRequest.getFile(fileName);
	         imageFileName=mFile.getOriginalFilename();//실제 파일명을 가져온다
	         File file = new File(IMAGE_REPO +"\\"+"temp"+"\\"+ fileName);
	         file.getParentFile().mkdirs(); //해당 경로 디렉터리 생성(존재하면 생성하지 않음)
	         if(mFile.getSize()!=0){ //File Null Check
	            //임시로 저장된 multipartFile을 실제 파일로 전송
	            mFile.transferTo(new File(IMAGE_REPO +"\\"+"temp"+"\\"+imageFileName)); 
	         }
	      }
	      return imageFileName;
	   }
	   
//	   public String uploadFile(MultipartHttpServletRequest multipartRequest,String email) throws Exception{
//		   String mail = email;
//	       int idx = mail.indexOf("@");
//	       String emailSet = mail.substring(0,idx);
//		      String imageFileName= null;
//		      Iterator<String> fileNames = multipartRequest.getFileNames();
//		      while(fileNames.hasNext()){
//		         String fileName = fileNames.next();//name을 가져온다(file1, file2...)
//		         MultipartFile mFile = multipartRequest.getFile(fileName);
//		         imageFileName=mFile.getOriginalFilename();//실제 파일명을 가져온다
//		         File file = new File(IMAGE_REPO +"\\"+emailSet+"\\"+ fileName);
//		         file.getParentFile().mkdirs(); //해당 경로 디렉터리 생성(존재하면 생성하지 않음)
//		         if(mFile.getSize()!=0){ //File Null Check
//		            //임시로 저장된 multipartFile을 실제 파일로 전송
//		            mFile.transferTo(new File(IMAGE_REPO +"\\"+emailSet+"\\"+imageFileName)); 
//		         }
//		      }
//		      return imageFileName;
//		   }
	   
	   
	   
	   //두번째부터 이거실행
	   public String getMessage(int result,String user_id,String originalFile,String newFile) throws Exception {
		      String message = "<script>";
		      int check =0;
		      //동일한이름이 존재하면 오류발생방지를위해삭제하고진행
		      if(originalFile.equals(newFile)) {
		    	  File oldFile = new File(IMAGE_REPO+"\\"+user_id+"\\"+originalFile);
		           oldFile.delete();
		           check =1;
		      }
		      if(result != -1) {
		         if(newFile.length() != 0 && check == 0) {
		        	
		            File srcFile = new File(IMAGE_REPO+"\\"+"temp"+"\\"+newFile);
		            File destDir = new File(IMAGE_REPO+"\\"+user_id);
		            FileUtils.moveFileToDirectory(srcFile, destDir, true);
		            File oldFile = new File(IMAGE_REPO+"\\"+user_id+"\\"+originalFile);
			       oldFile.delete();
			       message += "alert('글을 수정했습니다.');";
		         }else if(newFile.length()!=0 && check ==1) {
		        	 File srcFile = new File(IMAGE_REPO+"\\"+"temp"+"\\"+newFile);
			            File destDir = new File(IMAGE_REPO+"\\"+user_id);
			            FileUtils.moveFileToDirectory(srcFile, destDir, true);
			            message += "alert('동일제목파일을 수정했습니다.');";
		         }
		         
		      }else {
		         if(newFile.length() != 0) {
		            File srcFile = new File(IMAGE_REPO+"\\"+"temp"+"\\"+newFile);
		            srcFile.delete();
		         }
		         message += "alert('오류가 발생했습니다.다시 수정해주세요');";
		      }
		      message += "location.href='setting';";
		      message +=" </script>";
		      return message;
		   }
	   
	   //최초실행시실행
	   public String getMessage(int result,String user_id, String image_file_name) throws Exception {
		      String message = null;
		      
		      if(result != -1 ) {
		         if(image_file_name != null && image_file_name.length() != 0) {
		            File srcFile = new File(IMAGE_REPO+"\\"+"temp"+"\\"+image_file_name);
		            File destDir = new File(IMAGE_REPO+"\\"+user_id);
		            //true : destDir 디렉터리 생성. false : 디렉터리 생성하지 않음
		            FileUtils.moveFileToDirectory(srcFile, destDir,true);
		         }
		         message = "<script>alert('추가가완료.');";
		         message += " location.href='setting';</script>";
		      }else {
		         File srcFile = new File(IMAGE_REPO+"\\"+"temp"+"\\"+image_file_name);
		         srcFile.delete();
		         message = " <script> alert('오류가 발생했습니다. 다시 시도해 주세요');";
		         message +=" location.href='setting'; </script>";
		      }
		      return message;
		   }

	   public String fileProcess(MultipartHttpServletRequest multipartRequest, String email) throws Exception{
	      multipartRequest.setCharacterEncoding("utf-8");
	      Map<String, Object> writeMap = new HashMap<String, Object>();
	      Enumeration enu = multipartRequest.getParameterNames();
	      while(enu.hasMoreElements()) {
	         String name = (String)enu.nextElement();
	         String value = multipartRequest.getParameter(name);
	         System.out.println("이름 : "  + name);
	         System.out.println("value : " + value);
	         writeMap.put(name, value);
	      }
	      String imageFileName = uploadFile(multipartRequest);
	      System.out.println("업로드파일이름 :" + imageFileName);
	      writeMap.put("image_file_name", imageFileName);
	      
	      if(imageFileName.equals("")) {
	    	  
	      }else {
	      File srcFile = new File(IMAGE_REPO+"\\"+"temp"+"\\"+imageFileName);
          File destDir = new File(IMAGE_REPO+"\\"+email);
          //true : destDir 디렉터리 생성. false : 디렉터리 생성하지 않음
          FileUtils.moveFileToDirectory(srcFile, destDir,true);
	     // writeMap.put("path",path );
	      }
	      return imageFileName;
		   }
	   
	   
//	   public void download(int write_no,String image_file_name,
//			   HttpServletResponse response) throws Exception {
//			   OutputStream out = response.getOutputStream();
//			   String downFile = IMAGE_REPO + "\\" + write_no +"\\"+image_file_name;
//			   File file = new File(downFile);
//			   //Content-disposition :파일 다운로드를 처리하는 HTTP헤더 중 하나다
//			   //Content-disposition : attachment : attachment는 파일을 다운로드하여 브라우저로 표현 하는 의미다
//			   //fileName는 파일을 다운로드할때의 이름을 지정해 준다.
//			   response.addHeader("Content-disposition", "attachment; fileName=" + image_file_name);
//			   FileInputStream in = new FileInputStream(file);
//			   byte[] buffer = new byte[1024 * 8];
//			   while (true) {//브라우저로 전송
//			   int count = in.read(buffer);
//			   if (count == -1)
//			   break;
//			   out.write(buffer, 0, count);
//			   }
//			   in.close(); out.close();
//			   System.out.println("다운로드 서비스 실행 됨");
//			   }
//	   
	   
//	   
//	   public void boardFileDelete(int write_no) throws Exception {
//		    File destDir = new File(IMAGE_REPO+"\\"+write_no);
//		    FileUtils.deleteDirectory(destDir);
//		}
}
