$().ready(function() {
	$("#login_form").validate({
		rules: {
			username: "required",
			password: {
				required: true,
				minlength: 5
			},
		},
		messages: {
			username: "请输入姓名",
			password: {
				required: "请输入密码",
				minlength: jQuery.format("密码不能小于{0}个字 符")
			},
		}
	});
	$("#register_form").validate({
		rules: {
			"user.username": "required",
			"user.password": {
				required: true,
				minlength: 5
			},
			rpassword: {
				equalTo: "#register_password"
			},
			"user.type": {
				required: true,
			}
		},
		messages: {
			username: "请输入姓名",
			password: {
				required: "请输入密码",
				minlength: jQuery.format("密码不能小于{0}个字 符")
			},
			rpassword: {
				equalTo: "两次密码不一样"
			},
			email: {
				required: "请输入邮箱",
				email: "请输入有效邮箱"
			}
		}
	});
});
$(function() {
	$("#register_btn").click(function() {
		$("#register_form").css("display", "block");
		$("#login_form").css("display", "none");
	});
	$("#back_btn").click(function() {
		$("#register_form").css("display", "none");
		$("#login_form").css("display", "block");
	});
	$("input[name='user.usertype']").change(function(){
		if($('input[name="user.usertype"]:checked').val()=='2'){
			$("#postfile").attr("disabled", "disabled");
			$("#postfile").attr("class", "form-control required");
		}
		if($('input[name="user.usertype"]:checked').val()=='1'){
			$("#postfile").removeAttr("disabled", "disabled");
			$("#postfile").attr("class", "form-control");
		}
		
	});
	$('#loginbtn').click(function(){
		var username=$('#loginusername').val();
		var password=$('#loginpassword').val();
		$.ajax({
			type:"post",
			data:{
				"user.username":username,
				"user.password":password
			},
			dataType:"json",
			url:"/bishe/user/userAction_login.action",
			cache:false,
			success:function(data){
				console.log(data);
				if(data.status=="1"){
					window.location.href="index.jsp";
				}else if(data.status=="0"){
					$("#prompt").removeAttr("hidden");
				}else if(data.status=="2"){
					window.location.href="admin/table.jsp";
				}else{
					alert("你的账号已被冻结");
				}
			}
		});
	});
	

});

