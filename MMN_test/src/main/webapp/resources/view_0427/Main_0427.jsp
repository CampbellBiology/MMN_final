<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <%@page import="DataClass.*" %>
    <%@page import="DB.*" %>
    <%@page import="java.util.*" %>
    <%@page import="Controller.*" %>
    
<!DOCTYPE html>
<html lang="en">

<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
  <meta name="description" content="" />
  <meta name="author" content="" />
  <title>MMN-main</title>


  <link href="../CSS/template.css" rel="stylesheet" />
  <link href="../CSS/tag.css" rel="stylesheet" />
  <link href="../CSS/modal.css" rel="stylesheet" />
  <link href="../CSS/origin.css" rel="stylesheet" />
  <link href="../CSS/storeDetail.css" rel="stylesheet"/>
   <link href="../CSS/main_0427.css" rel="stylesheet"/>

  <link rel="stylesheet" type="text/css" href="../slick-1.8.1/slick/slick.css">
  <link rel="stylesheet" type="text/css" href="../slick-1.8.1/slick/slick-theme.css">
   <script src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
</head>


<body>
  <!-- Navigation-->
  <!-- <nav class="navbar navbar-light bg-light static-top">
    <div class="container">
      <a class="navbar-brand" href="#!"><img src="../UI/UI/logo_MMN(2).png" width="100px"></a>
      <a class="btn btn-primary" href="#signup" id="loginasdf">로그인</a>
      <a class="btn btn-primary" href="#signup" id="signupasdf">회원가입</a>
    </div>
  </nav> -->
  <!-- Masthead-->
  
 <%
	DB_Conn db = new DB_Conn();
	String userID = (String) session.getAttribute("memberID");
	System.out.println("Main_Main.jsp userID:" + userID);
	watchlist wl = new watchlist(userID);
	watchlistStoreDataPrint[] arr = new watchlistStoreDataPrint[10];
	ArrayList <tagData> tdList = db.getTagDataList();
	Collections.sort(tdList);

	/* int lim = Math.min(wl.getWsdpList().size(), 10);
 
	for (int i = 0; i < lim; i++) {
		arr[i] = wl.getWsdpList().get(i);
	} */
	%>
	<!-- Navigation-->
	<nav class="navbar navbar-light bg-light static-top">
		<div class="container">
			<a class="navbar-brand" href="Main_0427.jsp" id="brand"><img
				src="../UI/UI/logo_MMN(2).PNG" width="100px"></a> <a
				class="btn btn-primary" href="Login2.html" id="loginasdf"
				style="display:<%=userID != null ? "none" : "block"%>">로그인</a>
			<button type="button" id="watchlist_button"
				style="display:<%=userID == null ? "none" : "block"%>"
				onclick="sendRequest2()">
				<img src="../UI/UI/watchlist_active.png" height="50px">
			</button>
			<a class="btn btn-primary" href="SignIn2.html" id="signupasdf"
				style="display:<%=userID != null ? "none" : "block"%>">회원가입</a>

			<!-- 유저 이미지 파일 src DB에서 가져와서 넣어줘야 해요 -->
			<div id="profile"
				style="display:<%=userID == null ? "none" : "block"%>">
				<img src="http://192.168.250.44<%=db.getUserImagePath(userID)%>"
					id="profile_photo">
			</div>
		</div>
	</nav>

	<!-- <button id="show">팝업열기</button> -->
	<section>
		<div class="background">
			<div class="window">

	<button id="close">
					<img src="../UI/UI/close1.png" class="close" width="30px"
						height="30px">
				</button>
				
			<!--여기에 관심목록 내용 만들어져서 들어감 -->
				<div class="watchlist_popup" id="watchlist_popup">
				</div>
			</div>
		</div>

  
  
  
  
  <header class="masthead">
    <div class="container position-relative">
      <div class="row justify-content-center">
        <div class="col-xl-6">
          <div class="text-center text-white">
            <!-- Page heading-->
            <h1 class="mb-5" style="font-family: 'Gaegu', cursive; font-size: 70px">오늘 뭐 뭇노?</h1>
            <!-- Signup form-->
            <!-- * * * * * * * * * * * * * * *-->
            <!-- * * SB Forms Contact Form * *-->
            <!-- * * * * * * * * * * * * * * *-->
            <!-- This form is pre-integrated with SB Forms.-->
            <!-- To make this form functional, sign up at-->
            <!-- https://startbootstrap.com/solution/contact-forms-->
            <!-- to get an API token!-->
            <form class="form-subscribe" id="contactForm" data-sb-form-api-token="API_TOKEN">
              <!-- Email address input-->
              <div class="row">
                <div class="col">
                  <input class="form-control form-control-lg" id="search" type="text" placeholder="태그 또는 메뉴 검색" onkeyup="sendRequestTag(); sendRequestStore();" onfocus="window_open()" onblur="window_close()" autocomplete="off" />
                  <!-- <div class="invalid-feedback text-white" data-sb-feedback="emailAddress:required">Email Address is required.</div>
                                        <div class="invalid-feedback text-white" data-sb-feedback="emailAddress:email">Email Address Email is not valid.</div> -->
                </div>
                <div class="col-auto">
                  <!-- <button class="btn btn-primary btn-lg disabled" id="submitButton" type="submit">검색</button> -->
                  <button class="search_btn" id="search_btn">검색</button>
                  </div>
                   	<div id="search_window">
                      <div id="search_tag">
                        <div class="search_title" style="font-family: 'Gaegu', cursive;">태그</div>
                        <div id="tagInfo"></div>
                      </div><hr>
                      <div id="search_store">
                        <div class="search_title" style="font-family: 'Gaegu', cursive;">가게</div>
                        <div id="storeInfo"></div>
                      </div>
                    </div>
              </div>
              
              <!-- 여기 두 줄 지우면 검색 버튼이 비활성화 되어버림 -->
              <div class="d-none" id="submitSuccessMessage"><div class="text-center mb-3"></div></div>
              <div class="d-none" id="submitErrorMessage"></div>
              <!-- 여기 두 줄 지우면 검색 버튼이 비활성화 되어버림 -->
              
            </form>
          </div>
        </div>
      </div>
    </div>
  </header>


	<%
