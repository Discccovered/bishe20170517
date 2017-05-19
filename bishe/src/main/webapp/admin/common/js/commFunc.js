
/**
 * 请任何人不要修改这个方法
 * 共通ajax提交
 * @param url
 * 		路径
 * @param params
 * 		参数
 * @param callback
 * 		回调函数
 * @return
 */
function ajaxPostWithoutLoad(url,params,callback) {
	$.ajax({
		url:url,
		data:params,
		type:"post",
		dateType:"text",
		success:function(data){
			callback(data);
			// message全部在message.js定义
//			alert(MsgObsbg001);
		},
		error:function(){
//			alert(MsgCommErr);
		}
	});
}


function ajaxPost(url,params,callback) {
	// $.loading(true);
	$.ajax({
		url:url,
		data:params,
		type:"post",
		dateType:"text",
		success:function(data){
			callback(data);
			// message全部在message.js定义
//			alert(MsgObsbg001);
		},
		complete:function(XHR, TS) {
			$.loading(false);
		},
		error:function(){
			alert(MsgCommErr);
		}
	});
}

function ajaxPostWithOutLoading(url,params,callback) {
	$.ajax({
		url:url,
		data:params,
		type:"post",
		dateType:"json",
		success:function(data){
			 callback(data);
			// message全部在message.js定义
//			alert(MsgObsbg001);
		},
		error:function(){
			alert(MsgCommErr);
		}
	});
}

function ajaxPost2(url,params,callback) {
	$.loading(true);
	$.ajax({
		url:url,
		data:params,
		type:"post",
		dateType:"json",
		success:function(data){
			 callback(data);
			// message全部在message.js定义
//			alert(MsgObsbg001);
		},
		complete:function(XHR, TS) {
			$.loading(false);
		},
		error:function(){
			alert(MsgCommErr);
		}
	});
}

/**
 * 共通跨域访问
 * @param url 路径
 * @param params 参数
 * @param callback 回调函数
 * @return
 */
function ajaxPost3(url,params,callback){
	$.loading(true);
	$.ajax({
		type:"get",
		async:false,
		url:url,
		data:params,
		dataType:'jsonp',
		jsonp: "jsonpCallback",
		success : function(data) {
			if(data.result){

				callback(data.result);
			}else{
				callback(data);
			}
		},
		complete:function(XHR, TS) {
			$.loading(false);
		},
		error : function() {
			alert(MsgCommErr);
		}
	});
}

/**
 * 共通跨域访问
 * 因为体验度，无需loading显示
 * @param url 路径
 * @param params 参数
 * @param callback 回调函数
 * @return
 */
function ajaxPost4(url,params,callback){
	$.ajax({
		type:"get",
		async:false,
		url:url,
		data:params,
		dataType:'jsonp',
		jsonp: "jsonpCallback",
		success : function(data) {
			if(data.result){

				callback(data.result);
			}else{
				callback(data);
			}
		},
		complete:function(XHR, TS) {
		},
		error : function() {
			alert(MsgCommErr);
		}
	});
}

/**
 *
 * @param url  提交表单地址
 * @param formId 提交表单ID
 * @param callback 回调的方法
 */
function ajaxPostForm(url,formId,callback,asyncFlg) {
	var params = $("#"+formId).serialize();
	$.loading(true);
	$.ajax({
		url:url,
		data:params,
		type:"post",
		dateType:"json",
		async: asyncFlg,
		success:function(data){
			eval('callback(data)');
			// message全部在message.js定义
//			alert(MsgObsbg001);
		},
		complete:function(XHR, TS) {
			$.loading(false);
		},
		error:function(){
			alert(MsgCommErr);
		}
	});
}
/**
 * 查询，page默认为1
 *
 * @return
 */
function queryDataWithSpecialForm(url,params,queryDataFunc,changePageFunc,dataTableId,pagediv,pageindex) {
	if(!dataTableId){
		dataTableId = "ajaxTable";
	}
	if(!pagediv){
		pagediv = "Pagination";
	}
	if(!pageindex){
		pageindex = "page";
	}
	ajaxPost(url,params,function(data){
		var tableHtml = '';
		// 查询时数据处理，页面信息加载
		tableHtml = eval(queryDataFunc+"(tableHtml,data)");
		$("#"+dataTableId).html(tableHtml);
		$("#"+pagediv).paginationHelper(data.total, data.page, data.rows, {
			callback: function(page_index) {
				$("#"+pageindex).val(page_index + 1);
				// 动态执行传入方法，进行翻页
				eval(changePageFunc+"()");
			}
		});
	});
}

