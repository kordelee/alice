<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>

<!-- head s -->
<%@include file="../include/head.jsp"%>
<!-- head e -->

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
<!-- <form name="form" id="form" method="post" enctype="multipart/form-data"> -->
<form name="form" id="form" method="post">
<!-- *Vo.jsp s -->
<%@include file="memberVo.jsp"%>
<!-- *Vo.jsp e -->

<h3 class="mt-3 mb-0">회원관리</h3>
 
<div class="container-fluid px-0 px-sm-5 mt-2">
    <div class="row mt-sm-4">
        <div class="col-sm-6">
            <label for="ifmmId" class="form-label">아이디</label>
            <input type="text" id="ifmmId" name="ifmmId" value="<c:out value="${item.ifmmId}"/>" maxlength="20" placeholder="영문(대소문자),숫자,특수문자(-_.), 4~20자리 조합" class="form-control form-control-sm">
        </div>
        <div class="col-sm-6">
			<label for="ifmmNickname" class="form-label">별명</label>
            <input type="text" id="ifmmNickname" name="ifmmNickname" value="<c:out value="${item.ifmmNickname}"/>" maxlength="20" placeholder="별명" class="form-control form-control-sm">        
        </div>
    </div>
<c:if test="${empty item.ifmmId }">    
    <div class="row mt-sm-4">
        <div class="col-sm-6 mt-3 mt-sm-0">
            <label for="ifmmPassword" class="form-label">비밀번호</label>
            <input type="password" id="ifmmPassword" name="ifmmPassword" value="" maxlength="20" placeholder="영문(대소문자),숫자,특수문자(!@#$%^&*), 8~20자리 조합" class="form-control form-control-sm">
        </div>
        <div class="col-sm-6 mt-3 mt-sm-0">
            <label for="ifmmPasswordRe" class="form-label">비밀번호확인</label>
            <input type="password" id="ifmmPasswordRe" name="ifmmPasswordRe" value="" maxlength="20" placeholder="비밀번호 확인" class="form-control form-control-sm">          
        </div>
    </div>
