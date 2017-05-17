/**
 * 
 */

$(function() {
	$("#login").click(function() {
		window.location.href = "login.jsp";
	})
	$("#register").click(function() {
		$("#myModal").modal("show");
	})
	$("#guanyuyangsheng").click(function() {
		$("#right_page").load("guanyuyangsheng.jsp");
	})
	$("#shouye").click(function() {
		$("#right_page").load("shouye.jsp");
	});
	$("#right_page").load("shouye.jsp");
	$('body').prop({
		'scrollTop' : '0'
	}, 1000);
	$('#submitregister').click(function() {
		alert("tttt");
		console.log($('inpurt[name="type"]'));
	});
	$('inpurt[name="type"]').change(function() {
		console.log("ttt");
	});

/*	var pattern = /(\d{4})(\d{2})(\d{2})(\d{2})(\d{2})(\d{2})/;
	var formatedDate = "20170517150821".replace(pattern, '$1-$2-$3 $4:$5:$6');
	console.log(formatedDate);
	console.log(formatdate("20170517150821"));*/
	/*
	 * $("#writearticle").click(function(){ console.log("write article");
	 * $("#right_page").load("edit.jsp"); })
	 */
	console.log($("#usercontainer").val());
	modifyHtml();
	console.log($("#articleparagraph").val());
	
	
})

function validatet() {
	return $("#insertarticleform").validate({
		rules : {
			articletitle : "required",
			articleparagraph : {
				required : true,
				minlength : 10
			}
		},
		messages : {
			articletitle : "请输入标题",
			articleparagraph : {
				required : "请输入内容",
				minlength : jQuery.format("密码不能小于{0}个字 符")
			}
		}
	});
}

function loginout(){
	console.log("login out");
	$.ajax({
		type : "post",
		data : {
			"keyword" : $("#keyword").val()
		},
		async: false,
		dataType : "json",
		url : "/bishe/user/userAction_loginout.action",
		cache : false,
		success : function(data) {
			window.location.href="index.jsp";
		}
	});
}

function searchArctile() {
	$.ajax({
		type : "post",
		data : {
			"keyword" : $("#keyword").val()
		},
		async: false,
		dataType : "json",
		url : "/bishe/user/userAction_search.action",
		cache : false,
		success : function(data) {
			console.log(data);
			/*var str = "";
		    for(var i=0;i<data.articleList.length;i++){
		    	var dat = formatdate(data.articleList[i].createtime);

		     str += '<div class="b-blog-listing__block">' +
		                '<div class="b-blog-listing__block-top">    ' +
		                    '<h4><button class="btn btn-link" onclick="searchArticleById('+data.articleList[i].articleid+')">'+data.articleList[i].title+'</button><h4>    ' +
		                '</div>   ' +
		                '<div class="b-infoblock-with-icon b-blog-listing__infoblock">   ' +
		                    ' <div class="b-infoblock-with-icon__info f-infoblock-with-icon__info">  ' +
		                        ' <div class="f-infoblock-with-icon__info_text b-infoblock-with-icon__info_text f-primary-b b-blog-listing__pretitle">   ' +
		                            'By <button onclick="searchArticleWithAuthor('+data.articleList[i].author+')"  class="btn btn-link f-more">'+data.articleList[i].author+'</button> In <button onclick="seachArticleWithType('+data.articleList[i].type+')"  class="btn btn-link f-more">'+data.articleList[i].type+'</button> ' +
		                             '发表时间 '+formatdate(data.articleList[i].createtime)+
		                             '<a href="#" class="f-more b-blog-listing__additional-text f-primary"><i class="fa fa-comment"></i>'+data.articleList[i].credit+' Comments</a>' +
		                        '</div>' +
		                    '<div class="f-infoblock-with-icon__info_text b-infoblock-with-icon__info_text c-primary b-blog-listing__text" style=" height:20px;white-space:nowrap;text-overflow:ellipsis;-o-text-overflow:ellipsis;overflow: hidden;"> ' +
		        data.articleList[i].paragraph+'</div>' +
		                        '<div class="f-infoblock-with-icon__info_text b-infoblock-with-icon__info_text"> ' +
		                            '  <button onclick="searchArticleById('+data.articleList[i].articleid+')" class="btn btn-link f-more f-primary-b">查看全文</button>' +
		                        ' </div>' +
		                    '</div>' +
		                '</div>' +
		        '</div>';
		    }*/
			$("#right_page").html(formHtml(data));
		}
	});
}

function searchArticleWithAuthor(){
	console.log("searchArticleWithAuthor");
	$.ajax({
		url:"/bishe/user/userAction_searchArticleWithAuthor.action",
		cache:false,
		dataType:"json",
		data:{"author":$("#authorBtn").val()},
		type:"post",
		success:function(data){
			console.log(data);
			$("#right_page").html(formHtml(data));
		}
	});
}
function seachArticleWithType(data){
	console.log("searchArticleWithAuthor");
	$.ajax({
		url:"/bishe/user/userAction_seachArticleWithType.action",
		cache:false,
		dataType:"json",
		data:{"type":data},
		type:"post",
		success:function(data){
			console.log(data);
			$("#right_page").html(formHtml(data));
		}
	});
}

function chatting(){
	$("#right_page").load("chatting.jsp");
}

