<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Calendar"%>



<style>
.padding32{
padding : 32px;

</style>

<jsp:include page="/WEB-INF/views/template/header.jsp"></jsp:include>

<div class = "padding32">
<body>
<main>
<h1>출퇴근기록 생성하기(사원조회가능 + 보기만 가능)</h1>
<br>
<br>
<!-- 날짜 -->

<form>
<label>날짜</label>
<input type = "Month">
</form>

<form>
<select>
<option value="">활성직원</option> 
<option value="">출퇴근기록이 있는 직원만</option> 
</select>
</form>














</div>
</form>
</main>
</body>
<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>

