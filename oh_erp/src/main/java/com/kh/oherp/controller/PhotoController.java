package com.kh.oherp.controller;

import java.io.File;
import java.io.IOException;

import javax.servlet.http.HttpServletResponse;

import org.apache.commons.io.FileUtils;
import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.kh.oherp.entity.PhotoDto;
import com.kh.oherp.repository.PhotoDao;
import com.sun.mail.iap.Response;

@Controller
@RequestMapping("/photo")
public class PhotoController {
	
	@Autowired
	private PhotoDao photoDao;

	@GetMapping("/add")
	public String add() {
		return "photo/add";
	}
	@PostMapping("/add")
	public String add(
			@ModelAttribute PhotoDto photoDto,
		//	@RequestParam int photo_no,
		//	@RequestParam String photo_name,
		//	@RequestParam int member_code,
			@RequestParam MultipartFile file
			
			) throws IllegalStateException, IOException {
		//System.out.println("photo_no="+photo_no);
		//System.out.println("photo_name="+ photo_name);
		//System.out.println("file="+!file.isEmpty());
		
		//PhotoDto photoDto = new PhotoDto();
		//photoDto.setPhoto_no(photo_no);
		//photoDto.setPhoto_name(photo_name);
		//photoDto.setMember_code(member_code);
		
		
		//PhotoDto.setPname(photo.getOriginalFilename());
		photoDto.setPhoto_size(file.getSize());
		photoDto.setPhoto_type(file.getContentType());
		
		int no = photoDao.add(photoDto);
		File target = new File("C:\\upload", String.valueOf(no));
		file.transferTo(target);
		
		return "redirect:add";
	}
	
	//파일다운로드를 위한 컨트롤러 
@GetMapping("/down/{photo_no}")
@ResponseBody//응답에 있어서 자동으로 처리되는 도구들을 제거
public void  download(
			@PathVariable int photo_no,
			HttpServletResponse response) throws IOException {
		PhotoDto photoDto = photoDao.get(photo_no);
	
	//파일 정보가 없으면 사용자에게 404 notfound를 알린다
		if(photoDto == null) {
			response.sendError(404);
			return;
		}
		
		//파일 정보가 있으면 사용자에게 파일정보와 내용을 전달한다
		response.setHeader("Content-Type", "application/octet-stream; charset=UTF-8");
	//	response.setHeader("Content-Disposition", "attachment; filename=\""+URLEncoder.encode(photoDto.getFname(), "UTF-8")+"\"");
	//	response.setHeader("Content-Length", String.valueOf(photoDto.getFsize()));
		
	//	File target = new File("D:/upload", String.valueOf(photo_no));
	//	byte[] data = FileUtils.readFileToByteArray(target);
	//	response.getOutputStream().write(data);
		
	}



}