</c:if>    
    <div class="row mt-sm-4">
        <div class="col-sm-6 mt-3 mt-sm-0">
            <label for="ifmmName" class="form-label">이름</label>
            <input type="text" id="ifmmName" name="ifmmName" value="<c:out value="${item.ifmmName}"/>" maxlength="50" placeholder="" class="form-control form-control-sm">
        </div>
        <div class="col-sm-6 mt-3 mt-sm-0">
            <label for="ifmmNameEng" class="form-label">이름 (영문)</label>
            <input type="text" id="ifmmNameEng" name="ifmmNameEng" value="<c:out value="${item.ifmmNameEng}"/>" maxlength="50" placeholder="" class="form-control form-control-sm">            
        </div>
    </div>
    <div class="row mt-sm-4 mt-3 mt-sm-0">
        <div class="col-sm-6">
            <label for="ifmmLastName" class="form-label">성</label>
            <input type="text" id="ifmmLastName" name="ifmmLastName" value="<c:out value="${item.ifmmLastName}"/>" maxlength="50" placeholder="" class="form-control form-control-sm">
        </div>
        <div class="col-sm-6 mt-3 mt-sm-0">
            <label for="ifmmFirstName" class="form-label">이름</label>
            <input type="text" id="ifmmFirstName" name="ifmmFirstName" value="<c:out value="${item.ifmmFirstName}"/>" maxlength="50" placeholder="" class="form-control form-control-sm">          
        </div>
    </div>
    <div class="row mt-sm-4 mt-3 mt-sm-0">
        <div class="col-sm-6">
            <label for="ifmmLastNameEng" class="form-label">성 (영문)</label>
            <input type="text" id="ifmmLastNameEng" name="ifmmLastNameEng" value="<c:out value="${item.ifmmLastNameEng}"/>" maxlength="50" placeholder="" class="form-control form-control-sm">
        </div>
        <div class="col-sm-6 mt-3 mt-sm-0">
            <label for="ifmmFirstNameEng" class="form-label">이름 (영문)</label>
            <input type="text" id="ifmmFirstNameEng" name="ifmmFirstNameEng" value="<c:out value="${item.ifmmFirstNameEng}"/>" maxlength="50" placeholder="" class="form-control form-control-sm">          
        </div>
    </div>
    <div class="row mt-sm-4">
        <div class="col-sm-6 mt-3 mt-sm-0">
            <label for="ifmmGenderCd" class="form-label">성별</label>
            <select id="ifmmGenderCd" name="ifmmGenderCd" class="form-select form-select-sm">
				<option value="">::선택::</option>
	            	<c:forEach items="${codeGender}" var="itemGender" varStatus="statusGender">
				<option value="<c:out value="${itemGender.ifcdSeq }"/>" <c:if test="${item.ifmmGenderCd eq itemGender.ifcdSeq }">selected</c:if>><c:out value="${itemGender.ifcdName }"/></option>
					</c:forEach>
              </select>
        </div>
        <div class="col-sm-6 mt-3 mt-sm-0">
            <label for="ifmmDob" class="form-label">생일</label>
            <input type="text" id="ifmmDob" name="ifmmDob" value="<c:out value="${item.ifmmDob }"/>" placeholder="" class="form-control form-control-sm" autocomplete="off">          
        </div>
    </div>    
    <div class="row mt-sm-4">    
        <div class="col-sm-6 mt-3 mt-sm-0">
			<input type="hidden" id="ifmeDefaultNyArray0" name="ifmeDefaultNyArray" value="1">
			<input type="hidden" id="ifmeTypeCdArray0" name="ifmeTypeCdArray" value="44">
            <label for="ifmeEmailFullArray0" class="form-label">Email</label>
            <input type="text" id="ifmeEmailFullArray0" name="ifmeEmailFullArray" value="<c:out value="${item.ifmeEmailFull }"/>" maxlength="50" placeholder="account@example.com" class="form-control form-control-sm">
        </div>
        <div class="col-sm-6 mt-3 mt-sm-0">
            <label for="ifmmEmailConsentNy" class="form-label">이메일 정보 마케팅 사용 동의</label>
            <div class="form-check">
                <input type="checkbox" id="ifmmEmailConsentNy" name="ifmmEmailConsentNy" value="" class="form-check-input">
                <label for="ifmmEmailConsentNy" class="form-check-label">
                    동의합니다
                </label>
            </div>
        </div>
    </div>
    <div class="row mt-sm-4">
        <div class="col-sm-3 mt-3 mt-sm-0">
        	<input type="hidden" id="ifmpDefaultNyArray0" name="ifmpDefaultNyArray" value="1">
        	<input type="hidden" id="ifmpTypeCdArray0" name="ifmpTypeCdArray" value="54">
        	<input type="hidden" id="ifmpDeviceCdArray0" name="ifmpDeviceCdArray" value="58">
            <label for="ifmpTelecomCdArray0" class="form-label">통신사</label>
            <select id="ifmpTelecomCdArray0" name="ifmpTelecomCdArray" class="form-select form-select-sm">
				<option value="">::선택::</option>            
	            	<c:forEach items="${codeTelecom}" var="itemTelecom" varStatus="statusTelecom">
				<option value="<c:out value="${itemTelecom.ifcdSeq }"/>" <c:if test="${item.ifmpTelecomCd eq itemTelecom.ifcdSeq }">selected</c:if>><c:out value="${itemTelecom.ifcdName }"/></option>
					</c:forEach>
			</select>
        </div>
        <div class="col-sm-3 mt-3 mt-sm-0">
            <label for="ifmpNumberArray0" class="form-label">핸드폰</label>
            <input type="text" id="ifmpNumberArray0" name="ifmpNumberArray" value="" maxlength="11" placeholder="숫자만 (01044447777)" class="form-control form-control-sm">
        </div>
        <div class="col-sm-6 mt-3 mt-sm-0">
            <label for="ifmmSmsConsentNy" class="form-label">핸드폰 정보 마케팅 사용 동의</label>
            <div class="form-check">
                <input type="checkbox" id="ifmmSmsConsentNy" name="ifmmSmsConsentNy" value="" class="form-check-input">
                <label for="ifmmSmsConsentNy" class="form-check-label">
                    동의합니다
                </label>
            </div>          
        </div>
    </div>
  
    <div class="row mt-sm-4">
        <div class="col-sm-6 mt-3 mt-sm-0">
        	<input type="hidden" id="ifmpDefaultNyArray1" name="ifmpDefaultNyArray" value="0">
        	<input type="hidden" id="ifmpTypeCdArray1" name="ifmpTypeCdArray" value="54">
        	<input type="hidden" id="ifmpDeviceCdArray1" name="ifmpDeviceCdArray" value="57">
        	<input type="hidden" id="ifmpTelecomCdArray1" name="ifmpTelecomCdArray" value="">
            <label for="ifmpNumberArray1" class="form-label">전화번호</label>
            <input type="text" id="ifmpNumberArray1" name="ifmpNumberArray" value="" maxlength="11" placeholder="숫자만 (024447777)" class="form-control form-control-sm">
        </div>
        <div class="col-sm-6 mt-3 mt-sm-0">
        	<input type="hidden" id="ifmpDefaultNyArray2" name="ifmpDefaultNyArray" value="0">
        	<input type="hidden" id="ifmpTypeCdArray2" name="ifmpTypeCdArray" value="54">
        	<input type="hidden" id="ifmpDeviceCdArray2" name="ifmpDeviceCdArray" value="59">
        	<input type="hidden" id="ifmpTelecomCdArray2" name="ifmpTelecomCdArray" value="">
            <label for="ifmpNumberArray2" class="form-label">팩스번호</label>
            <input type="text" id="ifmpNumberArray2" name="ifmpNumberArray" value="" maxlength="11" placeholder="숫자만 (024447777)" class="form-control form-control-sm">
        </div>
    </div>
    <div class="row mt-sm-4">
        <div class="col-sm-6 mt-3 mt-sm-0">
            <label for="memCountryResidence" class="form-label">거주국가</label>
            <select id="memCountryResidence" name="memCountryResidence" class="form-select form-select-sm">
                <option value="">::선택::</option>
                <option value="1">한국</option>
                <option value="2">미국</option>
                <option value="3">일본</option>
              </select>
        </div>
        <div class="col-sm-6 mt-3 mt-sm-0">          
            <label for="exampleDataList" class="form-label">Datalist example</label>
            <input list="datalistOptions" name="" id="exampleDataList" placeholder="Type to search..." class="form-control form-select-sm">
            <datalist id="datalistOptions">
                <option value="San Francisco">
                <option value="New York">
                <option value="Seattle">
                <option value="Los Angeles">
                <option value="Chicago">
            </datalist>
        </div>
    </div>
    <div class="row mt-sm-4">
        <div class="col-sm-6 mt-3 mt-sm-0">
        	<input type="hidden" id="ifmaDefaultNyArray0" name="ifmaDefaultNyArray" value="1">
        	<input type="hidden" id="ifmaTypeCdArray0" name="ifmaTypeCdArray" value="78">
        	<input type="hidden" id="ifmaTitleArray0" name="ifmaTitleArray" value="기본">
        	<input type="hidden" id="ifmaAddressExtraArray0" name="ifmaAddressExtraArray" value="기본">
            <label for="memZip" class="form-label">주소 (한국전용)</label>
            <div class="input-group input-group-sm ">
                <input type="text" id="ifmaZipcodeArray0" name="ifmaZipcodeArray" value="" placeholder="우편번호" class="form-control" readonly>
                <button type="button" id="btnAddress" class="btn btn-outline-secondary"><i class="fas fa-search"></i></button>
                <button type="button" id="btnAddressClear" class="btn btn-outline-secondary"><i class="fa-solid fa-x"></i></button>
            </div>
            <input type="text" id="ifmaAddress1Array0" name="ifmaAddress1Array" value="" placeholder="주소" class="form-control form-control-sm mt-2" readonly>
            <input type="text" id="ifmaAddress2Array0" name="ifmaAddress2Array" value="" maxlength="50" placeholder="상세 주소" class="form-control form-control-sm mt-2">
        </div>
        <div class="col-sm-6">          
        </div>
    </div>
    <div class="row mt-sm-4">
        <div class="col-sm-6 mt-3 mt-sm-0">
            <label for="memZipAbroad" class="form-label">주소 (한국외전용)</label>
            <input type="text" id="memZipAbroad" name="memZipAbroad" value="" maxlength="50" placeholder="우편번호" class="form-control form-control-sm" >
            <input type="text" id="memAddressAbroad1" name="memAddressAbroad1" value="" maxlength="50" placeholder="주소" class="form-control form-control-sm mt-2">
            <input type="text" id="memAddressAbroad2" name="memAddressAbroad2" value="" maxlength="50" placeholder="상세 주소" class="form-control form-control-sm mt-2">
        </div>
        <div class="col-sm-6">          
        </div>
    </div>
    <div class="row mt-sm-4">
        <div class="col-sm-6 mt-3 mt-sm-0">
            <label for="memDesc" class="form-label">설명</label>
            <textarea id="memDesc" name="memDesc" placeholder="" class="form-control"></textarea>
        </div>
        <div class="col-sm-6">
        </div>
    </div>    
    <div class="row mt-sm-4">
        <div class="col-sm-3 mt-3 mt-sm-0">
            <label for="memModTxt" class="form-label">최종수정자</label>
            <input type="text" id="memModTxt" name="memModTxt" value="장원영" class="form-control form-control-sm" readonly>
        </div>
        <div class="col-sm-3 mt-3 mt-sm-0">
            <label for="memModDateTime" class="form-label">최종수정일</label>
            <input type="text" id="memModDateTime" name="memModDateTime" value="2021.01.01 12:12:12" class="form-control form-control-sm" readonly>          
        </div>
        <div class="col-sm-3 mt-3 mt-sm-0">
            <label for="memRegTxt" class="form-label">최초등록자</label>
            <input type="text" id="memRegTxt" name="memRegTxt" value="장원영" class="form-control form-control-sm" readonly>
        </div>
        <div class="col-sm-3 mt-3 mt-sm-0">
            <label for="memRegDateTime" class="form-label">최초등록일</label>
            <input type="text" id="memRegDateTime" name="memRegDateTime" value="2021.01.01 12:12:12" class="form-control form-control-sm" readonly>          
        </div>        
    </div>            
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

