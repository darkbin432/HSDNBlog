<%--
  Created by IntelliJ IDEA.
  User: 斌
  Date: 2019/12/22
  Time: 14:04
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!doctype html>
<!--[if lt IE 7]>      <html class="no-js lt-ie9 lt-ie8 lt-ie7" lang=""> <![endif]-->
<!--[if IE 7]>         <html class="no-js lt-ie9 lt-ie8" lang=""> <![endif]-->
<!--[if IE 8]>         <html class="no-js lt-ie9" lang=""> <![endif]-->
<!--[if gt IE 8]><!-->
<html lang="zh-cn">
<!--<![endif]-->
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta content="width=device-width,initial-scale=1" name="viewport">
    <meta name="description" content="overview &amp; stats"/>

    <title>杭州师范大学</title>

    <!--====== FAVICON ICON =======-->

    <!--====== STYLESHEETS ======-->
    <link href="<%=request.getContextPath()%>/resources/css/default/css/plugins.css" rel="stylesheet">
    <link href="<%=request.getContextPath()%>/resources/css/default/css/theme.css" rel="stylesheet">
    <link href="<%=request.getContextPath()%>/resources/css/default/css/icons.css" rel="stylesheet">

    <!--====== MAIN STYLESHEETS ======-->
    <link href="<%=request.getContextPath()%>/resources/css/default/style.css" rel="stylesheet">
    <link href="<%=request.getContextPath()%>/resources/css/default/css/responsive.css" rel="stylesheet">

    <script src="<%=request.getContextPath()%>/resources/css/default/js/vendor/modernizr-2.8.3.min.js"></script>
    <!--[if lt IE 9]>
    <script src="//oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
    <script src="//oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <![endif]-->

</head>

<body data-spy="scroll" data-target=".mainmenu-area" data-offset="90">

<!--[if lt IE 8]>
<p class="browserupgrade">You are using an <strong>outdated</strong> browser. Please <a href="http://browsehappy.com/">upgrade your browser</a> to improve your experience.</p>
<![endif]-->

<!--- PRELOADER -->
<div class="preeloader">
    <div class="preloader-spinner"></div>
</div>

<!--SCROLL TO TOP-->
<a href="#scroolup" class="scrolltotop"><i class="fa fa-long-arrow-up"></i></a>

<!--START TOP AREA-->
<header class="top-area" id="home">
    <div class="header-top-area" id="scroolup">
        <!--MAINMENU AREA-->
        <div class="mainmenu-area" id="mainmenu-area">
            <div class="mainmenu-area-bg"></div>
            <nav class="navbar">
                <div class="container">
                    <div class="navbar-header">
                        <a href="#home" class="navbar-brand"><img src="<%=request.getContextPath()%>/resources/images/hznu.png" alt="logo" class="logo"></a>
                    </div>
                    <div id="main-nav" class="stellarnav">
                        <ul id="nav" class="nav navbar-nav pull-right">
                            <li class="active"><a href="<%=request.getContextPath()%>/">首页</a></li>
                            <li><a href="<%=request.getContextPath()%>/general">学校概况</a></li>
                            <li><a href="<%=request.getContextPath()%>/mechanism">机构设置</a></li>
                            <li><a href="<%=request.getContextPath()%>/teachers">师资队伍</a></li>
                            <li><a href="<%=request.getContextPath()%>/discipline">学科建设</a></li>
                            <%--<li><a onclick="window.open('manage/index')"><span class="fa fa-user" aria-hidden="true"></span></a></li>--%>
                        </ul>
                    </div>
                </div>
            </nav>
        </div>
        <!--END MAINMENU AREA END-->
    </div>

    <!--WELCOME SLIDER AREA-->
    <div class="welcome-slider-area white font16">
        <div class="welcome-single-slide">
            <div class="slide-bg-one slide-bg-overlay"></div>
            <div class="welcome-area">
                <div class="container">
                    <div class="row flex-v-center">
                        <div class="col-md-8 col-lg-7 col-sm-12 col-xs-12">
                            <div class="welcome-text">
                                <h1>勤慎诚恕，博雅精进</h1>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="welcome-single-slide">
            <div class="slide-bg-two slide-bg-overlay"></div>
            <div class="welcome-area">
                <div class="container">
                    <div class="row flex-v-center">
                        <div class="col-md-8 col-lg-7 col-sm-12 col-xs-12">
                            <div class="welcome-text">
                                <h1>2019年马云乡村人才计划起航典礼</h1>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="welcome-single-slide">
            <div class="slide-bg-three slide-bg-overlay"></div>
            <div class="welcome-area">
                <div class="container">
                    <div class="row flex-v-center">
                        <div class="col-md-8 col-lg-7 col-sm-12 col-xs-12">
                            <div class="welcome-text">
                                <h1>不忘初心，牢记使命</h1>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!--WELCOME SLIDER AREA END-->
