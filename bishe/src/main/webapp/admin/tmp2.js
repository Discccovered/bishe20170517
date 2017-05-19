var queryList = '/hncm/company/company_getCompanyList.action';

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
	tableHtml += '<thead><tr>' + '<th>企业编号</th>' + '<th>企业名称</th>'
			+ '<th>企业类型</th>' + '<th>法定代表人</th>' + '<th>联系电话</th>'
			+ '<th>注册资金</th>' + '<th>注册时间</th>' + '<th></th>' + '</tr>'
			+ '</thead>';
	for (var i = 0; i < data.length; i++) {
		tableHtml += '<tr>';
		tableHtml += '<td>' + data[i].companyid + '</td>';
		tableHtml += '<td>' + data[i].companyname + '</td>';
		tableHtml += '<td>' + data[i].typename + '</td>';
		tableHtml += '<td>' + data[i].leagalperson + '</td>';
		tableHtml += '<td>' + data[i].contactphone + '</td>';
		tableHtml += '<td>' + data[i].registerfund + '</td>';
		tableHtml += '<td>'
				+ moment(data[i].registertime).format('YYYY-MM-DD HH:mm')
				+ '</td>';
		tableHtml += '<td><span><button class="btn btn-link" type="button" class="updateBtn" onclick="selectCompanyById('
				+ data[i].companyid
				+ ')" >修改</button></span><span><button class="btn btn-link btn-warning" type="button" onclick="updateRow('
				+ data[i].companyid + ')" data-toggle="modal" data-target="#myModal">删除</button></span></td>';
		tableHtml += '</tr>';
	}
	return tableHtml;
}

function refreshCityOrCourty(data){
	var ret;
	var url='/hncm/company/company_getArea.action';
	var code = {code:data};
	$.ajax({
		async:false,//ajax同步传输
		type:"post",
		cache:"false",
		data: code,
		dataType:"json",
		url:url,
		success : function(data){
			ret = data;
		}
	});
	return ret;
}

function refreshModule(datas){
	var url= '/hncm/company/company_getCompanyConfig.action';
	var initcode={code:"0000"};
	if(datas==null){
		datas={
				"province":"0",
				"companytype":"0",
				"city":"0"
		}
	}
	$.ajax({
		type:"post",
		cache:"false",
		data:initcode,
		dataType:"json",
		url:url,
		success:function(data){
			var companytype="<option></option>";
			for(var i=0;i<data.typeList.length;i++){
				if(datas.companytype==data.typeList[i].type){
					companytype+="<option value='"+data.typeList[i].type+"' selected='selected'>"+data.typeList[i].typename+"</option>";
				}else{
					companytype+="<option value='"+data.typeList[i].type+"'>"+data.typeList[i].typename+"</option>";
				}
			}
			$('#companytype').html(companytype);
			
			var province="<option></option>";
			for(var i=0;i<data.areaList.length;i++){
				if(datas.province==data.areaList[i].code){
					province+="<option value='"+data.areaList[i].code+"' selected='selected'>"+data.areaList[i].name+"</option>";
				}else{
					province+="<option value='"+data.areaList[i].code+"'>"+data.areaList[i].name+"</option>";
				}
			}
			$('#province').html(province);
			
			var citylist = refreshCityOrCourty(datas.province);
			var city="<option></option>";
			for(var i=0;i<citylist.areaList.length;i++){
				if(datas.city==citylist.areaList[i].code){
					city+="<option value='"+citylist.areaList[i].code+"' selected='selected'>"+citylist.areaList[i].name+"</option>";
				}else{
					city+="<option value='"+citylist.areaList[i].code+"'>"+citylist.areaList[i].name+"</option>";
				}
			}
			$('#city').html(city);
			
			var courtylist = refreshCityOrCourty(datas.city);
			var courty="<option></option>";
			for(var i=0;i<courtylist.areaList.length;i++){
				if(datas.courty==courtylist.areaList[i].code){
					courty+="<option value='"+courtylist.areaList[i].code+"' selected='selected'>"+courtylist.areaList[i].name+"</option>";
				}else{
					courty+="<option value='"+courtylist.areaList[i].code+"'>"+courtylist.areaList[i].name+"</option>";
				}
			}
			$('#courty').html(courty);
		}
	});
}



function selectCompanyById(data){
	var companyId={"companyid":data};
	var singleRow = '/hncm/company/company_getCompanyById.action';
	$.ajax({
		type:"post",
		cache:"false",
		data: companyId,
		dataType:"json",
		url:singleRow,
		success : function(data){
			var datas ={
					companytype:data.company.companytype,
					province:data.company.province,
					city:data.company.city,
					courty:data.company.courty
			};
			$('#companytype').val(data.company.companytype);
			$('#companyid').val(data.company.companyid);
			$('#companyname').val(data.company.companyname);
			$('#companytype').val(data.company.companyid);
			$('#contactphone').val(data.company.contactphone);
			$('#registerfund').val(data.company.registerfund);
			$('#registertime').val(data.company.registertime);
			$('#address').val(data.company.address);
			$('#leagalperson').val(data.company.leagalperson);
			$('#description').val(data.company.description);
			refreshModule(datas);
			$('#myModal').modal('show');  
			console.log(data);
		}
	});
}

