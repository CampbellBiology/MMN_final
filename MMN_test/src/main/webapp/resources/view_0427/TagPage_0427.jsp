<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@page import="DB.*" %>    
<%@page import="java.util.*" %>    
<%@page import="DataClass.*" %>    
    <%@page import="Controller.*" %>
    
<!Doctype html>
<html lang="ko">

<head>
    <meta charset="UTF-8">
    <title>MMN-태그페이지</title>
    <link rel="stylesheet" href="../CSS/style_TagPage_0414.css">
      <link href="../CSS/main_0427.css" rel="stylesheet"/>
      <link href="../CSS/template.css" rel="stylesheet" />     
 <script src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
 
 <%
	DB_Conn db = new DB_Conn();
	String userID = (String) session.getAttribute("memberID");
	System.out.println("tagPage_0427.jsp userID:" + userID);
	watchlist wl = new watchlist(userID);
	watchlistStoreDataPrint[] arr = new watchlistStoreDataPrint[10];
	ArrayList <tagData> tdList = db.getTagDataList();
	Collections.sort(tdList);

	/* int lim = Math.min(wl.getWsdpList().size(), 10);
 
	for (int i = 0; i < lim; i++) {
		arr[i] = wl.getWsdpList().get(i);
	} */
	String null_tagID = request.getParameter("tagID");
	int tagID = Integer.parseInt(null_tagID==null?"1":null_tagID);
	//TagPage_0427.jsp?tagID=<%= tdList.get(i).getTagId()
	session.setAttribute("urlPage", "/resources/view_0427/TagPage_0427.jsp?tagID=" + tagID);
	%>
	<!-- Navigation-->
	<nav class="navbar navbar-light bg-light static-top">
		<div class="container">
			<a class="navbar-brand" href="Main_0427.jsp" id="brand">
			<img src="https://raw.githubusercontent.com/CampbellBiology/MMN2/master/MMN_test/src/main/webapp/resources/UI/UI/banner3_50px.png" height="50px"></a> 
				
			<a class="btn btn-primary" href="Login2.html" id="loginasdf"
				style="display:<%=userID != null ? "none" : "block"%>">로그인</a>
			<a class="btn btn-primary" href="SignIn2.html" id="signupasdf" style="display:<%=userID != null ? "none" : "block"%>">회원가입</a>
				
			<button type="button" id="watchlist_button"
				style="display:<%=userID == null ? "none" : "block"%>"
				onclick="sendRequest2()">
				<img src="../UI/UI/watchlist_active.png" height="50px">
			</button>

			<form method="post" action ="sessionOut">
				<button type="submit" class="btn btn-primary" id="logoutasdf" style="display:<%=userID == null ? "none" : "block"%>">로그아웃</button>
			</form>
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

  
    
    <%
/*     	String userID = (String)session.getAttribute("memberID"); */
    	
    	System.out.println("TagPage_0414.jsp userID:"+userID);
    	
    	System.out.println("TagPage_0414.jsp tagID : "+request.getParameter("tagID"));
    	
/*     	DB_Conn db = new DB_Conn(); */
    	
    	if(null_tagID != null){
    		db.updateTagView(tagID);
    	}
    	
    	ArrayList<storeByTagDataPrint> list = db.getStoreListByTag(tagID, userID);
    	int lim = Math.min(10, list.size());
    %>
</head>

<body>
    <main>
        <div id="header">
            <div id="headerImage">
                <div id="headerTitle"><%= db.getTagName(tagID) %></div>
            </div>
        </div>
        
        <article>
        
        
        </article>
        
 <div id="art1" class = "art">
