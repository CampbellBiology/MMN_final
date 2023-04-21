let newId = false;
let newPw = false;

function logID() {
    let ID_txtbx = document.querySelector('#user_id');
    let regID = /^[a-z0-9-_]{5,20}$/;

    if (ID_txtbx.value == "") {
        document.querySelector('#id_noti').innerHTML = "필수값입니다";
    }
    else if (!regID.test(ID_txtbx.value)) //정규식
    {
        document.querySelector('#id_noti').style.display = "block";
        document.querySelector('#id_noti').innerHTML = "5~20자의 영문 소문자, 숫자와 특수기호(_),(-)만 사용 가능합니다.";
    }
    else { document.querySelector('#id_noti').style.display = "none"; 
    newId=true}
}

function logPW() {
    let PW_txtbx = document.querySelector('#user_pw');
    let regPW = /^[a-z0-9-_]{5,20}$/;


    if (PW_txtbx.value == "") {
        document.querySelector('#pw_noti').innerHTML = "필수값입니다";
    }
    else if (!regPW.test(PW_txtbx.value)) //정규식
    {
        document.querySelector('#pw_noti').style.display = "block";
        document.querySelector('#pw_noti').innerHTML = "8~16자 영문 대 소문자, 숫자, 특수문자를 사용하세요.";
    }
    else {
        document.querySelector('#pw_noti').style.display = "none";
        newPw=true
    }

}


function cancel_login() {
    document.querySelector('#user_id').value = null;
    document.querySelector('#user_pw').value = null;
    document.querySelector('#id_noti').style.display = "none";
    document.querySelector('#pw_noti').style.display = "none";
}

function mySubmit() {
	
	if(newId==false || newPw==false || newPw_confirm==false) {
		alert("아이디 또는 비밀번호를 올바르게 입력해주세요.");
		return false;
	} else {
		alert("로그인 성공");
		return true;
	}
}

