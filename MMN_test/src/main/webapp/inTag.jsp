<%@ page language="java" contentType="text/html; charset=utf-8"
   pageEncoding="utf-8"%>
   <%@page import="java.util.ArrayList"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Insert title here</title>
<style>
div {
   width: auto;
   background-color: #999999;
   border: 1px solid red;
}

li {
   width: 100px;
   background-color: orange;
   border: 1px solid #005500;
}
</style>

<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script src="./data.js"></script>

</head>
<body>
   <!-- 태그내용 입력부 -->
   <div id="input_tag">
      <span>#</span>
         <input type="text" id="id_input_tagName" name="input_tagName" onblur="input_blur()">
      <a href ="javascript:del_Click()">x</a>
   </div>
   <span id="warning_msg" style="display: none">태그는 5개로 제한되어 있습니다.</span>
   <!-- submit 버튼 클릭시 서블릿으로 이동하여 해당 내용 전송 -->
   <button>전송</button>
   <div>
      <span>테스트 데이터</span>
   </div>
   <script type="text/javascript">
      //태그명 담을 배열 생성
      var tag_list = [];
      var tag_count = 0;
      $(function () {   //화면 로딩후 시작
         $("#id_input_tagName").autocomplete({  //오토 컴플릿트 시작
            source: List,   // source는 data.js파일 내부의 List 배열
            focus : function(event, ui) { // 방향키로 자동완성단어 선택 가능하게 만들어줌   
               console.log(ui.item);
               return false;
            },
            minLength: 1,// 최소 글자수
            delay: 10,   //autocomplete 딜레이 시간(ms)
            //disabled: true, //자동완성 기능 끄기
         });
      });
      
      //blur시에 리스트 추가
      function input_blur() { //함수는 들어옴
         document.getElementById("warning_msg").style.disabled = false;
         var x = document.getElementById("id_input_tagName");
         if (x.value !== "" && tag_count < 5) {
            //입력한 내용을 배열에 추가
            tag_list.push(x.value);

            //div생성 <div></div>
            var input_TagList = document.createElement('ul');
            var input_Tag = document.createElement('li');
            input_Tag.innerText = "#" + x.value;
            input_Tag.setAttribute("id", "list_div"+tag_count);
            //x생성 <span></span>

            var input_vTag = document.createElement('a');
            input_vTag.innerText = "x";
            //input_vTag.setAttribute("id", "list_del"+tag_count);
            //input_vTag.setAttribute("class", "del_btn");
            
            console.log("list_div"+tag_count);
            //var vtext = document.createTextNode = x.value; //원하는 요소에 문자열
            //view.appendChild(vtext);//요소의 자식요소

            //위치 지정
            //특정위치 앞에 삽입, input_tag라는 아이디를 가진 div 부모 태그의 자식요소로 삽입한다.
            var pDiv = document.getElementById("input_tag");
            pDiv.insertBefore(input_TagList, null);
            input_TagList.insertBefore(input_Tag, null);

            //document.getElementById("input_tag").appendChild(document.createElement('p'));

            //배열 내용출력
            for (var i = 0; i < tag_list.length; i++) {

               console.log(i + ": " + tag_list[i]);
            }
            document.getElementById("id_input_tagName").value = null;
            tag_count++;
            
         } else if (tag_count > 4) { //태그 검색 개수가 5개 이상이라면 비활성화
            document.getElementById("id_input_tagName").disabled = true;
         } else { //빈 검색어라면 log에 none을 표시하고 추가되는 거 없음.
            console.log("none");
         }
      }

      //delete만들었다.
      //지금은 input 옆에 x, 클릭시 뒤에서부터 리스트 삭제.
      function del_Click() {
         var index = (tag_count-1).toString();
         //현재 배열 위치와 tag입력 개수 출력
         console.log("del: "+index+"\t"+tag_count);
         if(tag_list != 0){
            tag_list.pop();
            document.getElementById("list_div"+index).remove();
            
            tag_count--;
            for (var i = 0; i < tag_list.length; i++) {

               console.log("(Remain)"+i + ": " + tag_list[i]);
            }
            document.getElementById("id_input_tagName").disabled = false;
         }else{
            console.log("Value already missing in list");
         }
      }
   </script>

</body>
</html>