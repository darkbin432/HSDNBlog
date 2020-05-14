<%--
  Created by IntelliJ IDEA.
  User: 斌
  Date: 2019/12/22
  Time: 15:20
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <title>杭州师范大学·新闻管理</title>
    <meta content="IE=edge,chrome=1" http-equiv="X-UA-Compatible">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="">
    <meta name="author" content="">
    <link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/resources/lib/bootstrap/css/bootstrap.css">
    <link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/resources/css/theme.css">
    <link rel="stylesheet" href="<%=request.getContextPath()%>/resources/lib/font-awesome/css/font-awesome.css">
    <script src="<%=request.getContextPath()%>/resources/lib/jquery-1.7.2.min.js" type="text/javascript"></script>
    <script src="<%=request.getContextPath()%>/resources/ace/js/bootbox.js" type="text/javascript"></script>
    <style type="text/css">
        #line-chart {
            height:300px;
            width:800px;
            margin: 0px auto;
            margin-top: 1em;
        }
        .brand { font-family: georgia, serif; }
        .brand .first {
            color:#FFFFFF;
            font-style: italic;
        }
        .brand .second {
            color: #fff;
            font-weight: bold;
        }
    </style>
    <link rel="shortcut icon" href="../assets/ico/favicon.ico">
    <link rel="apple-touch-icon-precomposed" sizes="144x144" href="../assets/ico/apple-touch-icon-144-precomposed.png">
    <link rel="apple-touch-icon-precomposed" sizes="114x114" href="../assets/ico/apple-touch-icon-114-precomposed.png">
    <link rel="apple-touch-icon-precomposed" sizes="72x72" href="../assets/ico/apple-touch-icon-72-precomposed.png">
    <link rel="apple-touch-icon-precomposed" href="../assets/ico/apple-touch-icon-57-precomposed.png">
</head>



<body class="">
<div class="navbar">
    <div class="navbar-inner">
        <ul class="nav pull-right">

            <li><a href="<%=request.getContextPath()%>/" class="hidden-phone visible-tablet visible-desktop" role="button">
                首页</a></li>

            <li id="fat-menu" class="dropdown">
                <a href="#" role="button" class="dropdown-toggle" data-toggle="dropdown" id="currentUser">
                    <i class="icon-user"></i>管理员
                    <i class="icon-caret-down"></i>
                </a>

                <ul class="dropdown-menu">
                    <li><a tabindex="-1" href="#">我的数据</a></li>
                    <li class="divider"></li>
                    <li><a tabindex="-1" class="visible-phone" href="#">首页</a></li>
                    <li class="divider visible-phone"></li>
                    <li><a tabindex="-1" href="<%=request.getContextPath()%>/manage/logout">退出</a></li>
                </ul>
            </li>

        </ul>
        <a class="brand" href="<%=request.getContextPath()%>/manage/index"><span class="first">杭州师范大学</span> <span class="second">新闻管理中心</span></a>
    </div>
</div>



<div class="sidebar-nav">
    <a href="#dashboard-menu" class="nav-header" data-toggle="collapse"><i class="icon-dashboard"></i>数据操作</a>
    <ul id="dashboard-menu" class="nav nav-list collapse in">
        <li><a href="<%=request.getContextPath()%>/manage/index">全部新闻</a></li>
        <li ><a onclick="javascript:localStorage.removeItem('editId')" href="<%=request.getContextPath()%>/manage/edit">内容编辑</a></li>
        <%--<li ><a href="<%=request.getContextPath()%>/manage/search">新闻查找</a></li>--%>
    </ul>

    <a href="#accounts-menu" class="nav-header" data-toggle="collapse"><i class="icon-briefcase"></i>用户</a>
    <ul id="accounts-menu" class="nav nav-list collapse">
        <li ><a href="<%=request.getContextPath()%>/manage/logout">重新登陆</a></li>
        <li ><a href="<%=request.getContextPath()%>/manage/personal">更改密码</a></li>
    </ul>

    <a href="#error-menu" class="nav-header collapsed" data-toggle="collapse"><i class="icon-exclamation-sign"></i>更多<i class="icon-chevron-up"></i></a>
    <ul id="error-menu" class="nav nav-list collapse">
        <li ><a href="403.html">403 page</a></li>
        <li ><a href="404.html">404 page</a></li>
        <li ><a href="500.html">500 page</a></li>
        <li ><a href="503.html">503 page</a></li>
    </ul>
</div>


