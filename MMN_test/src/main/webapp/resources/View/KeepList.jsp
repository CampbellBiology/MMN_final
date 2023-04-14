<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@page import="Controller.*"%>
<%@page import="DataClass.*"%>
<%@page import="DB.*"%>

<!DOCTYPE html>
<html>

<head>
<meta charset="utf-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<title>Page Title</title>
<meta name="viewport" content="width=device-width, initial-scale=1" />
<link rel="stylesheet" href="../CSS/style_keepList.css">

</head>

<body>
	<button id="show">팝업열기</button>
	<div class="background">
		<div class="window">

			<%
			DB_Conn db = new DB_Conn();
			String userID = "aabb";
			watchlist wl = new watchlist(userID);
			watchlistStoreDataPrint[] arr = new watchlistStoreDataPrint[5];

			wl.getWdList().get(0).getStoreCode();
			int lim = Math.min(wl.getWsdpList().size(), 5);

			for (int i = 0; i < lim; i++) {
				arr[i] = wl.getWsdpList().get(i);
			}
			%>

			<form method="post" action="watchlistInactive">
				<div class="popup">

					<input type="text" name="userID" value="<%=userID%>">

					<%
					if (arr[0] != null) {
					%>
					<div id="store">
						<div id="keep_icon1" class="keep_icon">
							<input type="text" name="storeCode1"
								value="<%=arr[0].getStoreCode()%>"><input
								type="checkbox" name="check1" id="check1" checked><label
								for="check1"></label>
						</div>
						<div id="store_photo"
							style="background:url(<%=arr[0].getStoreImagePath()%>) no-repeat; background-size: 100%;"></div>
						<div id="store_details">
							<div id="store_name"><%=arr[0].getStoreName()%></div>
							<div id="store_score"><%=arr[0].getAverageRating()%></div>
							<div id="store_category"><%=arr[0].getCateName()%></div>
							<div id="store_address"><%=arr[0].getAddr()%></div>
						</div>
					</div>
					<%
					}
					%>
					<%
					if (arr[1] != null) {
					%>
					<div id="store">
						<div id="keep_icon2" class="keep_icon">
							<input type="text" name="storeCode2"
								value="<%=arr[1].getStoreCode()%>"><input
								type="checkbox" name="check2" id="check2" checked><label
								for="check2"></label>
						</div>
						<div id="store_photo"
							style="background:url(<%=arr[1].getStoreImagePath()%>) no-repeat; background-size: 100%;"></div>
						<div id="store_details">
							<div id="store_name"><%=arr[1].getStoreName()%></div>
							<div id="store_score"><%=arr[1].getAverageRating()%></div>
							<div id="store_category"><%=arr[1].getCateName()%></div>
							<div id="store_address"><%=arr[1].getAddr()%></div>
						</div>
					</div>
					<%
					}
					%>

					<%
					if (arr[2] != null) {
					%>
					<div id="store">
						<div id="keep_icon3" class="keep_icon">
							<input type="text" name="storeCode3"
								value="<%=arr[2].getStoreCode()%>"><input
								type="checkbox" name="check3" id="check3" checked><label
								for="check3"></label>
						</div>
						<div id="store_photo"
							style="background:url(<%=arr[2].getStoreImagePath()%>) no-repeat; background-size: 100%;"></div>
						<div id="store_details">
							<div id="store_name"><%=arr[2].getStoreName()%></div>
							<div id="store_score"><%=arr[2].getAverageRating()%></div>
							<div id="store_category"><%=arr[2].getCateName()%></div>
							<div id="store_address"><%=arr[2].getAddr()%></div>
						</div>
					</div>
					<%
					}
					%>


					<%
					if (arr[3] != null) {
					%>
					<div id="store">
						<div id="keep_icon4" class="keep_icon">
							<input type="text" name="storeCode4"
								value="<%=arr[3].getStoreCode()%>"><input
								type="checkbox" name="check4" id="check4" checked><label
								for="check4"></label>
						</div>
						<div id="store_photo"
							style="background:url(<%=arr[3].getStoreImagePath()%>) no-repeat; background-size: 100%;"></div>
						<div id="store_details">
							<div id="store_name"><%=arr[3].getStoreName()%></div>
							<div id="store_score"><%=arr[3].getAverageRating()%></div>
							<div id="store_category"><%=arr[3].getCateName()%></div>
							<div id="store_address"><%=arr[3].getAddr()%></div>
						</div>
					</div>
					<%
					}
					%>

					<%
					if (arr[4] != null) {
					%>
					<div id="store">
						<div id="keep_icon5" class="keep_icon">
							<input type="text" name="storeCode5"
								value="<%=arr[4].getStoreCode()%>"><input
								type="checkbox" name="check5" id="check5" checked><label
								for="check5"></label>
						</div>
						<div id="store_photo"
							style="background:url(<%=arr[4].getStoreImagePath()%>) no-repeat; background-size: 100%;"></div>
						<div id="store_details">
							<div id="store_name"><%=arr[4].getStoreName()%></div>
							<div id="store_score"><%=arr[4].getAverageRating()%></div>
							<div id="store_category"><%=arr[4].getCateName()%></div>
							<div id="store_address"><%=arr[4].getAddr()%></div>
						</div>
					</div>
					<%
					}
					%>

					<button type="submit" id="close">팝업닫기</button>

				</div>
			</form>
		</div>
	</div>
	<script>
		function show() {
			document.querySelector(".background").className = "background show";
		}

		function close() {
			document.querySelector(".background").className = "background";
		}

		document.querySelector("#show").addEventListener("click", show);
		document.querySelector("#close").addEventListener("click", close);
	</script>
</body>

</html>