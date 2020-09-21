<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Calendar"%>


<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>

    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" integrity="sha384-JcKb8q3iqJ61gNV9KGb8thSsNjpSL0n8PARn9HuZOnIxN0hoP+VmmDGMN5t9UJ0Z" crossorigin="anonymous">

    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js" integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN" crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js" integrity="sha384-B4gt1jrGC7Jh4AgTPSdUtOBvfO8shuf57BaghqFfPlYxofvL8/KUEfYiJOMMV+rV" crossorigin="anonymous"></script>

</head>
<body>

<style>
.padding32 {
	padding: 32px;
}
.left {
	text-align: left;
	padding: 50px;
}
.inline {
	display: inline-block;
}
.hidden_code{
padding:30px;
.row{
padding :10px;
}
.col-4{
text-align: left;
}
.inline {
   display: inline-block;
}

</style>

<jsp:include page="/WEB-INF/views/template/header.jsp"></jsp:include>

<div class="padding32" align="left">


    <div class="container-fluid">
<form action="regist" method="post">
<h1>출퇴근기록 생성하기</h1>
<hr>

<!--<div class = hidden_code>
★부서코드(안보이게 해야됨)<input type="text" name="department_no"> 
</div> -->
<br>

        <div class="row">

           
            <div class="col-11" align="center">
                <h3>출퇴근기록 작성란</h3>
  
            </div>
           
            
        </div>
<hr>
        <div class="row">

           <!-- <div class="offset-4 col-4">
                <h4>입력하슈</h4>
            </div>-->
        </div>

        <div class="row">
 <div class="col-3">
 </div>
 
<div class="col-5">
<br>

 사원코드<input type="text" class="form-control" name="member_code"> 
               <br> <br>

     <!--      <br> <br>
               근무일정
					<select class="form-control">
						<option value="">무일정근무</option>
						<option>뭘쓰지</option>
						<option>뭘써야하지</option>
						<option>기타</option>
					</select>
               
               <br> <br>
         -->      
              
              <br>
               출근시간
  <input type="datetime-local" class="form-control" name="attendance_in"> 

               <br> <br>
               
               퇴근시간
               <input type="datetime-local" class="form-control" name="attendance_out"> 
				<hr>
               <br><br>
      <div align="center">
      현재근무중
      </div>        
               
               <input type="checkbox" class="form-control">
                <br> <br>
               근무노트<textarea class="form-control" name="attendance_note"></textarea>


<hr>
<br><br>
<div align="center">확정됨</div>
 <input type="checkbox" class="form-control">
 <br><br>
<hr>
<br><br>
 </div>
 

<div class="col-4">
 <!-- 현재시간 구현! -->
			<h1>
				<div class='Time' style :font-size="50px" align="center">
			</h1>
			<h2 align="center">현재 시각</h2>
</div>
			<script>
				//현재시각구현
				function showtime() { //현재시간을 출력하는 showtime 함수를 만듬
					let date = new Date(); //date 변수 선언, DATE()생성자 함수를 이용하여 Date 객체를 생성
					let currhour = date.getHours();
					//Date객체 안에 내장함수인.getHours()함수, .getMinutes()함수는 각 시와 분을 출력하는 함수
					let currminu = date.getMinutes();
					//currhour 변수와 currminu를 선언하고 각 시와 분을 저장
					let time = document.querySelector('.Time');
					//time 클래스를 .querySelector로 불러와, time변수에 저장. 
					time.innerHTML = currhour + ":" + currminu;
					//innerHTML을 사용하여 Time 클래스의 내용을 현재 시와 분으로 바꿔준다.  
					setTimeout("showtime()", 1000);
				}
				//시간을 00:00 형식으로 출력하기
				function addZeros(num, digit) {
					//시, 분이 한 자리일 경우 앞에 0을 더해주는 함수 addZeros를 만듬
					//addZeros의 매개변수는 num과 digit이고 각각 시와분과 자릿수를 의미
					var zero = '';
					num = num.toString(); //공백을 담고 있는 변수 zero를 선언
					if (num.length < digit) { //num에 들어있는 값을 to.String을 통하여 문자열로 변환시킴
						for (i = 0; i < digit - num.length; i++) {
							zero += '0';
						}
					}
					return zero + num;
				}
				showtime();
			</script>
 
 </div>

        
    <!-- --------------------------- -->
    <div align="center">
    <button type="submit" class="form-control">추가하기</button>
<!--<input type="submit" value="출퇴신청하기">-->
</div>
</form>
</body>
</html>