<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>

<%@include file="../../xdmin/include/head.jsp"%>

</head>
<body>
memberOracleList
<br>



<c:forEach items="${list}" var="item" varStatus="status">
	<c:out value="${item.ifmmSeq }"/>
	<br><c:out value="${item.ifmmId }"/>	
	<br><c:out value="${item.ifmmName }"/>	
	<%-- <br><c:out value="${item.ifmmAge }"/>	 --%>
	<br><c:out value="${item.ifmmDob }"/>
	<br>#####################################<br>
</c:forEach>

</body>
</html>