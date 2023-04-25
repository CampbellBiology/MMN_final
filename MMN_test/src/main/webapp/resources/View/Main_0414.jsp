<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <%@page import="DataClass.*" %>
    <%@page import="DB.*" %>
    <%@page import="java.util.*" %>
    
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
  <link href="../CSS/storeDetail.css" rel="stylesheet" />
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
  <header class="masthead">
    <div class="container position-relative">
      <div class="row justify-content-center">
        <div class="col-xl-6">
          <div class="text-center text-white">
            <!-- Page heading-->
            <h1 class="mb-5">오늘 뭐 뭇노?</h1>
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
                  <input class="form-control form-control-lg" id="search" type="text" placeholder="태그 또는 메뉴 검색" onkeyup="sendRequestTag(); sendRequestStore();" />
                  <!-- <div class="invalid-feedback text-white" data-sb-feedback="emailAddress:required">Email Address is required.</div>
                                        <div class="invalid-feedback text-white" data-sb-feedback="emailAddress:email">Email Address Email is not valid.</div> -->
                </div>
                <div class="col-auto">
                  <!-- <button class="btn btn-primary btn-lg disabled" id="submitButton" type="submit">검색</button> -->
                  <button class="search_btn" id="search_btn">검색</button>
                  </div>
                   	<div id="search_window">
                      <div id="search_tag">
                        <div class="search_title">태그</div>
                        <div id="tagInfo"></div>
                      </div><hr>
                      <div id="search_store">
                        <div class="search_title">가게</div>
                        <div><a id="storeInfo"></a></div>
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
		String userID = loginData.userID;
	
		System.out.println("Main_0414.jsp userID:"+userID);
	
		DB_Conn db = new DB_Conn();
		ArrayList <tagData> tdList = db.getTagDataList();
		Collections.sort(tdList);
	%>

  <!-- 태그 부분 -->
  <section class="features-icons bg-light text-center">
    <div id="tag_area">
      <div id="titleasdf">#태그</div>
      <% 
      	int lim = Math.min(15, tdList.size());
      	for(int i=0;i<lim;i++){
      %>
      <button class="bttn-material-flat bttn-md bttn-primary"><a href = "TagPage_0414.jsp?tagID=<%= tdList.get(i).getTagId() %>" onclick="goTop()">#<%= tdList.get(i).getTagName() %></a></button>
      
      <%	
      }
      %>
    </div>
  </section>


  <!-- 태그 리스트 부분 -->
  
  <article>
  
  </article>
  
  <div id="sec1" class="sec">
  <%
  	lim = Math.min(10, lim);
  	for(int i=0;i<Math.min(4,lim); i++){
  		
  %>
  <section>
    <div class="container">
      <div class="popup-wrap">
        <div class="popup">
          <div class="popup-head"><span class="head-title">#<%= tdList.get(i).getTagName() %></span></div>
          <div class="popup-body">
            <div class="body-content">
              <div class="body-contentbox">

                <section id="test" class="test">

				<%
					tagListByTagData tlbt = new tagListByTagData(tdList.get(i).getTagId());
					int lim2 = Math.min(10, tlbt.getTldList().size());
					for(int j=0;j<lim2;j++){
					
				%>

                  <!-- 가게 한 덩이 -->
                  <figure class="storeSet" style="background-image:url(<%=tlbt.getTldList().get(j).getStoreImagePath()%>)">
                    <div class="store_score"><%= tlbt.getTldList().get(j).getAverageRating() %></div>
                    <figcaption>
                      <h3><%= tlbt.getTldList().get(j).getStoreName() %></h3>
                      <p><%=tlbt.getTldList().get(j).getReviewContent() %></p>
                    </figcaption>
                    <a href="Store_0424.jsp?storeCode=<%=tlbt.getTldList().get(j).getStoreCode()%>" onclick="goTop()"></a>
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

  <div id="sec2" class="sec"> 
<%
  	for(int i=4;i<Math.min(7,lim); i++){
  		
  %>
  <section>
    <div class="container">
      <div class="popup-wrap">
        <div class="popup">
          <div class="popup-head"><span class="head-title">#<%= tdList.get(i).getTagName() %></span></div>
          <div class="popup-body">
            <div class="body-content">
              <div class="body-contentbox">

                <section id="test" class="test">

				<%
					tagListByTagData tlbt = new tagListByTagData(tdList.get(i).getTagId());
					int lim2 = Math.min(10, tlbt.getTldList().size());
					for(int j=0;j<lim2;j++){
					
				%>

                  <!-- 가게 한 덩이 -->
                  <figure class="storeSet" style="background-image:url(<%=tlbt.getTldList().get(j).getStoreImagePath()%>)">
                    <div class="store_score"><%= tlbt.getTldList().get(j).getAverageRating() %></div>
                    <figcaption>
                      <h3><%= tlbt.getTldList().get(j).getStoreName() %></h3>
                      <p><%=tlbt.getTldList().get(j).getReviewContent() %></p>
                    </figcaption>
                    <a href="Store_0424.jsp?storeCode=<%=tlbt.getTldList().get(j).getStoreCode()%>" onclick="goTop()"></a>
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

  <div id="sec3" class="sec">
<%
  	for(int i=7;i<Math.min(10,lim); i++){
  		
  %>
  <section>
    <div class="container">
      <div class="popup-wrap">
        <div class="popup">
          <div class="popup-head"><span class="head-title">#<%= tdList.get(i).getTagName() %></span></div>
          <div class="popup-body">
            <div class="body-content">
              <div class="body-contentbox">

                <section id="test" class="test">

				<%
					tagListByTagData tlbt = new tagListByTagData(tdList.get(i).getTagId());
					int lim2 = Math.min(10, tlbt.getTldList().size());
					for(int j=0;j<lim2;j++){
					
				%>

                  <!-- 가게 한 덩이 -->
                  <figure class="storeSet" style="background-image:url(<%=tlbt.getTldList().get(j).getStoreImagePath()%>)">
                    <div class="store_score"><%= tlbt.getTldList().get(j).getAverageRating() %></div>
                    <figcaption>
                      <h3><%= tlbt.getTldList().get(j).getStoreName() %></h3>
                      <p><%=tlbt.getTldList().get(j).getReviewContent() %></p>
                    </figcaption>
                    <a href="Store_0424.jsp?storeCode=<%=tlbt.getTldList().get(j).getStoreCode()%>" onclick="goTop()"></a>
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
			//		document.getElementById("tagInfo").innerHtml = '<a id="tagInfo" href="TagPage_0414.jsp">dd</a>'//httpRequest.responseText;
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
var count = 0;

if(count == 0){
	var addContent = document.getElementById("sec1").innerHTML;
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
      
      addContent = document.getElementById("sec"+count).innerHTML;

      //article에 추가되는 콘텐츠를 append
      $('article').append(addContent);
  }
};

function goTop(){
	parent.window.scroll(0,0);
}

</script>

  <!-- template 라이브러리 -->
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
  <script src="js/scripts.js"></script>
  <script src="https://cdn.startbootstrap.com/sb-forms-latest.js"></script>


</body>

</html>