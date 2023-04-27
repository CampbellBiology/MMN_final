<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <%@page import="DB.*" %>
    <%@page import="DataClass.*" %>
    <%@page import="java.util.*" %>
<!Doctype html>
<html lang="ko">

<head>
    <meta charset="UTF-8">
    <title>MMN-가게</title>

    <link rel="stylesheet" href="../CSS/style_store_store_info.css">
    <link rel="stylesheet" href="../CSS/style_store_create_review.css">
    <link rel="stylesheet" href="../CSS/style_store_store_show_review.css">


    <link rel="stylesheet" type="text/css" href="../slick-1.8.1/slick/slick.css">
    <link rel="stylesheet" type="text/css" href="../slick-1.8.1/slick/slick-theme.css">
    <!-- <link rel="stylesheet" type="text/css" href="../CSS/style_ImagePopUp_0419.css"> -->

</head>

<body>
    <!-- <header>
        <div id="header"><img src="../UI/UI/eventBanner2.png" id="event_banner"></div>
    </header> -->
    
    <%
			DB_Conn _db = new DB_Conn();
			_db.constructStoreMap();
			_db.constructRtdCnt_map();
			ArrayList<storeData> storeList;
			ArrayList<rtdCntData> rtdCntList;
			storeList = _db.storefindAll();
			rtdCntList = _db.rtdCntfindAll();
			System.out.println("size : " + storeList.size());
			int storeCode = Integer.parseInt(request.getParameter("storeCode")==null?"0":request.getParameter("storeCode"));
			storeData sd = _db.getStoreData(storeCode);
			String storeImgPath = sd.getStoreImgPath();
			int review_store = sd.getStoreCode();
			_db.constructMenuMap(review_store);
			ArrayList<menuData> list = _db.menufindAll();
			Collections.sort(rtdCntList);
			String userID = (String)session.getAttribute("memberID");
			System.out.println("Store_0424.jsp userID : " + userID);
			
			ArrayList<reviewData> rdList = _db.getReviewByStoreCode(storeCode);
			
			boolean flag = _db.haveWatchlist(userID, storeCode);
			%>
    
    <main>
        <div id="body">
            <div id="store">

                <div id="store_info">
                    <div id="store_name"><%=sd.getStoreName()%></div>
                    <div id="store_keep">
                        <button class="store_keep">
