<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>

<%@include file="../include/head.jsp"%>

<style type="text/css">
	
</style>
</head>
<body>

<!-- top s -->
<%@include file="../include/top.jsp"%>
<!-- top e -->

<!-- gnb s -->
<%@include file="../include/gnb.jsp"%>
<!-- gnb e -->

<!-- right menu s -->
<%@include file="../include/right.jsp"%>
<!-- right menu e -->

<!-- contents s -->

<div class="container-fluid">
	<div class="row">
		<div class="col-sm-2 d-none d-md-block">
		
sessSeq: <c:out value="${sessSeq }"/><br>
sessName: <c:out value="${sessName }"/><br>
sessId: <c:out value="${sessId }"/><br>
<c:if test="${not empty sessSeq}">
	<button type="button" class="btn btn-danger btn-sm" name="" id="btnLogout"><i class="fa-solid fa-power-off"></i></button>
</c:if>

		</div>
	</div>
</div>
<!-- contents e -->


<!-- footer s -->
<%@include file="../include/footer.jsp"%>
<!-- footer e -->

<!-- modalBase s -->
<%@include file="../include/modalBase.jsp"%>
<!-- modalBase e -->

<!-- linkJs s -->
<%@include file="../include/linkJs.jsp"%>
<!-- linkJs e -->
	
<script>

	$(document).ready(function(){

	});
	
	$("#btnLogout").on("click", function(){
		$.ajax({
			async: true 
			,cache: false
			,type: "post"
			,url: "/member/logoutProc"
			,data: {}
			,success: function(response) {
				if(response.rt == "success") {
					location.href = URL_LOGIN_FORM;
				} else {
					// by pass
				}
			}
			,error : function(jqXHR, textStatus, errorThrown){
				alert("ajaxUpdate " + jqXHR.textStatus + " : " + jqXHR.errorThrown);
			}
		});
	});
     
</script>

</body>
</html>