</header>
<!--END TOP AREA-->

<!--FEATURES TOP AREA-->
<section class="features-top-area" id="features">
    <div class="container">
        <div class="row promo-content">
            <div class="col-md-4 col-lg-4 col-sm-6 col-xs-12">
                <div class="text-icon-box mb20 xs-mb0 wow fadeInUp padding30" data-wow-delay="0.1s">
                    <a href="http://xiaoyou.hznu.edu.cn/" title="师大校友">
                        <div class="box-icon">
                            <img src="" data-src="<%=request.getContextPath()%>/resources/images/sdxy.png">
                        </div>
                        <h3 class="box-title">师大校友</h3>
                    </a>
                    <p>校友会、教育基金会</p>
                </div>
            </div>
            <div class="col-md-4 col-lg-4 col-sm-6 col-xs-12">
                <div class="text-icon-box relative mb20 xs-mb0  wow fadeInUp padding30" data-wow-delay="0.2s">
                    <a href="https://www.hznu.edu.cn/xnxsg/" title="网上校史馆">
                        <div class="box-icon">
                            <img src="" data-src="<%=request.getContextPath()%>/resources/images/wsxsg.png">
                        </div>
                        <h3 class="box-title">网上校史馆</h3>
                    </a>
                    <p>360度全景摄影技术，采集校史馆内真实场景，在线游览校史馆</p>
                </div>
            </div>
            <div class="col-md-4 col-lg-4 col-sm-6 col-xs-12">
                <div class="text-icon-box relative mb20 xs-mb0 wow fadeInUp padding30" data-wow-delay="0.3s">
                    <a href="https://www.hznu.edu.cn/xnxsg/" title="师大校报">
                        <div class="box-icon">
                            <div class="box-icon">
                                <img src="" data-src="<%=request.getContextPath()%>/resources/images/xb.png">
                            </div>
                        </div>
                        <h3 class="box-title">师大校报</h3>
                    </a>
                    <p>在线浏览杭州师范大学数字报，并可查阅所有历史报纸</p>
                </div>
            </div>
        </div>
    </div>
</section>
<!--FEATURES TOP AREA END-->

<!--COURSE AREA-->
<section class="course-area padding-top" id="courses">
    <div class="container-fluid">
        <div class="row">
            <div class="col-md-8 col-lg-8 col-md-offset-2 col-lg-offset-2 col-sm-12 col-xs-12">
                <div class="area-title text-center wow fadeIn">
                    <h2 class="xs-font26">师大要闻</h2>
                </div>
            </div>
        </div>
        <div class="row course-list" id="sdywList">
            <div class="col-md-3 col-lg-3 col-sm-6 col-xs-12 listItem">
                <div class="single-course mb20">
                    <img src="" data-src="<%=request.getContextPath()%>/resources/images/1.jpg" alt="" class="sdyw">
                    <div class="course-details padding30">
                        <h3 class="font18">陈春雷率团访问南非、坦桑尼亚高校</h3>
                        <p>12月4日至11日，校党委书记陈春雷受邀率团访问南非、坦桑尼亚合作高校。</p>
                        <p class="mt30"><a href="#" class="enroll-button">阅读更多</a> <span class="course-price">12.16</span></p>
                    </div>
                </div>
            </div>
            <div class="col-md-3 col-lg-3 col-sm-6 col-xs-12 listItem">
                <div class="single-course mb20">
                    <img src="" data-src="<%=request.getContextPath()%>/resources/images/2.jpg" alt="" class="sdyw">
                    <div class="course-details padding30">
                        <h3 class="font18">周江勇来校宣讲党的十九届四中全会精神</h3>
                        <p>省委常委、杭州市委书记周江勇到我校宣讲党的十九届四中全会精神。</p>
                        <p class="mt30"><a href="#" class="enroll-button">阅读更多</a> <span class="course-price">11.29</span></p>
                    </div>
                </div>
            </div>
            <div class="col-md-3 col-lg-3 col-sm-6 col-xs-12 listItem">
                <div class="single-course mb20">
                    <img src="" data-src="<%=request.getContextPath()%>/resources/images/3.jpg" alt="" class="sdyw">
                    <div class="course-details padding30">
                        <h3 class="font18">【星耀师大】聚焦“美”，一直在路上</h3>
                        <p>总有一种力量让我们热泪盈眶，总有一种感动让我们深刻铭记。</p>
                        <p class="mt30"><a href="#" class="enroll-button">阅读更多</a> <span class="course-price">12.11</span></p>
                    </div>
                </div>
            </div>
            <div class="col-md-3 col-lg-3 col-sm-6 col-xs-12 listItem">
                <div class="single-course mb20">
                    <img src="" data-src="<%=request.getContextPath()%>/resources/images/4.jpg" alt="" class="sdyw">
                    <div class="course-details padding30">
                        <h3 class="font18">张杭君教授获“2019年浙江省有突出贡献青年科技人才”称号</h3>
                        <p>浙江省科学技术协会公布2019年浙江省有突出贡献青年科技人才名单，我校生命与环境科学学院张杭君教授入选。</p>
                        <p class="mt30"><a onclick="window.open('content')" class="enroll-button">阅读更多</a> <span class="course-price">12.17</span></p>
                    </div>
                </div>
            </div>
        </div>
        <a href="<%=request.getContextPath()%>/important"><span class="course-price hanggao">more &gt; &gt;</span></a>
    </div>
