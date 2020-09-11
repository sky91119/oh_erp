<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<h1>상세보기</h1>
<h3>번호 : ${boardDto.board_no}</h3>
<h3>사원번호 : ${boardDto.member_code}</h3>
<h3>분류 : ${boardDto.board_type}</h3>
<h3>제목 : ${boardDto.board_title}</h3>
<h3>내용 : ${boardDto.board_content}</h3>
<h3>조회수 : ${boardDto.board_view}</h3>
<h3>날짜 : ${boardDto.board_date}</h3>
	}