/* 		 String userID = (String)session.getAttribute("memberID"); 
	
		 System.out.println("Main_0414.jsp userID:"+userID);

		DB_Conn db = new DB_Conn();  */
	
	%>

  <!-- 태그 부분 -->
  <section class="features-icons bg-light text-center">
    <div id="tag_area">
      <div id="titleasdf">#태그</div>
      <% 
      	int lim = Math.min(15, tdList.size());
      	for(int i=0;i<lim;i++){
      %>
      <button class="bttn-material-flat bttn-md bttn-primary"><a href = "TagPage_0427.jsp?tagID=<%= tdList.get(i).getTagId() %>" onclick="goTop()" class="a">#<%= tdList.get(i).getTagName() %></a></button>
      
      <%	
      }
      %>
    </div>
  </section>


  <!-- 태그 리스트 부분 -->
  
  <article>
  
  <div id="sec1" class="sec">
  <%
  	lim = Math.min(10, lim);
  	for(int i=0;i<lim; i++){
  		
  %>
  <section>
    <div class="container">
      <div class="popup-wrap">
        <div class="store_popup">
          <div class="popup-head"><span class="head-title">#<%= tdList.get(i).getTagName() %></span></div>
          <div class="popup-body">
            <div class="body-content">
              <div class="body-contentbox">

                <section id="test" class="test">

				<%
					tagListByTagData tlbt = new tagListByTagData(tdList.get(i).getTagId());
					int lim2 = Math.min(10, tlbt.getTldList().size());
					System.out.println("tlbt: " + tlbt.getTldList().size());
					for(int j=0;j<lim2;j++){
					
				%>

                  <!-- 가게 한 덩이 -->
                  <figure class="storeSet" style="background-image:url(http://192.168.250.44<%=tlbt.getTldList().get(j).getStoreImagePath()%>)">
                    <div class="store_score"><%= tlbt.getTldList().get(j).getAverageRating() %></div>
                    <figcaption>
                      <h3><%= tlbt.getTldList().get(j).getStoreName() %></h3>
                      <p><%=tlbt.getTldList().get(j).getReviewContent() %></p>
                    </figcaption>
                    <a href="Store_0427.jsp?storeCode=<%=tlbt.getTldList().get(j).getStoreCode()%>" onclick="goTop()"></a>
                  </figure>
                  <!-- 가게 한 덩이 -->
				<%
					}
				%>
                </section>
              </div>
            </div>
          </div>
        </div>

      </div>
    </div>
  </section>

<%
  	}
