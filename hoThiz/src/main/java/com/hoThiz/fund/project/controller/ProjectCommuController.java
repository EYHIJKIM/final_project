package com.hothiz.fund.project.controller;

import java.io.File;
import java.io.FileInputStream;
import java.io.OutputStream;

import javax.mail.internet.ContentType;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.JsonObject;
import com.hothiz.fund.project.dto.ProjectCommunityDTO;
import com.hothiz.fund.project.service.ProjectCommunityServiceImpl;
import com.hothiz.fund.project.service.ProjectServiceImpl;

@Controller
public class ProjectCommuController {

	@Autowired
	ProjectCommunityServiceImpl pcs;
	@Autowired
	ProjectServiceImpl ps;
	
	static String bno;
	
	//스토리에 들어가는 이미지 저장 위치
	private final String IMAGE_REPO = "D:\\Spring\\final_project\\.metadata\\.plugins\\org.eclipse.wst.server.core\\tmp0\\wtpwebapps\\hoThiz\\resources\\img\\project\\community";
	
	
	
	@GetMapping(value="writeForm")
	public ModelAndView boardWrite(ModelAndView mv,HttpSession session) {
		
		//String userId = (String)session.getAttribute("userId");
				String userId = "30";
				//폼으로 프로젝트 아이디 보내줌
				//여기에 sessionId에서 뽑아낸 멤버 정보도 보내야 할듯.
				
				mv.addObject("memberInfo", ps.getAMemberDetail(userId));
				//mv.addObject("project_id", project_id);
				mv.setViewName("project/project_content/communityWriteForm");
		
		return mv;
		
		
	}
	
	@PostMapping("write")//폼을 누르면 실행되는 메소드
	public String write(@RequestParam String title, @RequestParam String content, ProjectCommunityDTO coDto
			,ModelAndView mv) { //제목과 내용을 받아온다.
		System.out.println(title);
		System.out.println(content);
		System.out.println("write들어옴");
		
		//처리되는 코드는 실제 서버에 올라온 파일을 저장하는 역할을 만들고 데이터 처리하면 된다.
		System.out.println(content.indexOf("imageFileName=")); //이미지파일의 이름을 찾기위해 인덱스를 찾음.
		System.out.println(content.lastIndexOf(".")); 
		System.out.println(content.substring(content.indexOf("imageFileName=")+14,content.lastIndexOf(">")-1));
		
		String imgName = "";
		String newContent = "";
		
		int i=0;
		for(i=content.indexOf("imageFileName=")+14; i < content.length();i++) { //이미지 이름의 길이만큼..뭘함.
			if(content.charAt(i) == '"') break;
			imgName += content.charAt(i);
		}
		newContent = content.substring(i+2,content.lastIndexOf("</p>"));
		
		System.out.println("newContent : "+newContent);
		System.out.println("imgName : "+imgName);
		//해당 이미지 이름은 이전에 저장한 위치에 있으므로 해당 위치의 값을 폴더에 실제로 저장하고
		//내용들은 디비에 따로 저장한다.
	
		pcs.writeOnCommunity(coDto);
		
		System.out.println();
		String path = "redirect:/fund/discover/"+coDto.getProject_id()+"/community";
		
		return path;
		
	}
	
	
	private String uploadFile(MultipartFile mFile) throws Exception{//업로드는 됨.
		
		//int num = pcs.getLastBno(project_id);
		//bno = Integer.toString(num+1);
		System.out.println(bno);
		
		String imageFileName= null;
			imageFileName=mFile.getOriginalFilename();//실제 파일명을 가져온다
			File file = new File(IMAGE_REPO +"\\"+bno+"\\"+ imageFileName);
			file.getParentFile().mkdirs(); //해당 경로 디렉터리 생성(존재하면 생성하지 않음)
			if(mFile.getSize()!=0){ //File Null Check
				//임시로 저장된 multipartFile을 실제 파일로 전송
				mFile.transferTo(new File(IMAGE_REPO +"\\"+bno+"\\"+imageFileName)); 
			}
		return imageFileName;
	}
	
	
	@RequestMapping("/download")
	public void download(@RequestParam("imageFileName") String imageFileName,
			                 HttpServletResponse response)throws Exception {
		System.out.println("다운로드 실행 됩니까???");
		OutputStream out = response.getOutputStream();
		String downFile = IMAGE_REPO + "\\"+bno+"\\" + imageFileName;
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
	
	@PostMapping(value="image", produces = "application/json;charset=utf8")
	@ResponseBody
	public String uploadSummernoteImageFile(@RequestParam("file") MultipartFile multipartFile, @RequestParam("project_id") int id) throws Exception {
		JsonObject jsonObject = new JsonObject();
		int num = pcs.getLastBno(id);
		bno = Integer.toString(num+1);
		
		String savedFileName = uploadFile(multipartFile);
		try {
			jsonObject.addProperty("url", "download?imageFileName="+savedFileName);
			jsonObject.addProperty("responseCode", "success");
	
		} catch (Exception e) {
			e.printStackTrace();
		}
		return jsonObject.toString();
	}
	
	
}
