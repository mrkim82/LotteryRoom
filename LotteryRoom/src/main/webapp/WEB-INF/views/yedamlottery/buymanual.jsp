<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>

.checked{
	border:3px black solid;
}
.lottery-container {
   display: flex;
   align-items: center;
   
}
.btn1:hover{
   background-color:#002ead;
      transition: 0.7s;
      border-width : 1px;
      color : white;
      text-align :center;
}
.btn1{
   width: 50px;
   height: 50px;
   font-size: 30px;
   border-width : 1px ;
   background-color: rgba(98, 93, 93, 0);
   font-size : 20px;
   border: 1px solid gray;
   margin: 5px;
   border-radius: 30px;
   text-align :center;
}
.divLine{
   border-bottom: solid 1px black;
   border-top: solid 1px black;
}
.buybtn {
   width:100px;
   height:50px;
   margin-left:400px;
   background-color: rgb(61, 50, 182);
   color: white;
}
.btn {
    padding: 5px 10px;
    margin: 0px;
    background-color: lightgray;
    border: 1px solid darkgray;
    cursor: pointer;
    border-radius: 12px;
    
}
.btn-selected {
    background-color: rgb(21, 12, 81);
    color: white;
}
#button-container {
    text-align : center;
    display: grid;
    grid-template-columns: repeat(7, 1fr);
    gap: 10px;
    justify-items: center;
    margin: 0 auto;
    width: 80%;
    max-width: 350px;
    float: left;
    margin-top:50px;
    margin-right:50px;
    position: relative;
	left:80px;
}
#table-container {
	margin-right : 150px;
	/* width: 80%; */
	float: right;
	width: 500px;
	position: relative;
	left:80px;
}
#lottery-container {
	float: right;
}
form {
  display: inline-block;
  float:right;
  
}
.span1{
	position: relative;
	top:40px;
}
.image{
position: relative;
right: 450px;
}
</style>
</head>
<body>
<h2><strong>수동복권구매</strong></h2>
 	<hr>