function queryDataWithParam(url,params,queryDataFunc,changePageFunc,dataTableId,pagediv,pageindex) {
	if(!dataTableId){
		dataTableId = "ajaxTable";
	}
	if(!pagediv){
		pagediv = "Pagination";
	}
	if(!pageindex){
		pageindex = "page";
	}
	ajaxPost(url,params,function(data){
		var tableHtml = '';
		// 查询时数据处理，页面信息加载
		tableHtml = eval(queryDataFunc+"(tableHtml,data)");
		$("#"+dataTableId).html(tableHtml);
		$("#"+pagediv).paginationHelper(data.total, data.page, data.rows, {
			callback: function(page_index) {
				$("#"+pageindex).val(page_index + 1);
				// 动态执行传入方法，进行翻页
				eval(changePageFunc+"()");
			}
		});
	});
}

/**
 * 提交第一个form中的所有参数查询
 *
 * @param url
 *            要提交的url
 * @param queryDataFunc
 *            页面处理的方法名
 * @param changePageFunc
 *            执行翻页的方法名
 * @return
 */
function queryDataWithSpecialForm(url, queryDataFunc, changePageFunc,searchFormId,dataTableId,pagediv,pageindex) {
	var params;
	if(!searchFormId){
		params = $("form").serialize();
	}else{
		params = $("#"+searchFormId).serialize();
	}
	queryDataSpecial(url,params,queryDataFunc,changePageFunc,dataTableId,pagediv,pageindex);
}


/**
 * 查询，page默认为1
 * @return
 */
function queryData(url,params,queryDataFunc,changePageFunc,tableId,pagDiv) {
	ajaxPost(url,params,function(data){
		var tableHtml = '';
		//查询时数据处理，页面信息加载
		tableHtml = eval(queryDataFunc+"(tableHtml,data)");
		if(tableId != null && tableId != ''){
			$("#"+tableId).html(tableHtml);
		}else{
			$("#ajaxTable").html(tableHtml);
		}
		var PaginationId = "Pagination";
		if(pagDiv != null && pagDiv != ''){
			PaginationId = pagDiv
		}
		$("#"+PaginationId).paginationHelper(data.total, data.page, data.rows, {
			callback: function(page_index) {
				$("#page").val(page_index + 1);
				//动态执行传入方法，进行翻页
				eval(changePageFunc+"()");
			}
		});
	});
}

/**
 * 查询，page默认为1
 * @return
 */

function queryDataWithForm2(url, queryDataFunc, changePageFunc,tableId,pagDiv,pagDiv2,pageId) {
	var params = $("form").serialize();
	ajaxPost(url,params,function(data){
		var tableHtml = '';
		//查询时数据处理，页面信息加载
		tableHtml = eval(queryDataFunc+"(tableHtml,data)");
		if(tableId != null && tableId != ''){
			$("#"+tableId).html(tableHtml);
		}else{
			$("#ajaxTable").html(tableHtml);
		}
		var pageId2 = "#page";
		if(pageId != null && pageId != ''){
			pageId2 = "#" + pageId;
		}
		var PaginationId = "Pagination";
		if(pagDiv != null && pagDiv != ''){
			PaginationId = pagDiv;
		}
		$("#"+PaginationId).paginationHelper(data.total, data.page, data.rows, {
			callback: function(page_index) {
				$(pageId2).val(page_index + 1);
				//动态执行传入方法，进行翻页
				eval(changePageFunc+"()");
			}
		});
		var PaginationId2 = "Pagination2";
		if(pagDiv2 != null && pagDiv2 != ''){
			PaginationId2 = pagDiv2;
		}
		$("#"+PaginationId2).paginationHelper(data.total, data.page, data.rows, {
			callback: function(page_index) {
				$(pageId2).val(page_index + 1);
				//动态执行传入方法，进行翻页
				eval(changePageFunc+"()");
			}
		});
	});
}

/**
 * 查询，page默认为1
 * @return
 */
