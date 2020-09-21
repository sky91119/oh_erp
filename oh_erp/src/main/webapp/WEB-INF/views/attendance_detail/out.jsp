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
      background-color: #D27300;
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
      
      .col-2 search{
      display: inline-black;
      }
   }   
   
</style>


   
  <div class="row padding32-bot">
       <div class="col-2">
          <input type="date" class="form-control">
       </div>

    
    <div class="col-2 sum-request" >
   
        <!--input class="form-control background-color: #3DB7CC" type="button" value="출근누락된 기록">-->
         
          <a href="<%=request.getContextPath()%>/attendance_detail/in">
        <input class="form-control" type="button" value="출근누락된 기록"></a>
         </div> 
         
             <div class="col-2">
         <input class="form-control btn btn-info" type="button" value="퇴근누락된 기록">
        
         
         </div> 
        
         
          <div class="col-2 ">
          
          
          </div>
         
        
         <div class="col-2">
                <select class="form-control" name="type" onchange="this.form.submit()">
               <option value="">다운로드</option>
               <option value="출퇴근기록">
               출퇴근기록</option>
               
               <option value="실급여정산">
               실급여정산</option>
               
            </select>
         
         </div> 
        
        
        <div class="col-2">
         <a href="<%=request.getContextPath()%>/attendance_detail/regist">
         <input class="form-control" type="button" value="+출퇴근기록생성하기"></a>
         
         </div> 
        
        
        </div>
        
        
        <div class="row">

    <div class="col-2 search" class="form-control">
         <form action= "search" method="post">
          <select name = "type" class="form-control">
          <option value="member_code">사원번호</option>
          <option value="attendance_no">근태번호</option>
          </select>
   
          <input type = "text" name="keyword" placeholder="검색창" class="form-control">
     
          <input type = "submit" value="검색" class="form-control">
            
            </form>
   </div>
        
        
      
      <div class = "col-6">
      
      
      </div>
            
            
            
         </div>
         
        
       
     <div>
     
     <br>
        <table class="table left-font">
    <thead>
              <tr>
   
   
    <th><a href="out?col=attendance_no&order=desc">근태번호</a></th>   
    <th><a href="out?col=member_code&order=desc">사원번호</a></th>
   <th><a href="out?col=member_name&order=desc">성명</a></th>
   <th>출근시간</th>
   <th>퇴근시간</th>
   <th>근무노트</th>
   
   <th>   </th>
    <th>   </th>
 
  
  </tr>
  </thead>
  <tbody>
   
      <c:forEach var="Attendance_detailListVo" items="${list}">
         <tr>
            <td>${Attendance_detailListVo.attendance_no}</td>            
            <td>${Attendance_detailListVo.member_code}</td>            
            <td>${Attendance_detailListVo.member_name}</td>
            <td>${Attendance_detailListVo.attendance_in}</td>
            <td>${Attendance_detailListVo.attendance_out}</td>
            <td>${Attendance_detailListVo.attendance_note}</td>
     
            
             <td>
            <a href ="edit/${Attendance_detailListVo.attendance_no}">수정</a>
            </td>           
            <td>
            <a href ="delete/${Attendance_detailListVo.attendance_no}">삭제</a>
            </td>
         </tr>
      </c:forEach>
   </tbody>
   </table>
</div>
</div>