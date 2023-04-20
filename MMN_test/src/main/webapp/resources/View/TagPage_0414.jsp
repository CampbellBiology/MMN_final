<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@page import="DB.*" %>    
<%@page import="java.util.*" %>    
<%@page import="DataClass.*" %>    
    
<!Doctype html>
<html lang="ko">

<head>
    <meta charset="UTF-8">
    <title>MMN-태그페이지</title>
    <link rel="stylesheet" href="../CSS/style_TagPage_0414.css">
 <script src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
    
    <%
		String userID = "aabb";
    	int tagID = 1;
    	DB_Conn db = new DB_Conn();
    	ArrayList<storeByTagDataPrint> list = db.getStoreListByTag(tagID, userID);
    	int lim = Math.min(10, list.size());
    %>
</head>

<body>
    <main>
        <div id="header">
            <div id="headerImage">
                <div id="headerTitle">태그 제목 동적으로 받아오기</div>
            </div>
        </div>
        
        <article>
        
        
        </article>
        
 <div id="art1" class = "art">
<%
		for(int i=1;i<=Math.min(4, lim);i++){
			int storeCode = list.get(i-1).getStoreCode();
%>
       
        <!-- 태그리스트 1묶음 -->
        <div id="tagList<%=i%>" class="taglist">
            <div id="store_photo<%=i%>" class="store_photo">
                <img src="../UI/storeImg/<%=i%>.jpg" class="store_img">
            </div>
            <div id="store_info<%=i%>" class="store_info">
                <div id="store_details<%=i%>" class="store_details">
                    <div class="first_row">
                        <div class="index"><%=i%>.</div>
                        <div class="store_name"><%=list.get(i-1).getStoreName()%></div>
                    </div>
                    <div class="second_row">
                        <div class="score"><%=list.get(i-1).getAverageRating()%></div>
                        <div class="store_category"><%=list.get(i-1).getCateName()%></div>
                    </div>
                    <div class="store_addr"><%=list.get(i-1).getAddr()%></div>
                    <div class="watchlist_title">함 무볼까</div>
                </div>
                <div class="store_keep"><img src="<%=list.get(i-1).isWatchlist() == true?"https://raw.githubusercontent.com/CampbellBiology/MMN2/master/MMN_test/src/main/webapp/resources/UI/UI/keep_btn_sel.png"
            		: "https://raw.githubusercontent.com/CampbellBiology/MMN2/master/MMN_test/src/main/webapp/resources/UI/UI/keep_btn.png" %>" id="keepImg<%=i%>" onclick="sendRequest(<%=storeCode%>); keepClick(<%=i%>)" onmouseover="onHover(<%=i%>)" onmouseout="offHover(<%=i%>)" width="100px"></div>
                <div class="review">
                    <div class="profile"><img src="../UI/profile/asdf.jpg" id="profile_photo"></div>
                    <div class="content">
                        <h4><%=list.get(i-1).getNickName() %></h4>
                        <p><%=list.get(i-1).getRd().getContents() %></p>
                    </div>
                </div>
                <div class="more_info"> >더 알아보기 </div>
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
            <div id="store_photo<%=i%>" class="store_photo">
                <img src="../UI/storeImg/<%=i%>.jpg" class="store_img">
            </div>
            <div id="store_info<%=i%>" class="store_info">
                <div id="store_details<%=i%>" class="store_details">
                    <div class="first_row">
                        <div class="index"><%=i%>.</div>
                        <div class="store_name"><%=list.get(i-1).getStoreName()%></div>
                    </div>
                    <div class="second_row">
                        <div class="score"><%=list.get(i-1).getAverageRating()%></div>
                        <div class="store_category"><%=list.get(i-1).getCateName()%></div>
                    </div>
                    <div class="store_addr"><%=list.get(i-1).getAddr()%></div>
                    <div class="watchlist_title">함 무볼까</div>
                </div>
                <div class="store_keep"><img src="<%=list.get(i-1).isWatchlist() == true?"https://raw.githubusercontent.com/CampbellBiology/MMN2/master/MMN_test/src/main/webapp/resources/UI/UI/keep_btn_sel.png"
            		: "https://raw.githubusercontent.com/CampbellBiology/MMN2/master/MMN_test/src/main/webapp/resources/UI/UI/keep_btn.png" %>" id="keepImg<%=i%>" onclick="sendRequest(<%=storeCode%>); keepClick(<%=i%>)" onmouseover="onHover(<%=i%>)" onmouseout="offHover(<%=i%>)" width="100px"></div>
                <div class="review">
                    <div class="profile"><img src="../UI/profile/asdf.jpg" id="profile_photo"></div>
                    <div class="content">
                        <h4><%=list.get(i-1).getNickName() %></h4>
                        <p><%=list.get(i-1).getRd().getContents() %></p>
                    </div>
                </div>
                <div class="more_info"> >더 알아보기 </div>
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
            <div id="store_photo<%=i%>" class="store_photo">
                <img src="../UI/storeImg/<%=i%>.jpg" class="store_img">
            </div>
            <div id="store_info<%=i%>" class="store_info">
                <div id="store_details<%=i%>" class="store_details">
                    <div class="first_row">
                        <div class="index"><%=i%>.</div>
                        <div class="store_name"><%=list.get(i-1).getStoreName()%></div>
                    </div>
                    <div class="second_row">
                        <div class="score"><%=list.get(i-1).getAverageRating()%></div>
                        <div class="store_category"><%=list.get(i-1).getCateName()%></div>
                    </div>
                    <div class="store_addr"><%=list.get(i-1).getAddr()%></div>
                    <div class="watchlist_title">함 무볼까</div>
                </div>
                <div class="store_keep"><img src="<%=list.get(i-1).isWatchlist() == true?"https://raw.githubusercontent.com/CampbellBiology/MMN2/master/MMN_test/src/main/webapp/resources/UI/UI/keep_btn_sel.png"
            		: "https://raw.githubusercontent.com/CampbellBiology/MMN2/master/MMN_test/src/main/webapp/resources/UI/UI/keep_btn.png" %>" id="keepImg<%=i%>" onclick="sendRequest(<%=storeCode%>); keepClick(<%=i%>)" onmouseover="onHover(<%=i%>)" onmouseout="offHover(<%=i%>)" width="100px"></div>
                <div class="review">
                    <div class="profile"><img src="../UI/profile/asdf.jpg" id="profile_photo"></div>
                    <div class="content">
                        <h4><%=list.get(i-1).getNickName() %></h4>
                        <p><%=list.get(i-1).getRd().getContents() %></p>
                    </div>
                </div>
                <div class="more_info"> >더 알아보기 </div>
            </div>
        </div>
        
       
        <!-- 태그리스트 1묶음 -->
        <%
		}
        %>
 </div>
 
    </main>
    
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
		httpRequest.send("userId=<%=userID%>&storeCode="+sc); // Http 요청을 보냄.
		}
    </script>
   
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
      count++;
  	if(count == 1)
  		return;
      var addContent;
      
      addContent = document.getElementById("art"+count).innerHTML;

      //article에 추가되는 콘텐츠를 append
      $('article').append(addContent);
  }
};


</script>
    
    
	<script type="text/javascript" src="../js/project03.js"></script>
    
</body>

</html>