function queryDataSpecial(url,params,queryDataFunc,changePageFunc,dataTableId,pagediv,pageindex) {
	ajaxPost(url,params,function(data){
		var tableHtml = '';
		//查询时数据处理，页面信息加载
		tableHtml = eval(queryDataFunc+"(tableHtml,data)");
		$("#"+dataTableId).html(tableHtml);
		$("#"+pagediv).paginationHelper(data.total, data.page, data.rows, {
			callback: function(page_index) {
				$("#"+pageindex).val(page_index + 1);
				//动态执行传入方法，进行翻页
				eval(changePageFunc+"()");
			}
		});
	});
}

/**
 * 查询，page默认为1
 * @return
 */
function queryDataSpecial2(url, queryDataFunc, changePageFunc,searchFormId,dataTableId,pagediv,pageindex,pagediv2) {
	var params;
	if(!searchFormId){
		params = $("form").serialize();
	}else{
		params = $("#"+searchFormId).serialize();
	}
	ajaxPost(url,params,function(data){
		var tableHtml = '';
		//查询时数据处理，页面信息加载
		tableHtml = eval(queryDataFunc+"(tableHtml,data)");
		$("#"+dataTableId).html(tableHtml);
		$("#"+pagediv).paginationHelper(data.total, data.page, data.rows, {
			callback: function(page_index) {
				$("#"+pageindex).val(page_index + 1);
				//动态执行传入方法，进行翻页
				eval(changePageFunc+"()");
			}
		});
		$("#"+pagediv2).paginationHelper(data.total, data.page, data.rows, {
			callback: function(page_index) {
				$("#"+pageindex).val(page_index + 1);
				//动态执行传入方法，进行翻页
				eval(changePageFunc+"()");
			}
		});
	});
}

/**
* 提交第一个form中的所有参数查询
* @param url 要提交的url
* @param queryDataFunc 页面处理的方法名
* @param changePageFunc 执行翻页的方法名
* @return
*/
function queryDataWithForm(url, queryDataFunc, changePageFunc,tableId,paginationId) {
	var params = $("form").serialize();
	queryData(url,params,queryDataFunc,changePageFunc,tableId,paginationId);
}

function formatDateTime(dateString) {
	return new Date(dateString).format("yyyy-MM-dd hh:mm:ss");
}

function formatTime(dateString) {
	return new Date(dateString).format("hh:mm:ss");
}

function formatDate(dateString) {
	return new Date(dateString).format("yyyy-MM-dd");
}

/**
 * 将string转为日期格式
 * 默认格式为yyyy-MM-dd hh:mm:ss
 * @param format
 * @return
 */
String.prototype.stringToDateTime = function(format) {
	if (format == undefined) {
		return new Date(this).format("yyyy-MM-dd hh:mm:ss");
	} else {
		return new Date(this).format(format);
	}
}

/**
 * 日期格式化
 * @param format
 * @return
 */
Date.prototype.format = function(format) {
	var o = {
		"M+" : this.getMonth() + 1, // month
		"d+" : this.getDate(), // day
		"h+" : this.getHours(), // hour
		"m+" : this.getMinutes(), // minute
		"s+" : this.getSeconds(), // second
		"q+" : Math.floor((this.getMonth() + 3) / 3), // quarter
		"S" : this.getMilliseconds()
	// millisecond
	}

	if (/(y+)/.test(format)) {
		format = format.replace(RegExp.$1, (this.getFullYear() + "")
				.substr(4 - RegExp.$1.length));
	}

	for ( var k in o) {
		if (new RegExp("(" + k + ")").test(format)) {
			format = format.replace(RegExp.$1, RegExp.$1.length == 1 ? o[k]
					: ("00" + o[k]).substr(("" + o[k]).length));
		}
	}
	return format;
};

/**
 * 低版本ie不支持new Date()带参数，可以用此方法代替
 * @param {Object} str '1111-11-11' 或 '1111-11-11 11:11:11'
 * @return {TypeName}
 */
function newDate(str) {
	var years = str.split(' ')[0].split('-');
	var date = new Date();
	date.setUTCFullYear(years[0], years[1] - 1, years[2]);
	if (str.split(' ').length > 1) {
		var hours = str.split(' ')[1].split(':');
		var hour = 0;
		var min = 0;
		var sec = 0;
		if (hours[0]) {
			hour = hours[0]-8;
		}
		if (hours[1]) {
			min = hours[1];
		}
		if (hours[2]) {
			sec = hours[2];
		}
		date.setUTCHours(hour, min, sec, 0);
	} else {
		date.setUTCHours(0, 0, 0, 0);
	}
	return date;
}

