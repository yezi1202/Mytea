$(document).ready(function() {


	if ($('.slider').length) {
		var viewedSlider = $('.slider');

		viewedSlider.owlCarousel(
			{
				loop: true,
				autoplay: true,
				autoplayTimeout: 4000,
				nav: false,
				dots: false,
				responsive:
				{
					0: { items: 1 },
					575: { items: 2 },
					768: { items: 3 },
				}

			});

		if ($('.bbb_viewed_prev').length) {
			var prev = $('.bbb_viewed_prev');
			prev.on('click', function() {
				viewedSlider.trigger('prev.owl.carousel');
			});
		}

		if ($('.bbb_viewed_next').length) {
			var next = $('.bbb_viewed_next');
			next.on('click', function() {
				viewedSlider.trigger('next.owl.carousel');
			});
		}
	}


});

// Thêm sản phẩm vào trong giỏ hàng
function AddToCart(baseUrl, productId, quanlity) {
	console.log(quanlity)
	//	alert(productId);
	// javascript object.  data la du lieu ma day len action cua controller
	let data = {
		productId: productId, // lay theo id
		quanlity: quanlity, // lay theo id
	};

	// $ === jQuery
	// json == javascript object
	jQuery.ajax({
		url: baseUrl + "/cart", //->action
		type: "post",
		contentType: "application/json",
		data: JSON.stringify(data),

		dataType: "json", // kieu du lieu tra ve tu controller la json
		success: function(jsonResult) {
			if (jsonResult.tbkd != "" && jsonResult.tbkd != null) {
				alert(jsonResult.tbkd);
			}
			// tăng số lượng sản phẩm trong giỏ hàng trong icon
			$("#checkcart_items").html(jsonResult.totalItems);
			$(".totalprice").html(jsonResult.totalprice);
			$("#totalprice").val(jsonResult.totalprice);
			/*$([document.documentElement, document.body]).animate({
				scrollTop: $("#iconShowTotalItemsInCart").offset().top
			}, 2000);*/
		},
		error: function(jqXhr, textStatus, errorMessage) {

		}
	});
}

function UpdateCart(baseUrl, productId,qty) {
//alert(qty.replace(/\B(?=(\d{3})+(?!\d))/g, ',')+"đ")
	// javascript object.  data la du lieu ma day len action cua controller
	let data = {
		productId: productId, 
		quanlity: qty,
		
	};
	var m="";
	// $ === jQuery
	// json == javascript object
	jQuery.ajax({
		url: baseUrl + "/cart-updateQuanlityCart", //->action
		type: "post",
		contentType: "application/json",
		data: JSON.stringify(data),

		dataType: "json", // kieu du lieu tra ve tu controller la json
		success: function(jsonResult) {
			if(jsonResult.tbkd!=""&&jsonResult.tbkd!=null){
				alert(jsonResult.tbkd);
			}
			// tăng số lượng sản phẩm trong giỏ hàng trong icon
			$("#checkcart_items").html(jsonResult.totalItems);
			$(".totalprice").html(jsonResult.totalprice);
			
			$("#totalprice").val(jsonResult.totalprice);
			/*$([document.documentElement, document.body]).animate({
			    scrollTop: $("#iconShowTotalItemsInCart").offset().top
			}, 2000);*/
		},
		error: function(jqXhr, textStatus, errorMessage) {
			
		}
	});
}