<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">

    <title>在线养生咨询管理页面</title>

  	<meta http-equiv="pragma" content="no-cache">
  	<meta http-equiv="cache-control" content="no-cache">
  	<meta http-equiv="expires" content="0">
  	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
  	<meta http-equiv="description" content="在线养生咨询管理页面">
    <%@ include file="common/jsp/common-head.jsp"%>
    <link type="text/css" rel="stylesheet" href="/bishe/admin/assets/style/table.css"/>
    <script type="text/javascript" src="/bishe/admin/table.js"></script>
  </head>

  <body>
    <div class="container-fluid">
    <div class="row">
      <%@ include file="common/jsp/header.jsp"%>
      <div class="col-md-12 prn pln table-wrap">
        <div class="col-md-1 prn pln left-content">
          <ul class="side-menu">
            <li class="active">
            <a href="javsscript:void(0);" onclick="goToPage('home')"><span><i class="fa fa-file"></i></span><span>文章管理</span></a></li>
            <li><a href="javsscript:void(0);" onclick="goToPage('company')"><i class="fa fa-user"></i><span>用户管理</span></a></li>
          </ul>
        </div>
        <div class="col-md-11 right-content">
            <div class="right-main"></div>
        </div>
      </div>
    </div>
    </div>
  </body>
</html>
