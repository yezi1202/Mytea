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
<body style="background: white;">

	<!-- big screen nav -->
	<jsp:include page="/WEB-INF/views/nguoidung/layout/navbar.jsp"></jsp:include>
	<!-- end -->
	<jsp:include page="/WEB-INF/views/nguoidung/layout/taikhoan/dangnhap.jsp"></jsp:include>
</body>
<jsp:include page="/WEB-INF/views/nguoidung/layout/js.jsp"></jsp:include>

<script src="${base }/user/js/jquery.simplePagination.js"></script>
<script>
if(${tbal.length()>0}){
	alert(${tbal})
}
var m = true
$('#eye').click(function () {
	if(m){
		$('#password').attr('type','text');
		$('#eye').addClass("fa-eye-slash").removeClass("fa-eye");
		m=false;
	}else{
		$('#password').attr('type','password');
		$('#eye').addClass("fa-eye").removeClass("fa-eye-slash");
		m = true
	}
	
});



</script>
</html>