<div class="content">

    <div class="header">

        <h1 class="page-title">全部新闻</h1>
    </div>

    <ul class="breadcrumb">
        <li><a href="<%=request.getContextPath()%>/manage/index">数据操作</a> <span class="divider">/</span></li>
        <li class="active">全部新闻</li>
    </ul>

    <div class="container-fluid">
        <div class="row-fluid">

            <div class="btn-toolbar">
                <button class="btn btn-primary" id="insertNews"><i class="icon-plus"></i>新建内容</button>
                <label style="display: inline;margin-left: 40px;vertical-align: middle;">条件查询：<input type="text" placeholder="请输入新闻标题或作者" class="span12" style="width: 300px;margin-top: 10px;" id="searchText"><a id="toSearch" class="btn btn-primary" style="margin-left: 10px;">查询</a></label>
            </div>
            <div class="well">
                <table class="table">
                    <thead>
                    <tr>
                        <th>创建日期</th>
                        <th>新闻标题</th>
                        <th>新闻类别</th>
                        <th>作者</th>
                        <th>发布状态</th>
                        <th style="width: 26px;"></th>
                    </tr>
                    </thead>
                    <tbody id="newsList">
                    <%--<tr>--%>
                        <%--<td>2019.12.19</td>--%>
                        <%--<td>《Science Translational Medicine》发表医学院谢恬教授国际合作研究成果</td>--%>
                        <%--<td>师大要闻</td>--%>
                        <%--<td>陈鑫</td>--%>
                        <%--<td>--%>
                            <%--<a href="<%=request.getContextPath()%>/manage/edit"><i class="icon-pencil"></i></a>--%>
                            <%--<a href="#myModal" role="button" data-toggle="modal"><i class="icon-remove"></i></a>--%>
                        <%--</td>--%>
                    <%--</tr>--%>
                    <%--<tr>--%>
                        <%--<td>2019.12.18</td>--%>
                        <%--<td>学校召开2019年招生就业工作会议</td>--%>
                        <%--<td>师大要闻</td>--%>
                        <%--<td>单蔚</td>--%>
                        <%--<td>--%>
                            <%--<a href="<%=request.getContextPath()%>/manage/edit"><i class="icon-pencil"></i></a>--%>
                            <%--<a href="#myModal" role="button" data-toggle="modal"><i class="icon-remove"></i></a>--%>
                        <%--</td>--%>
                    <%--</tr>--%>
                    <%--<tr>--%>
                        <%--<td>2019.12.17</td>--%>
                        <%--<td>张杭君教授获“2019年浙江省有突出贡献青年科技人才”称号</td>--%>
                        <%--<td>师大要闻</td>--%>
                        <%--<td>曾红月</td>--%>
                        <%--<td>--%>
                            <%--<a href="<%=request.getContextPath()%>/manage/edit"><i class="icon-pencil"></i></a>--%>
                            <%--<a href="#myModal" role="button" data-toggle="modal"><i class="icon-remove"></i></a>--%>
                        <%--</td>--%>
                    <%--</tr>--%>
                    <%--<tr>--%>
                        <%--<td>2019.12.16</td>--%>
                        <%--<td>学校召开2019年情况通报会</td>--%>
                        <%--<td>通知公告</td>--%>
                        <%--<td>邱璐</td>--%>
                        <%--<td>--%>
                            <%--<a href="<%=request.getContextPath()%>/manage/edit"><i class="icon-pencil"></i></a>--%>
                            <%--<a href="#myModal" role="button" data-toggle="modal"><i class="icon-remove"></i></a>--%>
                        <%--</td>--%>
                    <%--</tr>--%>
                    <%--<tr>--%>
                        <%--<td>2019.12.17</td>--%>
                        <%--<td>陈春雷率团访问南非、坦桑尼亚高校</td>--%>
                        <%--<td>通知公告</td>--%>
                        <%--<td>谢曼萍</td>--%>
                        <%--<td>--%>
                            <%--<a href="<%=request.getContextPath()%>/manage/edit"><i class="icon-pencil"></i></a>--%>
                            <%--<a href="#myModal" role="button" data-toggle="modal"><i class="icon-remove"></i></a>--%>
                        <%--</td>--%>
                    <%--</tr>--%>
                    <%--<tr>--%>
                        <%--<td>2019.12.12</td>--%>
                        <%--<td>人文学院学生“老字号立法”调研项目获省委常委、市委书记周江勇批示</td>--%>
                        <%--<td>人文学院</td>--%>
                        <%--<td>媒体师大</td>--%>
                        <%--<td>--%>
                            <%--<a href="<%=request.getContextPath()%>/manage/edit"><i class="icon-pencil"></i></a>--%>
                            <%--<a href="#myModal" role="button" data-toggle="modal"><i class="icon-remove"></i></a>--%>
                        <%--</td>--%>
                    <%--</tr>--%>
                    <%--<tr>--%>
                        <%--<td>2019.12.11</td>--%>
                        <%--<td>【星耀师大】聚焦“美”，一直在路上</td>--%>
                        <%--<td>通知公告</td>--%>
                        <%--<td>邱璐、许嘉璐、方艺</td>--%>
                        <%--<td>--%>
                            <%--<a href="<%=request.getContextPath()%>/manage/edit"><i class="icon-pencil"></i></a>--%>
                            <%--<a href="#myModal" role="button" data-toggle="modal"><i class="icon-remove"></i></a>--%>
                        <%--</td>--%>
                    <%--</tr>--%>
                    <%--<tr>--%>
                        <%--<td>2019.12.11</td>--%>
                        <%--<td>【星耀师大】聚焦“美”，一直在路上</td>--%>
                        <%--<td>党建文化</td>--%>
                        <%--<td>邱璐、许嘉璐、方艺</td>--%>
                        <%--<td>--%>
                            <%--<a href="<%=request.getContextPath()%>/manage/edit"><i class="icon-pencil"></i></a>--%>
                            <%--<a href="#myModal" role="button" data-toggle="modal"><i class="icon-remove"></i></a>--%>
                        <%--</td>--%>
                    <%--</tr>--%>
                    <%--<tr>--%>
                        <%--<td>2019.12.11</td>--%>
                        <%--<td>【星耀师大】聚焦“美”，一直在路上</td>--%>
                        <%--<td>党建文化</td>--%>
                        <%--<td>邱璐、许嘉璐、方艺</td>--%>
                        <%--<td>--%>
                            <%--<a href="<%=request.getContextPath()%>/manage/edit"><i class="icon-pencil"></i></a>--%>
                            <%--<a href="#myModal" role="button" data-toggle="modal"><i class="icon-remove"></i></a>--%>
                        <%--</td>--%>
                    <%--</tr>--%>
                    <%--<tr>--%>
                        <%--<td>2019.12.11</td>--%>
                        <%--<td>【星耀师大】聚焦“美”，一直在路上</td>--%>
                        <%--<td>学术预告</td>--%>
                        <%--<td>邱璐、许嘉璐、方艺</td>--%>
                        <%--<td>--%>
                            <%--<a href="<%=request.getContextPath()%>/manage/edit"><i class="icon-pencil"></i></a>--%>
                            <%--<a href="#myModal" role="button" data-toggle="modal"><i class="icon-remove"></i></a>--%>
                        <%--</td>--%>
                    <%--</tr>--%>
                    </tbody>
                </table>
            </div>
            <div class="pagination">
                <ul id="pageList">
                    <li><a href="#">上一页</a></li>
                    <li><a href="#">1</a></li>
                    <li><a href="#">2</a></li>
                    <li><a href="#">3</a></li>
                    <li><a href="#">4</a></li>
                    <li><a href="#">下一页</a></li>
                </ul>
            </div>

            <div class="modal small hide fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
                    <h3 id="myModalLabel">重要提示</h3>
                </div>
                <div class="modal-body">
                    <p class="error-text"><i class="icon-warning-sign modal-icon"></i>真的要删除它吗？</p>
                </div>
                <div class="modal-footer">
                    <button class="btn" data-dismiss="modal" aria-hidden="true">取消</button>
                    <button class="btn btn-danger" data-dismiss="modal" id="indexToDelete">删除</button>
                </div>
            </div>
            <footer>
                <hr>
                <p class="pull-right">版权所有<a href="http://www.cssmoban.com/" title="网页模板" target="_blank">杭州师范大学</a></p>
            </footer>
        </div>
    </div>
</div>


<script src="<%=request.getContextPath()%>/resources/lib/bootstrap/js/bootstrap.js"></script>
<script src="<%=request.getContextPath()%>/resources/js/util/staticUrl.js" type="text/javascript"></script>
<script src="<%=request.getContextPath()%>/resources/js/index.js"></script>
<script type="text/javascript">
    $("[rel=tooltip]").tooltip();
    $(function() {
        $('.demo-cancel-click').click(function(){return false;});
    });
</script>

</body>
</html>


