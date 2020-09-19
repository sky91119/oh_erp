<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:include page="/WEB-INF/views/template/header.jsp"></jsp:include>

    회원정보 : ${sessionScope.userinfo}
    
    
<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>