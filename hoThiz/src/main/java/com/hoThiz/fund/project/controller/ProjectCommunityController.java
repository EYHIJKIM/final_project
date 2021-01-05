package com.hothiz.fund.project.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import com.hothiz.fund.project.dto.ProjectCommunityDTO;
import com.hothiz.fund.project.service.ProjectCommunityService;


public class ProjectCommunityController {

	@Autowired
	ProjectCommunityService pcs;
	
	
	//스토리에 들어가는 이미지
		private final String IMAGE_REPO2 = "D:\\ee";
		

	
	
	

	/*
	@PostMapping(value="/write")
	public String write(@RequestParam String title, @RequestParam String content, @RequestParam String project_id) {
		//System.out.println(title);
		//System.out.println(content);
		ProjectInfoDTO dto = new ProjectInfoDTO();
		//String id = project_id;
		int id = Integer.parseInt(project_id);
		dto.setProject_id(id);
		dto.setProject_story(content);
		//service.insert_story(dto);
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
		return "redirect:/fund/discover/"+project_id+"/community";
	}
	
	private String uploadFile(MultipartFile mFile) throws Exception{
		String imageFileName= null;
			imageFileName=mFile.getOriginalFilename();//실제 파일명을 가져온다
			File file = new File(IMAGE_REPO2 +"\\"+"temp"+"\\"+ imageFileName);
			file.getParentFile().mkdirs(); //해당 경로 디렉터리 생성(존재하면 생성하지 않음)
			if(mFile.getSize()!=0){ //File Null Check
				//임시로 저장된 multipartFile을 실제 파일로 전송
				mFile.transferTo(new File(IMAGE_REPO2 +"\\"+"temp"+"\\"+imageFileName)); 
			}
		return imageFileName;
	}
	@RequestMapping("/edit-project/download")
	public void download(@RequestParam("imageFileName") String imageFileName,
			                 HttpServletResponse response)throws Exception {
		//System.out.println("다운로드 실행 됩니까???");
		OutputStream out = response.getOutputStream();
		String downFile = IMAGE_REPO2 + "\\temp\\" + imageFileName;
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
	public String uploadSummernoteImageFile(@RequestParam("file") MultipartFile multipartFile) throws Exception {
		JsonObject jsonObject = new JsonObject();
		String savedFileName = uploadFile(multipartFile);
		try {
			jsonObject.addProperty("url", "write/download?imageFileName="+savedFileName);
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
		return service.get_storyget_story(dto);
		
	}	
	
	*/
	
}
