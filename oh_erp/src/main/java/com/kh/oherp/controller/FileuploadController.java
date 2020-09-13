package com.kh.oherp.controller;

import java.io.File;
import java.io.IOException;
import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.kh.oherp.entity.UploadVo;

@Controller
@RequestMapping("/file")
public class FileuploadController {

	
	@GetMapping("/upload")
	public String upload() {
		return "file/upload";
	}
	
	//방식1 파일 1개 수신
	//@PostMapping("/upload")
	//public String upload(
	//		@RequestParam String uploader,
	//		@RequestParam MultipartFile f
	//		){
	//	System.out.println("uploader= "+uploader);
	//	System.out.println("f= "+ f);
//System.out.println("파일이 있나요?" + !f.isEmpty());
	//	return "redirect:upload";
//	}
	
	//방식2 : @RequestParam을 이용하여  파일 여러개 수신
	//@PostMapping("/upload")
	//public String upload(
	//		@RequestParam String uploader,
	//		@RequestParam List<MultipartFile> f
	//		) {
	//	System.out.println("uploader =" + uploader);
	//	System.out.println("f="+f.size());
		
	//	return "redirect:upload";
	//}
	
	//방식3 @ModelAttribute를 사용하여 수신
	@PostMapping("/upload")
	public String upload(@ModelAttribute UploadVo uploadVo) throws IllegalStateException, IOException {
		System.out.println("uploader= " + uploadVo.getUploader());
		System.out.println("file count= " + uploadVo.getF().size());
		
	//파일 정보 불러와서 저장
		if(uploadVo.isFileExist()) {
			for(MultipartFile file: uploadVo.getF()) {
				System.out.println("이름 :" + file.getOriginalFilename());
				System.out.println("크기 :" + file.getSize());
				System.out.println("유형 :" + file.getContentType());
				
				//대상을 지정하여 내보내기(저장)
				File target = new File("C:\\upload", file.getOriginalFilename());
				file.transferTo(target);
			}
			
		}
		
		
		return "redirect:upload";
	}
}
