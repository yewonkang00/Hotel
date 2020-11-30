<%@ page language="java" pageEncoding="UTF-8" contentType="text/html; charset=UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"  %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html lang="ko">
    <head>
        <meta charset="UTF-8">
		<link rel="stylesheet" href="/resources/css/style_admin.css" type="text/css">
        <script type="text/javascript" src="/resources/js/jquery-1.11.3.min.js"></script>
        <style>
            * {
                font-family: 'Noto Sans KR', sans-serif;
            }
        </style>
        <title>Member List</title>
        
        
  <script type="text/javascript">
			
	var sessionLevel = '${member.userLevel}';
	
	if(sessionLevel == null || sessionLevel == 'null' || sessionLevel=="" || sessionLevel == "1"){
		alert("관리자 권한이 없습니다.");
		location.href="/main";
	}
	
	  function updateLevel(id, level) {
		  var UserLevel = level;
		  var UserId = id;
		  if(level == '1') {
			  var confirm_test = confirm("관리자로 변경하시겠습니까?");
			  if(confirm_test == true) {
				  UserLevel ='2';	
			  }
		  }
		  else if(level == '2') {
			  var confirm_test = confirm("고객으로 변경하시겠습니까?");
			  if(confirm_test == true) {
				  UserLevel ='1';	
			  }
		  }
		  var data = {"UserId" : UserId,
					"UserLevel" : UserLevel
			};
		  $.ajax({
				type : "POST",
				url : "/admin/levelAction.do",
				data : data,
				datatype : 'json',
				success : function(data) {
					var result = data["resultMsg"];
					if(result == "Success"){
						alert("변경되었습니다!");
						location.href="/admin/memberList";
					}
				}
		})
	  }

	  function memberDetail(id) {
		var UserId = id;
		location.href="/admin/memberDetail.do?userId=" + id;
	  }
  </script>

		<script>
			$(document).on('click', '#btnSearch', function(e){
				e.preventDefault();

				var url = "${pageContext.request.contextPath}/board/getBoardList";

				url = url + "?searchType=" + $('#searchType').val();

				url = url + "&keyword=" + $('#keyword').val();

				location.href = url;

				console.log(url);
			});
		</script>
  
  
    </head>
    <body>
	<%@include file = "/WEB-INF/views/admin/admin_header.jsp" %>

        <div class=contents>
			<p style="text-align:center;">MEMBER LIST</p>
			<!-- search{s} -->
			<div class="form-group row justify-content-center">
				<div class="w100" style="text-align: center">
					<select class="form-control form-control-sm" name="searchType" id="searchType">
						<option value="UserName">이름</option>
						<option value="UserId">아이디</option>
					</select>
					<input type="text" class="form-control form-control-sm" name="keyword" id="keyword">
					<button class="btn btn-sm btn-primary" name="btnSearch" id="btnSearch">검색</button>
				</div>
				<br>
			</div>
			<!-- search{e} -->
        	<table class="table table-hover">
			<thead>
			<tr>
				<td>No</td>
				<td>USER ID</td>
				<td>USER Name</td>
				<td>USER GRADE</td>
				<td>USER Phone</td>
				<td>USER Email</td>
				<td>LEVEL</td>
				<td></td>
			</tr>
			</thead>

			<c:forEach items="${memberList}" var="item" varStatus="idx">
			<tr>
				<td>${idx.index+1}</td>
				<td><a href="javaScript:memberDetail('${item.userId}');">${item.userId}</a></td>
				<td>${item.userName}</td>
				<td>${item.userGrade}</td>
				<td>${fn:substring(item.userPhone,0,3)} - ${fn:substring(item.userPhone,3, 7)} - ${fn:substring(item.userPhone,7,11)}</td>
				<td>${item.userEmail}</td>
				<td>
				<c:choose>
					<c:when test="${item.userLevel == '1'}">유저</c:when>
					<c:otherwise>관리자</c:otherwise>
				</c:choose>
				</td>
				<td><input type="button" value="Update" class="submit-btn" onClick="javaScript:updateLevel('${item.userId}','${item.userLevel}');"></td>
			</tr>
			</c:forEach>
		</table>
        </div>
    <!-- pagination{e} -->

</body>

</html>
