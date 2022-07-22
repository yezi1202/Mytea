<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!-- directive SPRING-FORM -->
<%@ taglib prefix="sf" uri="http://www.springframework.org/tags/form"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Mytea</title>
<jsp:include page="/WEB-INF/views/common/variables.jsp"></jsp:include>
<jsp:include page="/WEB-INF/views/nguoidung/layout/css.jsp"></jsp:include>

</head>
<body>

	<!-- big screen nav -->
	<jsp:include page="/WEB-INF/views/nguoidung/layout/navbar.jsp"></jsp:include>
	<!-- end -->
	<!-- carousel -->

	<!-- end -->
	<!-- product-hot -->
<jsp:include page="/WEB-INF/views/nguoidung/layout/home/product_hot.jsp"></jsp:include>
	



</body>
<jsp:include page="/WEB-INF/views/nguoidung/layout/js.jsp"></jsp:include>

</html>