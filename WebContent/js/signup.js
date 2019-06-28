(function(){

const ryan = document.querySelector('#ryan');
const face = document.querySelectorAll('.ears, .eyes, .muzzle');
const id = document.querySelector('input[type="text"]');
const passwordCheck = document.querySelector('#pwCheck');
const password = document.querySelector('input[type="password"]');
const name = document.querySelector('#namefocus');
const birth = document.querySelector('#birthfocus');
const email = document.querySelector('#emailfocus');
const fauxInput = document.createElement('div');
const span = document.createElement('span');
let timer = null;

function rotate3d(x, y, z, rad) {
    const value = `rotate3d(${x}, ${y}, ${z}, ${rad}rad)`;
    for (let i=0; i < face.length; i++) {
        face[i].style.transform = value;
    }
}

function focus(event) {
    event.target.classList.add('focused');
    copyStyles(event.target);
    event.target.type === 'password' ? lookAway(event) : look(event);
}

function reset(event) {
    event.target.classList.remove('focused');
    ryan.classList.remove('playing');

    clearTimeout(timer);
    timer = setTimeout( () => {
        ryan.classList.remove('look-away', 'down', 'up');
        rotate3d(0,0,0,0);
    }, 1 );
}

function copyStyles(el) {
    const props = window.getComputedStyle(el, null);

    if ( fauxInput.parentNode === document.body ) {
        document.body.removeChild(fauxInput);
    }

    fauxInput.style.visibility = 'hidden';
    fauxInput.style.position = 'absolute';
    fauxInput.style.top = Math.min(el.offsetHeight * -2, -999) + 'px';

    for(let i=0; i < props.length; i++) {
        if (['visibility','display','opacity','position','top','left','right','bottom'].indexOf(props[i]) !== -1) {
            continue;
        }
        fauxInput.style[props[i]] = props.getPropertyValue(props[i]);
    }

    document.body.appendChild(fauxInput);
}

function look(event) {
    const el = event.target;
    const text = el.value.substr(0, el.selectionStart);

    span.innerText = text || '.';

    const ryanRect = ryan.getBoundingClientRect();
    const inputRect = el.getBoundingClientRect();
    const caretRect = span.getBoundingClientRect();
    const caretPos = caretRect.left + Math.min(caretRect.width, inputRect.width) * !!text;
    const distCaret = ryanRect.left + ryanRect.width/2 - inputRect.left - caretPos;
    const distInput = ryanRect.top + ryanRect.height/2 - inputRect.top;
    const y = Math.atan2(-distCaret, Math.abs(distInput)*3);
    const x =  Math.atan2(distInput, Math.abs(distInput)*3 / Math.cos(y));
    const angle = Math.max(Math.abs(x), Math.abs(y));

    rotate3d(x/angle, y/angle, y/angle/2, angle);
}

function lookAway(event) {
    const el = event.target;
    const ryanRect = ryan.getBoundingClientRect();
    const inputRect = el.getBoundingClientRect();
    const distInput = ryanRect.top + ryanRect.height/2 - inputRect.top;

    ryan.classList.add( 'look-away', distInput < 0 ? 'up' : 'down' );

    clearTimeout(timer);
    timer = setTimeout( () => {
        ryan.classList.add( 'playing' );
    }, 300);
}

fauxInput.appendChild(span);

id.addEventListener( 'focus', focus, false );
id.addEventListener( 'keyup', look, false );
id.addEventListener( 'click', look, false );
id.addEventListener( 'blur', reset, false );

password.addEventListener( 'focus', lookAway, false );
password.addEventListener( 'blur', reset, false );

passwordCheck.addEventListener( 'focus', lookAway, false );
passwordCheck.addEventListener( 'blur', reset, false );

name.addEventListener( 'focus', focus, false );
name.addEventListener( 'keyup', look, false );
name.addEventListener( 'click', look, false );
name.addEventListener( 'blur', reset, false );

birth.addEventListener( 'focus', focus, false );
birth.addEventListener( 'keyup', look, false );
birth.addEventListener( 'click', look, false );
birth.addEventListener( 'blur', reset, false );

email.addEventListener( 'focus', focus, false );
email.addEventListener( 'keyup', look, false );
email.addEventListener( 'click', look, false );
email.addEventListener( 'blur', reset, false );
})();

function checkValue() {
	let form = document.userInfo;
	let emailCheck = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i;
	let Check = /^[a-zA-Z0-9]{4,12}$/; // 아이디 비번유효성 검사 정규식
	let birthCheck =/^(19[0-9][0-9]|20\d{2})(0[0-9]|1[0-2])(0[1-9]|[1-2][0-9]|3[0-1])$/;
	
	
	if(!form.id.value){
		alert("아이디를 입력하세요.");
		return false;
	}
	if(form.idVal.value !="idCheck"){
		alert("아이디 중복체크를 해주세요.");
		return false;
	}
	if(!Check.test(form.id.value)){
		alert("아이디는 4~12자의 영문 대소문자와 숫자로만 입력 해주세요.")
		return false;
	}
	if(!form.pw.value){
		alert("비밀번호를 입력하세요.");
		return false;
	}
	if(!Check.test(form.pw.value)){
		alert("비밀번호는  4~12자의 영문 대소문자와 숫자로만 입력 해주세요.")
		return false;
	}
	if(form.pw.value != form.pwCheck.value){
		alert("비밀번호와 비밀번호확인란을 동일하게 입력하세요.");
		return false;
	}
	if(!form.name.value){
		alert("이름을 입력하세요.");
		return false;
	}
	if(form.email.value==""){
		alert("이메일을 입력해 주세요.");
		return false;
	}
	if(!emailCheck.test(form.email.value)){
		alert("적합하지 않은 이메일 형식입니다.");
		return false;
	}
	if(isNaN(form.birth.value)){
		alert("생년월일의 양식에 맞지 않습니다. ex)2000년 10월 30일생  ->20001030");
		return false;	
	}if(!birthCheck.test(form.birth.value)){
		alert("생년월일의 양식에 맞지 않습니다. ex)2000년 10월 30일생  ->20001030");
		return false;
	} 

}
function openIdChk(){
	window.name = "parentForm"; //부모창 이름
	window.open("idCheckForm.jsp","checkForm","width=500, height=300 resizable=no, scrollbars=no");
}
function inputIdChk(){ //아이디 중복체크 여부
	document.userInfo.idVal.value ="idNoCheck";
}