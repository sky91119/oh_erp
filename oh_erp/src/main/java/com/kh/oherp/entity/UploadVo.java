package com.kh.oherp.entity;

import java.util.List;

import org.springframework.web.multipart.MultipartFile;

import lombok.Data;

@Data
public class UploadVo {

	private String uploader;
	private List<MultipartFile> f;
	
	
	//파일 유무를 반환하는 메소드
	public boolean isFileExist() {
		if(f==null)
			return false;
		
		if(f.size()<1)
			return false;
		
		if(f.get(0).isEmpty())
			return false;
	
	
		return true;
	}
	
	
	public String getUploader() {
		return uploader;
	}
}