<div id="button-container" class="col-lg-4"></div>
      <div id="lottery-container" class="col-lg-6">
         <div style="width:300px" >
         </div>
         <div>
         <form action="addAuto.do">
         <input id="formcount" type="text" name="count" value="1" style="display:none">
         <input id="userNo" type="text" name="UserNo" value="${UserNo }" style="display:none">
         <input id="LtTimes" type="text" name="LtTimes" value="${LtTimes }" style="display:none">
         <input id="realMileage" type="text" name="realMileage" value="${Mileage }" style="display:none">
         <input id="userId" type="text" name="userId" value="${UserId }" style="display:none">
         <div id="table-container" >
         <span class="span1">선택번호 확인</span>
         <table style="margin-top:50px;">
         <!-- <tr><td><p style="display:inline-block; width:50px; height:40px;">선택번호 확인</p> -->
         <select class="span1" id="selectBox" onclick=priceSelect(this)><option>1</option><option>2</option><option>3</option><option>4</option><option>5</option></select>
         <!-- </td></tr> -->
         <tr class="number" style="border-top: solid 1px; border-color: black;" onclick=addClass(this)>
            <td><p style="width:50px;">A 자동</p></td>
            <td><input type="text" class="btn1" id="btnA1" name="btnA1" value=""></td>
            <td><input type="text" class="btn1" id="btnA2" name="btnA2" value=""></td>
            <td><input type="text" class="btn1" id="btnA3" name="btnA3" value=""></td>
            <td><input type="text" class="btn1" id="btnA4" name="btnA4" value=""></td>
            <td><input type="text" class="btn1" id="btnA5" name="btnA5" value=""></td>
            <td><input type="text" class="btn1" id="btnA6" name="btnA6" value=""></td>
           <td><button type="button" onclick=deleteData1()>삭제</button></td>
         </tr>
         <tr class="number" onclick=addClass(this)>
            <td><p>B 자동</p></td>
            <td><input type="text" class="btn1" id="btnB1" name="btnB1" value=""></td>
            <td><input type="text" class="btn1" id="btnB2" name="btnB2" value=""></td>
            <td><input type="text" class="btn1" id="btnB3" name="btnB3" value=""></td>
            <td><input type="text" class="btn1" id="btnB4" name="btnB4" value=""></td>
            <td><input type="text" class="btn1" id="btnB5" name="btnB5" value=""></td>
            <td><input type="text" class="btn1" id="btnB6" name="btnB6" value=""></td>
            <td><button type="button" onclick=deleteData2()>삭제</button></td>
         </tr>
         <tr class="number" onclick=addClass(this)>
            <td><p>C 자동</p></td>
            <td><input type="text" class="btn1" id="btnC1" name="btnC1" value=""></td>
            <td><input type="text" class="btn1" id="btnC2" name="btnC2" value=""></td>
            <td><input type="text" class="btn1" id="btnC3" name="btnC3" value=""></td>
            <td><input type="text" class="btn1" id="btnC4" name="btnC4" value=""></td>
            <td><input type="text" class="btn1" id="btnC5" name="btnC5" value=""></td>
            <td><input type="text" class="btn1" id="btnC6" name="btnC6" value=""></td>
            <td><button type="button" onclick=deleteData3()>삭제</button></td>
         </tr>
         <tr class="number" onclick=addClass(this)>
            <td><p>D 자동</p></td>
            <td><input type="text" class="btn1" id="btnD1" name="btnD1" value=""></td>
            <td><input type="text" class="btn1" id="btnD2" name="btnD2" value=""></td>
            <td><input type="text" class="btn1" id="btnD3" name="btnD3" value=""></td>
            <td><input type="text" class="btn1" id="btnD4" name="btnD4" value=""></td>
            <td><input type="text" class="btn1" id="btnD5" name="btnD5" value=""></td>
            <td><input type="text" class="btn1" id="btnD6" name="btnD6" value=""></td>
            <td><button type="button" onclick=deleteData4()>삭제</button></td>
         </tr>
         <tr class="number" onclick=addClass(this)>
            <td><p>E 자동</p></td>
            <td><input type="text" class="btn1" id="btnE1" name="btnE1" value=""></td>
            <td><input type="text" class="btn1" id="btnE2" name="btnE2" value=""></td>
            <td><input type="text" class="btn1" id="btnE3" name="btnE3" value=""></td>
            <td><input type="text" class="btn1" id="btnE4" name="btnE4" value=""></td>
            <td><input type="text" class="btn1" id="btnE5" name="btnE5" value=""></td>
            <td><input type="text" class="btn1" id="btnE6" name="btnE6" value=""></td>
            <td><button type="button" onclick=deleteData5()>삭제</button></td>
         </tr>
         <tr style="border-top: solid 1px; border-color: black"></tr>
      </table>
<div class="image">
<button id="reset" style="background-color: rgb(61, 50, 182); color: white; width: 70px;display:inline-block;" type="button"  >초기화</button>
 <button id="put" style="background-color: rgb(61, 50, 182); color: white; width: 50px;display:inline-block;" type="button"  >확인</button>
 </div>
      
      <table style="width:300px;margin:20px; text-align: center; padding: 0px;">
         <tr>
            <td style="border-right:1px black solid;">보유예치금</td>
            <td>결제금액</td>
         </tr>
         <tr style="padding:0px;">
            <td id="usermilege" style="border-right:1px black solid;"></td>
            <td id="lottoprice"><input id="lotteryprice" type="text" name="price" value="5,000" readonly  style="width:60px;border:0px "></td>
         </tr>
      </table>
      </div>
      <button id="submit" style="margin-left: 400px;" type="button" class="buybtn">구매하기</button>
      </form>
   </div>
   </div>
   </div>
