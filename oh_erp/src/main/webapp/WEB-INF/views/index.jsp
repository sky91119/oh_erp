<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<jsp:include page="/WEB-INF/views/template/header.jsp"></jsp:include>

<c:if test="${empty sessionScope.userinfo}">
	
<form action="login" method="post">
	사원번호 : <input type="text" name="member_code"><br><br>
	비밀번호 : <input type="password" name="member_pw"><br><br>
	<input type="submit" value="로그인">
	<br>
	
</form>


</c:if>

<c:if test="${not empty sessionScope.userinfo}">


</c:if>

<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>