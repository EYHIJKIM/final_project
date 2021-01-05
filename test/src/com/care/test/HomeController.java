package com.care.test;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.text.DateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.Enumeration;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Locale;
import java.util.Map;
import java.util.UUID;

import javax.servlet.http.HttpServletResponse;

import org.apache.commons.io.FileUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.google.gson.JsonObject;

/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {
	
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	private final String IMAGE_REPO = "c:\\spring\\image_repo";
	@GetMapping("test")
	public String boardWrite() {
		return "test";
	}
	@PostMapping("write")
	public void write(@RequestParam String title, @RequestParam String content) {
		System.out.println(title);
		System.out.println(content);
		//처리되는 코드는 실제 서버에 올라온 파일을 저장하는 역할을 만들고 데이터 처리하면 된다.
		System.out.println(content.indexOf("imageFileName="));
		System.out.println(content.lastIndexOf("."));
		System.out.println(content.substring(content.indexOf("imageFileName=")+14,content.lastIndexOf(">")-1));
		String imgName = "";
		String newContent = "";
		int i=0;
		for(i=content.indexOf("imageFileName=")+14; i < content.length();i++) {
			if(content.charAt(i) == '"') break;
			imgName += content.charAt(i);
		}
		newContent = content.substring(i+2,content.lastIndexOf("</p>"));
		System.out.println("newContent : "+newContent);
		System.out.println("imgName : "+imgName);
		//해당 이미지 이름은 이전에 저장한 위치에 있으므로 해당 위치의 값을 폴더에 실제로 저장하고
		//내용들은 디비에 따로 저장한다.
	}
	private String uploadFile(MultipartFile mFile) throws Exception{
		String imageFileName= null;
			imageFileName=mFile.getOriginalFilename();//실제 파일명을 가져온다
			File file = new File(IMAGE_REPO +"\\"+"temp"+"\\"+ imageFileName);
			file.getParentFile().mkdirs(); //해당 경로 디렉터리 생성(존재하면 생성하지 않음)
			if(mFile.getSize()!=0){ //File Null Check
				//임시로 저장된 multipartFile을 실제 파일로 전송
				mFile.transferTo(new File(IMAGE_REPO +"\\"+"temp"+"\\"+imageFileName)); 
			}
		return imageFileName;
	}
	@RequestMapping("/download")
	public void download(@RequestParam("imageFileName") String imageFileName,
			                 HttpServletResponse response)throws Exception {
		System.out.println("다운로드 실행 됩니까???");
		OutputStream out = response.getOutputStream();
		String downFile = IMAGE_REPO + "\\temp\\" + imageFileName;
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
	public JsonObject uploadSummernoteImageFile(@RequestParam("file") MultipartFile multipartFile) throws Exception {
		JsonObject jsonObject = new JsonObject();
		String savedFileName = uploadFile(multipartFile);
		try {
			jsonObject.addProperty("url", "download?imageFileName="+savedFileName);
			jsonObject.addProperty("responseCode", "success");
		} catch (Exception e) {
			e.printStackTrace();
		}
		return jsonObject;
	}

	/**
	 * Simply selects the home view to render by returning its name.
	 */
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Locale locale, Model model) {
		logger.info("Welcome home! The client locale is {}.", locale);
		
		Date date = new Date();
		DateFormat dateFormat = DateFormat.getDateTimeInstance(DateFormat.LONG, DateFormat.LONG, locale);
		
		String formattedDate = dateFormat.format(date);
		
		model.addAttribute("serverTime", formattedDate );
		
		return "home";
	}
	
}