//加载ztree树状结构
function showTree(getTreeUrl, idKey, pidKey, rootPId, ctgyTreeId, checkboxFlg) {
	$.ajax({
		url : getTreeUrl,
		type : "post",
		success : function(data) {
			var setting = {
				view : {
					dblClickExpand : false
				},
				data : {
					simpleData : {
						enable : true,
						idKey : idKey, // id
						pIdKey : pidKey, // 父节点id
						rootPId : rootPId // 根节点
					}
				},
				check:{
					chkStyle:"checkbox",
					chkboxType:{ "Y": "ps", "N": "ps" },
					enable:checkboxFlg
				},
				callback : {
					onClick : onClick
				}
			};
			$.fn.zTree.init($(ctgyTreeId), setting, data);
		},
		complete : function(data) {
			if(typeof zTreeOnAsyncSuccess  == 'function'){
				zTreeOnAsyncSuccess();
			}
		}
	});
}

//加载ztree树状结构
function showTreeByCondition(getTreeUrl, idKey, pidKey, rootPId, ctgyTreeId, checkboxFlg, params) {
	$.ajax({
		url : getTreeUrl,
		type : "post",
		data:params,
		success : function(data) {
			var setting = {
				view : {
					dblClickExpand : false
				},
				data : {
					simpleData : {
						enable : true,
						idKey : idKey, // id
						pIdKey : pidKey, // 父节点id
						rootPId : rootPId // 根节点
					}
				},
				check:{
					chkStyle:"checkbox",
					chkboxType:{ "Y": "ps", "N": "ps" },
					enable:checkboxFlg
				},
				callback : {
					onClick : onClick
				}
			};
			$.fn.zTree.init($(ctgyTreeId), setting, data);
		},
		complete : function(data) {
			if(typeof zTreeOnAsyncSuccess  == 'function'){
				zTreeOnAsyncSuccess();
			}
		}
	});
}

/**
 * 判断元素值为null或''
 * @param domId 元素id
 * @return
 */
function isNullOrEmpty(domId) {
	return $("#" + domId).val() == null || $("#" + domId).val() == "";
}

/**
 * 获取radio的值
 * @param RadioName
 * @return
 */
function getRadioValue(RadioName){
    var obj;
    obj = document.getElementsByName(RadioName);
    if(obj != null){
        var i;
        for(i = 0;i < obj.length;i++){
            if(obj[i].checked){
                return obj[i].value;
            }
        }
    }
    return null;
}

/**
 * 该方法用于将Undefined转换为空值
 *
 * @param val
 */
function convertUndefinedToEmpty(val) {

	if (undefined == val || null == val||typeof val == undefined || typeof val == 'undefined'|| 'undefined' == val) {
		val = "";
	}
	return val;
}

/**
 * 四舍五入，保留两位小数
 * @param num 数值
 * @return
 */
function twoSmallNumber(num) {
	var aa = Math.round(num*100)/100;
	if((aa+"").indexOf(".")==-1) {
		aa = aa + ".00";
	}
	return aa;
}

/**
 * 四舍五入，最多两位小数
 * @param num 数值
 * @return
 */
function twoSmallNumber2(num) {
	if (num != '' && !isNaN(num))
		return Math.round(num*100)/100;
	else
		return 0;
}

/**
 * 获取n位数字随机码
 * @param n
 * @return
 */
function generateMixed(n) {
	 var chars = ['0','1','2','3','4','5','6','7','8','9'];
     var res = "";
     for(var i = 0; i < n ; i ++) {
         var id = Math.ceil(Math.random()*9);
         res += chars[id];
     }
     return res;
}

/**
 * 全选与取消
 * @return
 */
function checkedAllClick(){
	if ($("#checkedAll").attr("checked") == true || $("#checkedAll").attr("checked") == "checked") { // 全选
			$("input[name='chkEachs']").each(function() {
				$(this).attr("checked", true);
			});
	} else { // 取消全选
			$("input[name='chkEachs']").each(function() {
				$(this).attr("checked", false);
			});
	}
}

