<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<jsp:include page="/WEB-INF/views/template/header.jsp"></jsp:include>

<style>

/*마진*/	
	.margin100 {
		margin: 100px 100px 100px 100px;
	}
	
/*패딩*/
	.padding32 {
		padding:32px;
	}	

/*제목*/
	.title{
		font-size: 25px;
		padding-bottom:15px;
        }

</style>

<div class="padding32 container-fluid">
	<div>
		<p class="title">요청 관리</p>
	</div>
    <div class="row">
    	<div class="col-3">
    		<input type="date" class="form-control">
    	</div>
		<div class="col-3">
			<select class="form-control">
				<option>모든 요청들</option>
				<option>승인이 필요한 요청들</option>
				<option>완료된 요청들</option>
			</select>
        </div>
        <div class="col-6">
        	<span>총 요청수 : 3</span>
        </div>

        </div>
	
</div>



<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>