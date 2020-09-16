<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
 <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
 
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
		align:right;
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
		
		
		.add{
		font-size:16px;
		text-align:right;
		}
		
		.search{
		display: inline-black;
		}
	}	
	
</style>

<div class="container-fluid">

<div>
    <p class="title">통계</p>
    
    
<div class="row padding32-bot">
    	<div class="col-4">
    	
    	</div>
    	
    	    <div class="col-4">
			<form action=${pageContext.rank_page.contextPath}/attendance_detail/rank_page method="post">
				<select class="form-control" name="type" onchange="this.form.submit()">
					<option value="날짜기록">
					날짜기록<br><br></option>
					<option value="뭘쓸까낭">
					뭘쓸까낭 </option>
				</select>
				
			</form>
		
			</div>

<div class="col-4 ">
			 </div>
			 
			 
			 
			 <div class="col-2 sum-request">
                <select class="form-control" name="type" onchange="this.form.submit()">
					<option value="">다운로드</option>
					<option value="성실대장랭킹">
					성실대장랭킹</option>
					
					<option value="지각대장랭킹">
					지각대장랭킹</option>
					
				</select>
             </div> 
             
              <div class="row">
            
            <div class="col-4 search" class="form-control">
         <form action= "search" method="post">
          <select name = "type" class="form-control">
          <option value="member_code">사원번호</option>
          <option value="attendance_date">근태번호</option>
          </select>
	
          <input type = "text" name="keyword" placeholder="검색창" class="form-control">
     
          <input type = "submit" value="검색" class="form-control">
				
				</form>
	</div>
	
	  
              
  <div class="col-1">
		
		<a href="<%=request.getContextPath()%>/attendance_detail/rank_page">
        <input class="form-control" type="button" value="목록"></a>
		</div>
		
		<div class = "col-6">
		
		
		</div>

</div>

<div class="row">

     <div class="col-12">
     
     <h1>이 달의 성실대장</h1>
     </div>
     
    <!--<div class="col-6">
     
     <h1>이 달의 지각대장</h1>
     </div>-->

</div>


   <div>
     <br>
     	<table class="table left-font">
    <thead>
     			<tr>
	
	<th>랭킹번호</th>
    <th>사원번호</th>
     <th>성명</th>
     <th>합계</th>
   
  </div>
  

  </tr>
  </thead>
  
  <tbody>
  <c:forEach var="Attendance_countDto" items="${count}">
  <tr>
  
  
  <td>랭킹</td>
  
  <td>Attendance_countDto.code</td>
     <td>Attendance_countDto.member_name</td>
    <td>Attendance_countDto.in_time</td>
     <td>Attendance_countDto.member_</td>
     <td></td>
     
   
   </tr>
   </c:forEach>
   </tbody>
   </table>
</div>
</div>
</div>
</div>

