<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%-- <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> --%>
<%@ page import="a.b.c.com.emp.vo.EmpVO" %>
<%@ page import="java.util.List" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>EMP SELECT ALL</title>
</head>
<body>
<h3>EMP SELECT ALL : jsp</h3>
<hr>
<%
	Object obj = request.getAttribute("listAll");
	if (obj == null) {return;}
	
	List<EmpVO> list = (List<EmpVO>)obj;
	if (list.size() > 0) {
		for (int i = 0; i < list.size(); i++) {
			EmpVO evo = list.get(i);
%>			
			<%= evo.getEmpno() %>
			<%= evo.getEname() %>
			<%= evo.getHiredate() %><br>
<%	
			// out.println(evo.getEmpno());
			// out.println(evo.getEname());
			// out.println(evo.getHiredate() + "<br>");
		}
	}
%>
<table border="1">
	<thead>
		<tr>
			<td>EmpNO</td>
			<td>ENAME</td>
			<td>HIREDATE</td>
		</tr>
	</thead>
	<%
		for (int i=0; i<list.size(); i++) {
			EmpVO empVO = (EmpVO) list.get(i);
	%>
	<tr>
		<td><%=empVO.getEmpno() %></td>
		<td><%=empVO.getEname() %></td>
		<td><%=empVO.getHiredate() %></td>
	</tr>
	<%
		}
	%>
</table>
<h3>EMP SELECT ALL : jstl & el</h3>
<hr>
	<c:forEach items="${listAll }" var="emp">
		${emp.empno }
		${emp.ename }
		${emp.hiredate }<br>
	</c:forEach>
<h3>EMP SELECT ALL : jsp & el</h3>
<hr>
</body>
</html>