%>
  </div>
  
  </article>
  


  <!-- 슬라이드 CSS 라이브러리 스크립트 -->
  <script src="https://code.jquery.com/jquery-2.2.0.min.js" type="text/javascript"></script>
  <script src="../slick-1.8.1/slick/slick.js" type="text/javascript" charset="utf-8"></script>
  <script type="text/javascript">
    $(document).on('ready', function () {

      $(".test").slick({
        dots: true,
        infinite: true,
        slidesToShow: 4,
        slidesToScroll: 4
      });
    });
  </script>

  <!-- tag javascript -->
  <script>
    $(".hover").mouseleave(
      function () {
        $(this).removeClass("hover");
      }
    );
  </script>
  
   

<script>
		function sendRequestTag(tagID) {
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
					document.getElementById("tagInfo").innerHTML=httpRequest.responseText;
			//		d1.insertAdjacentHTML('afterbegin', '\''+httpRequest.responseText+'\'');
			//		document.getElementById("tagInfo").innerHtml = '<a id="tagInfo" href="TagPage_0427.jsp">dd</a>'//httpRequest.responseText;
				}
			}
			httpRequest = createRequest(); // XMLHttpRequest 객체를 생성함.
			httpRequest.onreadystatechange = receiveResponse; // XMLHttpRequest 객체의 현재
																// 상태를 파악함.
			// GET 방식의 비동기식 요청으로 Http 요청을 생성함.
			httpRequest.open("POST", "searchTag.jsp", true);
			httpRequest.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");
			var query = document.getElementById('search').value;
			if(query=='')query='ghp_t75CmxWfvccKn9S8UkAR0AqEPHguza04jL2';
			httpRequest.send("query="+query); // Http 요청을 보냄.
			}
		</script>
		
		<script>
		function sendRequestStore(storeCode) {
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
					document.getElementById("storeInfo").innerHTML = httpRequest.responseText;
					
				}
			}
			httpRequest = createRequest(); // XMLHttpRequest 객체를 생성함.
			httpRequest.onreadystatechange = receiveResponse; // XMLHttpRequest 객체의 현재
																// 상태를 파악함.
			// GET 방식의 비동기식 요청으로 Http 요청을 생성함.
			httpRequest.open("POST", "searchStore.jsp", true);
			httpRequest.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");
			var query = document.getElementById('search').value;
			if(query=='')query='ghp_t75CmxWfvccKn9S8UkAR0AqEPHguza04jL2';
			httpRequest.send("query="+query); // Http 요청을 보냄.
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
				document.getElementById("watchlist_popup").innerHTML = httpRequest.responseText;
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
			httpRequest.open("POST", "watchlistAddOrDelete2.jsp", true);
			httpRequest.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");
			httpRequest.send("userID=<%=userID%>&storeCode="+sc); // Http 요청을 보냄.
			}
		</script>
		<script>
var count = 0;

if(count == 0){
	var addContent = document.getElementById("sec1").innerHTML;
      $('article').append(addContent);
}

//스크롤 바닥 감지
window.parent.onscroll = function(e) {
	
	if(count == 3)
		return;
	
  //추가되는 임시 콘텐츠
  //window height + window scrollY 값이 document height보다 클 경우,
  if((window.parent.innerHeight + window.parent.scrollY) >= document.body.offsetHeight) {
  	//실행할 로직 (콘텐츠 추가)
      count++;
  	if(count == 1)
  		return;
      var addContent;
      
      addContent = document.getElementById("sec"+count).innerHTML;

      //article에 추가되는 콘텐츠를 append
      $('article').append(addContent);
  }
};

function goTop(){
	parent.window.scroll(0,0);
}

</script>

<script>

//검색창에 포커스 있을 때 검색결과창 보이게 함
function window_open() {
var r_window = document.getElementById('search_window');

	r_window.style.display ="block";
}

//검색창에 포커스 없을 때 검색결과창 닫기
function window_close() {
	var r_window = document.getElementById('search_window');
	var query = document.getElementById('search').value;

	r_window.style.display ="none";
	
	//근데 검색 결과가 있으면 검색결과창 유지-> 키워드 클릭으로 페이지 이동 가능하게
	if(query!=='') {
		r_window.style.display ="block";
	}
}
</script>

  <script>
    function show() {
      document.querySelector(".background").className = "background show";
    }

    function close() {
      document.querySelector(".background").className = "background";
    }

    document.querySelector("#watchlist_button").addEventListener("click", show);
    document.querySelector("#close").addEventListener("click", close);
  </script>

  <!-- template 라이브러리 -->
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
  <script src="https://cdn.startbootstrap.com/sb-forms-latest.js"></script>
  
   <script type="text/javascript" src="../js/header.js"></script>

            <script type="text/javascript" src="../js/keepImg_star.js"></script>    


</body>

</html>