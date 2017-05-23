var queryList = '/bishe/user/userAction_getUserList.action';

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
	tableHtml += '<thead><tr>' + '<th>用户编号</th>' + '<th>用户名称</th>'
			+ '<th>身份</th>' + '<th>积分</th>' + '<th>用户状态</th>'
			 + '<th></th>' + '</tr>'
			+ '</thead>';
	for (var i = 0; i < data.length; i++) {
		tableHtml += '<tr>';
		tableHtml += '<td>' + data[i].userid + '</td>';
		tableHtml += '<td>' + data[i].username + '</td>';
		if(data[i].usertype=='1'){
			tableHtml += '<td>' + data[i].usertypename + '<button onclick="viewCertify(this.value)" value="'+data[i].file+'" class="btn btn-link">查看证书</button></td>';
		}else{
			tableHtml += '<td>' + data[i].usertypename + '</td>';
		}
		tableHtml += '<td>' + data[i].credit + '</td>';
		tableHtml += '<td>' + data[i].statusname + '</td>';
		/*tableHtml += '<td>' + data[i].registerfund + '</td>';
		tableHtml += '<td>'
				+ moment(data[i].registertime).format('YYYY-MM-DD HH:mm')
				+ '</td>';*/
		tableHtml += '<td><span><button class="btn btn-link" type="button" value="'	+ data[i].userid+ '"  onclick="forbidUserById(this.value)" >禁用</button></span><span><button class="btn btn-link " type="button" onclick="deleteRow(this.value)" value="'
		+ data[i].userid + '">删除</button></span></td>';
		tableHtml += '</tr>';
	}
	return tableHtml;
}

function deleteRow(data){
	var url="/bishe/user/userAction_deleteUserById.action";
	ajaxPost(url, {
		"userid" : data
	},function(data){
		console.log(data);
		if(data.status=='1'){
			alert("删除成功");
			$('.right-main').load('/bishe/admin/tmp2.jsp');
		}else{
			alert("删除失败");
		}
	});
}

function forbidUserById(data){
	var url="/bishe/user/userAction_forbidUserById.action";
	ajaxPost(url, {
		"userid" : data
	},function(data){
		console.log(data);
		if(data.status=='1'){
			alert("修改成功");
			$('.right-main').load('/bishe/admin//tmp2.jsp');
		}else{
			alert("修改失败");
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


