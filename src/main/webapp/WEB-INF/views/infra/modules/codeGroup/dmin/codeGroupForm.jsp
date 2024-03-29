<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>

<!-- head s -->
<%@include file="../../../include/admin/head.jsp"%>
<!-- head e -->

<style type="text/css">

	.addScroll{
		overflow-y:auto;
		height: 90px;
		background-color:#E9ECEF;
	}
 	
	.input-file-button{
		padding: 4px 25px;
		background-color:#FF6600;
		border-radius: 4px;
		color: white;
		cursor: pointer;
	}	

</style>
</head>
<body>

<!-- top s -->
<%@include file="../../../include/admin/top.jsp"%>
<!-- top e -->

<!-- gnb s -->
<%@include file="../../../include/admin/gnb.jsp"%>
<!-- gnb e -->

<!-- right menu s -->
<%@include file="../../../include/admin/right.jsp"%>
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
<c:set var="listCodeGender" value="${CodeServiceImpl.selectListCachedCode('3')}"/>
<c:set var="listCodeTelecom" value="${CodeServiceImpl.selectListCachedCode('10')}"/>

<!-- <form name="form" id="form" method="post" enctype="multipart/form-data"> -->
<form id="form" name="form" method="post" autocomplete="off" enctype="multipart/form-data">
<!-- *Vo.jsp s -->
<%@include file="codeGroupVo.jsp"%>
<!-- *Vo.jsp e -->

<h3 class="mt-3 mb-0">코드그룹 관리</h3>
 
<div class="container-fluid px-0 px-sm-5 mt-2">
	<div class="row mt-sm-4">
		<div class="col-sm-6">
			<label for="ifcgSeq" class="form-label">코드그룹 코드</label>
			<input type="text" id="ifcgSeq" name="ifcgSeq" value="<c:out value="${item.ifcgSeq}"/>" maxlength="20" placeholder="영문(대소문자),숫자" class="form-control form-control-sm">
		</div>
		<div class="col-sm-6">
			<label for="ifcgSeqAnother" class="form-label">코드그룹 코드 (Another)</label>
			<input type="text" id="ifcgSeqAnother" name="ifcgSeqAnother" value="<c:out value="${item.ifcgSeqAnother}"/>" maxlength="20" placeholder="영문(대소문자),숫자" class="form-control form-control-sm">        
		</div>
	</div> 
	<div class="row mt-sm-4">
		<div class="col-sm-6">
			<label for="ifcgName" class="form-label">코드그룹 이름 (한글)</label>
			<input type="text" id="ifcgName" name="ifcgName" value="<c:out value="${item.ifcgName}"/>" maxlength="20" placeholder="한글,숫자" class="form-control form-control-sm">
		</div>
		<div class="col-sm-6">
			<label for="ifcgNameEng" class="form-label">코드그룹 이름 (영문)</label>
			<input type="text" id="ifcgNameEng" name="ifcgNameEng" value="<c:out value="${item.ifcgNameEng}"/>" maxlength="20" placeholder="영문(대소문자),숫자" class="form-control form-control-sm">        
		</div>
	</div> 
	<div class="row mt-sm-4">
		<div class="col-sm-6">
			<label for="ifcgUseNy" class="form-label">사용여부</label>
			<select id="ifcgUseNy" name="ifcgUseNy" class="form-select form-select-sm">
				<option value="1" <c:if test="${item.ifcgUseNy eq 1 }">selected</c:if>>Y</option>
				<option value="0" <c:if test="${item.ifcgUseNy eq 0 }">selected</c:if>>N</option>
			</select>
		</div>
		<div class="col-sm-6">
			<label for="ifcgOrder" class="form-label">순서</label>
			<input type="text" id="ifcgOrder" name="ifcgOrder" value="<c:out value="${item.ifcgOrder}"/>" maxlength="20" placeholder="숫자" class="form-control form-control-sm">        
		</div>
	</div>
	<div class="row mt-sm-4">
		<div class="col-sm-6 mt-3 mt-sm-0">
			<label for="ifcgDesc" class="form-label">설명</label>
			<textarea id="ifcgDesc" name="ifcgDesc" class="form-control"><c:out value="${item.ifcgDesc }"/></textarea>
		</div>
		<div class="col-sm-6 mt-3 mt-sm-0">
			<label for="ifcgDelNy" class="form-label">삭제여부</label>
			<select id="ifcgDelNy" name="ifcgDelNy" class="form-select form-select-sm">
				<option value="0" <c:if test="${item.ifcgDelNy eq 0 }">selected</c:if>>N</option>
				<option value="1" <c:if test="${item.ifcgDelNy eq 1 }">selected</c:if>>Y</option>
			</select>
		</div>
	</div>  
	<div class="row mt-sm-4">
		<div class="col-sm-6">
			<label for="ifcgReferenceV1" class="form-label">예비1 (varchar type)</label>
			<input type="text" id="ifcgReferenceV1" name="ifcgReferenceV1" value="<c:out value="${item.ifcgReferenceV1}"/>" maxlength="20" placeholder="영문(대소문자),숫자" class="form-control form-control-sm">
		</div>
		<div class="col-sm-6">
			<label for="ifcgReferenceV2" class="form-label">예비2 (varchar type)</label>
			<input type="text" id="ifcgReferenceV2" name="ifcgReferenceV2" value="<c:out value="${item.ifcgReferenceV2}"/>" maxlength="20" placeholder="영문(대소문자),숫자" class="form-control form-control-sm">        
		</div>
	</div>	
	<div class="row mt-sm-4">
		<div class="col-sm-6">
			<label for="ifcgReferenceV3" class="form-label">예비3 (varchar type)</label>
			<input type="text" id="ifcgReferenceV3" name="ifcgReferenceV3" value="<c:out value="${item.ifcgReferenceV3}"/>" maxlength="20" placeholder="영문(대소문자),숫자" class="form-control form-control-sm">
		</div>
		<div class="col-sm-6">
		</div>
	</div>	
	<div class="row mt-sm-4">
		<div class="col-sm-6">
			<label for="ifcgReferenceI1" class="form-label">예비1 (Int type)</label>
			<input type="text" id="ifcgReferenceI1" name="ifcgReferenceI1" value="<c:out value="${item.ifcgReferenceI1}"/>" maxlength="20" placeholder="숫자" class="form-control form-control-sm">
		</div>
		<div class="col-sm-6">
			<label for="ifcgReferenceI2" class="form-label">예비2 (Int type)</label>
			<input type="text" id="ifcgReferenceI2" name="ifcgReferenceI2" value="<c:out value="${item.ifcgReferenceI2}"/>" maxlength="20" placeholder="숫자" class="form-control form-control-sm">        
		</div>
	</div>	
	<div class="row mt-sm-4">
		<div class="col-sm-6">
			<label for="ifcgReferenceI3" class="form-label">예비3 (Int type)</label>
			<input type="text" id="ifcgReferenceI3" name="ifcgReferenceI3" value="<c:out value="${item.ifcgReferenceI3}"/>" maxlength="20" placeholder="숫자" class="form-control form-control-sm">
		</div>
		<div class="col-sm-6">
		</div>
	</div>