</body>
<script>
var selectElement = document.getElementById('selectBox'); // 'selectBox'는 실제 <select> 요소의 id입니다.
selectElement.value = 5;
// 삭제한 값 안넘기기
document.querySelector('#submit').addEventListener('click',function(){
	
	let count = document.querySelector('select').value;
	let myself = document.querySelector('#submit');
	let numbers = document.querySelectorAll('.number');
	let form = document.querySelector('form');
	
	let ltprice = document.getElementById('lotteryprice');
	let lp = ltprice.value;

	if(parseInt(lp.replace(/,/g, "")) > ${Mileage}){
		alert('마일리지가 부족합니다.');
		myself.type = 'button';
		return;
	}else{
		myself.type = 'submit';
	}
	
	if(count == 1){
			if(numbers[0].children[1].children[0].value ==''){
				alert('번호를 작성하세요')
			}else{
				myself.type = 'submit';
			}
	}
	if(count == 2 ){
		for(let i = 0 ; i < count ; i++){
			if(numbers[i].children[1].children[0].value ==''){
				alert('번호를 작성하세요')
				myself.type = 'button';
				break;
			}else{
				myself.type = 'submit';
			}
		}
	}
	if(count == 3 ){
		for(let i = 0 ; i < count ; i++){
			if(numbers[i].children[1].children[0].value ==''){
				alert('번호를 작성하세요')
				myself.type = 'button';
				break;
			}else{
				myself.type = 'submit';
			}
		}
	}
	if(count == 4 ){
		for(let i = 0 ; i < count ; i++){
			if(numbers[i].children[1].children[0].value ==''){
				alert('번호를 작성하세요')
				myself.type = 'button';
				break;
			}else{
				myself.type = 'submit';
			}
		}
	}
	if(count == 5 ){
		for(let i = 0 ; i < count ; i++){
			if(numbers[i].children[1].children[0].value ==''){
				alert('번호를 작성하세요')
				myself.type = 'button';
				break;
			}else{
				myself.type = 'submit';
			}
		}
	}
})
const buttonContainer = document.getElementById('button-container');
for (let i = 1; i <= 45; i++) {
    const btn = document.createElement('button');
    btn.className = 'btn';
    btn.innerText = i;
    btn.onclick = function () {
        toggleColor(this);
    };

    buttonContainer.appendChild(btn);


}

let selectedCount = 0;

function toggleColor(btn) {
    if (btn.classList.contains("btn-selected")) {
        btn.classList.remove("btn-selected");
        selectedCount--;
    } else {
        if (selectedCount < 6) {
            btn.classList.add("btn-selected");
            selectedCount++;
        }
    }
}

let usermilege = document.getElementById('usermilege');
var milege = ${Mileage }
document.getElementById("usermilege").innerHTML = milege.toFixed().replace(/\B(?<!\.\d*)(?=(\d{3})+(?!\d))/g, ",") + "원";


// reset 기능
document.getElementById('reset').addEventListener('click',function(){
	let selectBtns = document.querySelectorAll('.btn-selected');
	for(i of selectBtns){
		i.classList.remove("btn-selected");
		selectedCount =0;
	}
})

//tr 클릭시 클래스 추가 
let checkedElement = null;

