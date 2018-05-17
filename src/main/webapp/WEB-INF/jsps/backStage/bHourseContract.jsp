<%--
  Created by IntelliJ IDEA.
  User: gcl
  Date: 2018/4/16
  Time: 下午4:26
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>
    <title>合同CURD</title>
</head>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/H-ui.css" />
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/H-ui.ie.css" />
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/H-ui.reset.css" />
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/MyIndexStyle.css" />
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/table.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/page.css">
<style type="text/css">
    .pageTest{ width: 1000px; height: 50px; margin-top: 100px;    }
    .activP{
        background-color: #367fa9!important;
        color: #fff!important;
    }
</style>
<body>
    <div class="clearfix">
        <form method="get" action="common/searchHourseByHourseContract.do">
            <input type="text" placeholder="请输入合同编号" class="input-text ac_input" name="search_text" value="" id="search_text" autocomplete="off" style="width:300px"><button type="submit" class="btn btn-default" id="search_button">搜索</button>
        </form>
    </div>

<table class="table table-border table-bordered table-hover">
    <thead>
        <tr>
            <th>编  号</th>
            <th>合同代号</th>
            <th>所有者</th>
            <th>操  作</th>
        </tr>
    </thead>
    <tbody>
        <c:forEach items="${hourseContractList}" var="contract" varStatus="start">
            <tr>
                <td>${start.index+1}</td>
                <td>${contract.contractId}</td>
                <td>${contract.masterName}</td>
                <td><a href="${pageContext.request.contextPath}/generateHourseRentContact/modifyContract.do?contract.ContractId=${contract.contractId}">修改</a></td>
                <td><a href="${pageContext.request.contextPath}/generateHourseRentContact/downloadConteact.do?contractId=${contract.contractId}">保存文档</a></td>
            </tr>
        </c:forEach>
    </tbody>
</table>

<input type="hidden" name="page" value="${currangePage}">
<div class="pageTest"></div>
<script src="http://www.jq22.com/jquery/jquery-1.10.2.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/page.js"></script>
<script type="text/javascript">
    $('.pageTest').page({
        leng: ${account},//分页总数
        activeClass: 'activP' , //active 类样式定义
        clickBack:function(page){
            console.log(page)
        }
    })
    // $('.pageTest').setLength(10)
</script>

</body>
</html>
