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
		/*text-align:left;*/
		align ="center"
		
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
		<p class="title">부서리스트</p>
	</div>
	
	<div class="row padding32-bot">
	
    	<div class="col-2">
    		<!-- <input type="date" class="form-control">-->
    	</div>
    	
    	<div class="col-2">
    		<!--부서 검색창 -->
<form action="search" method="post">

	<input type="text" name="keyword">
	
	
	<input type="submit" value="검색">
	
	<select name="type">
		<option value="department_no">부서코드</option>
		<option value="department_name">부서명</option>
		<option value="department_use">사용</option>
	</select>
	
</form>
    	</div>
    	
    	</div>
			 <div class="col-4 ">
			 
			 
			 </div>
			 
 </div>

<table class="table left-font">
    <thead>
     			<tr>
     		
     		<!-- ★여기다가 오름차순 내림차순 추가 -->
			<th>부서코드</th>
			<th>부서명</th>
			<th>사용</th>
		</tr>
	</thead>
	<tbody>
		<c:forEach var="DepartmentDto" items="${list}">
			<tr>
				<td>${DepartmentDto.department_no}</td>
				<td>${DepartmentDto.department_name}</td>
				<td>${DepartmentDto.department_use}</td>
			</tr>
		</c:forEach>
	</tbody>
</table>
