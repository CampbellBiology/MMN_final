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

<link rel="stylesheet" href="resources/CSS/style_store.css">
<link rel="stylesheet" href="resources/slick-1.8.1/slick/slick.css">
<link rel="stylesheet"
	href="resources/slick-1.8.1/slick/slick-theme.css">
<link rel="stylesheet" href="resources/CSS/style_ImagePopUp.css">
<script src="https://code.jquery.com/jquery-1.12.4.min.js"></script>

</head>

<body>
	<header>
		<div id="header">공통 헤더 이미지 머시기~</div>
	</header>
	<main>
		<div id="body">

			<%
			DB_Conn _db = new DB_Conn();
			_db.constructStoreMap();
			_db.constructRtdCnt_map();
			_db.constructMenuMap();

			ArrayList<menuData> list = _db.menufindAll();

			ArrayList<storeData> storeList;
			ArrayList<rtdCntData> rtdCntList;
			storeList = _db.storefindAll();
			rtdCntList = _db.rtdCntfindAll();

			System.out.println("size : " + storeList.size());
			int storeCode = Integer.parseInt(request.getParameter("storeCode")==null?"0":request.getParameter("storeCode"));
			storeData sd = _db.getStoreData(storeCode);
			
			System.out.println(sd.getStoreName());
			
			String storeImgPath = sd.getStoreImgPath();

			Collections.sort(rtdCntList);

			String userID = (String)session.getAttribute("member");
			System.out.println(userID);

			boolean flag = _db.haveWatchlist(userID, storeCode);
			%>

			<div id="store">
				<div id="store_photo">
					가게 이미지 및 음식 사진
					<div id="big_photo" class="photo">
						<img src="<%=storeImgPath%>">
					</div>
					<div id="small_photo" class="photo">이미지2</div>
					<div id="small_photo" class="photo">이미지3</div>
					<div id="small_photo" class="photo">이미지4</div>
					<div id="small_photo" class="photo">
						<button id="show">팝업열기</button>
					</div>
				</div>
				<div id="store_info">
					<div id="store_name"><%=sd.getStoreName()%></div>
					<div id="store_keep">
						<Button type="button" id="keepBtn" value="">
							<img src="<%=flag == true
		? "https://raw.githubusercontent.com/CampbellBiology/MMN2/master/MMN_test/src/main/webapp/resources/UI/UI/keep_btn_sel.png"
		: "https://raw.githubusercontent.com/CampbellBiology/MMN2/master/MMN_test/src/main/webapp/resources/UI/UI/keep_btn.png"%>"
								id="keepImg" onclick="keepClick();sendRequest();"
								onmouseover="onHover()" onmouseout="offHover()">
							</Button>
						<p id="text"></p>

					</div>
					
					<div id="store_detail"><%="가게 시작 시간 : " + sd.getOpenAt() + "<br>가게 마감 시간 : " + sd.getCloseAt() + "<br> 마지막 주문 가능 시간 : "
		+ (sd.getLastOrder() == null ? "정보 없음" : sd.getLastOrder()) + "<br>가게 주차 여부 : "
		+ (sd.getParking()==null ?"주차 정보 없음":sd.getParking().equals("1")?"주차 가능" : "주차 불가") + "<br> 휴무일 : "
		+ (sd.getOffDays() == null ? "정보 없음" : sd.getOffDays()) + "<br> 주소 : " + sd.getAddr() + "<br> 전화번호 : "
		+ sd.getPhone() + "<br> 홈페이지 : " + (sd.getWeb() == null ? "정보 없음" : sd.getWeb()) + "<br> 브레이크 타임 : "
		+ (sd.getBreakStart() == null ? "정보 없음" : sd.getBreakStart() + " - " + sd.getBreakEnd())%><br>
					</div>
				</div>


				<div id="store_static">
					<div id="favorite" class="store_static">
						뭐뭇나 회원이 가장 많이 먹은 음식은?
						<%="<br>"%>
						<%
						for (rtdCntData r : rtdCntList) {
						%>
						<%=_db.getFoodName(r.getFoodCode())%>
						<%
						}
						%>
					</div>
					<div id="related_tag" class="store_static">관련된 태그는?</div>
				</div>

				<div id="review_btn">
					<input type="button" value="리뷰 작성하기">
				</div>
			</div>
			<hr>

			<form method="post" action="review">

				<div id="create_riview">
					<div id="first_row">
						<div id="review_store_name">가게이름</div>
						<div id="noname_check">
							<input type="checkbox" value="noname">익명으로 작성하기
						</div>
					</div>

					<div id="second_row">
						<div id="review_whatIAte">
							내가 먹은 메뉴 <select>
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
						</div>
						<div id="score_title">평점</div>
					</div>

					<div id="third_row">
						<div id="show_whatIAte">
							<div id="whatiate1" class="whatiate">생삼겹</div>
							<div id="whatiate2" class="whatiate">생목살</div>
							<div id="whatiate3" class="whatiate">양념갈비</div>
							<div id="whatiate4" class="whatiate">그 외 2개</div>
						</div>

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

						<div id="forth_row">
							<div id="add_tag_title">태그를 입력해주세요.</div>
							<div id="add_tag">
								<div id="create_tag1" class="create_tag">
									<input type="text" placeholder="ex.#비오는날">
								</div>
								<div id="create_tag2" class="create_tag">
									<button type="button">추가아이콘</button>
								</div>
								<div id="create_tag3" class="create_tag"></div>
								<div id="create_tag4" class="create_tag"></div>
							</div>
						</div>

						<div id="fifth_row">
							<div>
								<input type="text" placeholder="리뷰를 작성해주세요. 최대 4000자">
							</div>
						</div>

						<div id="sixth_row">
							<div>이미지 등록 최대 5개</div>
							<div id="regImages">
								<div id="reg_image1" class="reg_images"></div>
								<div id="reg_image2" class="reg_images"></div>
								<div id="reg_image3" class="reg_images"></div>
								<div id="reg_image4" class="reg_images"></div>
								<div id="reg_image5" class="reg_images"></div>
							</div>
						</div>

						<div id="seventh_row">
							<button type="button" value="toMain">취소</button>
							<button type="submit">등록하기</button>
						</div>
					</div>
				</div>
			</form>

			<div id="blank">여백</div>

			<div id="show_review">
				<div id="first_line">
					<div id="review_title">리뷰</div>
					<div id="review_sort">
						<ul>
							<li>전체<span id="score_all" class="show_score">(12)</span></li>
							<li>억수로 마싯다<span id="score_great" class="show_score">(12)</span></li>
							<li>갠찮드라<span id="score_good" class="show_score">(12)</span></li>
							<li>영 파이다<span id="score_bad" class="show_score">(12)</span></li>
						</ul>
					</div>
				</div>

				<div id="review_profile">프로필 사진 + 이름</div>
				<div id="review_detail">
					<div id="second_line">
						<div id="reg_date">23.03.30</div>
						<div id="show_rate">억수로 마싯다</div>
					</div>

					<div id="third_line">
						<div id="WIA_title">먹은 음식:</div>
						<div id="WIA_contents">동적으로 추가</div>
					</div>

					<div id="forth_line">
						<div id="riview_contents">
							리뷰 내용이 될 부분<br>뫄뫄뫄뫄
						</div>
					</div>

					<div id="fifth_line">
						<div id="show_images">
							이미지 넣는 부분<br>
							<div id="show_image1" class="show_images"></div>
							<div id="show_image2" class="show_images"></div>
							<div id="show_image3" class="show_images"></div>
							<div id="show_image4" class="show_images"></div>
							<div id="show_image5" class="show_images"></div>
						</div>
					</div>
				</div>
				<div id="blank">여백</div>


				<!-- 여기서부터
