<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="com.queuetable.model.*"%>
<%@ page import="java.util.*"%>

<%
	// 取出servlet request 再設定pagecontext供查詢
	List<QueTableVO> list = new ArrayList<QueTableVO>();
	list = (List<QueTableVO>) request.getAttribute("queTableVO");
	pageContext.setAttribute("list", list);
	String storeid = (String) request.getAttribute("storeid");
%> 
<%=list == null%>
<html lang="en">
<head>
<meta charset="UTF-8" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/front-end/bootstrap-4.5.3-dist/css/bootstrap-grid.min.css" />
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/front-end/bootstrap-4.5.3-dist/css/bootstrap.min.css" />
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/front-end/bootstrap-4.5.3-dist/css/bootstrap-reboot.min.css" />
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/front-end/bootstrap-4.5.3-dist/css/customerPickupNo.css" />
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
<title>editQueTable.jsp</title>


</head>
<body bgcolor='white'>
	<table id="table-1">
		<tr>
			<td>
				<h3>S000001:</h3>
				<h4>
					<a href="select_page.jsp">回首頁</a>
				</h4>
			</td>
		</tr>
	</table>

	<%-- 錯誤表列 --%>
	<c:if test="${not empty errorMsgs}">
		<font style="color: red">請修正以下錯誤:</font>
		<ul>
			<c:forEach var="message" items="${errorMsgs}">
				<li style="color: red">${message}</li>
			</c:forEach>
		</ul>
	</c:if>
	<div class="container">
		<table class="table">
			<thead>
				<tr>
					<th scope="col">序號</th>
					<th scope="col">餐桌類型</th>
					<th scope="col">總餐桌數</th>
					<th scope="col">開放桌數</th>
					<th scope="col"></th>
				</tr>
			</thead>
			<tbody>
				<%
					int count = 1;
				%>
				<c:forEach var="queTableVO" items="${list}">
					<tr>
						<th scope="row"><%=count%></th>
						<c:choose>
							<c:when test="${queTableVO.queuetabletype=='2P'}">
								<td>二人桌</td>
							</c:when>
							<c:when test="${queTableVO.queuetabletype=='4P'}">
								<td>四人桌</td>
							</c:when>
							<c:when test="${queTableVO.queuetabletype=='8P'}">
								<td>八人桌</td>
							</c:when>
							<c:when test="${queTableVO.queuetabletype=='10P'}">
								<td>十人桌</td>
							</c:when>
						</c:choose>
						<td>${queTableVO.queuetablettl}</td>
						<td>${queTableVO.queuetableusable}</td>
						<td><input id="storeid" name="storeid" value="${storeid }"
							type="hidden"> <input id="queuetableid"
							class="queuetableid" name="queuetableid"
							value="${queTableVO.queuetableid }" type="hidden"> <input
							name="update" value="修改桌數" type="button" class="btn btn-primary"></td>
							<td><form method="post" action="queueTable.do" style="width:100px;">
						<input id="storeid" name="storeid" value="${storeid }"
							type="hidden"> <input id="queuetalbeid"
							class="queuetableid" name="queuetableid"
							value="${queTableVO.queuetableid}" type="hidden">
							<input name="action" value="delete" type="hidden">
							<input
							name="delete" value="時段刪除" type="submit" class="btn btn-primary"></form></td>
					</tr>
					<%
						count++;
					%>
				</c:forEach>
			</tbody>
		</table>
		<div class="row">
			<div class="col-4"></div>
			<input id="add" onClick="showAddPage()" name="add" value="新增桌型"
				type="button" class="btn btn-primary">
		</div>
		<div id="showPage"></div>
	</div>
</body>
<script
	src="<%=request.getContextPath()%>/front-end/bootstrap-4.5.3-dist/js/jquery-3.4.1.min.js"></script>
<script
	src="<%=request.getContextPath()%>/front-end/bootstrap-4.5.3-dist/js/bootstrap.min.js"></script>
<script
	src="<%=request.getContextPath()%>/front-end/bootstrap-4.5.3-dist/js/popper.min.js"></script>
<script
	src="<%=request.getContextPath()%>/front-end/bootstrap-4.5.3-dist/js/customerPickupNo.js"></script>

<script type="text/javascript">
	function showAddPage() {
		var url = "address";
		$.ajax({
			type : "get",
			async : false, //同步请求
			url : "addQueTable.jsp",
			success : function(dates) {
				//alert(dates);
				$("#showPage").html(dates);//要刷新的div
			},
			error : function() {
				// alert("失败，请稍后再试！");
			}
		});
	}
	// 	function showUpdatePage(e) {
	$(".btn").click(function(e) {
		var url = "address";
		// 		var target = $(e.target);
		$.ajax({
			type : "get",
			async : false, //同步请求
			url : "updateQueTable.jsp",
			data : {
				storeid : $("#storeid").val(),
				queuetableid : $(e.target).prev($(".queuetableid")).val(),

			},
			success : function(dates) {
				//alert(dates);
				$("#showPage").html(dates);//要刷新的div
			},
			error : function() {
				// alert("失败，请稍后再试！");
			}
		});

	});
</script>

</html>

