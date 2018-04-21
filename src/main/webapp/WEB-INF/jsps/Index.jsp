<%--
  Created by IntelliJ IDEA.
  User: gcl66
  Date: 2018/3/25
  Time: 18:57
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/H-ui.css" />
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}css/H-ui.ie.css" />
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/H-ui.reset.css" />
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/MyIndexStyle.css" />
<link href="http://img.jigao616.com/css/bootstrap.min.css" rel="stylesheet">
<link href="http://img.jigao616.com/css/style.css" rel="stylesheet">
<script src="${pageContext.request.contextPath}/js/H-ui.js"></script>

<head>
    <meta charset="utf-8">
    <meta name="renderer" content="webkit|ie-comp|ie-stand">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width,initial-scale=1,minimum-scale=1.0,maximum-scale=1.0,user-scalable=no" />
    <title>再现租房 - 主页 - 站酷（ORL）</title>
    <meta name="keywords" content="">
    <meta name="description" content="">
    <LINK rel="Shortcut Icon" href="/favicon.ico" />
    <!--[if lt IE 9]>
    <![endif]-->
    <link href="http://img.jigao616.com/css/style.css" rel="stylesheet">
    <!--<link href="${pageContext.request.contextPath}/css/style.css" rel="stylesheet" type="text/css" />-->
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-1.8.3.js"></script>
    <!--[if IE 6]>
    <script>DD_belatedPNG.fix('.pngfix,.icon,.list-icon');</script>
    <![endif]-->
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
                <li class="active"><a href="http://localhost:8091/Index.jsp/">首页</a></li>
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
<div id="container">
    <div id="section-1" class="section">
        <div class="wp">
            <div class="tuwen">
                <div class="tuwennr" style="font-size: 40px;font-weight: bold">
                    <span style="color:white">发 现 生 活 中 的 不 同 <br>
                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        在 线 租 房！</span>
                </div>
            </div>
        </div>
    </div>
    <div id="section-2" class="section">
        <div class="wp">
            <div class="tuwen">
                <div class="tuwennr">
                    <h2 class="title">去旅途中发现灵感</h2>
                    <p class="info">地点：旅途　/　获取灵感：224克<br>
                        <br>
                        又要出发了！背上行囊，乘坐旅行的大巴，去遇见更多有趣的人，发现更多新鲜的创意，找到不可思议的灵感。<br>
                        <br>
                        这，就是我们旅行的意义,获取租房设置意义</p>
                    <p class="btnbar"><a class="btn-buy" href="http://localhost:8091/hourse/housrsedetail.do?hourseId=1" target="_blank"><span class="paddingW"></span>马上订购&gt;&gt;</a></p>
                </div>
            </div>
        </div>
    </div>
    <div id="section-3" class="section">
        <div class="wp">
            <div class="tuwen">
                <div class="tuwennr r">
                    <h2 class="title">在艺术的汪洋里汲取灵感</h2>
                    <p class="info">地点：画廊　/　获取灵感：798克<br>
                        <br>
                        当我们在看画展的时候，我们在看些什么？无论印象派还是立体派，卡拉瓦乔还是莫奈，传世珍宝还是街头涂鸦……照单全收。<br>
                        <br>
                        在他们创作的激情里，找到我们久违的触动。</p>
                    <p class="btnbar"><a class="btn-buy" href="http://localhost:8091/hourse/housrsedetail.do?hourseId=2" target="_blank"><span class="paddingW"></span>马上订购&gt;&gt;</a></p>
                </div>
            </div>
        </div>
    </div>
    <div id="section-4" class="section">
        <div class="wp">
            <div class="tuwen">
                <div class="tuwennr">
                    <h2 class="title">在独自行走的路上寻觅灵感</h2>
                    <p class="info">地点：在路上　/　获取灵感：1957克<br>
                        <br>
                        设计注定是孤独的旅行，年轻的我们在路上追寻。形形色色的行人没有一致的步伐，别人的路线也不是方向，找到自己的时候才会找到答案。<br>
                        <br>
                        带上画本，一路向前，下一个转角遇见灵感。</p>
                    <p class="btnbar"><a class="btn-buy" href="http://localhost:8091/hourse/housrsedetail.do?hourseId=3" target="_blank"><span class="paddingW"></span>马上订购&gt;&gt;</a></p>
                </div>
            </div>
        </div>
    </div>
    <div id="section-5" class="section">
        <div class="wp">
            <div class="tuwen">
                <div class="tuwennr r">
                    <h2 class="title">在日常工作中获得持续的灵感</h2>
                    <p class="info">地点：工作间　/　获取灵感：365克<br>
                        <br>
                        你朝九晚五，我夜以继日。你全年全勤无休，我365天笔耕不辍。因为我知道：好不好看，眼睛知道；用没用功，画笔知道；有没有料，脑袋知道。<br>
                        <br>
                        厚积方能薄发。这就是为什么我不能停止创作。</p>
                    <p class="btnbar"><a class="btn-buy" href="http://localhost:8091/hourse/housrsedetail.do?hourseId=4" target="_blank"><span class="paddingW"></span>马上订购&gt;&gt;</a></p>
                </div>
            </div>
        </div>
    </div>
    <div id="section-6" class="section">
        <div class="wp">
            <div class="tuwen">
                <div class="tuwennr">
                    <h2 class="title">在平常生活中沉淀不竭的灵感</h2>
                    <p class="info">地点：咖啡馆　/　获取灵感：8760克<br>
                        <br>
                        灵感源自对生活点滴的感知。在工作之外，打开更开阔的思路；在设计之外，看到更广阔的世界。<br>
                        <br>
                        找一个安静的地方画画。有时候，慢下来，才有灵感。</p>
                    <p class="btnbar"><a class="btn-buy" href="http://localhost:8091/hourse/housrsedetail.do?hourseId=5" target="_blank"><span class="paddingW"></span>马上订购&gt;&gt;</a></p>
                </div>
            </div>
        </div>
    </div>
    <div class="Newfooter">
        <div class="wp cl">
            <div class="weixin-pic"></div>
            <div class="weixin-text">
                <div style="padding-top:63px">服务号：zcoolshop<br>
                    扫一扫关注微信账号</div>
            </div>
            <div class="copyrightWP">
                <div class="bottomNav cl">
                    <div class="leftbox">
                        <div class="tit">在线客服</div>
                        <ul>
                            <li>工作时间：9:30 - 18:30（节假日休息）</li>
                            <li>客服电话：010 - 56538600</li>
                            <li>E-mail：zshop@zcool-mail.com</li>
                        </ul>
                    </div>
                    <div class="leftbox2">
                        <div class="tit">关于我们</div>
                        <ul>
                            <li><a href="http://shop.zcool.com.cn/about.php" target="_blank">关于再线租房系统</a></li>
                            <li><a href="http://shop.zcool.com.cn/returns-process.php" target="_blank">租房流程</a></li>
                            <li><a href="http://shop.zcool.com.cn/distribution.php" target="_blank">详细说明</a></li>
                            <li><a href="http://shop.zcool.com.cn/privacy.php" target="_blank">版权隐私说明</a></li>
                        </ul>
                    </div>
                    <a target="_blank" href="http://www.zcool.com.cn/" class="footer-logo"></a>
                </div>
                <div class="copyright">京ICP备11017824号-4 / 京ICP证130164号  / 北京市公安局朝阳分局备案编号：110105000501<br>Copyright &copy; 2006-2014 ZCOOL inc.</div>
            </div>
        </div>
    </div>
</div>
</body>
    <script type="text/javascript" src="js/jquery.scrollTo.js"></script>
    <script type="text/javascript" src="js/jquery.nav.js"></script>
    <script type="text/javascript">
        jQuery(function($) {
            $('#nav').onePageNav({
                begin: function() {
                    console.log('start');
                },
                end: function() {
                    console.log('stop');
                },
                scrollOffset: 30
            });
        });
    </script>
</html>
