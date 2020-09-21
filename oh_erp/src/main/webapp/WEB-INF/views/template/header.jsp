<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
<title>oherp-index</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
 <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" integrity="sha384-JcKb8q3iqJ61gNV9KGb8thSsNjpSL0n8PARn9HuZOnIxN0hoP+VmmDGMN5t9UJ0Z" crossorigin="anonymous">
  <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
  <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js" integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN" crossorigin="anonymous"></script>
  <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js" integrity="sha384-B4gt1jrGC7Jh4AgTPSdUtOBvfO8shuf57BaghqFfPlYxofvL8/KUEfYiJOMMV+rV" crossorigin="anonymous"></script>


<link href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">

<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<script type="text/javascript" src="/js/twbs-pagination/jquery.twbsPagination.js"></script>
     <!--스타일 -->
        <style>  
         
         
         
      .bd-placeholder-img {
        font-size: 1.125rem;
        text-anchor: middle;
        -webkit-user-select: none;
        -moz-user-select: none;
        -ms-user-select: none;
        user-select: none;
      }

      @media (min-width: 768px) {
        .bd-placeholder-img-lg {
          font-size: 3.5rem;
        }
      }
            
   
    .navbar {
      margin-bottom: 0px;
      border-radius: 0px;
    }
   
    .row.content {height: auto;}
  
    .sidenav {
      padding-top: 0px;
      background-color: #f1f1f1;
      height: auto;
    }

    footer {
      background-color: black;
      color: white;
      padding: 15px;
    }
    
 
    @media screen and (max-width: 767px) {
      .sidenav {
        height: auto;
        padding: 15px;
      }
      .row.content {height:auto;} 
    } 
         
    </style>
    
  </head>
  <body>
  
    <nav class="navbar navbar-expand-md navbar-dark bg-dark">
    

   &emsp;&emsp;                   
 
   <a class="navbar-brand"href="${pageContext.request.contextPath}">
   <!--     로고 -->
     <img src="${pageContext.request.contextPath}/res/image/logo.png" alt="logo" style="width:150px;" display="inline">
   </a>
    &emsp;  &emsp; 

<!-- Dropdown -->


     <ul class="navbar-nav align-items-center">
 
    <li class="nav-item dropdown">
      <a class="nav-link dropdown-toggle" href="#" id="navbardrop" data-toggle="dropdown">
        급여관리
      </a>
      <div class="dropdown-menu" style="text-align: center;">
       <p style="color:#FF8000">상용직</p>
        <a class="dropdown-item" href="${pageContext.request.contextPath}/salary/list">급여계산대장</a>
        <a class="dropdown-item" href="${pageContext.request.contextPath}/salary/all">급여현황</a>
         <br>	
<!--         <p style="color:#FF8000">일용직</p>
 
<%--         <a class="dropdown-item" href="${pageContext.request.contextPath}/dailywork/dwlist">근무입력</a> --%>
        <a class="dropdown-item" href="${pageContext.request.contextPath}/dailywork/dwlist">근무입력/급여계산대장</a>
          <a class="dropdown-item" href="${pageContext.request.contextPath}/dailywork/dwall">급여현황</a>-->
      </div>
     
         <li class="nav-item dropdown">
         <a class="nav-link dropdown-toggle" href="#" id="navbardrop" data-toggle="dropdown">
        근태관리
      </a>
      <div class="dropdown-menu">

      	<a class="dropdown-item" href="<%=request.getContextPath()%>/attendance_detail/regist">출퇴근등록</a>
        <a class="dropdown-item" href="<%=request.getContextPath()%>/attendance_detail/admin_page">출퇴근기록관리</a>
        <a class="dropdown-item" href="${pageContext.request.contextPath}/attendance/myrequest">요청내역</a>
       
        <!-- 관리자일때만 메뉴 표시 -->
        <c:if test="${userinfo.member_position eq '관리자'}">
        <a class="dropdown-item" href="${pageContext.request.contextPath}/attendance/request">요청관리</a>
        </c:if>
      </div>
      
        <li class="nav-item dropdown">
        <a class="nav-link dropdown-toggle" href="#" id="navbardrop" data-toggle="dropdown">
         캘린더
      </a>
      <div class="dropdown-menu">
        <a class="dropdown-item" href="#">회사일정</a>
        <a class="dropdown-item" href="#">근무일정</a>
      </div>
      	 
        <li class="nav-item dropdown">
        <a class="nav-link dropdown-toggle" href="#" id="navbardrop" data-toggle="dropdown">
        기본사항등록
      </a>
      <div class="dropdown-menu">
        <a class="dropdown-item" href="${pageContext.request.contextPath}/benefit/list">수당등록</a>
        <a class="dropdown-item" href="${pageContext.request.contextPath}/department/list">부서등록</a>
        <a class="dropdown-item" href="${pageContext.request.contextPath}/member/list">사원등록</a>
        <a class="dropdown-item" href="${pageContext.request.contextPath}/project/regist">프로젝트등록</a>
        <a class="dropdown-item" href="${pageContext.request.contextPath}daily_worker/list">일용직등록</a>
      </div>
      
        <li class="nav-item dropdown">
        <a class="nav-link dropdown-toggle" href="#" id="navbardrop" data-toggle="dropdown">
        게시판
      </a>
      <div class="dropdown-menu">
        <a class="dropdown-item" href="${pageContext.request.contextPath}/board/list">통합</a>
        <a class="dropdown-item" href="${pageContext.request.contextPath}/board/list2">공지사항</a>
        <a class="dropdown-item" href="${pageContext.request.contextPath}/board/list3">회사규정</a>
        <a class="dropdown-item" href="${pageContext.request.contextPath}/board/list4">인사발령</a>    
      </div>     
          </li>  
  </ul>
  <c:if test="${not empty sessionScope.userinfo}">
       <ul class="nav navbar-nav ml-auto w-100 justify-content-end">
  
  
   <span class="navbar-text">
    사원번호  ${sessionScope.userinfo.member_code} 
  </span>
  &emsp;   
   <span class="navbar-text">
   성명  ${sessionScope.userinfo.member_name} 
  </span>
  
 
    </ul>
</c:if>
 &nbsp; 
  <c:if test="${not empty sessionScope.userinfo}">
      <input type="button" value="logout" class="btn btn-info" onClick="logout();" />
  </c:if>
</nav>
      </nav>
<script>
function logout(){
    var con = confirm("로그아웃 하시겠습니까?");
    if(con == true){
     location.href="${pageContext.request.contextPath}/logout";
     //logout을 위해 세션을 제거하는 페이지 호출
    }else{}
   }   
</script>
 


  <!--nav 왼쪽 -->
<div class="container-fluid text-center">  
       <div class="row content">
    
   
       <!--본문 -->
    <div class="col-sm" style="margin: 60px"> 
    