<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>

<%@include file="../../include/head.jsp"%>

<style type="text/css">
	
</style>
</head>
<body>

<!-- top s -->
<%@include file="../../include/top.jsp"%>
<!-- top e -->

<!-- gnb s -->
<%@include file="../../include/gnb.jsp"%>
<!-- gnb e -->

<!-- right menu s -->
<%@include file="../../include/right.jsp"%>
<!-- right menu e -->

<!-- contents s -->

<div class="container-fluid">
	<div class="row">
		<div class="col-sm-2 d-none d-md-block">
		
<!-- left menu s -->
<div class="flex-shrink-0 p-3 bg-white">
<!-- 		
   	<a href="/" class="d-flex align-items-center pb-3 mb-3 link-dark text-decoration-none border-bottom">
		<svg class="bi me-2" width="30" height="24"><use xlink:href="#bootstrap"/></svg>
		<span class="fs-5 fw-semibold">Collapsible</span>
   	</a>
 -->		
	<ul class="list-unstyled ps-0">
		<li class="mb-1">
			<button class="btn btn-toggle align-items-center rounded collapsed" data-bs-toggle="collapse" data-bs-target="#home-collapse" aria-expanded="fasle">Home</button>
			<div class="collapse" id="home-collapse">
<!-- 
					<button class="btn btn-toggle align-items-center rounded collapsed" data-bs-toggle="collapse" data-bs-target="#home-collapse" aria-expanded="true">Home</button>
					<div class="collapse show" id="home-collapse">
 -->
				<ul class="btn-toggle-nav list-unstyled fw-normal pb-1 small">
					<li><a href="#" class="link-dark rounded">Overview</a></li>
					<li><a href="#" class="link-dark rounded">Updates</a></li>
					<li><a href="#" class="link-dark rounded">Reports</a></li>
				</ul>
			</div>
		</li>
		<li class="mb-1">
			<button class="btn btn-toggle align-items-center rounded collapsed" data-bs-toggle="collapse" data-bs-target="#dashboard-collapse" aria-expanded="false">Dashboard</button>
			<div class="collapse" id="dashboard-collapse">
				<ul class="btn-toggle-nav list-unstyled fw-normal pb-1 small">
					<li><a href="#" class="link-dark rounded">Overview</a></li>
					<li><a href="#" class="link-dark rounded">Weekly</a></li>
					<li><a href="#" class="link-dark rounded">Monthly</a></li>
					<li><a href="#" class="link-dark rounded">Annually</a></li>
				</ul>
			</div>
		</li>
		<li class="mb-1">
			<button class="btn btn-toggle align-items-center rounded collapsed" data-bs-toggle="collapse" data-bs-target="#orders-collapse" aria-expanded="false">Orders</button>
			<div class="collapse" id="orders-collapse">
				<ul class="btn-toggle-nav list-unstyled fw-normal pb-1 small">
					<li><a href="#" class="link-dark rounded">New</a></li>
					<li><a href="#" class="link-dark rounded">Processed</a></li>
					<li><a href="#" class="link-dark rounded">Shipped</a></li>
					<li><a href="#" class="link-dark rounded">Returned</a></li>
				</ul>
			</div>
		</li>
		<li class="border-top my-3"></li>
		<li class="mb-1">
			<button class="btn btn-toggle align-items-center rounded collapsed" data-bs-toggle="collapse" data-bs-target="#account-collapse" aria-expanded="false">Account</button>
			<div class="collapse" id="account-collapse">
				<ul class="btn-toggle-nav list-unstyled fw-normal pb-1 small">
					<li><a href="#" class="link-dark rounded">New...</a></li>
					<li><a href="#" class="link-dark rounded">Profile</a></li>
					<li><a href="#" class="link-dark rounded">Settings</a></li>
					<li><a href="#" class="link-dark rounded">Sign out</a></li>
				</ul>
			</div>
		</li>
	</ul>
</div>
<!-- left menu e -->

		</div>
		<div class="col-sm-10">

<!-- main s -->
<form name="formList" id="formList" method="post">
	<input type="hidden" name="thisPage" value="<c:out value="${vo.thisPage}" default="1"/>">
	<input type="hidden" name="rowNumToShow" value="<c:out value="${vo.rowNumToShow}"/>">
	<input type="hidden" name="checkboxSeqArray" >
	<input type="hidden" name="ltltSeq">	<!-- #-> -->
	
