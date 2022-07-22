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
	<jsp:include page="/WEB-INF/views/nguoidung/layout/cart/order.jsp"></jsp:include>
</body>
<jsp:include page="/WEB-INF/views/nguoidung/layout/js.jsp"></jsp:include>
<script>
function xacnhan(poId) {
	var text = "Bạn đã nhận được mặt hàng này?";
	if(confirm(text)){
		
		let data = {
				id: poId, 
			};
			jQuery.ajax({
				url: "/tinhtrang", //->action
				type: "post",
				contentType: "application/json",
				data: JSON.stringify(data),

				dataType: "json", // kieu du lieu tra ve tu controller la json
				success: function(jsonResult) {
					alert(jsonResult.tb);
					$('#'+poId).html(jsonResult.ht);
					
				},
				error: function(jqXhr, textStatus, errorMessage) {
					
				}
			});
	}
}
</script>

</html>