function formHtml(data){
	var str = "";
	for(var i=0;i<data.articleList.length;i++){
		/*var dat = formatdate(data.articleList[i].createtime);*/
		
		str += '<div class="b-blog-listing__block">' +
		'<div class="b-blog-listing__block-top">    ' +
		'<h4><button class="btn btn-link h4 f-infoblock-with-icon__info_title b-infoblock-with-icon__info_title f-primary-l b-title-b-hr f-title-b-hr"  onclick="searchArticleById('+data.articleList[i].articleid+')">'+data.articleList[i].title+'</button></h4>    ' +
		'</div>   ' +
		'<div class="b-infoblock-with-icon b-blog-listing__infoblock">   ' +
		' <div class="b-infoblock-with-icon__info f-infoblock-with-icon__info">  ' +
		' <div class="f-infoblock-with-icon__info_text b-infoblock-with-icon__info_text f-primary-b b-blog-listing__pretitle">   ' +
		'By <button onclick="searchArticleWithAuthor()" id="authorBtn" value="'+data.articleList[i].author+'" class="btn btn-link f-more">'+data.articleList[i].author+'</button> In <button onclick="seachArticleWithType(this.value)" value="'+data.articleList[i].type+'" class="btn btn-link f-more">'+data.articleList[i].typename+'</button> ' +
		'发表时间 '+formatdate(data.articleList[i].createtime)+
		'<a href="#" class="f-more b-blog-listing__additional-text f-primary"><i class="fa fa-eye"></i>'+data.articleList[i].credit+' Views</a>' +
		'</div>' +
		'<div class="f-infoblock-with-icon__info_text b-infoblock-with-icon__info_text c-primary b-blog-listing__text" style=" height:20px;white-space:nowrap;text-overflow:ellipsis;-o-text-overflow:ellipsis;overflow: hidden;"> ' +
		data.articleList[i].paragraph+'</div>' +
		'<div class="f-infoblock-with-icon__info_text b-infoblock-with-icon__info_text"> ' +
		'  <button onclick="searchArticleById('+data.articleList[i].articleid+')" class="btn btn-link f-more f-primary-b">查看全文</button>' +
		' </div>' +
		'</div>' +
		'</div>' +
		'</div>';
	}
	return str;
}

function searchArticleById(data){
	$.ajax({
		url : "/bishe/user/userAction_searchArticleById.action",
		type : "post",
		data : {
			"articleid" : data
		},
		async: false,
		dataType : "json",
		cache : false,
		success:function(data){
			console.log(data);
			var title = data.article.title;
			var paragraph = data.article.paragraph;
			var count=0;
			var st = "<p class='lead'>";
			var temp = paragraph.split("。");
			$.each(temp,function(i,val){
				count++;
				st+=val;
				if(count%5==0){
					st+="。</p><p class='lead'>";
				}
			});
			st+="</p>";
			var content =' <div class="b-blog-listing__block">		' +
            '		<div class="b-blog-listing__block-top">          ' +
            '              <div class="text-center h2">          ' +
                       '    '+title+'                              ' +
                       '    </div>                                     ' +
         '             </div>                 ' +
               '       <div class="b-infoblock-with-icon b-blog-listing__infoblock">     ' +
       '                   	<div id="paragraph">          ' +
                       '           '+st+'   		                        ' +
                           '	</div>    ' +
       '                </div>              ' +
           '      </div>';
			$("#right_page").html(content);
		}
	})
}

function formatdate(data){
	if(data!=null&&data.trim()!=""){
		var pattern = /(\d{4})(\d{2})(\d{2})(\d{1})(\d{2})(\d{2})(\d{2})/;
		var formatedDate = data.replace(pattern, '$1-$2-$3 $5:$6:$7');
		return formatedDate;
	}
	return "";
}


function writearticle() {
	$("#myModal").modal("show");
}

function clearmodal() {
	$('#myModal input:text').val("");
	$('#myModal textarea').val("");
}

function insertArticle() {
	if (validatet().form()) {

		var title = $("#articletitle").val();
		var paragraph = $("#articleparagraph").val();
		var articletype = $("#articletype").val();
		console.log($("#articleparagraph"));
		console.log(paragraph);
		$.ajax({
			type : "post",
			data : {
				"article.title" : title,
				"article.paragraph" : paragraph,
				"article.type" : articletype,
				"article.author" : $("#storeusername").val()
			},
			dataType : "json",
			url : "/bishe/user/userAction_write.action",
			cache : false,
			success : function(data) {
				console.log(data);
				if (data.status == "1") {
					window.location.href = "index.jsp";
					clearmodal();
					alert("发表成功");
				} else {
					alert(data.msg);
				}
				$("#myModal").modal("hide");
			}
		});
	}
}

function modifyHtml() {
	var check = checkUser();
	console.log(check);
	if (check) {
		$("#user").attr("data-toggle", "dropdown");
		$("#login").attr("hidden", "hidden");
	} else {
		console.log("none user");
		// $("#user").attr("disabled","disabled");
		$("#login").removeAttr("hidden");
		$("#user").attr("data-toggle", "");
	}
}

function checkUser() {
	var user = $("#usercontainer").val();
	if (user == null || user.trim() == '') {
		return false;
	} else {
		return true;
	}
}

function showModal() {
	$("#myModal").modal("show");
}

