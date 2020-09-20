<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<% session.invalidate(); %> 



<!-- 로그인인폼 -->
<form action="login" method="post">
	   사원번호<br>
	    <input type="text" id="uid" class="form-contro" placeholder="사원번호" name="member_code" required autofocus><br><br>
	    비밀번호<br>
        <input type="password" id="upw" class="form-contro" placeholder="비밀번호" name="member_pw" required ><br><br>
	  	<button type="submit" class="btn btn-primary btn-md">로그인</button>
</form>
