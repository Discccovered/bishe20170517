var queryList = '/bishe/user/userAction_getArticleList.action';

var pageSize = 10;
var pageNum = 0;
var totalNum = 0;

refreshOrderTable();

// 每页显示多少条数
function refreshOrderTable() {
	var perpage = $('.perpage').val();
	pageSize = perpage;
	refreshTablePage("1", perpage);
}
// 翻页刷新
function refreshForPageChange() {
	var perpage = $('.perpage').val();
	pageSize = perpage;
	refreshTablePage("0", perpage);
}

/*
 * 用服务器刷新列表页面 1刷新页码， 0翻页不刷新页码
 */                 
function refreshTablePage(refreshPage, pageSize) {
	var total_num;// total_num暂时写死 ，后期需要从后台获取
	ajaxPost(queryList, {
		"page" : curPage,
		"rows" : pageSize
	}, function(data) {
		total_num = data.rowNum;
		console.log(data);
		queryOrderCallBack(data);
		if (refreshPage == "1") {
			initPageNum(total_num, pageSize);
			$('#total_num').text(total_num);
			$('#pageCtr1').css('width', 'auto');
		}
	});
}
// 查询列表服务器返回处理
function queryOrderCallBack(data) {
	if (data.status == "1") {
		var tableHtml = '';
		tableHtml = dealPage(tableHtml, data.data);
		$("#detailTab").html(tableHtml);
	}
}
/**
 * 
 * @param tableHtml
 *            要替换的内容
 * @param data
 *            服务器返回的信息
 * @returns
 */
function dealPage(tableHtml, data) {
	console.log(data);
	tableHtml += '<thead><tr>' + '<th>文章编号</th>' + '<th>标题</th>'
			+ '<th>作者</th>' + '<th>写作时间</th>' + '<th>浏览量</th>'+'<th>文件类型</th>'
			 + '<th></th>' + '</tr>'
			+ '</thead>';
	for (var i = 0; i < data.length; i++) {
		tableHtml += '<tr>';
		tableHtml += '<td>' + data[i].articleid + '</td>';
		tableHtml += '<td>' + data[i].title + '</td>';
		tableHtml += '<td>' + data[i].author + '</td>';
		tableHtml += '<td>' + formatdate(data[i].createtime) + '</td>';
		tableHtml += '<td>' + data[i].credit + '</td>';
		tableHtml += '<td>' + data[i].typename + '</td>';
		/*tableHtml += '<td>' + data[i].registerfund + '</td>';
		tableHtml += '<td>'
				+ moment(data[i].registertime).format('YYYY-MM-DD HH:mm')
				+ '</td>';*/
		tableHtml += '<td><span><button class="btn btn-link" type="button" value="'	+ data[i].articleid+ '"  onclick="showArticle(this.value)" >修改</button></span><span><button class="btn btn-link " type="button" onclick="deleteRow(this.value)" value="'
		+ data[i].articleid + '">删除</button></span></td>';
		tableHtml += '</tr>';
	}
	return tableHtml;
}

function showArticle(data){
	var result ;
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
			$("#articleid").text(data.article.articleid);
			$("#articletitle").val(data.article.title);
			$("#articletype").val(data.article.type);
			$("#articleparagraph").val(data.article.paragraph);
			$("#articleauthor").text(data.article.author);
			result=data.article.type;
		}
	});
	$.ajax({
		url:"/bishe/user/userAction_getArticleType.action", 
		type : "post",
		data : {},
		async: false,
		dataType : "json",
		cache : false,
		success:function(data){
			var province="";
			for(var i=0;i<data.data.length;i++){
				if(result==data.data[i].articletype){
					province+="<option value='"+data.data[i].articletype+"' selected='selected'>"+data.data[i].typename+"</option>";
				}else{
					province+="<option value='"+data.data[i].articletype+"'>"+data.data[i].typename+"</option>";
				}
			}
			$('#articletype').html(province);
		}
	})
	$("#myModal").modal("show");
}

function alterArticleType(){
	var url="/bishe/user/userAction_alterArticleType.action";
	ajaxPost(url, {
		"article.articleid":$("#articleid").text(),
		"article.title":$("#articletitle").val(),
		"article.type":$("#articletype").val(),
		"article.paragraph":$("#articleparagraph").val(),
		"article.author":$("#articleauthor").text(),
	},function(data){
		console.log(data);
		if(data.status=='1'){
			alert("修改成功");
			$('.right-main').load('/bishe/admin/tmp3.jsp');
		}else{
			alert("修改失败");
		}
	});
	
	$("#myModal").attr("data-dismiss","modal");
	$("#myModal").modal("hide");
}

function formatdate(data){
	if(data!=null&&data.trim()!=""){
		var pattern = /(\d{4})(\d{2})(\d{2})(\d{1})(\d{2})(\d{2})(\d{2})/;
		var formatedDate = data.replace(pattern, '$1-$2-$3 $5:$6:$7');
		return formatedDate;
	}
	return "";
}

function deleteRow(data){
	var url="/bishe/user/userAction_deleteArticleById.action";
	ajaxPost(url, {
		"articleid" : data
	},function(data){
		console.log(data);
		if(data.status=='1'){
			alert("删除成功");
			$('.right-main').load('/bishe/admin/tmp3.jsp');
		}else{
			alert("删除失败");
		}
	});
}


function viewCertify(data){
		console.log(data);
		$('.img').attr("src",data);
	    $('.bg_img').show();
	    $('.img').show();
}



$(document).ready(function(){
	$('.img').click(function(){
	    $('.bg_img').hide();
	    $('.img').hide();
	});
})