function gotoMyShop() {
	ajaxPost4(pssbgPath + "/user_ajaxMyShop.do", {}, function(data){
		if(data=="isManager"){
			alert("管理员不能进行任何交易。");
			return;
		}
		if(data&&data.shopId!=''&& data.shopId!=undefined){
			window.location.href = pssPath + '/staticPage/shops/' + data.shopId + '.html?viewType=4';
		}else if(data.logisticsCompanyId!='' && data.logisticsCompanyId!=undefined){
			window.location.href = pssPath + '/pssM5005/pssM5005_enterCompany.do?lcai.logisticsCompanyId='+data.logisticsCompanyId;
		}
		else{
			alert("系统错误，请联系管理员。");
		}
	});
}

/*attType 1 img 2 mov
 * uploadPath ''表示未上传  已上传则写入上传路径
 * btnUpload  上传button ID
 * btnModify    修改button ID
 * btnDel        删除button ID
 * btnPreview  预览button ID
 */
function uploadInit(inOp,attType,uploadPath,btnUpload,btnModify,btnDel,btnPreview){
	if(!inOp.id){
		inOp.id = 'upLoadDiv';
	}
	var btnUploadId;
	var btnModifyId;
	var btnDelId;
	var btnPreviewId;

	if(undefined==btnUpload){
		btnUploadId='btnUpload';
	}else{
		btnUploadId=btnUpload;
	}
	if(undefined==btnModify){
		btnModifyId='btnModify';
	}else{
		btnModifyId=btnModify;
	}
	if(undefined==btnDel){
		btnDelId='btnDel';
	}else{
		btnDelId=btnDel;
	}
	if(undefined==btnPreview){
		btnPreviewId='btnPreview';
	}else{
		btnPreviewId=btnPreview;
	}
	var option = {};
	if(attType=='img'){
		option.imgExts = ['jpg','jepg','bmp','png'];
		option.filesize = 2000;//kb
		$('#' + inOp.id).html('<a href="#" id="'+btnUploadId+'">点击上传图片</a><a href="#" id="'+btnModifyId+'">替换|</a><a href="javascript:void(0);" id="'+btnDelId+'">删除|</a><a href="javascript:void(0);" id="'+btnPreviewId+'">查看</a>');
	}else if(attType=='mov'){
		option.imgExts = ['mp4','flv'];
		option.filesize = 10000;//kb
		$('#' + inOp.id).html('<a href="#" id="'+btnUploadId+'">上传视频</a><a href="#" id="'+btnModifyId+'">替换|</a><a href="javascript:void(0);" id="'+btnDelId+'">删除|</a><a href="javascript:void(0);" id="'+btnPreviewId+'">查看</a>');
	}else if (attType == 'att') {
		option.imgExts = ['jpg','jepg','bmp','png','doc','docx','pdf','xls','xlsx']; // 图片、word、pdf、excel
		option.filesize = 2000;//kb
		$('#' + inOp.id).html('<a href="#" id="'+btnUploadId+'">点击上传</a><a href="#" id="'+btnModifyId+'">替换|</a><a href="javascript:void(0);" id="'+btnDelId+'">删除|</a><a href="javascript:void(0);" id="'+btnPreviewId+'">查看</a>');
	}else if (attType == 'logo') {
		option.imgExts = ['jpg','jepg','bmp','png','doc','docx','pdf','xls','xlsx']; // 图片、word、pdf、excel
		option.filesize = 2000;//kb
		$('#' + inOp.id).html('<a href="#" id="'+btnUploadId+'">上传企业logo</a><a href="#" id="'+btnModifyId+'">替换|</a><a href="javascript:void(0);" id="'+btnDelId+'">删除|</a><a href="javascript:void(0);" id="'+btnPreviewId+'">查看</a>');
	}else if (attType == 'pre') {
		option.imgExts = ['jpg','jepg','bmp','png','doc','docx','pdf','xls','xlsx']; // 图片、word、pdf、excel
		option.filesize = 2000;//kb
		$('#' + inOp.id).html('<a href="#" id="'+btnUploadId+'">上传简介图片</a><a href="#" id="'+btnModifyId+'">替换|</a><a href="javascript:void(0);" id="'+btnDelId+'">删除|</a><a href="javascript:void(0);" id="'+btnPreviewId+'">查看</a>');
	}

	// add
	option.id =btnUploadId;
	var url = imageUploadPath+"/file-upload"+"?type=" + inOp.type;
	if(inOp.path){
		url = url + "&path=" + inOp.path;
	}
    option.url = url;
    option.submitCallback = function() {
    	$.loading(true);
    };
    option.callback = function(res){
    	$.loading(false);
    	if(inOp.callback){
    		inOp.callback(res);
    	}

    	if (!res || !res.ret) {
    		return;
    	}
//    	$('#'+btnPreviewId).bind("click",function(){
//    		window.open (imageUploadPath+ res.src + "?t=" + Math.random(),'newwindow','height=600,width=600,top=200,left=200,toolbar=no,menubar=no,scrollbars=no, resizable=no,location=no, status=no')
//    	});
    	$('#'+btnPreviewId).attr("href",imageUploadPath+ res.src + "?t=" + Math.random());
    	$('#'+btnPreviewId).attr("target","view_blank");
        $('#'+btnUploadId).hide();
        $('#'+btnModifyId).show();
        $('#'+btnDelId).show();
        $('#'+btnPreviewId).show();
    };

    if(inOp.imgExts){
    	option.imgExts = inOp.imgExts;
    }
    if(inOp.bindInputFileName){
    	option.bindInputFileName = inOp.bindInputFileName;
    }
    if(inOp.filesize){
    	option.filesize = inOp.filesize;
    }
    new AjaxUploadEx(option);

    // replace
    option.id = btnModifyId;
    option.url = imageUploadPath+"/file-upload"+"?op=replace";
    option.replaceDeletePathId = inOp.picSrcId;
    new AjaxUploadEx(option);

    // delete
    var option1 = {};
    option1.url = imageUploadPath+"/file-upload"+"?op=delete";
    option1.id = btnDelId;
    option1.replaceDeletePathId = inOp.picSrcId;
    option1.callback = function(res){
    	if(inOp.delCallBack){
    		inOp.delCallBack(res);
    	}
    	if (!res || !res.ret) {
			return;
		}

    	$('#'+btnUploadId).show();
        $('#'+btnModifyId).hide();
        $('#'+btnDelId).hide();
        $('#'+btnPreviewId).hide();
    }
    new AjaxUploadEx(option1);

    if(''==uploadPath){
    	$('#'+btnUploadId).show();
    	$('#'+btnModifyId).hide();
    	$('#'+btnDelId).hide();
    	$('#'+btnPreviewId).hide();
    }else{
    	$('#'+btnUploadId).hide();
    	$('#'+btnModifyId).show();
    	$('#'+btnDelId).show();
    	$('#'+btnPreviewId).show();
//    	$('#'+btnPreviewId).bind("click",function(){
//    		window.open (imageUploadPath+ uploadPath + "?t=" + Math.random(),'newwindow','height=600,width=600,top=200,left=200,toolbar=no,menubar=no,scrollbars=no, resizable=no,location=no, status=no')
//    	});
    	$('#'+btnPreviewId).attr("href",imageUploadPath+ uploadPath + "?t=" + Math.random());
    	$('#'+btnPreviewId).attr("target","view_blank");
    }
}

