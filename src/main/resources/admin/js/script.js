
$('#submenu_account').hide();
$('input[type="text"]');

var show_menu = true;
$(".btn_account").on('click', function(){
	if(show_menu == true){
		$('#submenu_account').show('slow');
		show_menu = false;
	}else{
		$('#submenu_account').hide('slow');
		show_menu = true;
	}

	// set đoạn text vào html
	// $('.container').text('Nội dung mới');
	// get nội dung text html
	var text = $('.container').text();
	console.log(text);

	// set nội dung html
	// $('.container').html('<h1>Cách thêm html vào html cha</h1>');
	// get html con vào html cha
	var htmlcon = $('.container').html();
	console.log(htmlcon);
});


$('#btn_save').on('click', function(){
	// get value của input, textarea, select
	var username = $('.input_username').val();
	var gender = $('.gender:checked').val();

	// tạc động đến css
	$('.input_username').css('background-color', 'red');

	// thêm class
	$('.gender:checked').addClass('radio_gender');

	// xóa class
	$('.input_username').removeClass('input_username');

	// xóa 1 phần tử html
	$('#password_confirm').remove();

	// tác đọng đến 1 thuộc tính bất kì
	$(this).attr('disabled', 'disabled');

	// lấy giá trị của thuộc tính
	var inputName = $('.input_fullname').attr('name');

	console.log('username', username);
	console.log('gender', gender);
	$('#form_insert').submit();
});

$('#form_insert').validate({
	rules : {
		fullname: 'required',
		username: {
			required: true,
			email: true
		}
	},
	messages: {
		fullname: 'Vui lòng nhập họ tên',
		username: {
			required: 'Vui lòng nhập tài khoản',
			email: 'Vui lòng nhập đúng định dạng email'
		}
	}
});