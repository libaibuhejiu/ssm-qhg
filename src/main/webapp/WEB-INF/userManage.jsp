<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>用户管理</title>
<script type="text/javascript" src="/ssm-project/js/jquery.3.3.1.js"></script>
<script type="text/javascript">
	function addUser(){
		window.location.href="<%=this.getServletContext().getContextPath() %>/user/addWin";
	}
	
	function findUser(){
		var usernameCondition = $("#findCondition").val();
		window.location.href="/ssm-project/user/findByUsernameCondition?username="+usernameCondition;
	}
	
	function deleteUser(id){
		if (confirm("确认删除该用户吗？")) {
			$.ajax({
				type:"POST",
				url:"/ssm-project/user/deleteUserById?id="+id,
				data:{
					
				},
				dataType:"json",
				success:function(data){
					if (data.status == "1") {
						alert("删除成功！");
						window.location.href="/ssm-project/user/userManage";
					}
					if (data.status == "0") {
						alert("删除失败，请重试！");
					}
				}
			})
		}
		return;
	}
	
</script>
</head>
<body>
	<div>
		<input id="add_button" type="button" onclick="addUser()"  value="新增用户">
		<input id="findCondition" type="text" style="margin-left:100px">
		<input id="find_button" type="button" onclick="findUser()" value="查找用户">
	</div>
	<div id="userList">
		<div id="table_area">
			<table id="table_uesr" border="1">
				<thead>
					<tr>
						<td>用户id</td>
						<td>用户名</td>
						<td>密码</td>
						<td>操作</td>
					</tr>
				</thead>
				<tbody>
					<c:forEach items="${pageBean.userList }" var="user">
						<tr>
							<td>${user.id }</td>
							<td>${user.username }</td>
							<td>${user.password }</td>
							<td>
								<a href="/ssm-project/user/updateWin?id=${user.id }">修改</a>
								<a href="#" onclick="deleteUser(${user.id})">删除</a>
							</td>
						</tr>
					</c:forEach>
<tr align="center">
   <td colspan="9">
	第<font style="color: blue">${pageBean.currPage }/${pageBean.totalPage }</font>页   
	每页显示<font style="color: blue">${pageBean.pageSize }</font>条   
	总记录数<font style="color: blue">${pageBean.allCount }</font>条  
	<c:if test="${pageBean.currPage != 1 }">  <!-- 判断当前页是否第一页,若不是第一页,就显示首页和下一页,反之不显示 -->
	   <a href="${pageContext.request.contextPath }/user/findUsersByPage?currPage=1" style="text-decoration: none">首页</a>
	   <a href="${pageContext.request.contextPath }/user/findUsersByPage?currPage=${pageBean.currPage - 1}"  style="text-decoration: none">前一页 </a>
	</c:if>
	<c:if test="${pageBean.totalPage <= 9 }"> <!-- 分页显示页码这里选择的是9,若是总页数小于等于9,则全部显示 -->
	   <c:forEach begin="1" var="i" end="${pageBean.totalPage }">
		<c:if test="${pageBean.currPage == i }">
		   <font style="color: red">${i }</font> 
		</c:if>
		<c:if test="${pageBean.currPage != i }"> <!-- 选择你要去的页数,假如当前页是4,然后点击6,此时i=6,点击后跳转第6页 -->
			<a href="${pageContext.request.contextPath }/user/findUsersByPage?currPage=${i }" style="text-decoration: none">${i } </a>
		</c:if>
	    </c:forEach>	
	</c:if>
	<c:if test="${pageBean.totalPage > 9 }"><!-- 当总页数大于9的时候 -->
		<c:if test="${pageBean.currPage <= 5 }"> <!-- 若是当前页小于5,则显示9个页码后用...代替,表示后面还有 -->
			<c:forEach var="i" begin="1" end="9">
				<c:if test="${pageBean.currPage == i }">
					<font style="color: red">${i }</font> 
				</c:if>
				<c:if test="${pageBean.currPage != i }">
				<a href="${pageContext.request.contextPath }/user/findUsersByPage?currPage=${i }" style="text-decoration: none">${i } </a>
				</c:if>
			</c:forEach>
						...
		</c:if>
		<c:if test="${pageBean.currPage > 5 }"> <!-- 若是当前页大于5,则需要进行下面的判断 -->
			<c:if test="${pageBean.currPage + 4 < pageBean.totalPage }">  <!-- 若是这种情况,则为中间显示9个页码,前后均为... -->
				...
				<c:forEach var="i" begin="${pageBean.currPage - 4 }" end="${pageBean.currPage + 4  }">
					<c:if test="${pageBean.currPage == i }">
						<font style="color: red">${i }</font> 
					</c:if>
					<c:if test="${pageBean.currPage != i }">
				<a href="${pageContext.request.contextPath }/user/findUsersByPage?currPage=${i }" style="text-decoration: none">${i } </a>
					</c:if>
				</c:forEach>
				...
			</c:if>
			<c:if test="${pageBean.currPage + 4 >= pageBean.totalPage }"><!-- 若是这种情况,只需前面加上...即可 -->
				...
				<c:forEach var="i" begin="${pageBean.totalPage - 8 }" end="${pageBean.totalPage }">
					<c:if test="${pageBean.currPage == i }">
						<font style="color: red">${i }</font> 
					</c:if>
					<c:if test="${pageBean.currPage != i }">
				<a href="${pageContext.request.contextPath }/user/findUsersByPage?currPage=${i }" style="text-decoration: none">${i } </a>
					</c:if>
				</c:forEach>
			</c:if>
		</c:if>
	</c:if>
	<c:if test="${pageBean.currPage != pageBean.totalPage }"> <!-- 此情况和显示首页前一页类似,不再赘述 -->
	<a href="${pageContext.request.contextPath }/user/findUsersByPage?currPage=${pageBean.currPage + 1 }" style="text-decoration: none">后一页</a>
		<a href="${pageContext.request.contextPath }/user/findUsersByPage?currPage=${pageBean.totalPage }" style="text-decoration: none">末页</a>
	</c:if> 
   </td>
</tr>
				</tbody>
			</table>
		</div>
	</div>
</body>
</html>