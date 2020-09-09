<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Calendar"%>

<jsp:include page="/WEB-INF/views/template/header.jsp"></jsp:include>

<style>
/*마진*/	
	.margin20 {
		margin: 20px 20px 20px 20px;
	}
	
/*패딩*/
	.padding32 {
		padding:32px;
	}	
	.padding32-bot{
		padding-bottom:32px;
	}
	.padding10{
		padding:10px;
	}
/*제목*/
	.title{
		font-size: 25px;
		text-align:left;
		padding-bottom:15px;
        }
/*총 요청수*/ 
	.sum-request{
		font-size:16px;
		text-align:right;
	}       
/*요청관리 상태*/
	.waiting{
         background-color: #D27300;
         margin: 0px 3px 0px 0px;
         padding: 2px 8px;
         color: #ffffff;
         text-align: center;
         font-size: 0.75rem;
         border-radius: 2px;
	}
	.ok{
	     background-color: #01853d;
         margin: 0px 3px 0px 0px;
         padding: 2px 8px;
         color: #ffffff;
         text-align: center;
         font-size: 0.75rem;
         border-radius: 2px;
	}
	.no{
	 	 background-color: #bf0920;
         margin: 0px 3px 0px 0px;
         padding: 2px 8px;
         color: #ffffff;
         text-align: center;
         font-size: 0.75rem;
         border-radius: 2px;
         #bf0920
	}
/*텍스트*/
	.left-font{
		text-align:left;
	}	
	
</style>

<div class="container-fluid">
	<div>
		<p class="title">근태상세관리</p>
	</div>

 <div class="row padding32-bot">
    	<div class="col-2">
    		<input type="date" class="form-control">
    	</div>
    	
</head>
<body>


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

           
            <div class="col">
                <h1>출퇴근기록 작성란</h1>
                <br><br>
            </div>
           
            <div class="col">
                <h1>현재시각</h1>
                <br><br>
            </div>
        </div>
<hr>
        <div class="row">

           <!-- <div class="offset-4 col-4">
                <h4>입력하슈</h4>
            </div>-->
        </div>

        <div class="row">

<div class="col-4">
                  사원코드<input type="text" class="form-control" name="member_code"> 
               <br> <br>
         날짜<input type="date" class="form-control" name="attendance_date">
               <br> <br>
               근무일정
					<select class="form-control">
						<option value="">무일정근무</option>
						<option>뭘쓰지</option>
						<option>뭘써야하지</option>
						<option>기타</option>
					</select>
               
               <br> <br>
              지점<select class="form-control" name="attendance_spot">
						<option value="서울지점">서울지점</option>
						<option value="경기지점">경기지점</option>
						<option value="기타">기타</option>
		</select>
               <br> <br>
               출근시간
  <input type="text" class="form-control" name="attendance_in_time1"> : <input type="text"
class="form-control" name="attendance_in_time2">
		<select class="form-control" name="attendance_in_time3">
							<option value="AM">AM</option>
							<option value="PM">PM</option>
						</select>
               <br> <br>
               
               퇴근시간
               <input type="text" class="form-control"
						name="attendance_out_time1"> : <input type="text"
						class="form-control" name="attendance_out_time2">
				
			
					<select class="form-control"  name="attendance_out_time3">
						<option value="AM">AM</option>
						<option value="PM">PM</option>
					</select>
               <br> <br>
               
               현재근무중<input type="checkbox" class="form-control">
                <br> <br>
               근무노트<textarea class="form-control" name="attendance_note"></textarea>
<br><br>

<hr>
 <input type="checkbox" class="form-control">확정됨
<hr>
<br><br>
 </div>
 
<div class="col-4">
 <!-- 현재시간 구현! -->
			<h1>
				<div class='Time' style :font-size="50px">
			</h1>
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
 </div>
        
    <!-- --------------------------- -->
    <div align="center">
    <button type="submit" class="form-control">추가하기</button>
<!--<input type="submit" value="출퇴신청하기">-->
</div>
</form>
</body>
</html>
<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>