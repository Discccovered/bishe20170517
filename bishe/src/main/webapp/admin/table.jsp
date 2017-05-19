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

    <title>My JSP 'login.jsp' starting page</title>

  	<meta http-equiv="pragma" content="no-cache">
  	<meta http-equiv="cache-control" content="no-cache">
  	<meta http-equiv="expires" content="0">
  	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
  	<meta http-equiv="description" content="This is my page">
    <%@ include file="common/jsp/common-head.jsp"%>
    <link type="text/css" rel="stylesheet" href="/hncm/app/assets/style/table.css"/>
    <script type="text/javascript" src="/hncm/app/tableList/table.js"></script>
  </head>

  <body>
    <div class="container-fluid">
    <div class="row">
      <%@ include file="common/jsp/header.jsp"%>
      <div class="col-md-12 prn pln table-wrap">
        <div class="col-md-1 prn pln left-content">
          <ul class="side-menu">
          <li><a  href="javsscript:void(0);" onclick="goToPage('home')"><i class="glyphicon glyphicon-search"></i></a>
            <li class="active">
            <a href="javsscript:void(0);" onclick="goToPage('home')"><i class="fa fa-home"></i><span>首页</span></a></li>
            <li><a href="javsscript:void(0);" onclick="goToPage('company')"><i class="fa fa-home"></i><span>企业</span></a></li>
            <li><a href="javsscript:void(0);" onclick="goToPage('home')"><i class="fa fa-home"></i><span>分析</span></a></li>
            <li><a href="javsscript:void(0);" onclick="goToPage('home')"><i class="fa fa-home"></i><span>用户</span></a></li>
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
