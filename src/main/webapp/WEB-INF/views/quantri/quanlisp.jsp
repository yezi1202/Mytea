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
<meta charset="UTF-8">
<title>admin</title>

<jsp:include page="/WEB-INF/views/common/variables.jsp"></jsp:include>
<jsp:include page="/WEB-INF/views/quantri/layout/css.jsp"></jsp:include>

</head>
<body>
	<div class="main">
		<jsp:include page="/WEB-INF/views/quantri/layout/meu.jsp"></jsp:include>
		<div class="content">
			<div class="header">
				<div class="form_search">
					<h3>Trang quản lí sản phẩm</h3>
				</div>
				<jsp:include page="/WEB-INF/views/quantri/layout/acc.jsp"></jsp:include>
			</div>
			
			<jsp:include page="/WEB-INF/views/quantri/layout/listsanpham.jsp"></jsp:include>
			
		</div>
	</div>
</body>
<jsp:include page="/WEB-INF/views/quantri/layout/js.jsp"></jsp:include>
<script src="${base }/user/js/jquery.simplePagination.js"></script>
<script>
/* $("#demo").change(function () {
	   var value = $(this).val();
	   if ($(this).is(":checked")) {
	       alert("true");
	    }
	    else {
	        alert("false");
	     }
	}); */
	//trạng thái
	function trangthai(pid) {
		//console.log(pid);
		var stat = true;
		if ($('#'+pid).is(":checked")) {
			stat = true;
		} else {
			stat = false;
		}
		//console.log(stat);
	let data = { // lay theo id
		id:pid,
		status:stat,
	};
	jQuery.ajax({
		url: "/admin/status/sanpham", //->action
		type: "post",
		contentType: "application/json",
		data: JSON.stringify(data),

		dataType: "json", // kieu du lieu tra ve tu controller la json
		success: function(jsonResult) {
			console.log(jsonResult.tb);
			if(jsonResult.tb){
				alert("Đã cập nhật trạng thái!")
			}else {
				alert("Lỗi!")
			}
			
			
		},
		error: function(jqXhr, textStatus, errorMessage) {

		}
	});
};
	
$( document ).ready(function() {
	$("#categoryId").val(${searchModel.categoryId});
	$("#paging").pagination({
		currentPage: ${product.currentPage},
        items: ${product.totalItems},
        itemsOnPage: 8,
        cssStyle: 'dark-theme',
        onPageClick: function(pageNumber, event) {
        	$('#page').val(pageNumber);
        	$('#btnSearch').trigger('click');
		},
    });
});
</script>
</html>