<%
		for(int i=1;i<=Math.min(4, lim);i++){
			int storeCode = list.get(i-1).getStoreCode();
			
			System.out.println("TagPage_0414 storeImagePath : " + list.get(i-1).getStoreImgPath());
			System.out.println("TagPage_0414 userImagePath ID : " + list.get(i-1).getRd().getUserId());
			System.out.println("TagPage_0414 userImagePath : " + db.getUserImagePath(list.get(i-1).getRd().getUserId()));
%>
       
        <!-- 태그리스트 1묶음 -->
        <div id="tagList<%=i%>" class="taglist">
            <div id="tag_store_photo<%=i%>" class="tag_store_photo"><a href="Store_0427.jsp?storeCode=<%=storeCode%>">
                <img src="http://192.168.250.44<%=list.get(i-1).getStoreImgPath()%>" class="store_img"></a>
            </div>
            <div id="store_info<%=i%>" class="store_info">
                <div id="store_details<%=i%>" class="store_details">
                    <div class="first_row">
                        <div class="index"><%=i%>.</div>
                        <div class="store_name"><a href="Store_0427.jsp?storeCode=<%=storeCode%>"><%=list.get(i-1).getStoreName()%></a></div>
                    </div>
                    <div class="second_row">
                        <div class="score"><%=list.get(i-1).getAverageRating()%></div>
                        <div class="store_category"><%=list.get(i-1).getCateName()%></div>
                    </div>
                    <div class="store_addr"><%=list.get(i-1).getAddr()%></div>
                    <div class="watchlist_title">함 무볼까</div>
                </div>
                <div class="tag_store_keep"><img src="<%=db.haveWatchlist(userID, storeCode) == true?"https://raw.githubusercontent.com/CampbellBiology/MMN2/master/MMN_test/src/main/webapp/resources/UI/UI/keep_btn_sel.png"
            		: "https://raw.githubusercontent.com/CampbellBiology/MMN2/master/MMN_test/src/main/webapp/resources/UI/UI/keep_btn.png" %>" id="tag_keepImg<%=i%>" onclick="keepClick3(<%=i%>); sendRequest3(<%=storeCode%>, <%=i%>);" onmouseover="onHover3(<%=i%>)" onmouseout="offHover3(<%=i%>)" width="100px"></div>
                <div class="review">
                    <div class="profile"><img src="http://192.168.250.44<%=db.getUserImagePath(list.get(i-1).getRd().getUserId())%>" style="background:no-repeat; background-size:cover; width:90px; height:90px;" id="profile_photo"></div>
                    <div class="content">
                        <h4><%=db.getNickname(list.get(i-1).getRd().getUserId())%></h4>
                        <p><%=list.get(i-1).getRd().getContents()%></p>
                    </div>
                </div>
                <div class="more_info"><a href="Store_0427.jsp?storeCode=<%=storeCode%>"> >더 알아보기 </a></div>
            </div>
        </div>
        
       
        <!-- 태그리스트 1묶음 -->
        <%
		}
        %>
 </div>
 
 <div id="art2" class = "art">
<%
		for(int i=5;i<=Math.min(lim,7);i++){
			int storeCode = list.get(i-1).getStoreCode();
%>
       
        <!-- 태그리스트 1묶음 -->
        <div id="tagList<%=i%>" class="taglist">
            <div id="tag_store_photo<%=i%>" class="tag_store_photo"><a href="Store_0427.jsp?storeCode=<%=storeCode%>">
                <img src="http://192.168.250.44<%=list.get(i-1).getStoreImgPath()%>" class="store_img"></a>
            </div>
            <div id="store_info<%=i%>" class="store_info">
                <div id="store_details<%=i%>" class="store_details">
                    <div class="first_row">
                        <div class="index"><%=i%>.</div>
                        <div class="store_name"><a href="Store_0427.jsp?storeCode=<%=storeCode%>"><%=list.get(i-1).getStoreName()%></a></div>
                    </div>
                    <div class="second_row">
                        <div class="score"><%=list.get(i-1).getAverageRating()%></div>
                        <div class="store_category"><%=list.get(i-1).getCateName()%></div>
                    </div>
                    <div class="store_addr"><%=list.get(i-1).getAddr()%></div>
                    <div class="watchlist_title">함 무볼까</div>
                </div>
                <div class="tag_store_keep"><img src="<%=db.haveWatchlist(userID, storeCode) == true?"https://raw.githubusercontent.com/CampbellBiology/MMN2/master/MMN_test/src/main/webapp/resources/UI/UI/keep_btn_sel.png"
            		: "https://raw.githubusercontent.com/CampbellBiology/MMN2/master/MMN_test/src/main/webapp/resources/UI/UI/keep_btn.png" %>" id="tag_keepImg<%=i%>" onclick="keepClick3(<%=i%>); sendRequest3(<%=storeCode%>, <%=i%>);" onmouseover="onHover3(<%=i%>)" onmouseout="offHover3(<%=i%>)" width="100px"></div>
                <div class="review">
                    <div class="profile"><img src="http://192.168.250.44<%=db.getUserImagePath(list.get(i-1).getRd().getUserId())%>" style="background:no-repeat; background-size:cover; width:90px; height:90px;" id="profile_photo"></div>
                    <div class="content">
                        <h4><%=db.getNickname(list.get(i-1).getRd().getUserId())%></h4>
                        <p><%=list.get(i-1).getRd().getContents() %></p>
                    </div>
                </div>
                <div class="more_info"><a href="Store_0427.jsp?storeCode=<%=storeCode%>"> >더 알아보기 </a></div>
            </div>
        </div>
        
       
        <!-- 태그리스트 1묶음 -->
        <%
		}
        %>
 </div>
 
 <div id="art3" class = "art">
