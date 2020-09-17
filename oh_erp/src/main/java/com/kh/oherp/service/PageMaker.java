package com.kh.oherp.service;

import com.kh.oherp.repository.BoardDao;

//public class PageMaker {
//	// 페이지 계산 코드
//		////////////////////////////////////////////////////////////
//		int pageSize = 10;//한 페이지에 표시할 데이터 개수
//		
//		//page 번호를 계산하기 위한 코드
//		// - 이상한 값은 전부다 1로 변경
//		// - 멀쩡한 값은 그대로 숫자로 변환
//		String pageStr = request.getParameter("page");
//		int pageNo;
//		try{
//			pageNo = Integer.parseInt(pageStr);
//			if(pageNo <= 0){
//				throw new Exception();
//			}
//		}
//		catch(Exception e){ 
//			pageNo = 1;
//		}
//		
//		//시작 글 순서와 종료 글 순서를 계산
//		int finish = pageNo * pageSize;
//		int start = finish - (pageSize - 1);
//		
//		//////////////////////////////////////////////////////////////////
//		// 페이지 네비게이터 계산 코드
//		//////////////////////////////////////////////////////////////////
//		int blockSize = 10;//이 페이지에는 네비게이터 블록을 10개씩 배치하겠다!
//		int startBlock = (pageNo - 1) / blockSize * blockSize + 1;
//		int finishBlock = startBlock + blockSize - 1;
//		BoardDao bdao = new BoardDao();