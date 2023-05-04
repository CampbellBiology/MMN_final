<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@page import="DB.*"%>
<%@page import="DataClass.*"%>
<%@page import="java.util.*"%>
<%@page import="Controller.*"%>
<!Doctype html>
<html lang="ko">

<head>
<meta charset="UTF-8">
<title>MMN-가게</title>

<link rel="stylesheet" href="../CSS/style_store_store_info.css">
<link rel="stylesheet" href="../CSS/style_store_create_review.css">
<link rel="stylesheet" href="../CSS/style_store_store_show_review.css">
<link href="../CSS/template.css" rel="stylesheet" />
<link href="../CSS/main_0427.css" rel="stylesheet" />

<link rel="stylesheet" type="text/css" href="../slick-1.8.1/slick/slick.css">
<link rel="stylesheet" type="text/css" href="../slick-1.8.1/slick/slick-theme.css">
<link rel="stylesheet" type="text/css" href="../CSS/style_ImagePopUp_0419.css">

<!-- tag autocomplete를 위한 라이브러리 -->
<link rel="stylesheet" href="../CSS/style_TagInput.css">
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
</head>

<body>


	<%
	DB_Conn db = new DB_Conn();
	String userID = (String) session.getAttribute("memberID");
	System.out.println("Main_Main.jsp userID:" + userID);
	watchlist wl = new watchlist(userID);
	watchlistStoreDataPrint[] arr = new watchlistStoreDataPrint[10];
	ArrayList<tagData> tdList = db.getTagDataList();
	Collections.sort(tdList);

	/* int lim = Math.min(wl.getWsdpList().size(), 10);

	for (int i = 0; i < lim; i++) {
		arr[i] = wl.getWsdpList().get(i);
	} */
	%>
	<!-- Navigation-->
	<nav class="navbar navbar-light bg-light static-top">
		<div class="container">
			<a class="navbar-brand" href="Main_0427.jsp;" id="brand"><img
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
				<div class="watchlist_popup" id="watchlist_popup"></div>
			</div>
		</div>
	</section>

	<%
	DB_Conn _db = new DB_Conn();
	_db.constructStoreMap();
	_db.constructRtdCnt_map();
	ArrayList<storeData> storeList;
	ArrayList<rtdCntData> rtdCntList;
	storeList = _db.storefindAll();
	rtdCntList = _db.rtdCntfindAll();
	System.out.println("size : " + storeList.size());
	int storeCode = Integer.parseInt(request.getParameter("storeCode") == null ? "0" : request.getParameter("storeCode"));
	storeData sd = _db.getStoreData(storeCode);
	String storeImgPath = sd.getStoreImgPath();
	int review_store = sd.getStoreCode();
	_db.constructMenuMap(review_store);
	ArrayList<menuData> list = _db.menufindAll();
	Collections.sort(rtdCntList);
	/* 	String userID = (String)session.getAttribute("memberID"); */
	System.out.println("Store_0427.jsp userID : " + userID);

	ArrayList<reviewData> rdList = _db.getReviewByStoreCode(storeCode);

	boolean flag = _db.haveWatchlist(userID, storeCode);

	String menu_popular = _db.get_menuCount(storeCode);
	%>

	<main>
		<div id="body">
			<div id="store">

				<div id="store_info">
					<div id="store_name"><%=sd.getStoreName()%></div>
					<div id="store_keep">
						<button class="store_keep">
							<img
								src="<%=flag == true
		? "https://raw.githubusercontent.com/CampbellBiology/MMN2/master/MMN_test/src/main/webapp/resources/UI/UI/keep_btn_sel.png"
		: "https://raw.githubusercontent.com/CampbellBiology/MMN2/master/MMN_test/src/main/webapp/resources/UI/UI/keep_btn.png"%>"
								id="keepImg" onclick="keepClick();sendRequest3();"
								onmouseover="onHover()" onmouseout="offHover()">
						</button>
					</div>
					<div id="store_detail">
						<p class="subject">
							평균 평점 : <span class="fromDB-rate"><%=_db.getAverageRating(sd.getStoreCode())%></span>
						</p>
						<p class="subject">
							가게 시작 시간 : <span class="fromDB"><%=sd.getOpenAt()%></span>
						</p>
						<p class="subject">
							가게 마감 시간 : <span class="fromDB"><%=sd.getCloseAt()%></span>
						</p>
						<p class="subject">
							마지막 주문 가능 시간 : <span class="fromDB"><%=(sd.getLastOrder() == null ? "정보 없음" : sd.getLastOrder())%></span>
						</p>
						<p class="subject">
							주차 공간 : <span class="fromDB"><%=(sd.getParking() == null ? "주차 정보 없음" : sd.getParking().equals("1") ? "주차 가능" : "주차 불가")%></span>
						</p>
						<p class="subject">
							휴무일 : <span class="fromDB"><%=(sd.getOffDays() == null ? "정보 없음" : sd.getOffDays())%></span>
						</p>
						<p class="subject">
							브레이크 타임 : <span class="fromDB"><%=(sd.getBreakStart() == null ? "정보 없음" : sd.getBreakStart() + " ~ " + sd.getBreakEnd())%></span>
						</p>
						<p class="subject">
							뭐뭇나 회원이 가장 많이 먹은 음식 : <span class="fromDB-most"><%=menu_popular%></span>
						</p>
						<p class="subject">관련 태그 :</p>
						<div id="related_tag">
							<%
							if (storeCode != 0) {
								for (int i = 0; i < 3; i++) {
									ArrayList<tagData> tag_popular = _db.get_tagCount(1);
							%>
							<div class="tag1">
								<a> <span class="sharp"># </span>
									<div class="tag2"><%=tag_popular.get(i)%></div>
								</a>
							</div>
							<%
							}
							}
							%>
						</div>
					</div>
				</div>

				<div id="store_photo">

					<!-- 큰 이미지 -->
					<div id="mainImage"
						style="background-image:url(http://192.168.250.44<%=sd.getStoreImgPath()%>)">
					</div>

					<!-- 작은 이미지들, 선택하면 큰 이미지가 바뀜 -->
					<div id="box" class="box">
						<div id="color-wrap">
							<div id="colorList"></div>
						</div>
					</div>
				</div>
			</div>


			<!-- 여기서부터 리뷰작성 버튼 누르면 리뷰작성란 나옴 -->
			<div id="review_btn">
				<input type="button" value="↓ 리뷰 작성하러 가기" class="btn_riview" id="show_btn" onclick="show_create_review()">
				<input type="button" value="↑ 닫기" class="btn_riview" id="remove_btn" onclick="clearClick()">
			</div>


			<!-- 여기서부터 리뷰작성란 -->
			<form method="post" id="review_form" action="review"
				enctype="multipart/form-data">
				<div id="create_riview">
					<input name="review_storeCode" value="<%=sd.getStoreCode()%>"
						style="display: none">
					<div id="review_store_name"><%=sd.getStoreName()%></div>
					<input type="text" name="revihttpRequest.sendew_input_id"
						value="<%=userID%>" style="display: none">
					<div id="noname_check">
						<input type="checkbox" name="noname_check">익명으로 작성하기
					</div>

					<div id="review_whatIAte">내가 먹은 메뉴</div>
					<div class="selectBox">
						<select id="menu_select" name="fruits" class="select"
							onchange="select_menu()">
							<!--option disabled selected>fruits 🍊</option>
						<option value="apple">apple</option>
						<option value="orange">orange</option>
						<option value="grape">grape</option>
						<option value="melon">melon</option-->
							<%
							int cnt = 0;
							for (menuData md : list) {
							%>
							<option value="<%=md.getFoodCode()%>"
								<%=cnt == 0 ? "selected" : ""%>>
								<%=md.getFoodName()%></option>
							<%
							cnt++;
							}
							%>
						</select>
						<button type="button" id="x-button" onclick="menu_del()">×</button>
						<!-- 선택한 메뉴리스트를 문자열로 전달하기 위한 input -->
						<input id="menuListView" name="menuListView" style="display: none">
					</div>

					<div id="score_title">평점</div>
					<!-- 평점정보 전달을 위한 input -->
					<input id="score_result" name="score_result" style="display: none">
					<div id="score">
						<div id="score_great" class="score">
							<button type="button" value="great" class="score_btn">억수로
								마싯다</button>
						</div>
						<div id="score_good" class="score">
							<button type="button" value="good" class="score_btn">갠찮드라</button>
						</div>
						<div id="score_bad" class="score">
							<button type="button" value="bad" class="score_btn">영
								파이다</button>
						</div>
					</div>


					<!-- 내가먹은 메뉴 추가하는 부분 -->
					<div id="show_whatIAte">
						<ul id="show_list">
							<!-- <li id="whatiate1" class="whatiate">#족발ㅁㄴㅇㄹ</li>
							<li id="whatiate2" class="whatiate">#해asfㄹ전</li>
							<li id="whatiate3" class="whatiate">#ㅁㅇㄹㅁㄴㅇㄻㄴㅇㄹ</li>
							<li id="whatiate4" class="whatiate">#sdfㅁㄴㅇㄻㄴㅇㄹㄹ</li>
							<li id="whatiate5" class="whatiate">그 외 2개</li>
						-->
							<!-- 메뉴를 3개 이상 선택 시에 보여줄 부분 -->
							<!-- li id="whatiate_add" class="whatiate" style="display: none" -->
						</ul>
					</div>
					<!-- 메뉴, 태그 돌아와 -->

					<!-- 태그 추가하는 부분 -->
					<div id="add_tag_title"> 태그를 입력해주세요. </div>
					<!-- 태그정보 전달을 위한 input -->
					<input id="tagListView" name="tagListView" style="display: none">
					<!-- 태그 입력 경고문 -->
					<div id="add_tag">
						<!-- 
						<div id="create_tag1" class="create_tag">#asdfasdf</div>
						<div id="create_tag2" class="create_tag">#asdfasdf</div>
						<div id="create_tag3" class="create_tag">#asdfdfasdf</div>
						<div id="create_tag4" class="create_tag">#asdfasdf</div>
					 -->
						<ul id="lists_tag"></ul>
						<input type="text" id="id_input_tagName" onkeypress="javascript:show_name(event);" class="tag_input" placeholder="ex.점심특선 (Enter로 입력)">
						<button type="button" id="plus_button" onclick="tag_del()">x</button>
						<span id="warning_msg" style="color: red; display: none"></span>
					</div>

					<div id="review_title">리뷰를 작성해주세요.</div>
					<!-- 자동줄바꿈 등 위해 input text가 아닌 textarea 사용함 -->
					<textarea rows="3" cols=20 wrap="hard" placeholder="최대 4000자"
						name="review_text" class="input_review" maxlength="4000"></textarea>

					<div id="image_info_title">
						이미지 등록 최대 5개 <span class="subtext">(jpg, png)</span>
					</div>
					<!-- 임시 코드 -->
					<!-- 파일찾기에 input 파일이 가려지면서 클릭을 못하게 되어 임시로 위로 빼두었습니다. -->
					<input type="file" id="reviewimg" accept=".jpg, .png"
						onchange="readImg(this);" onclick="clickImg()" multiple>
					<!-- 파일명 전달해주기 위한 input -->
					<input type="text" id="id_imgtext" name="name_imgtext"
						style="display: none">
					<div class="filebox">
						<label for="file">파일찾기</label>
					</div>
					<div id="regImages">
						<!-- 
					<div id="reg_image1" class="reg_images"></div>
					<div id="reg_image2" class="reg_images"></div>
					<div id="reg_image3" class="reg_images"></div>
					<div id="reg_image4" class="reg_images"></div>
					<div id="reg_image5" class="reg_images"></div>
					 -->
					</div>
					<button type="reset" value="toMain" id="review_cancel"
						class="review_button" onclick="clearClick()">취소</button>
					<button type="button" value="submit" id="review_submit"
						class="review_button" onclick="submitClick()">등록하기</button>

					<div id="something"></div>
				</div>
			</form>

			<!-- 여기서부터 리뷰 보여주는 영역 -->
			<div id="show_review">
				<div id="first_line">
					<div id="review_title2">뭐뭇노 회원들의 소중한 리뷰</div>
					<div id="review_sort">
						<%
						//각 리뷰 별 계산하는 함수 불러오기.
						int review_count_All = _db.get_review_count_All(sd.getStoreCode());
						int review_count_great = _db.get_review_count_great(sd.getStoreCode());
						int review_count_good = _db.get_review_count_good(sd.getStoreCode());
						int review_count_bad = _db.get_review_count_bad(sd.getStoreCode());
						%>
						<!-- 리뷰 정렬을 위한 파라미터로 보낼 input -->
						<div id="score_btn2" class="score_btn2-1" onclick="sortAll()">
						전체 (<%=review_count_All%>)
						</div>
						<div id="score_btn2" class="score_btn2-2" onclick="sortGreat()">
							억수로 마싯다 (<%=review_count_great%>)
						</div>
						<div id="score_btn2" class="score_btn2-3" onclick="sortGood()">
							갠찮드라 (<%=review_count_good%>)
						</div>
						<div id="score_btn2" class="score_btn2-4" onclick="sortBad()">
							영 파이다 (<%=review_count_bad%>)
						</div>
					</div>
				</div>
			</div>

			<%
			//리뷰정보를 리스트로 가져오는 함수실행.
			//reviewIndex, contents, regDate, rating, anonymous, photoPath
			//reviewIndex, userId, contents, regDate, rating, anonymous, photoPath
			String strSort = null;
			try {
				
				//(리뷰정렬)세션받아오기
				strSort = (String) session.getAttribute("test");
				//세션 설정 안한 처음 부를 땐 0 반환
				if (strSort == null) {
					strSort = "0";
				}
				System.out.println("테스트: "+strSort);
				//원하는 데이터(리뷰정렬 세션)를 받았으니 세션 종료시키기
				ArrayList<reviewData> rd = _db.get_ReviewData(sd.getStoreCode(), strSort);
				
				session.removeAttribute("test");
				//세션종료
				//session.invalidate();
				//리스트방식
				/*int review_in = Integer.parseInt(rd.get(0));
				String review_id = rd.get(1);
				String review_con = rd.get(2);
				String review_date = rd.get(3);
				String review_rat = rd.get(4);
				String review_ano = rd.get(5);
				String[] review_photo = rd.get(6).split(",");
				if (review_ano.equals("1")) {
					review_id = "익명";
				}
				*/
					//리뷰한 메뉴정보 리스트를 가져오는 함수실행.
					//파라미터로 (제거)storeCode와 review_index
					for(reviewData data : rd){
						System.out.println(data.getIndex());
						ArrayList<String> menuList = _db.get_ReviewTarget(data.getIndex());
						//String[] review_photo = data.getPhotoPath().split(",");
			%>
			<form method="post" id="review_form2" action="reviewSortServlet">
				<input type="text" id="review_SortText" name="review_SortTexted" style="display: none">
				<input name="review_storeCode" value="<%=sd.getStoreCode()%>" style="display: none">
				<div id="review_wrap">
					<!-- 리뷰 한 덩이 시작 -->
					<div class="review_contents">
						<div class="review_profile_box">
							<div class="review_profile_photo"></div>
							<div class="nickname"><%=data.getUserId()%></div>
						</div>

						<div class="reg_date">
							등록일:
							<!-- 22.02.01.12:59--><%=data.getDate()%></div>
						<div class="show_rate"><%=data.getRating()%></div>

						<div class="WIA_title">
							<span class="highlight">닉네임</span>님이 먹은 음식
						</div>
						<div class="WIA_container">
							<%
							for (int menu = 0; menu < menuList.size(); menu++) {
							%>
							<div class="WIA_contents"><%=menuList.get(menu)%></div>
							<%
							}
							%>
							<!-- <div class="WIA_contents">동적으로 추가asdfasdfasdf</div>
								<div class="WIA_contents">동적으로 추가ㅁㄴㅇㄻㄴㅇㅎㅁㄴㅇㅎㅁㄴㅇㅎ</div>
								<div class="WIA_contents">동적으로 추가ㅁㄴㅇㄻㄴㅇㅎㅁㄴㅇㅎㅁㄴㅇ</div>
								<div class="WIA_contents">그 외 n개</div>
								 -->
						</div>

						<div class="riview_contents">
							<!-- 리뷰 내용이 될 부분 asdf<br>aaav<br>aaav<br>aaav-->
							<%=data.getContents()%>
						</div>
						<!-- http://192.168.250.44/ImageTest/userImage/lisa123.jpg -->
						<div class="show_images">
							<br>
							<%--
								for(int i=0; i<review_photo.length; i++){
									review_photo[i] = "http://192.168.250.44"+review_photo[i];
							--%>
							<div class="show_images2">
								<img src=<%--=review_photo[i]--%>>
							</div>
							<%--
								}
							--%>
						</div>
					</div>
					<%
							}
					} catch (Exception e) {
						e.printStackTrace();
					}
					%>
				</div>
			</form>
		</div>
		<!-- 여기서부터 스크립트 -->

		<!-- 모달 팝업 스크립트 -->
		<!-- <script>
                function show() {
                    document.querySelector(".background").className = "background show";
                }

                function close() {
                    document.querySelector(".background").className = "background";
                }

                document.querySelector("#show").addEventListener("click", show);
                document.querySelector("#close").addEventListener("click", close);
            </script> -->

		<!-- 슬라이드 CSS 라이브러리 스크립트 -->
		<!-- script src="https://code.jquery.com/jquery-2.2.0.min.js" type="text/javascript"></script>-->
		<script src="../slick-1.8.1/slick/slick.js" type="text/javascript" charset="utf-8"></script>
		
		<script src="../js/store.js" type="text/javascript" charset="ansi"></script>
		<script type="text/javascript" src="../js/data.js"></script>
		<!-- 메인 이미지 -->

		<script>
				function sendRequest3() {
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
					
					var doc = document.getElementById("keepImg");
					var src = doc.src;
					
					var arr = src.split("/");
					
					httpRequest.send("userID=<%=userID%>&storeCode=<%=storeCode%>&keepType="+arr[arr.length-1]); // Http 요청을 보냄.
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
						if (httpRequest.readyState == XMLHttpRequest.DONE && httpRequest.status == 200) {
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
                function init() {
//                	var backgroundURL = [ "../UI/UI/keep_btn.png", "../UI/storeImgSub/1-2.jpg",
//                			"../UI/storeImgSub/1-1.jpg", "../UI/storeImgSub/2-1.jpg",
//                			"../UI/storeImgSub/2-2.jpg", "../UI/storeImgSub/2-23jpg",
//                			"../UI/storeImgSub/3-1.jpg", "../UI/storeImgSub/3-2.jpg",
//                			"../UI/storeImgSub/3-3.jpg", "../UI/storeImgSub/4-1.jpg",
//                			"../UI/storeImgSub/4-2.jpg", "../UI/storeImgSub/5-1.jpg",
//                			"../UI/storeImgSub/5-2.jpg" ]; // 색상코드를 원하는 만큼 넣어주세요~!

                	 var backgroundURL = [<%=rdList.size() == 0 ? "" : rdList.get(0).getPhotoPath()%>];

                	var tag = "";

                	// 배열 길이만큼 div를 동적으로 생성함
                	for (i = 0; i < backgroundURL.length; i++) {
    	               	 backgroundURL[i] = "http://192.168.250.44"+backgroundURL[i];
                		tag += "<img id=" + backgroundURL[i]
                				+ " class='colorBox' onclick='colorSet(this)'>";
                	}

                	// 만들어진 div에 클래스명과 onclick함수 부여
                	var colorBox = document.getElementById("colorList");
                	document.getElementById("colorList").innerHTML = tag;

                	// colorBox.style.backgroundSize = "100%";
                	// colorBox.style.backgroundRepeat = "no-repeat";

                	// 만들어진 div들을 List로 담기
                	var colorBoxList = document.getElementsByClassName("colorBox");

                	// 각 배열 요소에 백그라운드 url 부여
                	for (i = 0; i < colorBoxList.length; i++) {
                		// colorBoxList[i].style.backgroundImage = colorBoxList[i].id;
                		var str = colorBoxList[i].id;
                		//alert(str);
                		colorBoxList[i].src = str;
                	}
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
				httpRequest.send("userID="+<%=userID%>); // Http 요청을 보냄.
			}
			</script>
		<!-- 정윤 js 이벤트 처리 -->
		<!-- 메뉴 추가&삭제, 평점,  -->
		<script type="text/javascript">
			//1. 메뉴 select 선택 시 추가되는 메소드/이벤트
			//메뉴명 담은 배열 생성
			var menu_list = [];
			var menu_count = 0;
			//선택된 메뉴명을 먹은 메뉴에 추가하는 이벤트
			function select_menu() {
				//선택한 메뉴 정보 가져오기
				var sMenu = document.getElementById("menu_select");
				//선택한 메뉴명 가져오기
				var Menu_data = sMenu.options[sMenu.selectedIndex].text;
				//null이 아니면서 갯수가 3개이하이며, 중복이 없을 때 처리
				if (Menu_data != "" && menu_count < 3) {
					//리스트 추가
					menu_list.push(Menu_data);
					//ul과 div 불러오기
					//var input_MenuList = document.getElementById("show_list");
					//var add_Menu = document.getElementById("whatiate_add");
					//리스트 요소 생성
					//생성한 리스트의 id는 list_menu+(숫자)
					var input_Menu = document.createElement('li');
					input_Menu.innerText = Menu_data;
					input_Menu.setAttribute("id", "whatiate" + menu_count);
					input_Menu.setAttribute("class", "whatiate");
					//생성한 요소를 null 이면 뒤, 설정시 그 요소의 앞에 위치 시킨다.
					//input_MenuList.insertBefore(input_Menu, add_Menu);
					menu_count = menu_list.length;
					document.querySelector("ul#show_list").appendChild(input_Menu);
					document.getElementById("menuListView").value = menu_list.toString();
				} else if (menu_count == 3) { //선택한 메뉴 갯수가 4개 이상이라면 숨겼던 div보여주고 text변경.
					//<li id="whatiate_add" class="whatiate" style="display: none">
					var input_Menu = document.createElement('li');
					input_Menu.setAttribute("id", "whatiate_add");
					input_Menu.setAttribute("class", "whatiate");
					//input_MenuList.insertBefore(input_Menu, add_Menu);
					document.querySelector("ul#show_list").appendChild(input_Menu);
					//리스트에 추가
					menu_list.push(Menu_data);
					menu_count = menu_list.length;
					//text수정
					document.getElementById("whatiate_add").innerText = "그 외 1개";
				} else if (menu_count > 3) { //선택한 메뉴 갯수가 4개 이상이라면 숨겼던 div보여주고 text변경.
					//count가 4개 이상이라면 그 외 *개 보이게
					//document.getElementById("whatiate_add").style.display = "block";
					//리스트에 추가
					menu_list.push(Menu_data);
					menu_count = menu_list.length;
					//text수정
					document.getElementById("whatiate_add").innerText = "그 외 " + (menu_count - 3) + "개";
				} else {
					//입력이나 처리 없음
					console.log("none");
				}
				//길이따라 count 재지정.
				menu_count = menu_list.length;
				//내용 확인용 함수 호출
				menu_list_view();
			}
			//2. 메뉴 x클릭 시 삭제되는 메소드/이벤트
			//메뉴 리스트 삭제
			//지금은 input 옆에 x, 클릭시 뒤에서부터 리스트 삭제.
			function menu_del() {
				//지울 리스트 요소 선택 (맨 마지막에 생성된 요소)
				var del_list = document.getElementById("whatiate" + (menu_count - 1).toString());
				if (menu_list.length != 0 && menu_count < 4) {
					//보이는 li 지우기
					del_list.remove();
					//리스트에서 삭제
					menu_list.pop();
					//길이따라 count 재지정.
					menu_count = menu_list.length;
				} else if (menu_count > 2) {
					//선택한 메뉴가 4개 이상일때 삭제 방법
					//리스트에서 삭제
					menu_list.pop();
					//길이에 따라 재지정
					menu_count = menu_list.length;
					//갯수 확인용 로그
					console.log("현재 개수: " + (menu_count) + "개");
					//갯수에 따라 text 수정
					document.getElementById("whatiate_add").innerText = "그 외 " + (menu_count - 3) + "개";
					//3개라면 "그 외 3개"표시 안함.
					if ((menu_count - 3) === 0) {
						document.getElementById("whatiate_add").remove();
					}
				} else {
					//이미 없어짐.
					console.log("Value already missing in menu list");
				}
				//내용 확인용 함수 호출
				menu_list_view();
			}
	
			//1,2 - 메뉴 내용 확인용(로그) 함수 : 개발용
			//내용 확인용 함수
			function menu_list_view() {
				//배열 내용출력
				for (var i = 0; i < menu_list.length; i++) {
					console.log(i + "(menu): " + menu_list[i]);
				}
			}
	
			/*
			//3. 평점 클릭 이벤트 처리 -> 다른 곳에서 처리
			//평점 클릭시 버튼마다 설정
			//평점 점수 5, 3, 1
			//클릭시 클릭한 평점에 따라 버튼 색변경
			$("#score_great").on("click", (e)=> {
				document.getElementById("score_result").value = 5;
				
				document.getElementById("btn_score_great").style.backgroundColor="#FF4500";
				document.getElementById("btn_score_good").style.backgroundColor="#D2B48C";
				document.getElementById("btn_score_bad").style.backgroundColor="#D2B48C";
				
			});
				
			$("#score_good").on("click", (e)=> {
				document.getElementById("score_result").value = 4;
				
				document.getElementById("btn_score_great").style.background="#D2B48C";
				document.getElementById("btn_score_good").style.background="#FF8C00";
				document.getElementById("btn_score_bad").style.background="#D2B48C";
				
			});
			$("#score_bad").on("click", (e)=> {
				document.getElementById("score_result").value = 3;
				
				document.getElementById("btn_score_great").style.background="#D2B48C";
				document.getElementById("btn_score_good").style.background="#D2B48C";
				document.getElementById("btn_score_bad").style.background="#DAA520";
				
			});
			*/
	
			//4. 이미지 파일 업로드시 미리보기 처리하는 메소드/이벤트
			function readImg(input) {
				//4-1. 이미지 미리보기 처리
				//var img_count = 1;
				//input에 입력한 파일 가져오기
				//while(img in input.files){
				if (document.getElementById("reviewimg").files.length > 5) {
					alert("파일은 최대 5개 입력가능합니다.");
					document.getElementById("reviewimg").value = "";
					return 0;
				} else {
					for (var image of event.target.files) {
						var reader = new FileReader();
						/*if (input.files && input.files[0]) {
						} else {
							document.getElementById("preview"+img_count).src = "";
						}*/
						reader.onload = function(event) {
							var imgview = document.createElement("img");
							imgview.setAttribute("src", event.target.result);
							imgview.setAttribute("class", "reg_images")
							document.querySelector("div#regImages").appendChild(imgview);
						};
						reader.readAsDataURL(image);
					}
				}
	
				//4-2. 업로드한 이미지 파일의 파일명을 추출하여 input으로 전달
				//입력한 이미지 파일명을 전달하기 위해 input에 파일명 문자열로 입력
				var files_name = "";
				var multi = document.getElementById("reviewimg").files;
				for (var i = 0; i < multi.length; i++) {
					console.log(multi[i].name);
					files_name = files_name + "," + multi[i].name;
				}
				document.getElementById("id_imgtext").value = files_name;
				console.log(files_name);
			}
	
			//5. 파일추가 버튼을 클릭했을때, 이전에 추가한 파일 삭제하는 메소드/이벤트
			function clickImg() {
				var pdiv = document.getElementById("regImages");
				while (pdiv.hasChildNodes()) {
					pdiv.removeChild(pdiv.firstChild);
				}
			}
	
			/*6. 리뷰 작성하기 버튼을 클릭 시 작성 페이지 보이도록 -> 다른 곳에서 처리
			function writeClick(){
				document.getElementById("review_write").style.display = "none";
				document.getElementById("review_form").style.display = "block";
			}*/
	
			//7. 취소 버튼을 클릭했을 때 clear 처리
			function clearClick(){
				//보이는 메뉴 삭제
				document.getElementById("show_list").innerHTML = "";
				menu_list.length = 0;
				menu_count = 0;
				//보이는 태그 삭제
				
				//미리보기 이미지 삭제
				document.getElementById("regImages").innerHTML = "";
			}
			//8. 등록하기 버튼을 클릭했을 때 submit 처리(서블릿 이동)
			function submitClick(){
				document.getElementById("review_form").submit();
				//return false;
			}
	
			//9. 리뷰 정렬
			//0421
			//리뷰 정렬 클릭마다 내용 변경.
			//전체 클릭시 최신순으로 5개 출력.
			function sortAll() {
				document.getElementById("review_SortText").value = 0;
				document.getElementById("review_form2").submit();
			}
			//억수로 마싯다 클릭시 평점 5인 리뷰 5개 출력.
			function sortGreat() {
				if(<%=review_count_great%> == 0){
					alert("작성된 리뷰가 없습니다.");
				}else{
					document.getElementById("review_SortText").value = 5;
					document.getElementById("review_form2").submit();
				}
			}
			//갠찮드라 클릭시 평점 4인 리뷰 5개 출력.
			function sortGood() {
				if(<%=review_count_good%> == 0){
					alert("작성된 리뷰가 없습니다.");
				}else{
					document.getElementById("review_SortText").value = 4;
					document.getElementById("review_form2").submit();
				}
			}
			//영 파이다 클릭시 평점 3인 리뷰 5개 출력.
	
			function sortBad() {
				if(<%=review_count_bad%> == 0){
					alert("작성된 리뷰가 없습니다.");
				}else{
					document.getElementById("review_SortText").value = 3;
					document.getElementById("review_form2").submit();
				}
			}
		</script>
		<!-- 태그부분에 처리하는 기능이 많아서 스크립트를 따로 구분하여 개발 -->
		<script type="text/javascript">
			//10~13. 태그명 입력시 배열을 생성하여 여러개의 태그 처리
			//태그명 담을 배열 생성
			var tag_list = [];
			var tag_count = 0;
			
			//10. tag 입력 자동완성 이벤트(현재 jQuery 충돌로 안나옴)
			$(function() {
				$("#id_input_tagName").autocomplete({ //오토 컴플릿트 시작
					source: List, // source는 data.js파일 내부의 List 배열
					focus: function(event, ui) { // 방향키로 자동완성단어 선택 가능하게 만들어줌	
						//console.log(ui.item);
						return false;
					},
					minLength: 1,// 최소 글자수
					delay: 10, //autocomplete 딜레이 시간(ms)
					//disabled: true, //자동완성 기능 끄기
				});
			});
			
			//11. enter시에 태그 배열에 내용 추가하는 메소드/이벤트
			function show_name(e) {
				document.getElementById("id_input_tagName").setAttribute("placeholder", "ex.점심특선");
				//경고문 안보이게
				document.getElementById("warning_msg").style.display = "none";
				//input정보
				var x = document.getElementById("id_input_tagName");
				//입력이 없거나 태그가 5개 이하라면(0~4) 입력받음
				//code: 입력키, 입력이 ""이 아닐때, tag개수가 5개 이하일 때, 중복체크 1: 중복아님, 0:중복
				if (e.key == 'Enter' && tag_count < 5 && x.value != "" && dup_check(x.value) && List.includes(x.value)) {
					console.log("tag_input");
					
					//입력한 내용을 배열에 추가
					tag_list.push(x.value);
					//태그목록 생성
					//var input_TagList = document.createElement('ul');
					var input_TagList = document.getElementById("lists_tag");
					var input_Tag = document.createElement('li');
					input_Tag.setAttribute("class", "create_tag");
					input_Tag.innerText = "#" + x.value;
					input_Tag.setAttribute("id", "list_tag" + tag_count);
	
					//위치 지정
					//특정위치 앞에 삽입(상속관계), div > ul > li
					input_TagList.insertBefore(input_Tag, null);
	
					//input창 초기화
					x.value = null;
					//카운트
					tag_count++;
	
					document.getElementById("tagListView").value = tag_list.toString();
				} else if (tag_count > 4) { //태그 검색 개수가 6개 이상이라면 비활성화
					//console.log("tag_input1");
					x.disabled = true;
					document.getElementById("warning_msg").innerText = "태그는 5개로 제한되어 있습니다.";
					document.getElementById("warning_msg").style.display = "block";
				} else if (!List.includes(x.value)) {
					document.getElementById("tagListView").value = null;
					document.getElementById("id_input_tagName").setAttribute("placeholder", "리스트에 없는 내용입니다.");
				} else { //빈 검색어라면 log에 none을 표시하고 추가되는 거 없음
					console.log("none");
				}
			}
	
			//12. 입력한 태그 중복확인 이벤트(t: 중복아님, f:중복)/메소드
			//입력 input의 value값(String)
			function dup_check(str) {
				var x = document.getElementById("id_input_tagName");
				for (var i = 0; i < tag_count; i++) {
					if (str === tag_list[i]) {
						document.getElementById("warning_msg").innerText = "중복된 태그는 입력되지 않습니다.";
						document.getElementById("warning_msg").style.display = "block";
						return 0;
					}
				}
				return 1;
			}
	
			//13. input 옆에 x 클릭시 뒤에서부터 리스트 삭제 이벤트
			function tag_del() {
				//현재 배열 위치와 tag입력 개수 출력
				console.log("del: " + "list_tag" + (tag_count - 1).toString() + "\t" + tag_count);
				//tag_count != 0 체크하려했는데 실수지만 잘 
				if (tag_list.length != 0) {
					document.getElementById("list_tag" + (tag_count - 1)).remove();
					tag_list.pop();
					tag_count--;
					document.getElementById("warning_msg").style.display = "none";
					document.getElementById("id_input_tagName").disabled = false;
					//input창 초기화
					document.getElementById("tagListView").value = null;
					document.getElementById("tagListView").value = tag_list.toString();
				} else {
					console.log("Value already missing in tag list");
				}
			}
		</script>
		<script type="text/javascript" src="../js/header.js"></script>
		<script type="text/javascript" src="../js/keepImg.js"></script>
		<script type="text/javascript" src="../js/keepImg_star.js"></script>
	</main>
</body>
</html>
