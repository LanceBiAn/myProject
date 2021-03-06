<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    <title></title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	
	<link rel="stylesheet" href="${pageContext.request.contextPath}/util/bootstrap/css/bootstrap.css" /> 
	<link rel="stylesheet" href="${pageContext.request.contextPath}/css/css.css" />
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery.min.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/util/bootstrap/js/bootstrap.min.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/sdmenu.js"></script>
	<script type="text/javascript">
	</script>
  </head>
<body>
<jsp:include page="/frame/head.jsp"/>
<div id="middle">
	<jsp:include page="/frame/stu_menu.jsp"/>
    <div class="right"  id="mainFrame">
         <div class="right_cont">
              <ul class="breadcrumb">当前位置：
                <span>学生</span> <span class="divider">/</span>
               	<b>信息管理</b><span class="divider"></span>	 
              </ul>
             <div class="title_right"><b>个人信息</b></div>
             <div style="width:900px;margin:auto;"></div>
             <div id="content" class="container-fluid">
             	<div class="col-md-12" align="center" style="margin-top:50px">
	             		<div class="panel panel-success" style="width:650px">
						  <div class="panel-heading">个人信息</div>
						  <div class="panel-body">
						    <table class="table table-bordered" style="text-align:center">
						    	<tr>
						    		<td class="active">学号</td>
						    		<td>${stuinfo.stuId}</td>
						    		<td class="active">姓名</td>
						    		<td>${stuinfo.stuName}</td>
						    	</tr>
						    	<tr>
						    		<td class="active">性别</td>
						    		<td>${stuinfo.stuSex}</td>
						    		<td class="active">籍贯</td>
						    		<td>${stuinfo.stuOrg}</td>
						    	</tr>
						    	<tr>
						    		<td class="active">学年制</td>
						    		<td>${stuinfo.stuNz}</td>
						    		<td class="active">年级</td>
						    		<td>${stuinfo.stuGride}</td>
						    	</tr>
						    	<tr>
						    		<td class="active">学院</td>
						    		<td>${stuinfo.stuXy}</td>
						    		<td class="active">专业</td>
						    		<td>${stuinfo.stuMajor}</td>
						    	</tr>
						    	<tr>
						    		<td class="active">联系方式</td>
						    		<td>${stuinfo.stuTel}</td>
						    		<td class="active">入住状态</td>
						    		<td>${stuinfo.stuInState}</td>
						    	</tr>
						    	<tr>
						    		<td class="active">宿舍楼栋</td>
						    		<td>${stuinfo.stuBanId}栋</td>
						    		<td class="active">宿舍号</td>
						    		<td>${stuinfo.stuDormId}</td>
						    	</tr>
						    </table>
						  </div>
						</div><!-- end panel -->
             	</div>
			 </div>
        </div>
    </div><!-- end right -->
</div><!-- end middle -->
<jsp:include page="/frame/footer.jsp"/>
</body>
</html>
