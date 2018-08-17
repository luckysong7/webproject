<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:include page="../header.jsp" flush="false"/>
<%
	request.setCharacterEncoding("UTF-8");
	String cp = request.getContextPath();

%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="<%=cp%>/movie/css/list.css" type="text/css"/>
<link href="https://fonts.googleapis.com/css?family=Nanum+Gothic" rel="stylesheet">
<script type="text/javascript">

	/* function showPop() {
		
		var f = document.mvForm;
		
		window.open("movie.do","movieInfo",
				"top=90, width=968, height=650, left="
				+(screen.width-968)/2+"",
				"toolbar=no", "menubar=no", "status=no", "resizable=no",
				"location=no","scrollbars=yes");
		} */

		function showPop() {

			var setting = 'toolbar=no,menubar=no,status=no,resizable=no,location=no,top=90, width=968, height=650, left='+(screen.width-968)/2+'';
			
			var windowObj = window.open("movie.do","movieInfo",setting);
			
			windowObj.document.getElementById("movie_id").value = document.getElementById("movie_id").value;
		
		}
		
</script>
</head>
<body>
<form action="" method="post" id="mvForm">
<div id="title">
	<table width="1000px" height="50px" align="center" style="vertical-align: middle;" class="topMenu">
		<tr>
			<td><a href=<%=cp %>/Movie/list.do><font color="#503396">박스오피스</font></a></td>
			<td><a href=<%=cp %>/Movie/list_date.do>최신개봉작</a></td>
			<td><a href=<%=cp %>/Movie/list_pre.do>상영예정작</a></td>
			<td><span style="float: left;">
			<a href="<%=cp %>/movie/wishMov.jsp">♥ 보고싶어</a></span>
			<span style="float: right;">
			<font size="2pt">
			<a href="<%=cp %>/movie/myMov.jsp">나의 무비스토리 ></a></font></span></td>
		</tr>
	</table>
</div>

<div id="content">
	<table width="1722px">
		<tr>
		<td height="50px" colspan="7"></td>

		</tr>
	<c:set var="i" value="0"/>
	<c:forEach var="dto" items="${lst }">
	<c:if test="${i==0 }">
		<tr>
	</c:if>
	<c:if test="${i!=0&&i%7==0 }">
		</tr>
		<tr>
	</c:if>
		<td width="242px" height="517px">
		<table width="230px" height="503px" style="margin: 3px;">
			<tr>
				<td class="top">
				<img src="${imagePath }/${dto.file_name}" width="230px" height="330px"/>
				</td>
			</tr>
			<tr>
				<td width="230px" height="50px" class="bottom">
				<span style="line-height: 25px;">
				<font color="grey" style="font-weight: bold; font-size: 11pt;">평점 ${dto.rating }</font></span>
				<span style="float: right;"><img src="./image/bg_allstar1.png"/></span>
				</td>
			</tr>
			<tr>
				<td class="middle">
				<img src="./image/age15.png" align="middle"/>
				<font color="#353535" style="font-weight: bold;">
				<a href="javascript:showPop();">${dto.movie_name }</a></font><!-- … --></td>
			</tr>
			<tr>
				<td class="bottom" align="center"> 
				<input type="hidden" name="movie_id1" value="${dto.movie_id }"/>
				<input type="button" value="상세정보" class="btn1"
				onclick="showPop();"/>
				&nbsp;<input type="button" value="예매하기" class="btn1"
				onclick=""/></td>
				<c:set var="i" value="${i+1 }" />
			</tr>
	</table>
	</td>
	</c:forEach>	
	</table>
</div>




<div style="clear: both;">
<jsp:include page="../footer.jsp" flush="false"/>
</div>
</body>
</html>