<img src="<%=flag == true
		? "https://raw.githubusercontent.com/CampbellBiology/MMN2/master/MMN_test/src/main/webapp/resources/UI/UI/keep_btn_sel.png"
		: "https://raw.githubusercontent.com/CampbellBiology/MMN2/master/MMN_test/src/main/webapp/resources/UI/UI/keep_btn.png"%>"
								id="keepImg" onclick="keepClick();sendRequest();"
								onmouseover="onHover()" onmouseout="offHover()">
                        </button>
                    </div>
                    <div id="store_detail">
                        <p class="subject">평균 평점 : <span class="fromDB-rate"><%= _db.getAverageRating(sd.getStoreCode()) %></span></p>
                        <p class="subject">가게 시작 시간 : <span class="fromDB"><%=sd.getOpenAt() %></span></p>
                        <p class="subject">가게 마감 시간 : <span class="fromDB"><%=sd.getCloseAt() %></span></p>
                        <p class="subject">마지막 주문 가능 시간 : <span class="fromDB"><%=(sd.getLastOrder() == null ? "정보 없음" : sd.getLastOrder()) %></span></p>
                        <p class="subject">주차 공간 : <span class="fromDB"><%=(sd.getParking()==null ?"주차 정보 없음":sd.getParking().equals("1")?"주차 가능" : "주차 불가") %></span></p>
                        <p class="subject">휴무일 : <span class="fromDB"><%= (sd.getOffDays() == null ? "정보 없음" : sd.getOffDays()) %></span></p>
                        <p class="subject">브레이크 타임 : <span class="fromDB"><%=(sd.getBreakStart() == null ? "정보 없음" : sd.getBreakStart() + " ~ " + sd.getBreakEnd()) %></span></p>
                        <p class="subject">뭐뭇나 회원이 가장 많이 먹은 음식 : <span class="fromDB-most">딸기빙수</span></p>
                        <p class="subject">관련 태그 : </p>
                        <div id="related_tag">
                            <div class="tag1"><a><span class="sharp"># </span>
                                    <div class="tag2">딸기빙수</div>
                                </a></div>
                            <div class="tag1"><a><span class="sharp"># </span>
                                    <div class="tag2">딸기빙수녹차빙수ㅁㄴ</div>
                                </a></div>
                            <div class="tag1"><a><span class="sharp"># </span>
                                    <div class="tag2">딸기빙수</div>
                                </a></div>
                            <div class="tag1"><a><span class="sharp"># </span>
                                    <div class="tag2">초코빙수</div>
                                </a></div>
                            <div class="tag1"><a><span class="sharp"># </span>
                                    <div class="tag2">인절미빙수</div>
                                </a></div>
                            <div class="tag1"><a><span class="sharp"># </span>
                                    <div class="tag2">인절미빙수</div>
                                </a></div>
                        </div>
                    </div>
                </div>

                <div id="store_photo">

                    <!-- 큰 이미지 -->
                     <div id="mainImage" style ="background-image:url(http://192.168.250.44<%=sd.getStoreImgPath()%>)">
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
                <input type="button" value="↓ 리뷰 작성하러 가기" class="btn_riview" id="show_btn"
                    onclick="show_create_review()">
                <input type="button" value="↑ 닫기" class="btn_riview" id="remove_btn" onclick="remove_create_review()">
            </div>


            <!-- 여기서부터 리뷰작성란 -->

            <div id="create_riview">
                <div id="review_store_name">가게 이름이 어디까지 길어질까요</div>
                <div id="noname_check"><input type="checkbox" value="noname">익명으로 작성하기</div>

                <div id="review_whatIAte">내가 먹은 메뉴</div>
                <div class="selectBox">
                    <select name="fruits" class="select">
                        <option disabled selected>fruits 🍊</option>
                        <option value="apple">apple</option>
                        <option value="orange">orange</option>
                        <option value="grape">grape</option>
                        <option value="melon">melon</option>
                    </select>
                    <button type="button" id="x-button">×</button>
                </div>

                <div id="score_title">평점</div>
                <div id="score">
                    <div id="score_great" class="score"><button type="button" value="great" class="score_btn">억수로
                            마싯다</button></div>
                    <div id="score_good" class="score"><button type="button" value="good"
                            class="score_btn">갠찮드라</button></div>
                    <div id="score_bad" class="score"><button type="button" value="bad" class="score_btn">영
                            파이다</button>
                    </div>
                </div>



                <div id="show_whatIAte">
                    <ul id="show_list">
                        <li id="whatiate_add" class="whatiate">#족발ㅁㄴㅇㄹ</li>
                        <li id="whatiate_add" class="whatiate">#해asfㄹ전</li>
                        <li id="whatiate_add" class="whatiate">#ㅁㅇㄹㅁㄴㅇㄻㄴㅇㄹ</li>
                        <li id="whatiate_add" class="whatiate">#sdfㅁㄴㅇㄻㄴㅇㄹㄹ</li>
                        <li id="whatiate_add" class="whatiate">그 외 2개</li>
                        <li id="whatiate_add" class="whatiate" style="display: none">
                    </ul>
                </div>



                <div id="add_tag_title">태그를 입력해주세요.</div>
                <div id="add_tag">
                    <input type="text" placeholder="ex.#비오는날" class="tag_input">
                    <div id="create_tag2" class="create_tag">#asdfasdf</div>
                    <div id="create_tag3" class="create_tag">#asdfdfasdf</div>
                    <div id="create_tag4" class="create_tag">#asdfasdf</div>
                    <button type="button" id="plus_button">+</button>
                </div>

                <div id="review_title">리뷰를 작성해주세요.</div>
                <!-- 자동줄바꿈 등 위해 input text가 아닌 textarea 사용함 -->
                <textarea rows="3" cols=20 wrap="hard" placeholder="최대 4000자" class="input_review"
                    maxlength="4000"></textarea>


                <div id="image_info_title">이미지 등록 최대 5개 <span class="subtext">(jpg, png)</span></div>
                <div class="filebox">
                    <label for="file">파일찾기</label><input type="file" id="file" accept=".jpg, .png">
                </div>
                <div id="regImages">
                    <div id="reg_image1" class="reg_images"></div>
                    <div id="reg_image2" class="reg_images"></div>
                    <div id="reg_image3" class="reg_images"></div>
                    <div id="reg_image4" class="reg_images"></div>
                    <div id="reg_image5" class="reg_images"></div>
                </div>

                <button type="button" value="toMain" id="review_cancel" class="review_button"
                    onclick="clear_create_review()">취소</button>
                <button type="button" value="submit" id="review_submit" class="review_button">등록하기</button>

                <div id="something"></div>
            </div>


            <!-- 여기서부터 리뷰 보여주는 영역 -->
            <div id="show_review">
                <div id="first_line">
                    <div id="review_title2">뭐뭇노 회원들의 소중한 리뷰</div>
                    <div id="review_sort">
                        <div id="score_btn2" class="score_btn2-1">전체<span id="score_all2" class="show_score2"> (12)
                            </span>
                        </div>
                        <div id="score_btn2" class="score_btn2-2">억수로 마싯다<span id="score_great2" class="show_score2">
                                (12)
                            </span></div>
                        <div id="score_btn2" class="score_btn2-3">갠찮드라<span id="score_good2" class="show_score2"> (12)
                            </span></div>
                        <div id="score_btn2" class="score_btn2-4">영 파이다<span id="score_bad2" class="show_score2"> (12)
                            </span></div>
                    </div>
                </div>
            </div>

            <div id="review_wrap">
                <!-- 리뷰 한 덩이 시작 -->
                <div class="review_contents">
                    <div class="review_profile_box">
                        <div class="review_profile_photo"></div>
                        <div class="nickname">jennie123</div>
                    </div>

                    <div class="reg_date">등록일: 22.02.01.12:59</div>
                    <div class="show_rate">억수로 마싯다</div>

                    <div class="WIA_title"><span class="highlight">닉네임</span>님이 먹은 음식</div>
                    <div class="WIA_container">
                        <div class="WIA_contents">동적으로 추가ㅁㄴㅇㄻㄴㅇㅎㅁㄴㅇㅎㅁㄴㅇ</div>
                        <div class="WIA_contents">동적으로 추가asdfasdfasdf</div>
                        <div class="WIA_contents">동적으로 추가ㅁㄴㅇㄻㄴㅇㅎㅁㄴㅇㅎㅁㄴㅇㅎ</div>
                        <div class="WIA_contents">동적으로 추가ㅁㄴㅇㄻㄴㅇㅎㅁㄴㅇㅎㅁㄴㅇ</div>
                        <div class="WIA_contents">그 외 n개</div>
                    </div>

                    <div class="riview_contents">리뷰 내용이 될 부분 asdf<br>aaav<br>aaav<br>aaav</div>

                    <div class="show_images"><br>
                        <div class="show_images2"></div>
                        <div class="show_images2"></div>
                        <div class="show_images2"></div>
                        <div class="show_images2"></div>
                        <div class="show_images2"></div>
                    </div>
                </div>
                <!-- 리뷰 한 덩이 끝-->

                <!-- 리뷰 한 덩이 시작 -->
                <div class="review_contents">
                    <div class="review_profile_box">
                        <div class="review_profile_photo"></div>
                        <div class="nickname">jennie123</div>
                    </div>

                    <div class="reg_date">등록일: 22.02.01.12:59</div>
                    <div class="show_rate">영 파이다</div>

                    <div class="WIA_title"><span class="highlight">닉네임</span>님이 먹은 음식</div>
                    <div class="WIA_container">
                        <div class="WIA_contents">동적으로 추가ㅁㄴㅇㄻㄴㅇㅎㅁㄴㅇㅎㅁㄴㅇ</div>
                        <div class="WIA_contents">동적으로 추가asdfasdfasdf</div>
                        <div class="WIA_contents">동적으로 추가ㅁㄴㅇㄻㄴㅇㅎㅁㄴㅇㅎㅁㄴㅇㅎ</div>
                        <div class="WIA_contents">동적으로 추가ㅁㄴㅇㄻㄴㅇㅎㅁㄴㅇㅎㅁㄴㅇ</div>
                        <div class="WIA_contents">그 외 n개</div>
                    </div>

                    <div class="riview_contents">리뷰 내용이 될 부분 asdf</div>

                    <div class="show_images"><br>
                        <div class="show_images2"></div>
                        <div class="show_images2"></div>
                        <div class="show_images2"></div>
                        <div class="show_images2"></div>
                        <div class="show_images2"></div>
                    </div>
                </div>
                <!-- 리뷰 한 덩이 끝-->

                <!-- 리뷰 한 덩이 시작 -->
                <div class="review_contents">
                    <div class="review_profile_box">
                        <div class="review_profile_photo"></div>
                        <div class="nickname">jennie123</div>
                    </div>

                    <div class="reg_date">등록일: 22.02.01.12:59</div>
                    <div class="show_rate">별로드라</div>

                    <div class="WIA_title"><span class="highlight">닉네임</span>님이 먹은 음식</div>
                    <div class="WIA_container">
                        <div class="WIA_contents">동적으로 추가ㅁㄴㅇㄻㄴㅇㅎㅁㄴㅇㅎㅁㄴㅇ</div>
                        <div class="WIA_contents">동적으로 추가asdfasdfasdf</div>
                        <div class="WIA_contents">동적으로 추가ㅁㄴㅇㄻㄴㅇㅎㅁㄴㅇㅎㅁㄴㅇㅎ</div>
                        <div class="WIA_contents">동적으로 추가ㅁㄴㅇㄻㄴㅇㅎㅁㄴㅇㅎㅁㄴㅇ</div>
                        <div class="WIA_contents">그 외 n개</div>
                    </div>

                    <div class="riview_contents">리뷰 내용이 될 부분 asdf<br>aaav<br>aaav<br>aaav<br>aaav<br>aaav<br>aaav<br>aaav<br>aaav
                    </div>

                    <div class="show_images"><br>
                        <div class="show_images2"></div>
                        <div class="show_images2"></div>
                        <div class="show_images2"></div>
                        <div class="show_images2"></div>
                        <div class="show_images2"></div>
                    </div>
                </div>
                <!-- 리뷰 한 덩이 끝-->
             
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
            <script src="https://code.jquery.com/jquery-2.2.0.min.js" type="text/javascript"></script>
            <script src="../slick-1.8.1/slick/slick.js" type="text/javascript" charset="utf-8"></script>
            
            <script src="../js/store.js" type="text/javascript" charset="ansi"></script>
		<script type="text/javascript" src="../js/project01.js"></script>
            
            <!-- 메인 이미지 -->
            
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

			var doc = document.getElementById("keepImg");
			var src = doc.src;
			
			var arr = src.split("/");
			
			httpRequest.send("userID=<%=userID%>&storeCode=<%=storeCode%>&keepType="+arr[arr.length-1]); // Http 요청을 보냄.
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

                	 var backgroundURL = [<%=rdList.size()==0?"":rdList.get(0).getPhotoPath()%>];

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

    </main>

</body>

</html>