/**
 * 调用客户端tsc打印机
 * 打印机名：TSC_ME340
 * 注意：使用该方法必须：
 * 1、将TSCActiveX.dll, TSCLIB.dll放入C:\windows\system\
 * 2、cmd进入C:\Windows\SysWOW64（64位操作系统）
 * 3、注册。Regsvr32 TSCActiveX.dll
 * @param {Object} barcode 条形码
 * @param count 条形码打印份数
 */
function tscPrint(barcode, count) {
	var TSCObj;
	// 加载lib，***********只有ie内核浏览器支持*********
	TSCObj = new ActiveXObject("TSCActiveX.TSCLIB");
	// 显示dll版本
	// TSCObj.ActiveXabout();
	// 1、启动打印机TSC_ME340
	TSCObj.ActiveXopenport ("TSC_ME340");
	// 下载图像到打印机
	// TSCObj.ActiveXdownloadpcx ("G:/JSP-Example/UL.PCX","UL.PCX");
	// 2、设定卷标的宽度、高度、打印速度、打印浓度、感应器类别、垂直间距、偏移距离
	TSCObj.ActiveXsetup ("55","32","3","5","0","0","0");
	//TSCObj.ActiveXformfeed();
	//TSCObj.ActiveXnobackfeed();
	//TSCObj.ActiveXsendcommand ("SET TEAR ON");


	//TSCObj.ActiveXsendcommand ("PUTPCX 10,200,\"UL.PCX\"");
	//TSCObj.ActiveXwindowsfont (400, 200, 48, 0, 3, 1, "arial", "DEG 0");
	//TSCObj.ActiveXwindowsfont (400, 200, 48, 90, 3, 1, "arial", "DEG 90");
	//TSCObj.ActiveXwindowsfont (400, 200, 48, 180, 3, 1, "arial", "DEG 180");
	//TSCObj.ActiveXwindowsfont (400, 200, 48, 270, 3, 1, "arial", "DEG 270");
	// 3、打印输出条码(a,b,c,d,e,f,g,h,I)
	//  a 条形码X方向起始点，以点(point)表示
	//  b 条形码Y方向起始点，以点(point)表示
	//  c 条形码类型
	//  d 设定条形码高度，以点(point)表示
	//  e 设定是否打印条形码码文 0 不打印 1 打印
	//  f 设定条形码旋转角度 0 90 180 270
	//  g 设定条形码窄bar 比例因子，请参考TSPL使用手册
	//  h 设定条形码窄bar 比例因子，请参考TSPL使用手册
	//  I 条形码内容
	TSCObj.ActiveXbarcode ("20", "100", "39", "200", "0", "0", "3", "6", barcode);
	// 4.设置条形码下方的文字输出。(a,b,c,d,e,f,g)
	//  a 文字X方向起始点，以点(point)表示
	//  b 文字Y方向起始点，以点(point)表示
	//  c 内建字型名称，共12种
	//  d 设定文字旋转角度 0 90 180 270
	//  e 设定文字X方向放大倍率，1~8
	//  f 设定文字Y方向放大倍率，1~8
	//  g 打印文字内容
	TSCObj.ActiveXprinterfont ("30","310","4","0","1","1",barcode);
	// 5、设定打印卷标式数、打印卷标份数
	count = convertUndefinedToEmpty(count);
	//若count为空，则默认为1.即打印一份
	if(count == ""){
		count = 1;
	}
	TSCObj.ActiveXprintlabel ("1",count);
	// 6、清除
	TSCObj.ActiveXclearbuffer();
	// 7、关闭
	TSCObj.ActiveXcloseport();
}

