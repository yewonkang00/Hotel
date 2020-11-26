<%@ page language="java" pageEncoding="UTF-8" contentType="text/html; charset=UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"  %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html lang="ko">
    <head>
        <meta charset="UTF-8">
        <script type="text/javascript" src="/resources/js/jquery-1.11.3.min.js"></script>
        <style>
            * {
                font-family: 'Noto Sans KR', sans-serif;
            }
            body {
                margin-left:auto;
                margin-right: auto;
                padding:0px;
                background-color: white;
                font-family:나눔고딕;
            }
            a {
                color:#111111;
            }
            a { text-decoration:none } 
            .header{
                margin-left:auto;
                margin-right: auto;
                background-color: #D4C1A1;
                position: fixed;
                top: 0;
                left: 0;
                right: 0;
                height: 50px;
                text-align: center;
                padding: 8px;
                color: #111111;
                font-size: 5px;
                display: flex;
                justify-content: space-between;
                align-items: center;
            }
            .header nav {
                list-style-type: none;
                text-align: center;
                margin: 0;
                padding: 0;
            }
            .header nav span {
                display:inline-block;
                font-size: 15px;
                padding: 20px;
            }
            .banner{
                background-image: url("/resources/image/oria-hotel-4636405_1280.jpg");
                background-size: cover;
                margin-top: auto;
                width: auto;
                height: 700px;
            }
            
            .contents{
                width: 1200px;
                margin-left:auto;
                margin-right: auto;
                min-height: 500px;
                padding: 50px;
                background-color: white;
                font-size: 18px;
                color: #333333
            }
            .finish {
                width: 1200px;
                margin-left:auto;
                margin-right: auto;
                padding: 50px;
                background-color: white;
                font-size: 18px;
                color: #333333
            }

        </style>
        <title>Welcom Delluna!</title>
        
        
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

	
  
  </script>
  
  
    </head>
    <body>
        <div class=header>
            <img src="/resources/image/moon.png" width="100" height="100">
            <nav>
                <span><a href="/admin/memberList">회원리스트</a></span>
                <span><a href="/admin/roomList">객실List</a></span>
                <span>
		        	<c:choose>
		  				<c:when test="${member != null}"><a href="/logout.do">로그아웃</a></c:when>
		   				<c:otherwise><a href="/login.do">로그인</a></c:otherwise>
		   			</c:choose>
       			</span>
            </nav>
            
        </div>
        <p>

		<p>
        <div class=contents>
                <p style="text-align:center;">회원 LIST</p>
        <table border="1">
        <tr><td>No</td><td>USER ID</td><td>USER Name</td><td>USER Phone</td><td>USER Email</td><td>UserAddressState</td><td>LEVEL</td></tr>
			<c:forEach items="${memberList}" var="item" varStatus="idx">
			<tr>
				<td>${idx.index+1}</td>
				<td>${item.userId}</td>
				<td>${item.userName}</td>
				<td>${fn:substring(item.userPhone,0,3)} - ${fn:substring(item.userPhone,3, 7)} - ${fn:substring(item.userPhone,7,11)}</td>
				<td>${item.userEmail}</td>
				<td>${item.userAddressState}</td>
				<td>
				<c:choose>
					<c:when test="${item.userLevel == '1'}">유저</c:when>
					<c:otherwise>관리자</c:otherwise>
				</c:choose>
				 <br> 
			<input type="button" value="Update" class="submit-btn" onClick="javaScript:updateLevel('${item.userId}','${item.userLevel}');">
			</td>			
			</tr>
			</c:forEach>
		</table>
        </div>
    <!-- pagination{e} -->

		<!-- search{s} -->

		<div class="form-group row justify-content-center">

			<div class="w100" style="padding-right:10px">

				<select class="form-control form-control-sm" name="searchType" id="searchType">

					<option value="UserName">이름</option>

					<option value="UserId">아이디</option>

				</select>

			</div>

			<div class="w300" style="padding-right:10px">

				<input type="text" class="form-control form-control-sm" name="keyword" id="keyword">

			</div>

			<div>

				<button class="btn btn-sm btn-primary" name="btnSearch" id="btnSearch">검색</button>

			</div>

		</div>

		<!-- search{e} -->

	</div>
	
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


</body>

</html>