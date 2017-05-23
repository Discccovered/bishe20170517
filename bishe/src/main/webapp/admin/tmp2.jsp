<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<link type="text/css" href="app/tableList/template/tmp2.css">

<script type="text/javascript"
	src="/bishe/admin/tmp2.js"></script>


<div class="page-header">
  <h1>注册企业列表 </h1>
</div>

<div class="list-table" id="detailDiv">
	<table class="table table-hover table-bordered" id="detailTab">
	</table>
	<!--追加翻页代码-->
	<div class="pagination-list">
		<div class="pagination-count pull-left">
			<span>每页</span> <select class="perpage"
				onchange="refreshOrderTable()">
				<option>10</option>
				<option>20</option>
				<option>30</option>
				<option>40</option>
				<option>50</option>
				<option>100</option>
			</select> <span>共有</span> <span id="total_num"></span> <span>条数据</span>
		</div>
		<div class="fanye pull-right" id="pageCtr1"></div>
		
		<div class="bg_img" style="background:#191919;opacity:0.8;display:none;position:fixed;width:60%;height:30%;"></div>
<img class="img" src="" style="display:none;position:absolute;top:10%;left:0;width:100%"/>
	</div>
</div>