function addClass(thing) {
  if (checkedElement === thing) {
    thing.classList.remove("checked");
    checkedElement = null;
  } else {
    if (checkedElement !== null) {
      checkedElement.classList.remove("checked");
    }
    thing.classList.add("checked");
    checkedElement = thing;
  }
}
//select box 금액설정 
function priceSelect(thing){
	document.getElementById('formcount').value = thing.value;
	let lottoCount = thing.value;
	let numbers = document.querySelectorAll('.number');
	for(i of numbers){
		i.style.visibility = 'visible';
	}
	let lottoprice = document.getElementById('lottoprice');
    let price = lottoprice.innerText;
    let calculatedValue = 0;
    calculatedValue = lottoCount * 1000;
    document.getElementById("lottoprice").children[0].value = calculatedValue.toFixed().replace(/\B(?<!\.\d*)(?=(\d{3})+(?!\d))/g, ",") + "원";
    if(lottoCount == 1 ){
    	
    	for(let i = numbers.length-1 ; i >= lottoCount ; i--){
    		numbers[i].style.visibility = 'hidden';
    	}
    }
    if(lottoCount == 2){
    	for(let i = numbers.length-1 ; i >= lottoCount ; i--){
    		numbers[i].style.visibility = 'hidden';
    	}
    }
    if(lottoCount == 3){
    	for(let i = numbers.length-1 ; i >= lottoCount ; i--){
    		numbers[i].style.visibility = 'hidden';
    	}
    }
    if(lottoCount == 4){
    	for(let i = numbers.length-1 ; i >= lottoCount ; i--){
    		numbers[i].style.visibility = 'hidden';
    	}
    }
    
    if(lottoCount == 5){
    	for(let i = numbers.length-1 ; i >= lottoCount ; i--){
    		numbers[i].style.visibility = 'hidden';
    	}
    }
}
document.querySelector('select').value
// put 기능
document.getElementById('put').addEventListener('click',function(){
	
if(selectedCount == 6){

   
   
   var lotto = []; //6개로 값이 나열될것이기 때문에 배열처리 - 값은 담지 않음
   let btnSelect = document.querySelectorAll('.btn-selected');
   for(i of btnSelect){
	   lotto.push(i.innerText);
   }
         //오름차순으로 숫자 정렬
         lotto.sort(function(a,b){
            return a - b;      
         });
         
        
         let ltFir = document.querySelector('.checked').children[1];
         let ltSec = document.querySelector('.checked').children[2];
         let ltThr = document.querySelector('.checked').children[3];
         let ltFour = document.querySelector('.checked').children[4];
         let ltFive = document.querySelector('.checked').children[5];
         let ltSix = document.querySelector('.checked').children[6];
         ltFir.children[0].value = lotto[0];
         ltSec.children[0].value = lotto[1];
         ltThr.children[0].value = lotto[2];
         ltFour.children[0].value = lotto[3];
         ltFive.children[0].value = lotto[4];
         ltSix.children[0].value = lotto[5];
         
         
}else{
	alert('여섯개 번호를 선택해주세요.')
	return;
}
})
   


function deleteData1() {
      let ltFir = document.getElementById('btnA1');
      let ltSec = document.getElementById('btnA2');
      let ltThr = document.getElementById('btnA3');
      let ltFour = document.getElementById('btnA4');
      let ltFive = document.getElementById('btnA5');
      let ltSix = document.getElementById('btnA6');
      ltFir.value = "";
      ltSec.value = "";
      ltThr.value = "";
      ltFour.value = "";
      ltFive.value = "";
      ltSix.value = "";
}
function deleteData2() {
   let ltFir = document.getElementById('btnB1');
   let ltSec = document.getElementById('btnB2');
   let ltThr = document.getElementById('btnB3');
   let ltFour = document.getElementById('btnB4');
   let ltFive = document.getElementById('btnB5');
   let ltSix = document.getElementById('btnB6');
   ltFir.value = "";
   ltSec.value = "";
   ltThr.value = "";
   ltFour.value = "";
   ltFive.value = "";
   ltSix.value = "";
}
function deleteData3() {
   let ltFir = document.getElementById('btnC1');
   let ltSec = document.getElementById('btnC2');
   let ltThr = document.getElementById('btnC3');
   let ltFour = document.getElementById('btnC4');
   let ltFive = document.getElementById('btnC5');
   let ltSix = document.getElementById('btnC6');
   ltFir.value = "";
   ltSec.value = "";
   ltThr.value = "";
   ltFour.value = "";
   ltFive.value = "";
   ltSix.value = "";
}
function deleteData4() {
   let ltFir = document.getElementById('btnD1');
   let ltSec = document.getElementById('btnD2');
   let ltThr = document.getElementById('btnD3');
   let ltFour = document.getElementById('btnD4');
   let ltFive = document.getElementById('btnD5');
   let ltSix = document.getElementById('btnD6');
   ltFir.value = "";
   ltSec.value = "";
   ltThr.value = "";
   ltFour.value = "";
   ltFive.value = "";
   ltSix.value = "";
}
function deleteData5() {
   let ltFir = document.getElementById('btnE1');
   let ltSec = document.getElementById('btnE2');
   let ltThr = document.getElementById('btnE3');
   let ltFour = document.getElementById('btnE4');
   let ltFive = document.getElementById('btnE5');
   let ltSix = document.getElementById('btnE6');
   ltFir.value = "";
   ltSec.value = "";
   ltThr.value = "";
   ltFour.value = "";
   ltFive.value = "";
   ltSix.value = "";
}
</script>
</html>