</section>
<!--COURSE AREA END-->

<!--ADDMISSION AREA-->
<section class="admition-area padding-100-70 bg-theme mt100">
    <div class="container">
        <div class="row flex-v-center">
            <div class="col-md-6 col-lg-6 col-sm-6 col-xs-12">
                <div class="admition-content xs-center xs-mb30" id="notice">
                    <%--<h3 class="xs-font20">通知公告</h3>--%>
                    <%--<p><a>关于第九届中国声乐论坛的预通知</a></p>--%>
                    <%--<p>关于鼓励党外师生加入“学习强国”学习平台的实施通知</p>--%>
                    <%--<p>关于我校工程硕士专业学位授权点名称调整的公告</p>--%>
                    <%--<p>关于举办“翰墨丹青——庆祝新中国成立70周年”师生书画摄影作品征集活动的通知</p>--%>
                    <%--<p>关于第七届杭州师范大学“马云青春领袖奖” 十佳大学生获得者名单的公示</p>--%>
                    <%--<p>杭州师范大学文化创意学院面向全校启动钱塘江流域传统节日文化视觉传播项目</p>--%>
                    <%--<p>关于开展第七届杭州师范大学“马云青春领袖奖”十佳大学生评选活动终评环节的通知</p>--%>
                </div>
            </div>
            <div class="col-md-6 col-lg-6 col-sm-6 col-xs-12">
                <div class="enroll-button right xs-center">
                    <a href="#">更多通知</a>
                </div>
            </div>
        </div>
    </div>
</section>
<!--ADDMISSION AREA END-->

