<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>楼栋管理</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	
	<link rel="stylesheet" href="${pageContext.request.contextPath}/util/bootstrap/css/bootstrap.css" /> 
	<link rel="stylesheet" href="${pageContext.request.contextPath}/css/css.css" />
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery.min.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/util/bootstrap/js/bootstrap.min.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/sdmenu.js"></script>
	<style type="text/css">
		#banVisitInfo th,td{
			text-align:center;
		}
	</style>
	
	<script type="text/javascript">
		function insertLeaveTime(bvId) {
			$.ajax({
				 type:"post",
				 url:"${pageContext.request.contextPath}/insertLeaveTime",
        		 data:{"bvId":bvId},
      			 dataType:"json",
       			 success:function(data) {
       			 	if(data==1) {
       			 		alert("操作成功");
       			 		window.location.reload();
       			 	}
       			 }
       		});
		}
	</script>
  </head>
<body>
<jsp:include page="/frame/head.jsp"/>
<div id="middle">
	<jsp:include page="/frame/dorm_menu.jsp"/>
    <div class="right"  id="mainFrame">
         <div class="right_cont">
              <ul class="breadcrumb">
              	当前位置：
                <span>楼栋管理员</span> <span class="divider">/</span>
               	<b>来访管理</b><span class="divider"></span>	 
              </ul>
             <div class="title_right"><strong>来访人员离开登记</strong></div>
             <div style="width:900px;margin:auto;"></div>
             <div id="content" class="container-fluid" style="height:350px;">
             	<div class="row">
             		 <div class="col-md-12">
					 	<div id="banVisitInfo" style="margin-top:30px;">
					 		<table class="table table-bordered table-hover">
					 			<tr id="ttitle" class="success">
					 				<th>序号</th>
					 				<th>姓名</th>
					 				<th>性别</th>
					 				<th>出示证件类型</th>
					 				<th>证件号</th>
					 				<th>来访日期</th>
					 				<th>来访时间</th>
					 				<th>备注</th>
					 				<th>操作</th>
					 			</tr>
					 			<c:forEach items="${lists}" var="c" varStatus="status">
						 			<tr>
						 				<td>${status.index + 1}</td>
						 				<td>${c.bvName}</td>
						 				<td>${c.bvSex}</td>
						 				<td>${c.bvCredType}</td>
						 				<td>${c.bvCredCode}</td>
						 				<td><fmt:formatDate value="${c.bvDate}" pattern="yyyy-MM-dd" /></td>
						 				<td><fmt:formatDate value="${c.bvIntime}" pattern="HH:mm:ss" /></td>
						 				<td>${c.bvDesc }</td>
						 				<td><button class="btn btn-info btn-xs" onclick="insertLeaveTime(${c.bvId})"><span class="glyphicon glyphicon-saved"></span> 离开</button></td>
						 			</tr>
					 			</c:forEach>
					 		</table>
					 	</div>
                	</div><!-- end col-md-12 -->
                </div> <!-- end row -->
       	     </div><!-- end content -->
       	     <div id="page" align="center">
			 		<nav aria-label="Page navigation" align="center">
					  <ul class="pagination">
					    <!-- 首页 -->
			                <li><a href="${pageContext.request.contextPath}/dormSys_leaveVisit?pn=1">首页</a></li>
			                <!--上一页-->
			                <li>
			                    <c:if test="${pageinfo.hasPreviousPage}">
			                        <a href="${pageContext.request.contextPath}/dormSys_leaveVisit?pn=${pageinfo.pageNum-1}" aria-label="Previous">
			                           <span aria-hidden="true">«</span>
			                        </a>
			                    </c:if>
			                 </li>
			                <!--循环遍历连续显示的页面，若是当前页就显示，并且没有链接-->
			                <c:forEach items="${pageinfo.navigatepageNums}" var="page_num">
			                    <c:if test="${page_num == pageinfo.pageNum}">
			                         <li class="active"><a href="${pageContext.request.contextPath}/dormSys_leaveVisit?pn=${page_num}">${page_num}</a></li>
			                    </c:if>
			                    <c:if test="${page_num != pageinfo.pageNum}">
			                        <li><a href="${pageContext.request.contextPath}/dormSys_leaveVisit?pn=${page_num}">${page_num}</a></li>
			                    </c:if>
			                </c:forEach>
			                <!--下一页-->
			                <li>
			                    <c:if test="${pageinfo.hasNextPage}">
			                        <a href="${pageContext.request.contextPath}/dormSys_leaveVisit?pn=${pageinfo.pageNum+1}" aria-label="Next">
			                          <span aria-hidden="true">»</span>
			                        </a>
			                    </c:if>
			                </li>
			                <!-- 尾页 -->
			                <li><a href="${pageContext.request.contextPath}/dormSys_leaveVisit?pn=${pageinfo.pages}">尾页</a></li>
					  </ul>
					</nav>
					<div align="center">
						当前第&nbsp;[&nbsp;${pageinfo.pageNum}&nbsp;]&nbsp;页,
						共&nbsp;[&nbsp;${pageinfo.pages}&nbsp;]&nbsp;页,
						共&nbsp;[&nbsp;${pageinfo.total}&nbsp;]&nbsp;条记录
					</div>
				</div><!-- end page -->
       </div><!-- end right_cont -->
    </div><!-- end right -->
</div><!-- end middle -->
<jsp:include page="/frame/footer.jsp"/>
</body>
</html>
