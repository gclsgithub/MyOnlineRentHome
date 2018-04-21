<%--
  Created by IntelliJ IDEA.
  User: gcl66
  Date: 2018/3/25
  Time: 15:52
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html lang="zh-CN">
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <meta name="description" content="">
        <meta name="author" content="">
        <title>登录与注册页</title>

        <link href="${pageContext.request.contextPath}/css/bootstrap.css" rel="stylesheet">
        <link href="http://img.jigao616.com/css/style.css" rel="stylesheet">
    </head>

    <body>
    <nav class="navbar navbar-diy">
        <div class="container">
            <div class="navbar-header">
                <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar" aria-expanded="false" aria-controls="navbar">
                    <span class="sr-only">在线租房</span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                </button>
                <a class="navbar-brand" href="http://localhost:8091/Index.jsp/"></a>
            </div>
            <div id="navbar" class="collapse navbar-collapse">
                <ul class="nav navbar-nav">
                    <li class="active"><a href="http://localhost:8091/MyIndex.jsp/">首页</a></li>
                    <li><a href="${pageContext.request.contextPath}/hourse/seachHourseByName.do?searchName=''">可租列表</a></li>
                </ul>
                <ul id="top1_denglu" class="nav navbar-nav navbar-right">
                    <li><a href="${pageContext.request.contextPath}/jump/regex.do">登录</a></li>
                    <li><a href="${pageContext.request.contextPath}/jump/login.do">注册</a></li>
                </ul>
            </div>
            <!--/.nav-collapse -->
            <div class="navbar-form navbar-left topsearch" role="search">
                <form action="${pageContext.request.contextPath}/hourse/seachHourseByName.do" method="get">
                    <input name="searchName" type="text" class="top-control" placeholder="房屋信息..." id="patentText" onkeydown= "if(event.keyCode==13){patentS(); return false;}">
                    <button type="submit" class="btn btn-so" onclick="patentS();return false;"></button>
                </form>
            </div>
        </div>
    </nav>
        <div class="login-wrap">
            <div class="form-popover">
                <div class="form-hd">Hi，欢迎您！</div>
                <div class="form-body">
                    <form method="post" action="${pageContext.request.contextPath}/user/login.do" onsubmit="javascript:return WebForm_OnSubmit();" id="from1">
                        <div class="aspNetHidden">
                        </div>

                        <script type="text/javascript">
                            //<![CDATA[
                            var theForm = document.forms['from1'];
                            if (!theForm) {
                                theForm = document.from1;
                            }
                            function __doPostBack(eventTarget, eventArgument) {
                                if (!theForm.onsubmit || (theForm.onsubmit() != false)) {
                                    theForm.__EVENTTARGET.value = eventTarget;
                                    theForm.__EVENTARGUMENT.value = eventArgument;
                                    theForm.submit();
                                }
                            }
                            //]]>
                        </script>
                        <script src="${pageContext.request.contextPath}/js/jquery-1.8.3.js" type="text/javascript"></script>

                        <div class="aspNetHidden">
                        </div>
                        <div class="form-row">
                            <div class="hd">用户名</div>
                            <div class="bd">
                                <input name="userName" type="text" id="userName" placeholder="您的用户名" />

                            </div>
                        </div>
                        <div class="form-row">
                            <div class="hd">密码</div>
                            <div class="bd">
                                <input name="passWord" type="password" id="passWord" placeholder="您的密码" />
                            </div>
                        </div>
                        <div class="checkbox">
                            <label>
                                <input name="cb1" type="checkbox" id="cb1" /> 登陆保持90天
                            </label>
                        </div>
                        <div class="form-footer">
                            <input type="button" name="Button1" value="  用户登录  "  id="MySubmitButton1" class="btn btn-submit" onclick="doMySubmit()"/>
                            <span id="tishi" style="color :red"></span>
                            <span data-val-controltovalidate="username" data-val-errormessage="请输入用户名" data-val-display="Dynamic" data-val-validationGroup="a" id="Rtor1" data-val="true" data-val-evaluationfunction="RequiredFieldValidatorEvaluateIsValid" data-val-initialvalue="" style="color:#FF3300;display:none;">请输入用户名</span>
                            <span data-val-controltovalidate="password" data-val-errormessage="请输入密码" data-val-display="Dynamic" data-val-validationGroup="a" id="Requr1" data-val="true" data-val-evaluationfunction="RequiredFieldValidatorEvaluateIsValid" data-val-initialvalue="" style="color:#FF3300;display:none;">请输入密码</span>
                            <span data-val-controltovalidate="password" data-val-errormessage=${stageError} data-val-display="Dynamic" data-val-validationGroup="a" id="Requr2" data-val="true" data-val-evaluationfunction="RequiredFieldValidatorEvaluateIsValid" data-val-initialvalue="" style="color:#FF3300;">${stageError}</span>

                        </div>
                    </form>
                </div>
            </div>
        </div>
        <div class="lg-footer">
            <p>Copyright &copy; 2018 All Rights Reserved. </p><p> <a href="http://www.miitbeian.gov.cn/" target="_blank" rel="nofollow">Hytc</a>@gcl  <a href="http://www.jigao616.com/zuixinzhuanli.aspx">最新专利</a></p>
        </div>
        <script src='${pageContext.request.contextPath}/js/jquery-1.8.3.js'></script>
        <script src='${pageContext.request.contextPath}/js/bootstrap.min.js'></script>
        <script>
            function doMySubmit() {
                    document.getElementById("Rtor1").style="display:none";
                    document.getElementById("Requr1").style="display:none";
                    document.getElementById("Requr2").style="display:none";
                    var form=document.getElementById("from1");
                    var userName= document.getElementById("userName").value;
                    var passWord=document.getElementById("passWord").value;
                    if (userName == ""){
                        document.getElementById("Rtor1").style="display:'';";
                    }
                    if (passWord == ""){
                        document.getElementById("Requr1").style="display:'';";
                    }
                    if(userName !="" && passWord !=""){
                        form.submit();
                    }
            }
            $(document).ready(function () {
                var winWidth = document.documentElement.clientWidth;
                var winHeight = document.documentElement.clientHeight;
                $('.login-wrap').height(winHeight - 50 - 84);

            });

            $(window).resize(function () {
                var winWidth = document.documentElement.clientWidth;
                var winHeight = document.documentElement.clientHeight;
                $('.login-wrap').height(winHeight - 50 - 84);

            }).resize();
        </script>

        <script>
            var _hmt = _hmt || [];
            (function () {
                var hm = document.createElement("script");
                hm.src = "https://hm.baidu.com/hm.js?12366927c4be2160d368602e4ed13f15";
                var s = document.getElementsByTagName("script")[0];
                s.parentNode.insertBefore(hm, s);
            })();
        </script>
    </body>
<script>
    var onlick=document.getElementById(MySubmitButton1).onclick;
</script>
</html>