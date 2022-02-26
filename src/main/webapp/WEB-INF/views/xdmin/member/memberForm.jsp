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

<h3 class="mt-3 mb-0">Code</h3>
 
<div class="container-fluid px-0 px-sm-5 mt-2">
    <div class="row mt-sm-4">
        <div class="col-sm-6">
            <label for="memId" class="form-label">아이디</label>
            <input type="text" id="ifmmId" name="ifmmId" value="<c:out value="${rt.ifmmId}"/>" maxlength="20" placeholder="영문(대소문자),숫자,특수문자(), 4~20자리 조합" class="form-control form-control-sm">
        </div>
        <div class="col-sm-6">
        </div>
    </div>
    <div class="row mt-sm-4">
        <div class="col-sm-6 mt-3 mt-sm-0">
            <label for="memPwd" class="form-label">비밀번호</label>
            <input type="password" id="memPwd" name="memPwd" value="" maxlength="20" placeholder="영문(대소문자),숫자,특수문자(), 8~20자리 조합" class="form-control form-control-sm">
        </div>
        <div class="col-sm-6 mt-3 mt-sm-0">
            <label for="memPwdRe" class="form-label">비밀번호확인</label>
            <input type="password" id="memPwdRe" name="memPwdRe" value="" maxlength="20" placeholder="" class="form-control form-control-sm">          
        </div>
    </div>
    <div class="row mt-sm-4">
        <div class="col-sm-6 mt-3 mt-sm-0">
            <label for="memNameFull" class="form-label">이름</label>
            <input type="text" id="ifmmName" name="ifmmName" value="<c:out value="${rt.ifmmName}"/>" maxlength="50" placeholder="" class="form-control form-control-sm">
        </div>
        <div class="col-sm-6 mt-3 mt-sm-0">
            <label for="memNameFullEng" class="form-label">이름 (영문)</label>
            <input type="text" id="memNameFullEng" name="memNameFullEng" value="" maxlength="50" placeholder="" class="form-control form-control-sm">            
        </div>
    </div>
    <div class="row mt-sm-4 mt-3 mt-sm-0">
        <div class="col-sm-6">
            <label for="memNameLast" class="form-label">이름</label>
            <input type="text" id="memNameLast" name="memNameLast" value="" maxlength="50" placeholder="" class="form-control form-control-sm">
        </div>
        <div class="col-sm-6 mt-3 mt-sm-0">
            <label for="memNameFirst" class="form-label">성</label>
            <input type="text" id="memNameFirst" name="memNameFirst" value="" maxlength="50" placeholder="" class="form-control form-control-sm">          
        </div>
    </div>
    <div class="row mt-sm-4 mt-3 mt-sm-0">
        <div class="col-sm-6">
            <label for="memNameLastEng" class="form-label">이름 (영문)</label>
            <input type="text" id="memNameLastEng" name="memNameLastEng" value="" maxlength="50" placeholder="" class="form-control form-control-sm">
        </div>
        <div class="col-sm-6 mt-3 mt-sm-0">
            <label for="memNameFirstEng" class="form-label">성 (영문)</label>
            <input type="text" id="memNameFirstEng" name="memNameFirstEng" value="" maxlength="50" placeholder="" class="form-control form-control-sm">          
        </div>
    </div>
    <div class="row mt-sm-4">
        <div class="col-sm-6 mt-3 mt-sm-0">
            <label for="memGender" class="form-label">성별</label>
            <select id="memGender" name="memGender" class="form-select form-select-sm">
                <option value="">::선택::</option>
                <option value="1">남성</option>
                <option value="2">여성</option>
                <option value="3">기타</option>
              </select>
        </div>
        <div class="col-sm-6 mt-3 mt-sm-0">
            <label for="memDob" class="form-label">생일</label>
            <input type="text" id="memDob" name="memDob" value="" placeholder="" class="form-control form-control-sm" >          
        </div>
    </div>    
    <div class="row mt-sm-4">    
        <div class="col-sm-6 mt-3 mt-sm-0">
            <label for="memEmail" class="form-label">Email</label>
            <input type="text" id="memEmail" name="memEmail" value="" maxlength="50" placeholder="name@example.com" class="form-control form-control-sm">
        </div>
        <div class="col-sm-6 mt-3 mt-sm-0">
            <label for="memEmailAgree" class="form-label">이메일 정보 마케팅 사용 동의</label>
            <div class="form-check">
                <input type="checkbox" id="memEmailAgree" name="memEmailAgree" value="" class="form-check-input">
                <label for="memEmailAgree" class="form-check-label">
                    동의합니다
                </label>
            </div>
        </div>
    </div>
    <div class="row mt-sm-4">
        <div class="col-sm-6 mt-3 mt-sm-0">
            <label for="memMobile" class="form-label">핸드폰</label>
            <input type="text" id="memMobile" name="memMobile" value="" maxlength="11" placeholder="숫자만 (01044447777)" class="form-control form-control-sm">
        </div>
        <div class="col-sm-6 mt-3 mt-sm-0">
            <label for="memMobileAgree" class="form-label">핸드폰 정보 마케팅 사용 동의</label>
            <div class="form-check">
                <input type="checkbox" id="memMobileAgree" name="memMobileAgree" value="" class="form-check-input">
                <label for="memMobileAgree" class="form-check-label">
                    동의합니다
                </label>
            </div>          
        </div>
    </div>
    <div class="row mt-sm-4">
        <div class="col-sm-6 mt-3 mt-sm-0">
            <label for="memTel" class="form-label">전화번호</label>
            <input type="text" id="memTel" name="memTel" value="" maxlength="11" placeholder="숫자만 (024447777)" class="form-control form-control-sm">
        </div>
        <div class="col-sm-6 mt-3 mt-sm-0">
            <label for="memFax" class="form-label">팩스번호</label>
            <input type="text" id="memFax" name="memFax" value="" maxlength="11" placeholder="숫자만 (024447777)" class="form-control form-control-sm">
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
            <label for="memZip" class="form-label">주소 (한국전용)</label>
            <div class="input-group input-group-sm ">
                <input type="text" id="memZip" name="memZip" value="" maxlength="5" placeholder="" class="form-control" readonly>
                <button type="button" id="button-addon2" class="btn btn-outline-secondary" data-bs-toggle="modal" data-bs-target="#exampleModal"><i class="fas fa-search"></i></button>
            </div>
            <input type="text" id="memAddress1" name="memAddress1" value="" maxlength="50" placeholder="" class="form-control form-control-sm mt-2" readonly>
            <input type="text" id="memAddress2" name="memAddress2" value="" maxlength="50" placeholder="상세 주소" class="form-control form-control-sm mt-2">
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
            <button type="button" class="btn btn-danger btn-sm" data-bs-toggle="modal" data-bs-target="#staticBackdrop" name="" id="btnModalDelete"><i class="far fa-trash-alt"></i></button>
            <!-- <button type="button" class="btn btn-danger btn-sm" data-bs-toggle="modal" data-bs-target="#staticBackdrop" name="" id="btnUelete"><i class="far fa-trash-alt"></i></button> -->
            <button type="button" class="btn btn-danger btn-sm" name="" id="btnModalUelete"><i class="far fa-trash-alt"></i></button>
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
	   		alert($("input[name=ifmmId]").val());
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
	
	
	$("#btnModalUelete").on("click", function(){
		$("input:hidden[name=exDeleteType]").val(1);
		$(".modal-title").text("확 인");
		$(".modal-body").text("해당 데이터를 삭제하시겠습니까 ?");
		$("#modalConfirm").modal("show");
	});
	
	
	$("#btnModalDelete").on("click", function(){
		$("input:hidden[name=exDeleteType]").val(2);
		$(".modal-title").text("확 인");
		$(".modal-body").text("해당 데이터를 삭제하시겠습니까 ?");
		$("#modalConfirm").modal("show");
	});
	
	
	$("#btnUelete").on("click", function(){
		$("#modalConfirm").modal("hide");
		if ($("input:hidden[name=exDeleteType]").val() == 1) {
			formVo.attr("action", goUrlUele).submit();
		} else {
			formVo.attr("action", goUrlDele).submit();
		}
	});

</script>

</body>
</html>