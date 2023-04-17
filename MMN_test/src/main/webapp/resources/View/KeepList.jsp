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
			watchlistStoreDataPrint[] arr = new watchlistStoreDataPrint[10];

			int lim = Math.min(wl.getWsdpList().size(), 10);

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
						<div id="keep_icon">
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
						<div id="keep_icon">
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
						<div id="keep_icon">
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
						<div id="keep_icon">
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
						<div id="keep_icon">
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
					
					<%
					if (arr[5] != null) {
					%>
					<div id="store">
						<div id="keep_icon">
							<input type="text" name="storeCode6"
								value="<%=arr[5].getStoreCode()%>"><input
								type="checkbox" name="check6" id="check6" checked><label
								for="check6"></label>
						</div>
						<div id="store_photo"
							style="background:url(<%=arr[5].getStoreImagePath()%>) no-repeat; background-size: 100%;"></div>
						<div id="store_details">
							<div id="store_name"><%=arr[5].getStoreName()%></div>
							<div id="store_score"><%=arr[5].getAverageRating()%></div>
							<div id="store_category"><%=arr[5].getCateName()%></div>
							<div id="store_address"><%=arr[5].getAddr()%></div>
						</div>
					</div>
					<%
					}
					%>
					
					<%
					if (arr[6] != null) {
					%>
					<div id="store">
						<div id="keep_icon">
							<input type="text" name="storeCode7"
								value="<%=arr[6].getStoreCode()%>"><input
								type="checkbox" name="check7" id="check7" checked><label
								for="check7"></label>
						</div>
						<div id="store_photo"
							style="background:url(<%=arr[6].getStoreImagePath()%>) no-repeat; background-size: 100%;"></div>
						<div id="store_details">
							<div id="store_name"><%=arr[6].getStoreName()%></div>
							<div id="store_score"><%=arr[6].getAverageRating()%></div>
							<div id="store_category"><%=arr[6].getCateName()%></div>
							<div id="store_address"><%=arr[6].getAddr()%></div>
						</div>
					</div>
					<%
					}
					%>
					
					<%
					if (arr[7] != null) {
					%>
					<div id="store">
						<div id="keep_icon">
							<input type="text" name="storeCode8"
								value="<%=arr[7].getStoreCode()%>"><input
								type="checkbox" name="check8" id="check8" checked><label
								for="check8"></label>
						</div>
						<div id="store_photo"
							style="background:url(<%=arr[7].getStoreImagePath()%>) no-repeat; background-size: 100%;"></div>
						<div id="store_details">
							<div id="store_name"><%=arr[7].getStoreName()%></div>
							<div id="store_score"><%=arr[7].getAverageRating()%></div>
							<div id="store_category"><%=arr[7].getCateName()%></div>
							<div id="store_address"><%=arr[7].getAddr()%></div>
						</div>
					</div>
					<%
					}
					%>
					
					<%
					if (arr[8] != null) {
					%>
					<div id="store">
						<div id="keep_icon">
							<input type="text" name="storeCode9"
								value="<%=arr[8].getStoreCode()%>"><input
								type="checkbox" name="check9" id="check9" checked><label
								for="check9"></label>
						</div>
						<div id="store_photo"
							style="background:url(<%=arr[8].getStoreImagePath()%>) no-repeat; background-size: 100%;"></div>
						<div id="store_details">
							<div id="store_name"><%=arr[8].getStoreName()%></div>
							<div id="store_score"><%=arr[8].getAverageRating()%></div>
							<div id="store_category"><%=arr[8].getCateName()%></div>
							<div id="store_address"><%=arr[8].getAddr()%></div>
						</div>
					</div>
					<%
					}
					%>
					
					<%
					if (arr[9] != null) {
					%>
					<div id="store">
						<div id="keep_icon">
							<input type="text" name="storeCode10"
								value="<%=arr[9].getStoreCode()%>"><input
								type="checkbox" name="check10" id="check10" checked><label
								for="check10"></label>
						</div>
						<div id="store_photo"
							style="background:url(<%=arr[9].getStoreImagePath()%>) no-repeat; background-size: 100%;"></div>
						<div id="store_details">
							<div id="store_name"><%=arr[9].getStoreName()%></div>
							<div id="store_score"><%=arr[9].getAverageRating()%></div>
							<div id="store_category"><%=arr[9].getCateName()%></div>
							<div id="store_address"><%=arr[9].getAddr()%></div>
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