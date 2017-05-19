<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<link type="text/css" href="app/tableList/template/tmp2.css">

<script type="text/javascript"
	src="/hncm/app/tableList/template/tmp2.js"></script>


<div class="page-header">
  <h1>注册企业列表 <small></small><button type="button"
			class="btn btn-sm" id="addbtn">+新增</button></h1>
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

		<%-- <div class="modal fade" id="myModal" tabindex="-1" role="dialog"
			aria-labelledby="myModalLabel" aria-hidden="true">
			<div class="modal-dialog">
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal"
							aria-hidden="true">&times;</button>
						<h4 class="modal-title" id="myModalLabel">企业信息修改</h4>
					</div>
					<div class="modal-body">
						<table>
							<tr>
								<td>企业编号:</td>
								<td><input type="text" id="companyid"  disabled="disabled"></td>
								<td>企业名称:</td>
								<td><input type="text" id="companyname" ></td>
							</tr>
							<tr>
								<td>企业类型:</td>
								<td><select id="companytype" ></select></td>
								<td>法定代表人:</td>
								<td><input type="text" id="leagalperson"></td>
							</tr>
							<tr>
								<td>联系电话:</td>
								<td><input type="text" id="contactphone"></td>
								<td>注册资金:</td>
								<td><input type="text" id="registerfund" disabled="disabled"></td>
							</tr>
							<tr>
								<td>注册时间:</td>
								<td><input type="text" id="registertime"></td>
							</tr>
							<tr>
								<td>公司地址:</td>
								<td><select id="province" onchange="changeProvince(this)">
										
								</select>
								<select id="city">
										
								</select>
								<select id="courty">
										
								</select><input type="text" id="address"></td>
							</tr>
						</table>
					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
						<button type="button" class="btn btn-primary">提交更改</button>
					</div>
				</div>
				<!-- /.modal-content -->
			</div>
			<!-- /.modal -->
		</div> --%>

		<div class="modal fade" id="myModal" tabindex="-1" role="dialog"
			aria-labelledby="myModalLabel" aria-hidden="true">
			<div class="modal-dialog">
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal"
							aria-hidden="true">&times;</button>
						<h3 class="modal-title" id="myModalLabel">注册企业信息</h3>
					</div>
					<div class="modal-body">
						<form action="/hncm/company/company_updateCompany.action"
							method="post" id="updateform">
							<div>
								<label for="id">企业编号：</label><input type="text" id="companyid"
									style="border: 0;" disabled="disabled" />
							</div>
							<div style="margin-top: 20px;">
								<label for="companyname">企业名称：</label><input type="text"
									id="companyname" /><label for="companytype"
									class="col-md-offset-1">企业类型：</label><select id="companytype"></select>
							</div>
							<div style="margin-top: 20px;">
								<label for="leagalperson">企业法人：</label><input type="text"
									id="leagalperson" /><label for="contactphone"
									class="col-md-offset-1">联系电话：</label><input type="text"
									id="contactphone" />
							</div>
							<div style="margin-top: 20px;">
								<label for="registerfund">注册资金：</label><input type="text"
									id="registerfund" /><label for="registertime"
									class="col-md-offset-1">成立时间：</label><input type="text"
									id="registertime" />
							</div>
							<div style="margin-top: 20px;">
								<label>经营地址：</label> <select id="province"
									style="margin: 0 10px;" >

								</select> <select style="margin: 0 10px;" id="city">

								</select> <select style="margin: 0 10px;" id="courty">

								</select><input type="text" id="address">

							</div>
							<div style="margin-top: 20px;">
								<label for="description" class="pull-left">经营范围：</label>
								<textarea id="description" rows="6" class="col-md-10"></textarea>
							</div>
							<div class="clearfix"></div>
						</form>
					</div>
					<div class="modal-footer center-block">
						<button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
						<button type="button" class="btn btn-primary" id="updatebutton">确定</button>
					</div>
				</div>
				<!-- /.modal-content -->
			</div>
			<!-- /.modal -->


		</div>
	</div>
</div>