<%
		for(int i=8;i<=Math.min(10, lim);i++){
			int storeCode = list.get(i-1).getStoreCode();
%>
       
        <!-- 태그리스트 1묶음 -->
        <div id="tagList<%=i%>" class="taglist">
            <div id="tag_store_photo<%=i%>" class="tag_store_photo"><a href="Store_0427.jsp?storeCode=<%=storeCode%>">
                <img src="http://192.168.250.44<%=list.get(i-1).getStoreImgPath()%>" class="store_img"></a>
            </div>
            <div id="store_info<%=i%>" class="store_info">
                <div id="store_details<%=i%>" class="store_details">
                    <div class="first_row">
                        <div class="index"><%=i%>.</div>
                        <div class="store_name"><a href="Store_0427.jsp?storeCode=<%=storeCode%>"><%=list.get(i-1).getStoreName()%></a></div>
                    </div>
                    <div class="second_row">
                        <div class="score"><%=list.get(i-1).getAverageRating()%></div>
                        <div class="store_category"><%=list.get(i-1).getCateName()%></div>
                    </div>
                    <div class="store_addr"><%=list.get(i-1).getAddr()%></div>
                    <div class="watchlist_title">함 무볼까</div>
                </div>
                <div class="tag_store_keep"><img src="<%=db.haveWatchlist(userID, storeCode) == true?"https://raw.githubusercontent.com/CampbellBiology/MMN2/master/MMN_test/src/main/webapp/resources/UI/UI/keep_btn_sel.png"
            		: "https://raw.githubusercontent.com/CampbellBiology/MMN2/master/MMN_test/src/main/webapp/resources/UI/UI/keep_btn.png" %>" id="tag_keepImg<%=i%>" onclick="keepClick3(<%=i%>); sendRequest3(<%=storeCode%>, <%=i%>);" onmouseover="onHover3(<%=i%>)" onmouseout="offHover3(<%=i%>)" width="100px"></div>
                <div class="review">
                    <div class="profile"><img src="http://192.168.250.44<%=db.getUserImagePath(list.get(i-1).getRd().getUserId())%>" style="background:no-repeat; background-size:cover; width:90px; height:90px;"  id="profile_photo"></div>
                    <div class="content">
                        <h4><%=db.getNickname(list.get(i-1).getRd().getUserId())%></h4>
                        <p><%=list.get(i-1).getRd().getContents() %></p>
                    </div>
                </div>
                <div class="more_info"><a href="Store_0427.jsp?storeCode=<%=storeCode%>"> >더 알아보기 </a></div>
            </div>
        </div>
        
       
        <!-- 태그리스트 1묶음 -->
        <%
		}
        %>
 </div>
 
    </main>
   
  
    <script>
var count = 0;

if(count == 0){
	var addContent = document.getElementById("art1").innerHTML;

      $('article').append(addContent);
}

//스크롤 바닥 감지
window.onscroll = function(e) {
	
	if(count == 3)
		return;
	
  //추가되는 임시 콘텐츠
  //window height + window scrollY 값이 document height보다 클 경우,
  if((window.innerHeight + window.scrollY) >= document.body.offsetHeight) {
  	//실행할 로직 (콘텐츠 추가)
    if(count==0)
    	count=2;
    else count++;
  	
      var addContent;
      
      addContent = document.getElementById("art"+count).innerHTML;

      //article에 추가되는 콘텐츠를 append
      $('article').append(addContent);
  }
};


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
		function sendRequest3(sc, ii) {
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
			httpRequest.open("POST", "watchlistAddOrDelete.jsp", true);
			httpRequest.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");
			var doc = document.getElementById("tag_keepImg"+ii);
			var src = doc.src;

			var arr = src.split("/");
			httpRequest.send("userID=<%=userID%>&storeCode="+sc+"&keepType="+arr[arr.length - 1]); // Http 요청을 보냄.
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
	<script type="text/javascript" src="../js/keepImg_3.js"></script>
	<script type="text/javascript" src="../js/header.js"></script> 	 
	<script type="text/javascript" src="../js/keepImg_star.js"></script>
	          
</body>

</html>