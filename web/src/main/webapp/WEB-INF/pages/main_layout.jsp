<%--
  Overall version 1.6
  This version 1.6
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="zh-cn">
<head>
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1"/>
    <meta charset="utf-8"/>

    <meta name="description" content="overview &amp; stats"/>
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0"/>

    <link rel="shortcut icon"  href="<%=request.getContextPath()%>/resources/images/favicon.ico" >

</head>

<body class="no-skin">

<div class="main-container" id="main-container">
    <script type="text/javascript">
        try {
            ace.settings.check('main-container', 'fixed')
        } catch (e) {
        }
    </script>
</div>

<div class="main-content">
    <div class="main-content-inner">
        <!-- #section:basics/content.breadcrumbs -->

        <!-- /section:basics/content.breadcrumbs -->

        <div class="page-content">
            <!-- PAGE CONTENT BEGINS -->
            <jsp:include page="${view}"></jsp:include>
            <!-- PAGE CONTENT ENDS -->
        </div>
        <!-- /.page-content -->
    </div>
</div>
<!-- /.main-content -->




<%--<%@ include file="include/footer.jsp" %>--%>
<!-- /.main-container -->
<!-- inline scripts related to this page -->
</body>
</html>
