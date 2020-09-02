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
<form ation ="create" method="post">
<h1>출퇴근기록 생성하기</h1>
<br>
<br>
<!-- 날짜 -->
<form>
<label>날짜</label>
<input type = "date">
</form>
<br>

<!-- 직원 -->
<form>
<label>직원</label>
<select name = "head">

<option value="">이름설정</option>
<!--<option value="">
<input type = "search" name = "key" placeholder="검색" value =""></option>-->
<!-- 여기다가는 for문을 사용해야할 것같음 -->
</select>

</form>

<!--근무일정-->
<form>
<label>근무일정</label>
<select>
<option value="무일정근무">무일정근무</option> 
</select>
</form>

<!--지점-->
<form>
<label>지점</label>
<select>
<option value="선택안됨">선택안됨</option>
</select>
</form>

<form>
<label>직무</label>
<select>
<option value="">선택안됨</option> 
<!--<option><input type = "search" placeholder="검색"></option>-->
</select>
</form>

<form>
<label>출근시간</label>
<input type = "time" size="8">
</form>


<form>
<label>현재근무중</label>
<input type = "checkbox">
</form>

<form>
<label>근무노트</label>
<br>
<textarea size="300"></textarea>
</form>

<form>
<input type = "checkbox">확정됨
</form>

<input class = "form-btn" type="submit" value="닫기">
<input class = "form-btn2" type = "submit"  value ="추가하기">


<!-- 현재시간 구현! -->
<br><br>
<h1><div class ='Time' style :font-size="50px"></h1>

<h2>현재 시각</h2>
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
   
   setTimeout ("showtime()", 1000);
   

}

   //시간을 00:00 형식으로 출력하기
   
   function addZeros(num, digit) { 
      //시, 분이 한 자리일 경우 앞에 0을 더해주는 함수 addZeros를 만듬
      //addZeros의 매개변수는 num과 digit이고 각각 시와분과 자릿수를 의미
      
      var zero = ''; 
   num = num.toString(); //공백을 담고 있는 변수 zero를 선언
   if(num.length<digit){ //num에 들어있는 값을 to.String을 통하여 문자열로 변환시킴
      for(i=0; i<digit - num.length; i++){
         zero +='0';
        
      }
   }
   
   return zero + num;
   }

showtime();
</script>
</div>

</div>
</form>
</main>
</body>
<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>

