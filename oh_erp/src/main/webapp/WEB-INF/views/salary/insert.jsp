<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<jsp:include page="/WEB-INF/views/template/header.jsp"></jsp:include>

<script>
// function check(){
// 	var url = location.search.substr(location.search.indexOf("?") + 1);
//     console.log(url);
//     if(url=='error') {
//        history.replaceState({}, null, location.pathname);
//        alert("동일기간에 이미 생성된 급여가 있습니다"+
//     		   "급여를 생성하시겠습니까?");
//     }
// }

// function apply_check(){    
//     var result = confirm("등록하시겠습니까?");
//      if (!result){ 
//         return false;
//      }
//      else{
//         document.form.submit();
//         }
//      }

// window.onload=check;

// function sampleModalPopup(){
//     // 팝업 호출 url
//     var url = "${pageContext.request.contextPath}/salary/list";
    
//     // 팝업 호출
//     $("#sampleModalPopup > .modal-dialog").load(url, function() { 
//         $("#sampleModalPopup").modal("shown"); 
//     });
// }

</script>


<div align="left">
<button type="button" class="btn btn-primary" data-toggle="modal" data-target="#myModal" style="margin:15px; padding:5px;">
  신규
</button>
</div>
<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" data-backdrop="static" align="left">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
      </div>
      <div class="modal-body">
    <form action="insert" method="post">
	<table>
	<h5>급여정보입력</h5>
	<p></p>
		<tr>
			<td>귀속연월</td>
			<td><input type="month" class="form-control" id="salary_date" name="salary_date">
			</td>
		</tr>
		<p></p>
		<tr>
			<td>급여구분</td>
			<td><select class="form-control" id="salary_sortation" name="salary_sortation">
					<option value="기본급">기본급</option>
					<option value="기본급+상여">기본급+상여</option>
			</select></td>
		</tr>
<p></p>
		<tr>
			<td>대상기간</td>

			<td><input type="date" class="form-control"
				name="salary_period_start" id="salary_period_start"></td>
			<td>&nbsp;/&nbsp;</td>
			<td><input type="date" class="form-control"
				name="salary_period_finish" id="salary_period_finish"></td>
		</tr>
		<p></p>
		<tr>
			<td>지급일</td>
			<td><input type="date" class="form-control" name="salary_payday" id="salary_payday"></td>
		</tr>
		<p></p>
		<tr>
			<td>급여대장명칭</td>
			<td><input type="text" class="form-control" name="salary_name" id="salary_name"></td>
		</tr>
		<p></p>
		<tr>
			<td>대상사원</td>
			<td><input type="checkbox" id="salary_member" name="salary_member" value="전체"> 
			<label for="salary_member">전체</label> 
			
			<select name="salary_member" id="salary_member" class="form-control" required>
<%--                 <option value="" ${param.majorSearch == '' ? 'selected':''}>사원 선택</option> --%>
				<option>사원 선택</option>
                <c:forEach var="memberDto" items="${member}">
                   <option value="${memberDto.member_code}">${memberDto.member_name}</option>
                </c:forEach>
            </select>
		</tr>
		<p></p>
		</div>
	</table>	
	<p></p>
		<input type="submit" value="저장" onclick="sampleModalPopup();">
</form>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-default" data-dismiss="modal">닫기</button>
      </div>
    </div>
  </div>
  </div>
</body>
</html>
<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>