팝업창입니다 -->

				<div class="background">
					<div class="window">
						<!-- 팝업페이지 -->
						<div class="popup">

							<button id="close">팝업닫기</button>

							<!-- 슬라이드 CSS 라이브러리 -->
							<div id="mainImage">
								<img src="resources/UI/storeImg/1.jpg" id="main_image"
									width="400px">
							</div>
							<!-- 우측 리뷰 영역 -->
							<div id="pop_riview">
								<div id="user_profile">
									<img src="resources/UI/profile/jennie.jpg">
								</div>
								<div id="user_name">제니</div>
								<div id="user_riview">뫄뫄뫄</div>
							</div>


							<!-- 아래 이미지 영역 -->
							<section class="center slider">
								<div>
									<img src="resources/UI/storeImg/1.jpg">
								</div>
								<div>
									<img src="resources/UI/storeImg/2.jpg">
								</div>
								<div>
									<img src="resources/UI/storeImg/3.jpg">
								</div>
								<div>
									<img src="resources/UI/storeImg/4.jpg">
								</div>
								<div>
									<img src="resources/UI/storeImg/5.jpg">
								</div>
								<div>
									<img src="resources/UI/storeImg/6.jpg">
								</div>
								<div>
									<img src="resources/UI/storeImg/7.jpg">
								</div>
								<div>
									<img src="resources/UI/storeImg/8.jpg">
								</div>
								<div>
									<img src="resources/UI/storeImg/9.jpg">
								</div>

							</section>


						</div>


					</div>
				</div>
			</div>
		</div>

		<!-- 모달 팝업 스크립트 -->
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

		<!-- 슬라이드 CSS 라이브러리 스크립트 -->
		<script src="https://code.jquery.com/jquery-2.2.0.min.js"
			type="text/javascript"></script>
		<script src="resources/slick-1.8.1/slick/slick.js"
			type="text/javascript" charset="utf-8"></script>
		<script type="text/javascript">
			$(document).on('ready', function() {

				$(".center").slick({
					dots : true,
					infinite : true,
					centerMode : true,
					slidesToShow : 5,
					slidesToScroll : 3
				});
			});
		</script>


		<script>
		function sendRequest() {
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
			httpRequest.send("userId=<%=userID%>&storeCode=<%=storeCode%>"); // Http 요청을 보냄.
			}
		</script>

	</main>


	<script type="text/javascript" src="resources/js/project01.js"></script>

</body>

</html>