<c:if test="${not empty item.ifcgSeq }">
<!-- regMod s -->
<%@include file="../../../include/admin/regmod.jsp"%>
<!-- regMod e -->
</c:if>
</div>
 
<div class="container-fluid px-0 px-sm-5 mt-3">
    <div class="row">
        <div class="col-6 text-start">
            <button type="button" class="btn btn-secondary btn-sm" name="" id="btnList"><i class="fa-solid fa-bars"></i></button>
        </div>
        <div class="col-6 text-end">
            <button type="button" class="btn btn-danger btn-sm" name="" id="btnDelete"><i class="fa-solid fa-x"></i></button>
            <button type="button" class="btn btn-danger btn-sm" name="" id="btnUelete"><i class="far fa-trash-alt"></i></button>
            <button type="button" class="btn btn-success btn-sm" name="" id="btnSave"><i class="fa-regular fa-bookmark"></i></button>
        </div>
    </div>
</div>

<%-- <c:out value="${Code.selectListCachedCode("15") }"/> --%>

</form>
<form name="formVo" id="formVo" method="post">
<!-- *Vo.jsp s -->
<%@include file="codeGroupVo.jsp"%>
<!-- *Vo.jsp e -->
</form>
<!-- main e -->

		</div>
	</div>
</div>
<!-- contents e -->

<!-- footer s -->
<%@include file="../../../include/admin/footer.jsp"%>
<!-- footer e -->

<!-- modalBase s -->
<%@include file="../../../include/admin/modalBase.jsp"%>
<!-- modalBase e -->

<!-- linkJs s -->
<%@include file="../../../include/admin/linkJs.jsp"%>
<!-- linkJs e -->

