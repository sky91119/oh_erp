<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<jsp:include page="/WEB-INF/views/template/header.jsp"></jsp:include>



<c:if test="${empty sessionScope.userinfo}">


<!-- 로그인인폼 -->
<form action="login" method="post">
	   사원번호<br>
	    <input type="text" id="uid" class="form-contro" placeholder="사원번호" name="member_code" required autofocus><br><br>
	    비밀번호<br>
        <input type="password" id="upw" class="form-contro" placeholder="비밀번호" name="member_pw" required ><br><br>
	  	<button type="submit" class="btn btn-primary btn-md">로그인</button>
</form>

<br>
<br>

<!-- 슬라이더 -->

<div id="demo" class="carousel slide" data-ride="carousel">

  <!-- Indicators -->
  <ul class="carousel-indicators">
    <li data-target="#demo" data-slide-to="0" class="active"></li>
    <li data-target="#demo" data-slide-to="1"></li>
    <li data-target="#demo" data-slide-to="2"></li>
  </ul>

  <!-- The slideshow -->
  <div class="carousel-inner">
    <div class="carousel-item active">
      <img src="${pageContext.request.contextPath}/res/image/s3.jpg" alt="Los Angeles" width="1100" height="500">
    </div>
    <div class="carousel-item">
      <img src="${pageContext.request.contextPath}/res/image/s2.jpg" alt="Chicago" width="1100" height="500">
    </div>
    <div class="carousel-item">
      <img src="${pageContext.request.contextPath}/res/image/s1.png" alt="New York" width="1100" height="500">
    </div>
  </div>

  <!-- Left and right controls -->
  <a class="carousel-control-prev" href="#demo" data-slide="prev">
    <span class="carousel-control-prev-icon"></span>
  </a>
  <a class="carousel-control-next" href="#demo" data-slide="next">
    <span class="carousel-control-next-icon"></span>
  </a>
</div>

</c:if>



<c:if test="${not empty sessionScope.userinfo}">
	  	
</c:if>

