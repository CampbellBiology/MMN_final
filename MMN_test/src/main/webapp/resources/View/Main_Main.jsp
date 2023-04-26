<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@page import="DB.*"%>
<%@page import="Controller.*"%>
<%@page import="DataClass.*"%>
<!DOCTYPE html>
<html lang="en">

<head>
  <meta charset="utf-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
  <meta name="description" content="" />
  <meta name="author" content="" />
  <title>MMN-main</title>

  <link href="../CSS/template.css" rel="stylesheet" />
  <link href="../CSS/style_main_main.css" rel="stylesheet" />

</head>


<body>
<%
	DB_Conn db = new DB_Conn();
	String userID = (String)session.getAttribute("memberID");
	System.out.println("Main_Main.jsp userID:"+userID);
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
      <a class="navbar-brand" href="javascript:brandClick();" id="brand"><img src="../UI/UI/logo_MMN(2).PNG" width="100px"></a>
      <a class="btn btn-primary" href="Login2.html" id="loginasdf" style="display:<%=userID!=null?"none":"block"%>">로그인</a>
      <button type="button" id="watchlist_button" style="display:<%=userID==null?"none":"block"%>" onclick="sendRequest2()"><img src="../UI/UI/watchlist_active.png" height="50px"></button>
      <a class="btn btn-primary" href="SignIn2.html" id="signupasdf" style="display:<%=userID!=null?"none":"block"%>">회원가입</a>

      <!-- 유저 이미지 파일 src DB에서 가져와서 넣어줘야 해요 -->
      <div id="profile"style="display:<%=userID==null?"none":"block"%>"><img src="http://192.168.250.44<%= db.getUserImagePath(userID) %>" id="profile_photo"></div>
    </div>
  </nav>
  
    <!-- <button id="show">팝업열기</button> -->
  <div class="background">
    <div class="window">
      
      <button id="close">
        <img src="../UI/UI/close1.png" class="close" width="30px" height="30px">
      </button>
      <div class="popup" id="popup">
					

					<button type="button" id="close">팝업닫기</button>
			</div>
		</div>
	</div>

<!-- ifrmae으로 다른 html넣기 -->
  <iframe src="Main_0414.jsp" width="100%" height="5000px" frameborder="0"  scrolling="no" style="border:0;" allowfullscreen="" aria-hidden="false" tabindex="0" id="main_page"></iframe>
  <iframe src="Store_0424.jsp" width="100%" height="8000px" frameborder="0" style="border:0;" allowfullscreen="" aria-hidden="false" tabindex="0" id="store_page"></iframe>
  <iframe src="TagPage_0414.jsp" width="100%" height="5000px" frameborder="0" style="border:0; overflow:hidden;" allowfullscreen="" aria-hidden="false" tabindex="0" id="tag_page"></iframe>



	<script>
		function show() {
			document.querySelector(".background").className = "background show";
		}

		function close() {
			document.querySelector(".background").className = "background";
		}

		document.querySelector("#watchlist_button").addEventListener("click",
				show);
		document.querySelector("#close").addEventListener("click", close);
	</script>
	<script>
	function sendRequest(sc) {
		var httpRequest;
		function createRequest() {
			if (window.XMLHttpRequest) { // 익스플로러 7과 그 이상의 버전, 크롬, 파이어폭스, 사파리,
											// 오페라 등
				return new XMLHttpRequest();
			} else { // 익스플로러 6과 그 이하의 버전
				return new ActiveXObject("Microsoft.XMLHTTP");
			}
		}
		function receiveResponse() {
			// XMLHttpRequest 객체의 현재 상태가 요청 완료이고, 서버에 문서가 존재하면 받은 데이터를 출력함.
			if (httpRequest.readyState == XMLHttpRequest.DONE
					&& httpRequest.status == 200) {
				document.getElementById("text").innerHTML = httpRequest.responseText;
			}
		}
		httpRequest = createRequest(); // XMLHttpRequest 객체를 생성함.
		httpRequest.onreadystatechange = receiveResponse; // XMLHttpRequest 객체의 현재
															// 상태를 파악함.
		// GET 방식의 비동기식 요청으로 Http 요청을 생성함.
		httpRequest.open("POST", "../../watchlistAddOrDelete.jsp", true);
		httpRequest.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");
		httpRequest.send("userID=<%=userID%>&storeCode="+sc); // Http 요청을 보냄.
		}
	</script>
	
	<script>
	function sendRequest2() {
		var httpRequest;
		function createRequest() {
			if (window.XMLHttpRequest) { // 익스플로러 7과 그 이상의 버전, 크롬, 파이어폭스, 사파리,
											// 오페라 등
				return new XMLHttpRequest();
			} else { // 익스플로러 6과 그 이하의 버전
				return new ActiveXObject("Microsoft.XMLHTTP");
			}
		}
		function receiveResponse() {
			// XMLHttpRequest 객체의 현재 상태가 요청 완료이고, 서버에 문서가 존재하면 받은 데이터를 출력함.
			if (httpRequest.readyState == XMLHttpRequest.DONE
					&& httpRequest.status == 200) {
				document.getElementById("popup").innerHTML = httpRequest.responseText;
			}
		}
		httpRequest = createRequest(); // XMLHttpRequest 객체를 생성함.
		httpRequest.onreadystatechange = receiveResponse; // XMLHttpRequest 객체의 현재
															// 상태를 파악함.
		// GET 방식의 비동기식 요청으로 Http 요청을 생성함.
		httpRequest.open("POST", "watchlist_popup.jsp", true);
		httpRequest.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");
		httpRequest.send("userID=<%=userID%>"); // Http 요청을 보냄.
		}
	</script>
	
	<script type="text/javascript" src="../js/project02.js"></script>


</body>

</html>