<h3 class="mt-3 mb-0">위치관리</h3>			<!-- #-> -->

<div id="map" style="height:400px;"></div>

<!--  -->
<div class="container-fluid px-0 d-block d-sm-none">
    <div class="row">
        <div id="divSearchControl" class="col text-center">
            <i id="iSearchControlUp" class="fas fa-chevron-up"></i>
            <i id="iSearchControlDown" class="fas fa-chevron-down"></i>
        </div>
    </div>
</div>
<!--  -->

<!-- search s -->
<div id="divSearch" class="container-fluid border px-0 mt-2 py-2 py-sm-3">
    <div class="row row-cols-2 row-cols-sm-6 g-2 px-2">
        <div class="col">
            <select id="shDelNy" name="shDelNy" class="form-select form-select-sm">
                <option value="" <c:if test="${empty vo.shDelNy}">selected</c:if>>삭제여부</option>
                <option value="1" <c:if test="${vo.shDelNy eq 1}">selected</c:if>>Y</option>
                <option value="0" <c:if test="${vo.shDelNy eq 0}">selected</c:if>>N</option>
            </select>
        </div>
        <div class="col">
            <select id="shOptionDate" name="shOptionDate" class="form-select form-select-sm">
                <option value="" <c:if test="${empty vo.shOptionDate}">selected</c:if>>날짜</option>
                <option value="1" <c:if test="${vo.shOptionDate eq 1}">selected</c:if>>등록일</option>
                <option value="2" <c:if test="${vo.shOptionDate eq 2}">selected</c:if>>수정일</option>
            </select>
        </div>  
        <div class="col">
        	<fmt:parseDate var="shDateStart" value="${vo.shDateStart }" pattern="yyyy-MM-dd HH:mm:ss"/>
            <input type="text" id="shDateStart" name="shDateStart" value="<fmt:formatDate value="${shDateStart }" pattern="yyyy-MM-dd" />" placeholder="시작일" class="form-control form-control-sm" autocomplete="off">
        </div>              
        <div class="col">
			<fmt:parseDate var="shDateEnd" value="${vo.shDateEnd }" pattern="yyyy-MM-dd HH:mm:ss" />
	        <input type="text" id="shDateEnd" name="shDateEnd" value="<fmt:formatDate value="${shDateEnd }" pattern="yyyy-MM-dd"/>" placeholder="종료일" class="form-control form-control-sm" autocomplete="off">
        </div> 
    </div>
    <div class="row row-cols-2 row-cols-sm-6 g-2 mt-1 px-2">
        <div class="col">
            <select id="shOption" name="shOption" class="form-select form-select-sm">
                <option value="" <c:if test="${empty vo.shOption}">selected</c:if>>검색구분</option>
                <option value="1" <c:if test="${vo.shOption eq 1}">selected</c:if>>이름</option>
            </select>
        </div>                    
        <div class="col">
            <input type="text" id="shValue" name="shValue" value="<c:out value="${vo.shValue }"/>" placeholder="검색어" class="form-control form-control-sm">
        </div> 
        <div class="col">
			<button type="button" class="btn btn-warning btn-sm" name="" id="btnSearch"><i class="fas fa-search"></i></button>
			<button type="button" class="btn btn-danger btn-sm" name="" id="btnReset"><i class="fas fa-redo-alt"></i></button>
        </div>    
    </div>
</div>
<!-- search e -->

<!-- totalAndRowNum s -->
<%@include file="../../include/totalAndRowNum.jsp"%>
<!-- totalAndRowNumu e -->

<!-- table s -->
<div class="table-responsive px-0 mt-2">
    <table class="table table-bordered table-sm table-hover table-striped mb-0">
        <thead class="table-dark">
            <tr>
                <th class="text-center" width="40px" >
                    <div>
                        <input type="checkbox" id="checkboxAll" name="" value="" class="form-check-input">
                    </div>
                </th>
                <th width="80px">#</th>
                <th>이름</th>
                <th>설립일</th>
                <th>시작일</th>
                <th>대표자</th>
                <th>이메일</th>
                <th>연락처</th>
                <th>모바일</th>
                <th>주소</th>
                <th width="180px">최근수정일</th>
            </tr>
        </thead>
        <tbody id="tbody">
