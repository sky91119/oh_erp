<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<jsp:include page="/WEB-INF/views/template/header.jsp"></jsp:include>   
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>    
    


<button type="button" class="btn btn-primary" data-toggle="modal" data-target="#myModal" style="margin:15px; padding:15px;">
<!--모달 버튼이름을 적어-->  
수정
</button>

<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" data-backdrop="static" align="left">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
<!--          <h4 class="modal-title" id="myModalLabel"></h4>-->
      </div>
      <div class="modal-body">
   <h3> 부서수정</h3>
<form action="${pageContext.request.contextPath}/department/${department_no}" method="post">
부서명<input type="text" name="department_name">
<!--  사용여부<input type="text" name="department_use">-->
<input type="submit" value="저장">
</form>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-dismiss="modal">닫기</button>
      </div>
    </div>
  </div></div>