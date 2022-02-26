<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>

<input type="hidden" name="thisPage" value="<c:out value="${vo.thisPage}" default="1"/>">
<input type="hidden" name="rowNumToShow" value="<c:out value="${vo.rowNumToShow}"/>">

<input type="hidden" name="shDelNy" value="<c:out value="${vo.shDelNy}"/>"/>
<input type="hidden" name="shDateOption" value="<c:out value="${vo.shDateOption}"/>"/>
<%-- 
<input type="hidden" name="shStartDate" value="<c:out value="${vo.shStartDate}"/>"/>
<input type="hidden" name="shEndDate" value="<c:out value="${vo.shEndDate}"/>"/>
 --%>
<input type="hidden" name="shOption" value="<c:out value="${vo.shOption}"/>"/>
<input type="hidden" name="shValue" value="<c:out value="${vo.shValue}"/>"/>

<input type="hidden" name="exDeleteType"/>		<!-- 삭제 구분 : 1 : 수정삭제, 2: 실제 삭제 -->

<input type="hidden" name="ifmmSeq"value="<c:out value="${vo.ifmmSeq}"/>" />	<!-- #-> -->










<%-- 
<input type="hidden" name="thisPage" value="<c:out value="${param.thisPage}" default="1"/>"/>
<input type="hidden" name="rowNumToShow" value="<c:out value="${param.rowNumToShow}" default="10"/>"/>
<input type="hidden" name="searchValue" value="<c:out value="${param.searchValue}"/>"/>
<input type="hidden" name="gubun" value="<c:out value="${param.gubun}"/>"/>

<input type="hidden" name="sh_auth" value="<c:out value="${param.sh_auth}"/>"/>
<input type="hidden" name="sh_AUTH_SEQ" value="<c:out value="${param.sh_AUTH_SEQ}"/>"/>
 --%>