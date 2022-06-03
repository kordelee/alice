<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>

<%@include file="../xdmin/include/head.jsp"%>

</head>
<body>
memberOracleList



<c:forEach items="${list}" var="item" varStatus="status">
	<c:out value="${list.ifmmSeq }"/>
	<br><c:out value="${list.ifmmId }"/>	
	<br><c:out value="${list.ifmmName }"/>	
	<br><c:out value="${list.ifmmAge }"/>	
	<br><c:out value="${list.ifmmDob }"/>	
</c:forEach>

</body>
</html>