<!--BLOG AREA-->
<section class="padding-top" id="blog">
    <div class="container">
        <div class="row">
            <div class="col-md-8 col-lg-8 col-md-offset-2 col-lg-offset-2 col-sm-12 col-xs-12">
                <div class="area-title text-center wow fadeIn">
                    <h2>教学科研</h2>
                </div>
            </div>
        </div>
        <div class="row">
            <div class="col-md-4 col-lg-4 col-sm-6 col-xs-12">
                <div class="single-blog-item sm-mb30 xs-mb30 wow fadeInUp" data-wow-delay="0.2s">
                    <div class="blog-thumb">
                        <a href="blog.html"><img src="" data-src="<%=request.getContextPath()%>/resources/images/jx1.jpg" alt=""></a>
                    </div>
                    <div class="blog-details padding30">
                        <h3 class="blog-title font20 mb30"><a href="blog.html">青年教师教学能力培养走向深入</a></h3>
                        <p class="blog-meta font14 mt20"><a href="#">2019-12-19 </a><a href="#">刘晓宇</a></p>
                    </div>
                </div>
            </div>
            <div class="col-md-4 col-lg-4 col-sm-6 col-xs-12">
                <div class="single-blog-item sm-mb30 xs-mb30 wow fadeInUp" data-wow-delay="0.3s">
                    <div class="blog-thumb">
                        <a onclick="window.open('teach')"><img src="" data-src="<%=request.getContextPath()%>/resources/images/jx2.jpg" alt=""></a>
                    </div>
                    <div class="blog-details padding30">
                        <h3 class="blog-title font20 mb30"><a onclick="window.open('teach')">广西柳州市城中区“百人优师”培养工程启动仪式在我校举行</a></h3>
                        <p class="blog-meta font14 mt20"><a href="#">2019-12-18 </a><a href="#">孙一秀</a></p>
                    </div>
                </div>
            </div>
            <div class="col-md-4 col-lg-4 col-sm-6 col-xs-12">
                <div class="single-blog-item sm-mb30 xs-mb30 wow fadeInUp" data-wow-delay="0.4s">
                    <div class="blog-thumb">
                        <a href="blog.html"><img src="" data-src="<%=request.getContextPath()%>/resources/images/jx3.png" alt=""></a>
                    </div>
                    <div class="blog-details padding30">
                        <h3 class="blog-title font20 mb30"><a href="blog.html">第二届全国古典教育论坛在我校举行</a></h3>
                        <p class="blog-meta font14 mt20"><a href="#">2019-12-16 </a><a href="#">陈继旭、陈薇</a></p>
                    </div>
                </div>
            </div>
            <div class="col-md-4 col-lg-4 col-sm-6 col-xs-12">
                <div class="single-blog-item wow fadeInUp visible-sm" data-wow-delay="0.4s">
                    <div class="blog-thumb">
                        <a href="blog.html"><img src="" data-src="<%=request.getContextPath()%>/resources/images/jx4.jpg" alt=""></a>
                    </div>
                    <div class="blog-details padding30">
                        <h3 class="blog-title font20 mb30"><a href="blog.html">社会保障“高质量发展”高峰论坛在杭召开</a></h3>
                        <p class="blog-meta font14 mt20"><a href="#">2019-12-17 </a><a href="#">龚上华</a></p>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>
<!--BLOG AREA END-->

<!--FAQS AREA-->
<section class="faqs-area padding-50-50 bg-theme mt100" id="faqs">
    <div class="container">
        <div class="row">
            <div class="col-md-4 col-lg-4 col-sm-6 col-xs-12">
                <div class="text-icon-box relative mb50 wow fadeInUp" data-wow-delay="0.1s">
                    <a href="#"><span class="course-price">more &gt; &gt; </span></a>
                    <h3 class="area-title">党建文化</h3>
                    <p>聚焦：“不忘初心、牢记使命”主题教育</p>
                    <p>学校举办第二期“启创班”开班仪式</p>
                    <p>学校举行“双代会"代表专题培训</p>
                    <p>后勤举办2019年度技能比武大赛</p>
                    <p>钱江学院召开第六次共青团、学生代表大会</p>
                    <p>学校创建设立2019级本科生“笃学寝室”</p>
                    <p>“校警联动机制共建”启动</p>
                    <p>我校党外代表人士参加杭州市人民政协理论</p>
                </div>
            </div>
            <div class="col-md-4 col-lg-4 col-sm-6 col-xs-12">
                <div class="text-icon-box relative mb50 wow fadeInUp" data-wow-delay="0.1s">
                    <a href="#"><span class="course-price">more &gt; &gt;</span></a>
                    <h3 class="area-title">媒体师大</h3>
                    <p>聚焦：“不忘初心、牢记使命”主题教育</p>
                    <p>学校举办第二期“启创班”开班仪式</p>
                    <p>学校举行“双代会"代表专题培训</p>
                    <p>后勤举办2019年度技能比武大赛</p>
                    <p>钱江学院召开第六次共青团、学生代表大会</p>
                    <p>学校创建设立2019级本科生“笃学寝室”</p>
                    <p>“校警联动机制共建”启动</p>
                    <p>我校党外代表人士参加杭州市人民政协理论</p>
                </div>
            </div>
            <div class="col-md-4 col-lg-4 col-sm-6 col-xs-12">
                <div class="text-icon-box relative mb50 wow fadeInUp" data-wow-delay="0.1s">
                    <a href="#"><span class="course-price">more &gt; &gt;</span></a>
                    <h3 class="area-title">学术预告</h3>
                    <p>聚焦：“不忘初心、牢记使命”主题教育</p>
                    <p>学校举办第二期“启创班”开班仪式</p>
                    <p>学校举行“双代会"代表专题培训</p>
                    <p>后勤举办2019年度技能比武大赛</p>
                    <p>钱江学院召开第六次共青团、学生代表大会</p>
                    <p>学校创建设立2019级本科生“笃学寝室”</p>
                    <p>“校警联动机制共建”启动</p>
                    <p>我校党外代表人士参加杭州市人民政协理论</p>
                </div>
            </div>
        </div>
    </div>
