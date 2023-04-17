<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@page import="DB.*"%>
<%@page import="Controller.*"%>
<%@page import="DataClass.*"%>
<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="utf-8" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no" />
<meta name="description" content="" />
<meta name="author" content="" />
<title>MMN-main</title>

<link href="../CSS/template.css" rel="stylesheet" />
<link href="../CSS/style_main_main.css" rel="stylesheet" />

</head>


<body>

	<%
	DB_Conn db = new DB_Conn();
	String userID = "aabb";
	watchlist wl = new watchlist(userID);
	watchlistStoreDataPrint[] arr = new watchlistStoreDataPrint[10];

	int lim = Math.min(wl.getWsdpList().size(), 10);

	for (int i = 0; i < lim; i++) {
		arr[i] = wl.getWsdpList().get(i);
	}
	%>
	<!-- Navigation-->
	<nav class="navbar navbar-light bg-light static-top">
		<div class="container">
			<a class="navbar-brand" href="#!"><img
				src="../UI/UI/logo_MMN(2).PNG" width="100px"></a> <a
				class="btn btn-primary" href="#signup" id="loginasdf">로그인</a> <a
				class="btn btn-primary" href="#signup" id="signupasdf">회원가입</a>
		</div>
	</nav>

	<!-- <button id="show">팝업열기</button> -->
	<div class="background">
		<div class="window">

			<div class="popup">
				<form method="post" action="watchlistInactive">
					<input type="text" id="userID" name="userID" value="<%=userID%>">
					<%
					int cnt = 0;
					for (int i = 0; i < lim; i++) {
						if (arr[i] != null) {
							cnt++;

							System.out.println("i : " + i);
					%>
					<div id="store<%=i%>" class="store">
						<div class="keep_icon">
							<input type="text" id="storeCode" name="storeCode<%=i%>"
								value="<%=arr[i].getStoreCode()%>"><input
								type="checkbox" name="check<%=i%>" id="check<%=i%>" checked><label
								for="check<%=i%>"></label>
						</div>
						<div class="store_photo"
							style="background:url(<%=arr[i].getStoreImagePath()%>) no-repeat; background-size: 100%;"></div>
						<div class="store_details">
							<div id="store_name"><%=arr[i].getStoreName()%></div>
							<div id="store_score"><%=arr[i].getAverageRating()%></div>
							<div id="store_category"><%=arr[i].getCateName()%></div>
							<div id="store_address"><%=arr[i].getAddr()%></div>
						</div>
					</div>
					<%
					}
					}

					System.out.println("cnt : " + cnt);

					if (cnt == 0) {
					%>
					<img src="../UI/UI/뭐뭇나_List_none.png" class="list_none"
						id="list_none">
					<%
					}
					%>

					<button type="submit" id="close">팝업닫기</button>
				</form>
			</div>
		</div>
	</div>

	<script>
		function show() {
			document.querySelector(".background").className = "background show";
		}

		function close() {
			document.querySelector(".background").className = "background";
		}

		document.querySelector("#loginasdf").addEventListener("click", show);
		document.querySelector("#close").addEventListener("click", close);
	</script>



</body>

</html>