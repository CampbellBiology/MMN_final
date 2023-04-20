function logID() {
    let ID_txtbx = document.querySelector('#IDBox');
    let regID = /^[a-z0-9-_]{5,20}$/;

    if(ID_txtbx.value=="") {
        document.querySelector('#plus_txt_ID').innerHTML = "필수값입니다";}
    else if(!regID.test(ID_txtbx.value)) //정규식
    {
        document.querySelector('#plus_txt_ID').style.display="block";
        document.querySelector('#plus_txt_ID').innerHTML = "5~20자의 영문 소문자, 숫자와 특수기호(_),(-)만 사용 가능합니다.";}  
    // else if(ID_txtbx.value=="db에 있는 id") {document.querySelector('#plus_txt').innerHTML = "이미 사용중이거나 탈퇴한 아이디입니다.";}
    else {document.querySelector('#plus_txt_ID').style.display="none";}
}

function logPW() {
    let PW_txtbx = document.querySelector('#PWBox');
    let regPW = /^[a-z0-9-_]{5,20}$/;
    

    if(PW_txtbx.value=="") {
        document.querySelector('#plus_txt_PW').innerHTML = "필수값입니다";}
        //이미지 사용 불가 넣기
    else if(!regPW.test(PW_txtbx.value)) //정규식
    {document.querySelector('#plus_txt_PW').style.display="block";
    document.querySelector('#plus_txt_PW').innerHTML = "8~16자 영문 대 소문자, 숫자, 특수문자를 사용하세요.";
     document.getElementById('inablePW').innerHTML = "사용불가";
     document.getElementById('lock').src="lock/lock-red.png";
    }

    else {document.querySelector('#plus_txt_PW').style.display="none";
    document.getElementById('inablePW').innerHTML = "안전";
    document.getElementById('lock').src="lock/lock-green.png"}

}

function logPWConfirm() {
    let PW_txtbx = document.querySelector('#PWBox');
    let PW_confirm = document.querySelector('#PWConFirmBox');
    
    if(PW_confirm.value=="") { 
        document.querySelector('#plus_txt_PWConfirm').innerHTML = "필수값입니다"; 
    }
    if(PW_txtbx.value==PW_confirm.value && PW_confirm.value!=="") {
        document.querySelector('#plus_txt_PWConfirm').style.display="none";
        document.getElementById('lock2').src="lock/lock-green-checked.png";
    }
    if (PW_txtbx.value!==PW_confirm.value) {
        document.querySelector('#plus_txt_PWConfirm').style.display="block";
        document.querySelector('#plus_txt_PWConfirm').innerHTML = "비밀번호가 일치하지 않습니다.";
        document.getElementById('lock2').src="lock/lock-red.png";
    }

}

function logName() {
    let Name_txtbx = document.querySelector('#NameBox');
    let regName =  /^[가-힣]{2,4}|[a-zA-Z]{2,10}$/; 

    if(Name_txtbx.value=="") {
        document.querySelector('#plus_txt_Name').style.display="block";
        document.querySelector('#plus_txt_Name').innerHTML = "필수값입니다";
    } else if(!regName.test(Name_txtbx.value)){
        document.querySelector('#plus_txt_Name').style.display="block";
        document.querySelector('#plus_txt_Name').innerHTML = "한글과 영문 대 소문자를 사용하세요. (특수기호, 공백 사용 불가)";
    } else {document.querySelector('#plus_txt_Name').style.display="none";}
}

function logBirth() {
    let birthyear = document.querySelector('#birthYear');
    let birthmonth = document.querySelector('#birthMonth');
    let birthday = document.querySelector('#birthDay');

    if(birthyear.value.length<4) {
        document.querySelector('#plus_txt_birth').style.display="block";
        document.querySelector('#plus_txt_birth').innerHTML = "태어난 년도 4자리를 정확하게 입력하세요.";
    } 

    if(birthyear.value.length==4 && birthmonth.value=="월") {
        document.querySelector('#plus_txt_birth').style.display="block";
        document.querySelector('#plus_txt_birth').innerHTML = "태어난 월을 선택하세요.";
    }
    
    if(birthyear.value.length==4 && birthmonth.value!=="월") {
        document.querySelector('#plus_txt_birth').style.display="block";
        document.querySelector('#plus_txt_birth').innerHTML = "태어난 일(날짜) 2자리를 정확하게 입력하세요.";
    }

    if(birthyear.value.length==4 && birthmonth.value!=="월" && birthday.value.length>0) {
        document.querySelector('#plus_txt_birth').style.display="none";

        //isNaN(value) 숫자인지 판별 숫자가 아니면 true, 숫자면 false
        if( isNaN(birthyear.value)==true || isNaN(birthday.value)==true) {
            document.querySelector('#plus_txt_birth').style.display="block";
            document.querySelector('#plus_txt_birth').innerHTML = "생년월일을 다시 확인해주세요.";
        }
    }
}

function logGender() {
    let gender = document.querySelector('#gender');

    if(gender.value == "성별") {
        document.querySelector('#plus_txt_gender').style.display="block";
        document.querySelector('#plus_txt_gender').innerHTML = "필수 정보입니다.";
    } else {
        document.querySelector('#plus_txt_gender').style.display="none";
    }
}

function logEmail() {
    let email = document.querySelector('#emailBox');
    let regEmail = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i;

    if(email.value=="") {
        document.querySelector('#plus_txt_email').style.display="none";
    } else if(!regEmail.test(email.value)) {
        document.querySelector('#plus_txt_email').style.display="block";
        document.querySelector('#plus_txt_email').innerHTML = "이메일 주소를 다시 확인해주세요.";
    } else {
        document.querySelector('#plus_txt_email').style.display="none";
    }
}

function logPhone() {
    let phone = document.querySelector('#phoneBox');

    if(phone.value == "") {
        document.querySelector('#plus_txt_phone').style.display="block";
        document.querySelector('#plus_txt_phone').innerHTML = "필수 정보입니다.";
    } else {
        document.querySelector('#plus_txt_phone').style.display="none";
    }
}

function logCN() {
    let phone = document.querySelector('#phoneBox');
    let regPhone = /^01([0|1|6|7|8|9])-?([0-9]{3,4})-?([0-9]{4})/;
    document.querySelector('#plus_txt_phone').style.display="block";
    if(!regPhone.test(phone.value)) {
        
        document.querySelector('#plus_txt_phone').innerHTML = "형식에 맞지 않는 번호입니다.";
    } else { 
        document.querySelector('#plus_txt_phone').innerHTML = "인증번호를 발송했습니다.<br> (유효시간 30분) 인증번호가 오지 않으면 입력하신 정보가 정확한지 확인하여 주세요. <br>이미 가입된 번호이거나, 가상전화번호는 인증번호를 받을 수 없습니다.";
        document.querySelector('#plus_txt_phone').style.color="green";
        document.getElementById('CNBox').readOnly=false;
        document.querySelector('#CN').style.backgroundColor="white"; 
        document.querySelector('#CNBox').style.backgroundColor="white"; 
    }
}