</form>
<form name="formVo" id="formVo" method="post">
<!-- *Vo.jsp s -->
<%@include file="memberVo.jsp"%>
<!-- *Vo.jsp e -->
</form>
<!-- main e -->


<div id="map" style="width:500px;height:400px;"></div>


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

<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>

<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=cc0680fedff73402526955076f9c7d53"></script>


<script>

var container = document.getElementById('map'); //지도를 담을 영역의 DOM 레퍼런스
var options = { //지도를 생성할 때 필요한 기본 옵션
	center: new kakao.maps.LatLng(33.450701, 126.570667), //지도의 중심좌표.
	level: 3 //지도의 레벨(확대, 축소 정도)
};

var map = new kakao.maps.Map(container, options); //지도 생성 및 객체 리턴


	$(document).ready(function(){
		 $("#ifmmDob").datepicker();
		 
		
	}); 
	
	var goUrlList = "/member/memberList"; 			/* #-> */
	var goUrlInst = "/member/memberInst"; 			/* #-> */
	var goUrlUpdt = "/member/memberUpdt";			/* #-> */
	var goUrlUele = "/member/memberUele";			/* #-> */
	var goUrlDele = "/member/memberDele";			/* #-> */
	
	var seq = $("input:hidden[name=ifmmSeq]");		/* #-> */
	
	var form = $("form[name=form]");
	var formVo = $("form[name=formVo]");
	
	
	$("#btnSave").on("click", function(){
		if (seq.val() == "0"){
	   		// insert
	   		if (validationInst() == false) return false;
	   		form.attr("action", goUrlInst).submit();
	   	} else {
	   		// update
	   		/* keyName.val(atob(keyName.val())); */
	   		if (validationUpdt() == false) return false;
	   		form.attr("action", goUrlUpdt).submit();
	   	}
	}); 
	
	
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
	
	
	$("#btnAddressClear").on("click", function(){	
		$("#ifmaZipcodeArray0").val('');
		$("#ifmaAddress1Array0").val('');
	});	  
	
	
	//본 예제에서는 도로명 주소 표기 방식에 대한 법령에 따라, 내려오는 데이터를 조합하여 올바른 주소를 구성하는 방법을 설명합니다.
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
                /* document.getElementById("ifmaAddress2Array0").value = data.jibunAddress; */
                
                // 참고항목 문자열이 있을 경우 해당 필드에 넣는다.
                 
                if(roadAddr !== ''){
                    document.getElementById("ifmaAddressExtraArray0").value = extraRoadAddr;
                } else {
                    document.getElementById("ifmaAddressExtraArray0").value = '';
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
        aaa();        
            }
        }).open();
    }
	
	
	aaa = function() {
		$.ajax({
			async: true 
			,cache: false
			,type: "post"
			,url: "/member/addressFindGeoProc"
			,data : { "ifmaAddress1Array" : $("#ifmaAddress1Array0").val()}
			,success: function(response) {
				if(response.rt == "success") {
	       			
					alert(response.rtFloat[0]);
					alert(response.rtFloat[1]);
					
				} else {
					
				}
			}
			,error : function(jqXHR, textStatus, errorThrown){
				alert("ajaxUpdate " + jqXHR.textStatus + " : " + jqXHR.errorThrown);
			}
		});
	}
	
	

</script>

</body>
</html>