<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=45c6f58ea9a7ecfabff6e596d5079958&libraries=services"></script>
<script>

	$(document).ready(function(){
		 $("#ifmmDob").datepicker();
	}); 


	var goUrlList = "/codeGroup/codeGroupList"; 			/* #-> */
	var goUrlInst = "/codeGroup/codeGroupInst"; 			/* #-> */
	var goUrlUpdt = "/codeGroup/codeGroupUpdt";				/* #-> */
	var goUrlUele = "/codeGroup/codeGroupUele";				/* #-> */
	var goUrlDele = "/codeGroup/codeGroupDele";				/* #-> */
	
	var seq = $("input:hidden[name=ifcgSeq]");				/* #-> */
	
	var form = $("form[name=form]");
	var formVo = $("form[name=formVo]");
	
	
	$("#btnSave").on("click", function(){
		if (seq.val() == "0" || seq.val() == ""){
	   		// insert
	   		if (validationInst() == false) return false;
 			setCheckboxValue($("#ifmmEmailConsent"), $("#ifmmEmailConsentNy"));
			setCheckboxValue($("#ifmmSmsConsent"), $("#ifmmSmsConsentNy"));
	   		form.attr("action", goUrlInst).submit();
	   	} else {
	   		// update
	   		/* keyName.val(atob(keyName.val())); */
	   		if (validationUpdt() == false) return false;
	   		form.attr("action", goUrlUpdt).submit();
	   	}
	}); 
	
	
	setCheckboxValue = function(obj, targetObj) {
	   if(obj.is(":checked")){
		   targetObj.val("1");
	    } else {
	    	targetObj.val("0");
	    }
	}
	
	
	validationInst = function() {
	   	if(validationUpdt() == false) return false;
	}

	
	validationUpdt = function() {
		<!-- if(!checkNull($.trim($("input[name=MENU_NAME]").val()), "MENU_NAME")) return false;  -->
		/* if(!checkNull($('input[name=AUTH_NM]'), $.trim($('input[name=AUTH_NM]').val()), "권한명을 등록 해주세요!")) return false; */
	}
	
	
	$("#btnList").on("click", function(){
		formVo.attr("action", goUrlList).submit();
	}); 
	
	
	$("#btnUelete").on("click", function(){
		$("input:hidden[name=exDeleteType]").val(1);
		$(".modal-title").text("확 인");
		$(".modal-body").text("해당 데이터를 삭제하시겠습니까 ?");
		$("#btnModalUelete").show();
		$("#btnModalDelete").hide();
		$("#modalConfirm").modal("show");
	});
	

	$("#btnDelete").on("click", function(){
		$("input:hidden[name=exDeleteType]").val(2);
		$(".modal-title").text("확 인");
		$(".modal-body").text("해당 데이터를 삭제하시겠습니까 ?");
		$("#btnModalUelete").hide();
		$("#btnModalDelete").show();
		$("#modalConfirm").modal("show");
	});
	
	
	$("#btnModalUelete").on("click", function(){
		$("#modalConfirm").modal("hide");
		formVo.attr("action", goUrlUele).submit();
	});
	
	
	$("#btnModalDelete").on("click", function(){
		$("#modalConfirm").modal("hide");
		formVo.attr("action", goUrlDele).submit();
	});
	
	
	$("#btnAddress").on("click", function(){	
	    sample4_execDaumPostcode();
	});	  
	
	
	function sample4_execDaumPostcode() {
        new daum.Postcode({
            oncomplete: function(data) {
                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

                // 도로명 주소의 노출 규칙에 따라 주소를 표시한다.
                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                var roadAddr = data.roadAddress; // 도로명 주소 변수
                var extraRoadAddr = ''; // 참고 항목 변수

                // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                    extraRoadAddr += data.bname;
                }
                // 건물명이 있고, 공동주택일 경우 추가한다.
                if(data.buildingName !== '' && data.apartment === 'Y'){
                   extraRoadAddr += (extraRoadAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                }
                // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                if(extraRoadAddr !== ''){
                    extraRoadAddr = ' (' + extraRoadAddr + ')';
                }

                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                document.getElementById('ifmaZipcodeArray0').value = data.zonecode;
                document.getElementById("ifmaAddress1Array0").value = roadAddr;
                /* document.getElementById("").value = data.jibunAddress; */
                
                // 참고항목 문자열이 있을 경우 해당 필드에 넣는다.
                  
                if(roadAddr !== ''){
                    document.getElementById("ifmaAddress3Array0").value = extraRoadAddr;
                } else {
                    document.getElementById("ifmaAddress3Array0").value = '';
                }
                
/*  
                var guideTextBox = document.getElementById("guide");
                // 사용자가 '선택 안함'을 클릭한 경우, 예상 주소라는 표시를 해준다.
                if(data.autoRoadAddress) {
                    var expRoadAddr = data.autoRoadAddress + extraRoadAddr;
                    guideTextBox.innerHTML = '(예상 도로명 주소 : ' + expRoadAddr + ')';
                    guideTextBox.style.display = 'block';

                } else if(data.autoJibunAddress) {
                    var expJibunAddr = data.autoJibunAddress;
                    guideTextBox.innerHTML = '(예상 지번 주소 : ' + expJibunAddr + ')';
                    guideTextBox.style.display = 'block';
                } else {
                    guideTextBox.innerHTML = '';
                    guideTextBox.style.display = 'none';
                }
 */               
				
 				/* lat and lng from address s */
 				
				// 주소-좌표 변환 객체를 생성
				var geocoder = new daum.maps.services.Geocoder();
				
				// 주소로 좌표를 검색
				geocoder.addressSearch(roadAddr, function(result, status) {
				 
					// 정상적으로 검색이 완료됐으면,
					if (status == daum.maps.services.Status.OK) {
						
						document.getElementById("ifmaLatArray0").value=result[0].y;
						document.getElementById("ifmaLngArray0").value=result[0].x;
						
/* 						
						var coords = new daum.maps.LatLng(result[0].y, result[0].x);
				
						y = result[0].x;
						x = result[0].y;
				
						// 결과값으로 받은 위치를 마커로 표시합니다.
						var marker = new daum.maps.Marker({
							map: map,
							position: coords
						});
				
						// 인포윈도우로 장소에 대한 설명표시
						var infowindow = new daum.maps.InfoWindow({
							content: '<div style="width:150px;text-align:center;padding:5px 0;">좌표위치</div>'
						});
				
						infowindow.open(map,marker);
				
						// 지도 중심을 이동
						map.setCenter(coords);
						
						document.getElementById("ifmaLatArray0").value=x;
						document.getElementById("ifmaLngArray0").value=y;
 */						
					}
				});
				/* lat and lng from address e */

       }
   
        }).open();
        

    }
	

	$("#btnAddressClear").on("click", function(){	
		$("#ifmaZipcodeArray0").val('');
		$("#ifmaAddress1Array0").val('');
		$("#ifmaAddress2Array0").val('');
		$("#ifmaAddress3Array0").val('');
	});
	
	
	upload = function(seq, div) {
		
		$("#ulFile" + seq).children().remove();
		
		var fileCount = $("input[type=file]")[seq].files.length;
		
		if(checkUploadedTotalFileNumber(fileCount, seq) == false) { return false; }
		
		var totalFileSize;
		for (var i = 0 ; i < fileCount ; i++) {
			if(div == 1) {
				if(checkUploadedAllExt($("input[type=file]")[seq].files[i].name, seq) == false) { return false; }
			} else if (div == 2){
				if(checkUploadedImageExt($("input[type=file]")[seq].files[i].name, seq) == false) { return false; }
			} else {
				return false;
			}
			
			if(checkUploadedEachFileSize($("input[type=file]")[seq].files[i].name, seq) == false) { return false; }
			totalFileSize += $("input[type=file]")[seq].files[i].size;
		}
		
		if(checkUploadedTotalFileSize(totalFileSize, seq) == false) { return false; }
		
		for (var i = 0 ; i < fileCount ; i++) {
			addUploadLi(seq, i, $("input[type=file]")[seq].files[i].name);
		}
	}
	
	
	addUploadLi = function (seq, index, name){
		
		var ul_list = $("#ulFile0");
		
		li = '<li id="li_'+seq+'_'+index+'" class="list-group-item d-flex justify-content-between align-items-center">';
		li = li + name;
		li = li + '<span class="badge bg-danger rounded-pill" onClick="delLi('+ seq +','+ index +')"><i class="fa-solid fa-x" style="cursor: pointer;"></i></span>';
		li = li + '</li>';
		
		$("#ulFile"+seq).append(li);
	}
	
	
	delLi = function(seq, index) {
		$("#li_"+seq+"_"+index).remove();
	}
	
	
</script>

</body>
</html>