function updateData() {
/*	var companyid=$('#companyid').val();
	var companyname=$('#companyname').val();
	var companytype=$('#companytype').val();
	var leagalperson=$('#leagalperson').val();
	var contactphone=$('#contactphone').val();
	var registerfund=$('#registerfund').val();
	var registertime=$('#registertime').val();
	var province=$('#province').val();
	var city=$('#city').val();
	var address=$('#address').val();
	var description=$('#description').val();
	var courty=$('#courty').val();*/
	/*{
			"company.companyid":companyid,
			"company.companyname":companyname,
			"company.companytype":companytype,
			"company.leagalperson":leagalperson,
			"company.contactphone":contactphone,
			"company.registerfund":registerfund,
			"company.registertime":registertime,
			"company.province":province,
			"company.city":city,
			"company.address":address,
			"company.description":description,
			"company.courty":courty
	}*/
	var url="/hncm/company/company_updateCompany.action";
	
	var datas= collectData();
	ajaxPost(url, datas, function(data) {
		if(data.status=="1"){
			alert("change success");
			$('#myModal').modal('hide');  
		}else{
			alert("something wrong");
		}
		
	});
}

function collectData(){
	var companyid=$('#companyid').val();
	var companyname=$('#companyname').val();
	var companytype=$('#companytype').val();
	var leagalperson=$('#leagalperson').val();
	var contactphone=$('#contactphone').val();
	var registerfund=$('#registerfund').val();
	var registertime=$('#registertime').val();
	var province=$('#province').val();
	var city=$('#city').val();
	var address=$('#address').val();
	var description=$('#description').val();
	var courty=$('#courty').val();
	 var datas={
			"company.companyid":companyid,
			"company.companyname":companyname,
			"company.companytype":companytype,
			"company.leagalperson":leagalperson,
			"company.contactphone":contactphone,
			"company.registerfund":registerfund,
			"company.registertime":registertime,
			"company.province":province,
			"company.city":city,
			"company.address":address,
			"company.description":description,
			"company.courty":courty
	}
	 return datas;
}

function insertData(){
	var datas = collectData();
	var url="/hncm/company/company_insertCompany.action";
	ajaxPost(url, datas, function(data) {
		if(data.status=="1"){
			alert("insert success");
			$('#myModal').modal('hide');  
		}else{
			alert("something wrong---");
		}
		
	});
}


$(document).ready(function(){
	$("#province").change(function(){
		var areaList = refreshCityOrCourty($("#province").val());
		var tmp="<option></option>";
		for(var i=0;i<areaList.areaList.length;i++){
			tmp+="<option value='"+areaList.areaList[i].code+"'>"+areaList.areaList[i].name+"</option>";
		}
		$('#courty').empty();
		$('#address').val("");
		$('#city').empty();
		$('#city').html(tmp);
	})
	$("#city").change(function(){
		var areaList = refreshCityOrCourty($("#city").val());
		var tmp="<option></option>";
		for(var i=0;i<areaList.areaList.length;i++){
			tmp+="<option value='"+areaList.areaList[i].code+"'>"+areaList.areaList[i].name+"</option>";
		}
		$('#courty').empty();
		$('#courty').html(tmp);
	})
	
	/*$('#updatebutton').click(function(){
		var companyid=$('#companyid').val();
		var companyname=$('#companyname').val();
		var companytype=$('#companytype').val();
		var leagalperson=$('#leagalperson').val();
		var contactphone=$('#contactphone').val();
		var registerfund=$('#registerfund').val();
		var registertime=$('#registertime').val();
		var province=$('#province').val();
		var city=$('#city').val();
		var address=$('#address').val();
		var description=$('#description').val();
		var courty=$('#courty').val();
		var url="/hncm/company/company_updateCompany.action";
		
		var datas={
				"company.companyid":companyid,
				"company.companyname":companyname,
				"company.companytype":companytype,
				"company.leagalperson":leagalperson,
				"company.contactphone":contactphone,
				"company.registerfund":registerfund,
				"company.registertime":registertime,
				"company.province":province,
				"company.city":city,
				"company.address":address,
				"company.description":description,
				"company.courty":courty
		}
		ajaxPost(url, datas, function(data) {
			if(data.status=="1"){
				alert("change success");
				$('#myModal').modal('hide');  
			}else{
				alert("something wrong");
			}
			
		});
	})*/
	
	$("#addbtn").click(function(){
		$('#myModal').modal('show');  
		$('#myModal input:text').val("");
		$('#myModal textarea').val("");
		refreshModule(null);
		$('#updatebutton').click(function(){
			insertData();
		});
	});
	
	$(".updateBtn").click(function(){
		$('#updatebutton').click(updateData());
	})
})


