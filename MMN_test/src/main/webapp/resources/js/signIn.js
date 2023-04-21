let newId = false;
let newPw = false;
let newPw_confirm  = false;
let newName = false;
let newEmail = false;


function joinID() {
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
    else { 
		document.querySelector('#id_noti').style.display = "none";
		newId=true; 
	}
}

function joinPW() {
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
        newPw=true;
    }

}

function joinPWConfirm() {
    let PW_txtbx = document.querySelector('#user_pw');
    let PW_confirm = document.querySelector('#pw_confirm');

    if (PW_confirm.value == "") {
        document.querySelector('#PWConfirm_noti').innerHTML = "필수값입니다";
    }
    if (PW_txtbx.value == PW_confirm.value && PW_confirm.value !== "") {
        document.querySelector('#PWConfirm_noti').style.display = "none";
        newPw_confirm = true;
    }
    if (PW_txtbx.value !== PW_confirm.value) {
        document.querySelector('#PWConfirm_noti').style.display = "block";
        document.querySelector('#PWConfirm_noti').innerHTML = "비밀번호가 일치하지 않습니다.";
    }
}

function joinName() {
    let Name_txtbx = document.querySelector('#user_name');
    let regName = /^[가-힣]{2,4}|[a-zA-Z]{2,10}$/;

    if (Name_txtbx.value == "") {
        document.querySelector('#name_noti').style.display = "block";
        document.querySelector('#name_noti').innerHTML = "필수값입니다";
    } else if (!regName.test(Name_txtbx.value)) {
        document.querySelector('#name_noti').style.display = "block";
        document.querySelector('#name_noti').innerHTML = "한글과 영문 대 소문자를 사용하세요. (특수기호, 공백 사용 불가)";
    } else { document.querySelector('#name_noti').style.display = "none"; 
    newName = true;}
}


function joinEmail() {
    let email = document.querySelector('#user_email');
    let regEmail = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i;

    if (email.value == "") {
        document.querySelector('#email_noti').style.display = "block";
        document.querySelector('#email_noti').innerHTML = "필수값입니다";
    } else if (!regEmail.test(email.value)) {
        document.querySelector('#email_noti').style.display = "block";
        document.querySelector('#email_noti').innerHTML = "이메일 주소를 다시 확인해주세요.";
    } else {
        document.querySelector('#email_noti').style.display = "none";
        newEmail = true;
    }
}

function cancel_join() {
    document.querySelector('#user_id').value = null;
    document.querySelector('#user_pw').value = null;
    document.querySelector('#pw_confirm').value = null;
    document.querySelector('#user_name').value = null;
    document.querySelector('#user_email').value = null;
    document.querySelector('#user_photo').value = null;
       
    document.querySelector('#id_noti').style.display = "none";
    document.querySelector('#pw_noti').style.display = "none";
    document.querySelector('#PWConfirm_noti').style.display = "none";
    document.querySelector('#name_noti').style.display = "none";
    document.querySelector('#email_noti').style.display = "none";
}


function mySubmit() {
	
	if(newId==false || newPw==false || newPw_confirm==false || newName==false || newEmail==false) {
		alert("필수 회원가입 정보를 확인해주세요.");
		return false;
	} else {
		alert("가입 성공");
		return true;
	}
}

