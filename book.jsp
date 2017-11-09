<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>图书</title>
</head>
<body>

<h1>图书选购</h1>
<hr>
<center>
<table>
<tr>
<td><a>图书</a></td>
<td><a href="FoodServlet" >食品</a></td>
</tr>
</table>
<Form>
<table>
<tr align="center">
<th>序号</th>
<th>名称</th>
<th>图片</th>
<th>价格</th>
</tr>
<c:forEach var="book" items="${BookList}"  varStatus="status">
<tr align="center">
<td>${status.index + 1}</td>
<td>${book.name}</td>
<td><a href="DetailServlet?id=${book.id}"><img alt="" src="images/${book.picture}" width="100" height="100"/></a></td>
<td>${book.price}</td>
</tr>
</c:forEach>
</table>
<input type="button" value="退出" onclick="window.location.href = 'login.jsp'"/>
</Form>
</center>

</body>
</html>