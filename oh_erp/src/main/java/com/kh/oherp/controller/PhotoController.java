package com.kh.oherp.controller;

import java.io.File;
import java.io.IOException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.kh.oherp.entity.PhotoDto;
import com.kh.oherp.repository.PhotoDao;

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
}
