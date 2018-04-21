<%--
  Created by IntelliJ IDEA.
  User: gcl66
  Date: 2018/3/29
  Time: 0:03
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<head>
    <meta charset="utf-8">
    <meta name="renderer" content="webkit|ie-comp|ie-stand">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width,initial-scale=1,minimum-scale=1.0,maximum-scale=1.0,user-scalable=no" />
    <title>再线租房  CRM租房 - 租房专题 - 租房（CRM）</title>
    <meta name="description" content="花开无声，快来租房" />
    <meta name="keywords" content="租房,再线,潮T,CRM" />
    <LINK rel="Bookmark" href="/favicon.ico" >
    <LINK rel="Shortcut Icon" href="/favicon.ico" />
    <link href="${pageContext.request.contextPath}/css/main.css" rel="stylesheet" type="text/css" />
    <!--[if IE 6]>
    <script type="text/javascript" src="js/DD_belatedPNG_0.0.8a-min.js" ></script>
    <script>DD_belatedPNG.fix('.pngfix,.icon,.list-icon');</script>
    <![endif]-->
</head>
<body>
<!--<div class="homepic"><img src="images/home2.jpg"></div>-->
<div id="browser-0" class="browser">
    <a class="action" href="http://localhost:8091/generateHourseRentContact/nextPage?currentPage=${currentPage}" title="上一波"></a>
    <img style="width:100%;" src="${pageContext.request.contextPath}/images/8TH-1.png">
</div>
<c:forEach items="${hourseList}" var="hrd">
<div id="browser-${hrd.hourseId}" class="browser browser-hover firstAnim" onClick="modalshow('${hrd.hourseId}','暂无','aa','http://localhost:8089/jump/entire.do?hourseId=${hrd.hourseId}','http://localhost:8089/jump/monthly.do?hourseId=${hrd.hourseId}')">
    <div class="toppic">
        <img class="teepic" src="${pageContext.request.contextPath}/images/TEE${hrd.hourseId}.png">
    </div>
</div>
</c:forEach>
<input type="hidden" name="currentPage" value="${currentPage}">
<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-1.8.3.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/unslider.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/main2.js"></script>
</html>