<%-- 
<c:choose>
	<c:when test="${fn:length(list) eq 0}">
		<tr>
			<td class="text-center" colspan="10">There is no data!</td>
		</tr>	
	</c:when>
	<c:otherwise>
		<c:forEach items="${list}" var="item" varStatus="status">	
            <tr>
                <td class="text-center">
                    <div>
                        <input type="checkbox" id="checkboxSeq" name="checkboxSeq" value="<c:out value="${item.ltltSeq }"/>" class="form-check-input">
                    </div>
                </td>
                <td><c:out value="${vo.totalRows - ((vo.thisPage - 1) * vo.rowNumToShow + status.index) }"/></td>
                <td><a href="javascript:goForm(<c:out value="${item.ltltSeq}"/>)"><c:out value="${item.ltltName }"/></a></td>
                <td><c:out value="${item.ltltEstDate }"/></td>
                <td><c:out value="${item.ltltStartDate }"/></td>
                <td><c:out value="${item.ltltCeo }"/></td>
                <td><c:out value="${item.ltltEmail }"/></td>
                <td><c:out value="${item.ltltPhone1 }"/></td>
                <td><c:out value="${item.ltltMobile }"/></td>
                <td><c:out value="${item.ltltAddress1 }"/></td>
                <td><fmt:formatDate value="${item.modDateTime }" pattern="yyyy-MM-dd HH:mm:ss"/></td>
            </tr>
		</c:forEach>
	</c:otherwise>
</c:choose>	            
 --%>            
         </tbody>
    </table>
</div>
<!-- table e -->

<!-- pagination s -->
<%@include file="../../include/pagination.jsp"%>
<!-- pagination e -->

<!-- button s -->
<div class="container-fluid px-0 mt-2">
    <div class="row">
        <div class="col-6 text-start">
            <button type="button" class="btn btn-danger btn-sm" name="" id="btnDelete"><i class="fa-solid fa-x"></i></button>
            <button type="button" class="btn btn-danger btn-sm" name="" id="btnUelete"><i class="far fa-trash-alt"></i></button>
        </div>
        <div class="col-6 text-end">
            <button type="button" class="btn btn-success btn-sm" name="" id="btnExcel"><i class="far fa-file-excel fa-lg"></i></button>
            <button type="button" class="btn btn-primary btn-sm" name="" id="btnForm"><i class="fas fa-plus"></i></button>
        </div>
    </div>
</div>
<!-- button e -->

</form>
<!-- main e -->

		</div>
	</div>
</div>
<!-- contents e -->

<!-- footer s -->
<%@include file="../../include/footer.jsp"%>
<!-- footer e -->

<!-- modalBase s -->
<%@include file="../../include/modalBase.jsp"%>
<!-- modalBase e -->

<!-- linkJs s -->
<%@include file="../../include/linkJs.jsp"%>
<!-- linkJs e -->

<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=45c6f58ea9a7ecfabff6e596d5079958&libraries=services"></script>