</section>
<!--FAQS AREA END-->

<!--ABOUT TOP CONTENT AREA-->
<section class="section-padding">
    <div class="container">
        <div class="row">
            <div class="col-md-8 col-lg-8 col-md-offset-2 col-lg-offset-2 col-sm-12 col-xs-12">
                <div class="text-center wow fadeIn">
                    <h2 class="xs-font20">杭州师范大学（Hangzhou Normal University）</h2>
                    <p>现有仓前、下沙、玉皇山三个校区，占地面积198.9万平方米，有固定资产总值26.02亿元，博士、硕士点132个，有72个本科专业。化学、临床医学、植物学与动物学进入ESI前1%，2018年学校最新ESI国内综合排名位列第94，论文自然指数（NI）连续三年进入中国内地高校百强。</p>
                </div>
            </div>
        </div>
    </div>
</section>
<!--ABOUT TOP CONTENT AREA END-->

<!--FUN FACT AREA AREA-->
<section class="fun-fact-area center white relative padding-100-70" id="fact">
    <div class="area-bg" data-stellar-background-ratio="0.6"></div>
    <div class="container">
        <div class="row">
            <div class="col-md-3 col-sm-6 col-xs-12">
                <div class="single-fun-fact mb30 wow fadeInUp" data-wow-delay="0.1s">
                    <h3 class="font60 xs-font26"><span class="counter">17000</span></h3>
                    <p class="font600">本科生</p>
                </div>
            </div>
            <div class="col-md-3 col-sm-6 col-xs-12">
                <div class="single-fun-fact mb30 wow fadeInUp" data-wow-delay="0.2s">
                    <h3 class="font60 xs-font26"><span class="counter">2300</span></h3>
                    <p class="font600">博士和硕士学位研究生</p>
                </div>
            </div>
            <div class="col-md-3 col-sm-6 col-xs-12">
                <div class="single-fun-fact mb30 wow fadeInUp" data-wow-delay="0.3s">
                    <h3 class="font60 xs-font26"><span class="counter">1500</span></h3>
                    <p class="font600">留学生</p>
                </div>
            </div>
            <div class="col-md-3 col-sm-6 col-xs-12">
                <div class="single-fun-fact mb30 wow fadeInUp" data-wow-delay="0.4s">
                    <h3 class="font60 xs-font26"><span class="counter">21207</span></h3>
                    <p class="font600">在校生</p>
                </div>
            </div>
        </div>
    </div>
</section>
<!--FUN FACT AREA AREA END-->

<!--CLIENT AREA-->
<div class="client-area  padding-bottom mt100 sm-mt10 xs-mt0">
    <div class="container">
        <div class="row">
            <div class="col-md-12 col-lg-12 col-sm-12 col-xs-12">
                <div class="client-slider">
                    <div class="single-client">
                        <img src="" data-src="<%=request.getContextPath()%>/resources/images/weibo.png" alt="">
                        <p class="footer-wz">官方微博</p>
                    </div>
                    <div class="single-client">
                        <img src="" data-src="<%=request.getContextPath()%>/resources/images/weixin.png" alt="">
                        <p class="footer-wz">官方微信</p>
                    </div>
                    <div class="single-client">
                        <img src="" data-src="<%=request.getContextPath()%>/resources/images/sydw.png" alt="">
                        <p class="footer-wz">事业单位</p>
                    </div>
                    <div class="single-client">
                        <img src="" data-src="<%=request.getContextPath()%>/resources/images/tsg.png" alt="" style="padding-top: 40px;">
                        <p class="footer-wz">图书馆</p>
                    </div>
                    <div class="single-client" style="padding-top: 40px;">
                        <img src="" data-src="<%=request.getContextPath()%>/resources/images/xxgkw.png" alt="">
                        <p class="footer-wz">信息公开网</p>
                    </div>
                    <div class="single-client">
                        <img src="" data-src="<%=request.getContextPath()%>/resources/images/app.png" alt="">
                        <p class="footer-wz">智慧校园APP</p>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<!--CLIENT AREA END-->



