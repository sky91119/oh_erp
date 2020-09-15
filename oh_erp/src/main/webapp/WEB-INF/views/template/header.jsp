<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
  <a class="navbar-brand" href="#">ERP</a>
  <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarCollapse" aria-controls="navbarCollapse" aria-expanded="false" aria-label="Toggle navigation">
    <span class="navbar-toggler-icon"></span>
  </button>
  <!--헤더부분 예제 https://getbootstrap.kr/docs/4.5/components/navs/ 참고하면됩니다. -->
  <div class="collapse navbar-collapse" id="navbarCollapse">
    <ul class="navbar-nav mr-auto">
   
      <li class="nav-item">
        <a class="nav-link" href="#">급여관리</a>
      </li>
        <li class="nav-item">
        <a class="nav-link" href="#">근태관리</a>
      </li>
        <li class="nav-item">
        <a class="nav-link" href="#">갤린더</a>
      </li>
        <li class="nav-item">
        <a class="nav-link" href="#">기본사항등록</a>
      </li>
        <li class="nav-item">
        <a class="nav-link" href="#">전자결재</a>
      </li>
        <li class="nav-item">
        <a class="nav-link" href="#">증명서발급</a>
      </li>
        <li class="nav-item">
        <a class="nav-link" href="http://localhost:8080/oherp/board/list">게시판</a>
      </li>
    </ul>
  </div>
       <!--헤더부분 오른쪽 로그인 회원가입 -->
      <ul class="nav navbar-nav navbar-right">
      <li><a href="#"><span class="glyphicon glyphicon-user"></span> Sign Up </a>
      </li>
      &nbsp;   &nbsp;;
      <li><a href="#"><span class="glyphicon glyphicon-log-in"></span> Login</a>
      </li>
    </ul>
</nav>


  <!--nav 왼쪽 -->
<div class="container-fluid text-center">  
       <div class="row content">
    <div class="col-sm-2 sidenav">
      <hr>
     <img src="https://dimg.donga.com/wps/NEWS/IMAGE/2019/12/22/98915688.2.jpg" class="img-circle" alt="Bird" width="100" height="100">
     
     <hr>
      <!--급여관리-->
      <p>상용직</p>
      <p><a href="#">급여계산대장</a></p>
      <p><a href="#">급여현황</a></p>
      <p>일용직</p>
      <p><a href="#">근무입력</a></p>
      <p><a href="#">급여계산대장</a></p>
      <p><a href="#">급여현황</a></p>
      <!--근태관리-->
      <p><a href="#">출퇴근기록관리</a></p>
      <p><a href="#">근태조회</a></p>
      <p><a href="#">요청</a></p>
       <p><a href="#">요청관리</a></p>
         <!--캘린더-->
      <p><a href="#">회사일정</a></p>
      <p><a href="#">근무일정</a></p>
          <!--기본사항등록-->
      <p><a href="#">사원등록</a></p>
      <p><a href="#">일용직등록</a></p>
      <p><a href="#">수당등록</a></p>
       <p><a href="#">부서등록</a></p>
         <p><a href="#">프로젝트등록</a></p>
          <!--전자결재-->
     <p>기안문서</p>
      <p><a href="#">작성함</a></p>
      <p><a href="#">진행함</a></p>
        <p><a href="#">반려함</a></p>
      <p><a href="#">완결함</a></p>
      <p>결재문서</p>
      <p><a href="#">미결함</a></p>
      <p><a href="#">진행함</a></p>
        <p><a href="#">반려함</a></p>
      <p><a href="#">완결함</a></p>
             <!--증명서발급-->
      <p><a href="#">증명서발급</a></p>
            <!--게시판-->
      <p><a href="http://localhost:8080/oherp/board/list">통합</a></p>
      <p><a href="http://localhost:8080/oherp/board/board2list">공지사항</a></p>
      <p><a href="http://localhost:8080/oherp/board/board3list">회사규정</a></p>
       <p><a href="http://localhost:8080/oherp/board/board4list">인사발령</a></p>
   </div> 
   
       <!--본문 -->
    <div class="col-sm" style="margin: 20px"> 