<script>

	$(document).ready(function(){
		divSearchControl();
		 $("#shDateStart, #shDateEnd").datepicker();
		 
		 getNowLatLng();
		 
	});
	
	var goUrlList = "/location/locationList";					/* #-> */
	var goUrlForm = "/location/locationForm";					/* #-> */
	var goUrlMultiUele = "/location/locationMultiUele";			/* #-> */
	var goUrlMultiDele = "/location/locationMultiDele";			/* #-> */
	
	var seq = $("input:hidden[name=ltltSeq]");				/* #-> */
	
	var form = $("form[name=formList]");
	
	var checkboxSeqArray = [];
	
	
	$("#btnSearch").on("click", function(){
		if (validationList() == false) return false;
		form.attr("action", goUrlList).submit();
	});
    
	
	validationList = function() {
		/* if(!checkNull($.trim($("input[name=searchValue]").val()), "searchValue")) return false; */
	}
	
	
 	$("#btnReset").on("click", function(){
		$(location).attr("href", goUrlList);
	});
 	
 		
	$("#changeRowNum").on("change", function(){
		$("input:hidden[name=rowNumToShow]").val($("#changeRowNum option:selected").val());
		form.attr("action", goUrlList).submit();
	}); 
		
	
	goForm = function(key) {
    	/* if(key != 0) seq.val(btoa(key)); */
		seq.val(key);
		form.attr("action", goUrlForm).submit();
	}
	
	
	goList = function(thisPage) {
		$("input:hidden[name=thisPage]").val(thisPage);
		form.attr("action", goUrlList).submit();
	}

	
	$("#btnUelete").on("click", function(){
		if($("input[name=checkboxSeq]:checked").length > 0 ) {
			$("input:hidden[name=exDeleteType]").val(1);
			$(".modal-title").text("확 인");
			$(".modal-body").text("해당 데이터를 삭제하시겠습니까 ?");
			$("#btnModalUelete").show();
			$("#btnModalDelete").hide();
			$("#modalConfirm").modal("show");
		} else {
			$(".modal-title").text("확 인");
			$(".modal-body").text("데이터를 선택해 주세요!");
			$("#modalAlert").modal("show");
		}
	});
	

	$("#btnDelete").on("click", function(){
		if($("input[name=checkboxSeq]:checked").length > 0 ) {
			$("input:hidden[name=exDeleteType]").val(2);
			$(".modal-title").text("확 인");
			$(".modal-body").text("해당 데이터를 삭제하시겠습니까 ?");
			$("#btnModalUelete").hide();
			$("#btnModalDelete").show();
			$("#modalConfirm").modal("show");
		} else {
			$(".modal-title").text("확 인");
			$(".modal-body").text("데이터를 선택해 주세요!");
			$("#modalAlert").modal("show");
		}
	});
	
	
	$("#btnModalUelete").on("click", function(){
		$("input[name=checkboxSeq]:checked").each(function() { 
			checkboxSeqArray.push($(this).val());
		});
		
		$("input:hidden[name=checkboxSeqArray]").val(checkboxSeqArray);
		
		$("#modalConfirm").modal("hide");
		
		form.attr("action", goUrlMultiUele).submit();
	});
	
	
	$("#btnModalDelete").on("click", function(){
		$("input[name=checkboxSeq]:checked").each(function() { 
			checkboxSeqArray.push($(this).val());
		});
		
		$("input:hidden[name=checkboxSeqArray]").val(checkboxSeqArray);
		
		$("#modalConfirm").modal("hide");
							
		form.attr("action", goUrlMultiDele).submit();
	});

	
	$('#btnForm').on("click", function() {
		goForm(0);                
	});
	
	
	$("#checkboxAll").click(function() {
		if($("#checkboxAll").is(":checked")) $("input[name=checkboxSeq]").prop("checked", true);
		else $("input[name=checkboxSeq]").prop("checked", false);
	});
	
	
	$("input[name=checkboxSeq]").click(function() {
		var total = $("input[name=checkboxSeq]").length;
		var checked = $("input[name=checkboxSeq]:checked").length;
		
		if(total != checked) $("#checkboxAll").prop("checked", false);
		else $("#checkboxAll").prop("checked", true); 
	});
	
	
	function getNowLatLng(){
		if (navigator.geolocation) {
			var options = {timeout:60000};
			navigator.geolocation.getCurrentPosition(showLocation, errorHandler, options);
		} else {
			alert("현재 위치 정보 사용이 불가능합니다.");
		}
	}
	
	
	function showLocation(position) {
		lat = position.coords.latitude;
		lng = position.coords.longitude;
		
		/* kakao source s */
		var container = document.getElementById("map");
	 	var options = {
	 			center: new kakao.maps.LatLng(lat, lng),
	 			level: 3
	 		};
		map = new kakao.maps.Map(container, options);
		
		var markerPosition  = new kakao.maps.LatLng(lat, lng); 
		var marker = new kakao.maps.Marker({ position: markerPosition });
		marker.setMap(null);   
		marker.setMap(map);
		
		<c:forEach items='${list}' var='item' varStatus='status'>
			var markerPosition  = new kakao.maps.LatLng('<c:out value="${item.ltltLat }"/>', '<c:out value="${item.ltltLng }"/>'); 
			var marker = new kakao.maps.Marker({ position: markerPosition });
			marker.setMap(null);   
			marker.setMap(map);
		</c:forEach>
		/* kakao source e */
		
		getInfo();
		
		// 아작스
		$.ajax({
			async: true 
			,cache: false
			,type: "post"
			/* ,dataType:"json" */
			,url: "/location/locationAjaxList"
			/* ,data : $("#formLogin").serialize() */
			,data : { }
			,success: function(response) {
				if(response.rt == "success") {
					/* alert(response.list[0].ltltSeq); */
					var listHtml = "";
					
					if (response.count == 0) {
						listHtml += '<tr>';
						listHtml += '	<td class="text-center" colspan="11">There is no data!</td>';
						listHtml += '</tr>';
						$("#tbody").append(listHtml);
					} else {
						for(var i in response.list) {
						    listHtml += '<tr>';
						    listHtml += '<td class="text-center">';
						    listHtml += '<div>';
						    listHtml += '    <input type="checkbox" id="checkboxSeq" name="checkboxSeq" value="'+response.list[i].ltltSeq+'" class="form-check-input">';
						    listHtml += '</div>';
						    listHtml += '</td>';
						    listHtml += '<td>-</td>';
						    listHtml += '<td><a href="javascript:goForm('+response.list[i].ltltSeq+')">'+response.list[i].ltltName+'</a></td>';
						    listHtml += '<td>'+nullToEmpty(response.list[i].ltltEstDate)+'</td>';
						    listHtml += '<td>'+nullToEmpty(response.list[i].ltltStartDate)+'</td>';
						    listHtml += '<td>'+nullToEmpty(response.list[i].ltltCeo)+'</td>';
						    listHtml += '<td>'+nullToEmpty(response.list[i].ltltEmail)+'</td>';
						    listHtml += '<td>'+nullToEmpty(response.list[i].ltltPhone1)+'</td>';
						    listHtml += '<td>'+nullToEmpty(response.list[i].ltltMobile)+'</td>';
						    listHtml += '<td>'+nullToEmpty(response.list[i].ltltAddress1)+'</td>';
						    listHtml += '<td>'+timestampToDate(response.list[i].modDateTime)+'</td>';
						    listHtml += '</tr>';
						}
						$("#tbody").append(listHtml);
					}
				} else {
					/* by pass */
				}
			}
			,error : function(jqXHR, textStatus, errorThrown){
				alert("ajaxUpdate " + jqXHR.textStatus + " : " + jqXHR.errorThrown);
			}
		});
		
	}
	
	
	function timestampToDate (paramDate) {
		var date = new Date(paramDate);
		var rtDate = date.getFullYear()+ 
			        "-"+(("00"+(date.getMonth()+1).toString()).slice(-2))+
			        "-"+(("00"+date.getDate().toString()).slice(-2))+
			        " "+(("00"+date.getHours().toString()).slice(-2))+
			        ":"+(("00"+date.getMinutes().toString()).slice(-2))+
			        ":"+(("00"+date.getSeconds().toString()).slice(-2));
		return rtDate;
	}
	
	
	
	
	
	function nullToEmpty (paramData) {
		if(paramData == null) {
			paramData = '';
		}
		return rtData = paramData;
	}
	
	
	function errorHandler(error) {
		if(error.code == 1) {
			alert("접근차단");
		} else if( err.code == 2) {
			alert("위치를 반환할 수 없습니다.");
		}
	}
     
	
	function getInfo() {
	    // 지도의 현재 중심좌표를 얻어옵니다 
	    var center = map.getCenter(); 
	    
	    // 지도의 현재 레벨을 얻어옵니다
	    var level = map.getLevel();
	    
	    // 지도타입을 얻어옵니다
	    var mapTypeId = map.getMapTypeId(); 
	    
	    // 지도의 현재 영역을 얻어옵니다 
	    var bounds = map.getBounds();
	    
	    // 영역의 남서쪽 좌표를 얻어옵니다 
	    var swLatLng = bounds.getSouthWest(); 
	    
	    // 영역의 북동쪽 좌표를 얻어옵니다 
	    var neLatLng = bounds.getNorthEast(); 
	    
	    // 영역정보를 문자열로 얻어옵니다. ((남,서), (북,동)) 형식입니다
	    var boundsStr = bounds.toString();
	    
	    
	    var message = '지도 중심좌표는 위도 ' + center.getLat() + ', <br>';
	    message += '경도 ' + center.getLng() + ' 이고 <br>';
	    message += '지도 레벨은 ' + level + ' 입니다 <br> <br>';
	    message += '지도 타입은 ' + mapTypeId + ' 이고 <br> ';
	    message += '지도의 남서쪽 좌표는 ' + swLatLng.getLat() + ', ' + swLatLng.getLng() + ' 이고 <br>';
	    message += '북동쪽 좌표는 ' + neLatLng.getLat() + ', ' + neLatLng.getLng() + ' 입니다';
	    
	    
	    alert(message);
	    // 개발자도구를 통해 직접 message 내용을 확인해 보세요.
	    // ex) console.log(message);
	}
	

</script>

</body>
</html>