<!--FOOER AREA-->
<footer class="footer-area sky-gray-bg relative">
    <div class="footer-top-area padding-80-80 bg-dark">
        <div class="container">
            <div class="row">
                <div class="col-md-5 col-lg-5 col-sm-12 col-xs-12">
                    <div class="single-footer footer-about white sm-mb50 xs-mb50 sm-center xs-center">
                        <h2 class="mb30 xs-font18">HZNU</h2>
                        <p>地址：浙江省杭州市余杭区仓前街道余杭塘路2318号</p>
                        <p>联系电话：0571-28865012</p>
                        <p>邮编：311121</p>
                    </div>
                </div>
                <div class="col-md-2 col-lg-2 col-sm-4 col-xs-12">
                    <div class="single-footer footer-list white xs-center xs-mb50">
                        <ul>
                            <li><a onclick="window.open('important')">师大要闻</a></li>
                            <li><a href="#">通知公告</a></li>
                            <li><a href="#">教学科研</a></li>
                            <li><a href="#">党建文化</a></li>
                            <li><a href="#">媒体师大</a></li>
                            <li><a href="#">学术预告</a></li>
                        </ul>
                    </div>
                </div>
                <div class="col-md-5 col-lg-5 col-sm-8 col-xs-12">
                    <div class="single-footer footer-subscribe white xs-center">
                        <h3 class="mb30 xs-font18">招生热线</h3>
                        <p>本科招生热线: 0571-28865193</p>
                        <p>研究生招生热线：0571-28865143</p>
                        <div class="subscriber-form-area mt50 wow fadeIn">
                            <!--<form action="#" class="subscriber-form mb100">
                                <input type="email" name="email" id="email" placeholder="Email Address">
                                <button type="submit">Subscribe</button>
                            </form>-->
                            <form id="mc-form" class="subscriber-form">
                                <label class="mt10" for="mc-email"></label>
                                <input type="email" id="mc-email" placeholder="搜索">
                                <button type="submit" class="plus-btn"><i class="fa fa-paper-plane-o"></i></button>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div class="footer-bottom-area white">
        <div class="container">
            <div class="row">
                <div class="col-md-12 col-lg-12 col-sm-12 col-xs-12">
                    <div class="footer-copyright text-center wow fadeIn">
                        <p><!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->
                            Copyright &copy; 杭州师范大学<script>document.write(new Date().getFullYear());</script>
                            <!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. --></p>
                    </div>
                </div>
            </div>
        </div>
    </div>
</footer>
<!--FOOER AREA END-->




<!--====== SCRIPTS JS ======-->
<script src="<%=request.getContextPath()%>/resources/css/default/js/vendor/jquery-1.12.4.min.js"></script>
<script src="<%=request.getContextPath()%>/resources/css/default/js/vendor/bootstrap.min.js"></script>

<!--====== PLUGINS JS ======-->
<script src="<%=request.getContextPath()%>/resources/css/default/js/vendor/jquery.easing.1.3.js"></script>
<script src="<%=request.getContextPath()%>/resources/css/default/js/vendor/jquery-migrate-1.2.1.min.js"></script>
<script src="<%=request.getContextPath()%>/resources/css/default/js/vendor/jquery.appear.js"></script>
<script src="<%=request.getContextPath()%>/resources/css/default/js/owl.carousel.min.js"></script>
<script src="<%=request.getContextPath()%>/resources/css/default/js/stellar.js"></script>
<script src="<%=request.getContextPath()%>/resources/css/default/js/waypoints.min.js"></script>
<script src="<%=request.getContextPath()%>/resources/css/default/js/jquery.counterup.min.js"></script>
<script src="<%=request.getContextPath()%>/resources/css/default/js/wow.min.js"></script>
<script src="<%=request.getContextPath()%>/resources/css/default/js/jquery-modal-video.min.js"></script>
<script src="<%=request.getContextPath()%>/resources/css/default/js/stellarnav.min.js"></script>
<script src="<%=request.getContextPath()%>/resources/css/default/js/placeholdem.min.js"></script>
<script src="<%=request.getContextPath()%>/resources/css/default/js/contact-form.js"></script>
<script src="<%=request.getContextPath()%>/resources/css/default/js/jquery.ajaxchimp.js"></script>
<script src="<%=request.getContextPath()%>/resources/css/default/js/jquery.sticky.js"></script>
<script src="<%=request.getContextPath()%>/resources/js/util/staticUrl.js" type="text/javascript"></script>
<script src="<%=request.getContextPath()%>/resources/js/default.js"></script>
<script src="<%=request.getContextPath()%>/resources/js/base.js"></script>

<!--===== ACTIVE JS=====-->
<script src="<%=request.getContextPath()%>/resources/css/default/js/main.js"></script>

</body>

</html>