//function doKey(e){
//    var ev = e || window.event;//获取event对象
//    var obj = ev.target || ev.srcElement;//获取事件源
//    var t = obj.type || obj.getAttribute('type');//获取事件源类型
//    if(ev.keyCode == 8 && t != "password" && t != "text" && t != "textarea"){
//    	return false;
//    }
//}
function doKey(e){
    var ev = e || window.event;//获取event对象
    var obj = ev.target || ev.srcElement;//获取事件源
    var t = obj.type || obj.getAttribute('type');//获取事件源类型

    //获取作为判断条件的事件类型
    var vReadOnly = obj.getAttribute('readonly');
    //处理null值情况
    vReadOnly = (vReadOnly == "") ? false : vReadOnly;

    //当敲Backspace键时，事件源类型为密码或单行、多行文本的，
    //并且readonly属性为true或enabled属性为false的，则退格键失效
    if(ev.keyCode == 8 && (t=="password" || t=="text" || t=="search" || t=="textarea")&& vReadOnly=="readonly")
    	return false;
    //当敲Backspace键时，事件源类型非密码或单行、多行文本的，则退格键失效
    if(ev.keyCode == 8 && t != "password" && t != "text" && t != "search" && t != "textarea")
    	return false;
}
//禁止后退键 作用于Firefox、Opera
document.onkeypress=doKey;
//禁止后退键  作用于IE、Chrome
document.onkeydown=doKey;

function doPrint(how) {
	var myDoc = {
		settings:{printer:'FormPrinter',
			topMargin:50,
			leftMargin:50,
			bottomMargin:50,
			rightMargin:50},
		documents: document,
		/*
		 要打印的div 对象在本文档中，控件将从本文档中的 id 为 'page1' 的div对象，
		 作为首页打印id 为'page2'的作为第二页打印            */
		copyrights: '杰创软件拥有版权  www.jatools.com' // 版权声明,必须
	};
	if(how == '打印预览')
		document.getElementById("jatoolsPrinter").printPreview(myDoc );   // 打印预览
  	else if(how == '打印...')
  		document.getElementById("jatoolsPrinter").print(myDoc ,true);   // 打印前弹出打印设置对话框
	else
		document.getElementById("jatoolsPrinter").print(myDoc, false); // 直接打印，不弹出打印机设置对话框
}
