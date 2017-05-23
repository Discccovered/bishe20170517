<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<link type="text/css" href="app/tableList/template/tmp3.css">

<script type="text/javascript"
	src="/bishe/admin/tmp3.js"></script>


<div class="page-header" >
  <h1>文章列表 </h1>
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
		
	</div>
</div>
<div class="modal fade" id="myModal" tabindex="-1" role="dialog"
			aria-labelledby="myModalLabel" aria-hidden="true">
			<div class="modal-dialog">
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal"
							aria-hidden="true">&times;</button>
						<h3 class="modal-title" id="myModalLabel">修改文章信息</h3>
					</div>
					<div class="modal-body">
						<form action="/hncm/company/company_updateCompany.action"
							method="post" id="updateform">
							<div>
								<label for="articleid">文章编号：</label><span id="articleid">12345678</span>
								<label for="articleauthor">作者：</label><span id="articleauthor">12345678</span>
							</div>
							<div style="margin-top: 20px;">
								<label for="articletitle">标题：</label><input type="text" id="articletitle"/>
								<label for="articletype" class="col-md-offset-1">文章类型：</label><select id="articletype"></select>
							</div>
							<div style="margin-top: 20px;">
								<label for="articleparagraph" class="pull-left">内容：</label>
								<textarea id="articleparagraph" rows="15" class="col-md-10"></textarea>
							</div>
							<div class="clearfix"></div>
						</form>
					</div>
					<div class="modal-footer center-block">
						<button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
						<button type="button" class="btn btn-primary" id="updatebutton" onclick="alterArticleType()">确定</button>
					</div>
				</div>
				<!-- /.modal-content -->
			</div>
			<!-- /.modal -->
		</div>