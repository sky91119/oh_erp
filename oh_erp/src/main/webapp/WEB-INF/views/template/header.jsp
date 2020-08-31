<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <title>Bootstrap Example</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
     <style>
   
    .navbar {
      margin-bottom: 0;
      border-radius: 0;
    }
   
    .row.content {height: 450px}
  
    .sidenav {
      padding-top: 20px;
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

<nav class="navbar navbar-inverse">
  <div class="container-fluid">
    <div class="navbar-header">
      <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#myNavbar">
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>                        
      </button>
  <a class="navbar-brand" href="#">ERP</a> /<!-- 요게 홈으로 가게 링크걸기-->
    </div>
    <div class="collapse navbar-collapse" id="myNavbar">
 <ul class="nav navbar-nav">
     
     <li class="dropdown"><a class="dropdown-toggle" data-toggle="dropdown" href="#">급여관리<span class="caret"></span></a>
        <ul class="dropdown-menu">
          <li>상용직</li>
          <li><a href="#">급여계산대장</a></li>
          <li><a href="#">급여현황</a></li>
           <li>일용직</li>
          <li><a href="#">근무입력</a></li>
          <li><a href="#">급여계산대장</a></li>
           <li><a href="#">급여현황</a></li>
        </ul>
      </li>
      
      <li class="dropdown"><a class="dropdown-toggle" data-toggle="dropdown" href="#">근태관리<span class="caret"></span></a> <!--관리자만 보이게 하기-->
        <ul class="dropdown-menu">
          <li><a href="#">출퇴근기록관리</a></li>
          <li><a href="#">근태조회</a></li>
          <li><a href="#">일정</a></li>
          <li><a href="#">요청관리</a></li>
        </ul>
      </li>
   
       <li class="dropdown"><a class="dropdown-toggle" data-toggle="dropdown" href="#">갤린더<span class="caret"></span></a>
        <ul class="dropdown-menu">
          <li><a href="#">회사일정</a></li>
          <li><a href="#">근무일정</a></li>
        </ul>
      </li>
      
        <li class="dropdown"><a class="dropdown-toggle" data-toggle="dropdown" href="#">기본사항등록<span class="caret"></span></a>
        <ul class="dropdown-menu">
          <li><a href="#">사원등록</a></li>
          <li><a href="#">일용직등록</a></li>
          <li><a href="#">수당등록</a></li>
          <li><a href="#">부서등록</a></li>
          <li><a href="#">프로젝트등록</a></li>
        </ul>
      </li>
      
         <li class="dropdown"><a class="dropdown-toggle" data-toggle="dropdown" href="#">전자결재<span class="caret"></span></a>
        <ul class="dropdown-menu">
                <li>기안문서</li>
                <li><a href="#">작성함</a></li>
                <li><a href="#">진행함</a></li>
                <li><a href="#">반려함</a></li>
                <li><a href="#">완결함</a></li>
                <li>결재문서</li>
                <li><a href="#">미결함</a></li>
                <li><a href="#">진행함</a></li>
                <li><a href="#">반려함</a></li>
                <li><a href="#">완결함</a></li>
        </ul>
      </li>
      
        <li class="dropdown"><a href="#">증명서발급</a></li>
      

         <li class="dropdown"><a class="dropdown-toggle" data-toggle="dropdown" href="#">게시판<span class="caret"></span></a>
        <ul class="dropdown-menu">
          <li><a href="#">통합</a></li>
          <li><a href="#">공지사항</a></li>
          <li><a href="#">회사규정</a></li>
          <li><a href="#">인사발령</a></li>
        </ul>
      </li>
      
    </ul>
    <ul class="nav navbar-nav navbar-right">
      <li><a href="#"><span class="glyphicon glyphicon-user"></span> Sign Up</a></li>
      <li><a href="#"><span class="glyphicon glyphicon-log-in"></span> Login</a></li>
    </ul>
  </div>
   </div>
</nav>

<div class="container-fluid text-center">    
  <div class="row content">
    <div class="col-sm-2 sidenav">
    
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
      <p><a href="#">통합</a></p>
      <p><a href="#">공지사항</a></p>
      <p><a href="#">회사규정</a></p>
       <p><a href="#">인사발령</a></p>
    </div>
    
    <div class="col-sm-8 text-left"> 