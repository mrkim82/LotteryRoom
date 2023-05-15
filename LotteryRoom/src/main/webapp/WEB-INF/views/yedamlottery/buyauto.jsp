<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
table{
 color: transparent;
 text-shadow: 0 0 0 black;
 }
.image{
   align-items: center;
   float: left;
   margin-right : 100px;
}
.lottery-container {
   display: flex;
   align-items: center;
   
}
.btn:hover{
   background-color:#002ead;
      transition: 0.7s;
      border-width : 1px;
      color : white;
}
.btn{
   width: 50px;
    height: 50px;
   font-size: 30px;
   border-width : 1px ;
   background-color: rgba(98, 93, 93, 0);
   font-size : 20px;
   border: 1px solid gray;
   margin: 5px;
   
   border-radius: 30px;
}

.divLine{
   border-bottom: solid 1px black;
   border-top: solid 1px black;
}
.image img {
   width:300px;
   height:300px;
}
.buybtn {
   width:100px;
   height:50px;
   margin-left:400px;
   background-color: rgb(61, 50, 182);
   color: white;
}
</style>
</head>
<body>
 	<h2><strong>자동복권구매</strong></h2>
 	<hr>
   <div class="image">
      <div class="lottery-container">
         <div style="width:300px" >
            <img src="images/로또추첨기.png" style="">
            적용수량 <input style="margin-left: 50px;" type="number" value="1" min="1" max="5" name="count" id="count" onclick=change()>
            <button style="background-color: rgb(61, 50, 182); color: white; width: 50px; margin-left: 30px;"
             type="button" id="btn0" onclick=random()>확인</button>
         </div>
         <div>
         <form action="addAuto.do" >
         <input id="formcount" type="text" name="count" value="1" style="display:none">
         <input id="userNo" type="text" name="UserNo" value="${UserNo }" style="display:none">
         <input id="LtTimes" type="text" name="LtTimes" value="${LtTimes }" style="display:none">
         <input id="realMileage" type="text" name="realMileage" value="${Mileage }" style="display:none">
         <input id="userId" type="text" name="userId" value="${UserId }" style="display:none">
         <table>
         <tr><td><p>선택번호 확인</p></td></tr>
         <tr class="check" style="border-top: solid 1px; border-color: black">
            <td><p>A 자동</p></td>
            <td><input type="text" class="btn" id="btnA1" name="btnA1" value=""></td>
            <td><input type="text" class="btn" id="btnA2" name="btnA2" value=""></td>
            <td><input type="text" class="btn" id="btnA3" name="btnA3" value=""></td>
            <td><input type="text" class="btn" id="btnA4" name="btnA4" value=""></td>
            <td><input type="text" class="btn" id="btnA5" name="btnA5" value=""></td>
            <td><input type="text" class="btn" id="btnA6" name="btnA6" value=""></td>
           <td><button type="button" onclick=deleteData1()>삭제</button></td>
         </tr>
         <tr class="check">
            <td><p>B 자동</p></td>
            <td><input type="text" class="btn" id="btnB1" name="btnB1" value=""></td>
            <td><input type="text" class="btn" id="btnB2" name="btnB2" value=""></td>
            <td><input type="text" class="btn" id="btnB3" name="btnB3" value=""></td>
            <td><input type="text" class="btn" id="btnB4" name="btnB4" value=""></td>
            <td><input type="text" class="btn" id="btnB5" name="btnB5" value=""></td>
            <td><input type="text" class="btn" id="btnB6" name="btnB6" value=""></td>
            <td><button type="button" onclick=deleteData2()>삭제</button></td>
         </tr>
         <tr class="check">
            <td><p>C 자동</p></td>
            <td><input type="text" class="btn" id="btnC1" name="btnC1" value=""></td>
            <td><input type="text" class="btn" id="btnC2" name="btnC2" value=""></td>
            <td><input type="text" class="btn" id="btnC3" name="btnC3" value=""></td>
            <td><input type="text" class="btn" id="btnC4" name="btnC4" value=""></td>
            <td><input type="text" class="btn" id="btnC5" name="btnC5" value=""></td>
            <td><input type="text" class="btn" id="btnC6" name="btnC6" value=""></td>
            <td><button type="button" onclick=deleteData3()>삭제</button></td>
         </tr>
         <tr class="check">                                            
            <td><p>D 자동</p></td>                                     
            <td><input type="text" class="btn" id="btnD1" name="btnD1" value=""></td>
            <td><input type="text" class="btn" id="btnD2" name="btnD2" value=""></td>
            <td><input type="text" class="btn" id="btnD3" name="btnD3" value=""></td>
            <td><input type="text" class="btn" id="btnD4" name="btnD4" value=""></td>
            <td><input type="text" class="btn" id="btnD5" name="btnD5" value=""></td>
            <td><input type="text" class="btn" id="btnD6" name="btnD6" value=""></td>
            <td><button type="button" onclick=deleteData4()>삭제</button></td>
         </tr>
         <tr class="check" >                                           
            <td><p>E 자동</p></td>                                     
            <td><input type="text" class="btn" id="btnE1" name="btnE1" value=""></td>
            <td><input type="text" class="btn" id="btnE2" name="btnE2" value=""></td>
            <td><input type="text" class="btn" id="btnE3" name="btnE3" value=""></td>
            <td><input type="text" class="btn" id="btnE4" name="btnE4" value=""></td>
            <td><input type="text" class="btn" id="btnE5" name="btnE5" value=""></td>
            <td><input type="text" class="btn" id="btnE6" name="btnE6" value=""></td>
            <td><button type="button" onclick=deleteData5()>삭제</button></td>
         </tr>
         <tr style="border-top: solid 1px; border-color: black"></tr>
      </table>
      <table style="width:300px;margin:20px; text-align: center; padding: 0px;">
         <tr>
            <td style="border-right:1px black solid;">보유예치금</td>
            <td>결제금액</td>
         </tr>
         <tr style="padding:0px;">
            <td id="usermilege" style="border-right:1px black solid;"></td>
            <td id="lottoprice"><input id="lotteryprice" type="text" name="price" value="0원" readonly  style="width:60px;border:0px "> </td>
         </tr>
      </table>
      <button id="submit" style="margin-left: 400px;" type="submit" class="buybtn" >구매하기</button>
      </form>
   </div>
   </div>
   </div>
</body>
<script>
let usermilege = document.getElementById('usermilege');
var milege = ${Mileage }
document.getElementById("usermilege").innerHTML = milege.toFixed().replace(/\B(?<!\.\d*)(?=(\d{3})+(?!\d))/g, ",") + "원";

document.querySelector('#submit').addEventListener('click',function(){
	let countbtn = document.getElementById('btn0');
	let count = countbtn.parentElement.children[1].value;
	let myself = document.querySelector('#submit');
	let check = document.querySelectorAll('.check');
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
			if(check[0].children[1].children[0].value ==''){
				alert('번호를 작성하세요')
			}else{
				myself.type = 'submit';
			}
	}
	if(count == 2 ){
		for(let i = 0 ; i < count ; i++){
			if(check[i].children[1].children[0].value ==''){
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
			if(check[i].children[1].children[0].value ==''){
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
			if(check[i].children[1].children[0].value ==''){
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
			if(check[i].children[1].children[0].value ==''){
				alert('번호를 작성하세요')
				myself.type = 'button';
				break;
			}else{
				myself.type = 'submit';
			}
		}
	}
})
   
function random(){
   
   let countbtn = document.getElementById('btn0');
   let count = countbtn.parentElement.children[1].value;
   var calculatedValue = count * 1000;
   document.getElementById("lottoprice").children[0].value = calculatedValue.toFixed().replace(/\B(?<!\.\d*)(?=(\d{3})+(?!\d))/g, ",") + "원";
   var lotto = []; //6개로 값이 나열될것이기 때문에 배열처리 - 값은 담지 않음
      
   //6번처리 - 반복문
   for(var k=1; k<=count ; k++){
      for(var i=0;i<6;i++){
         //새로 추가될 숫자 : 1~45사이의 숫자가 랜덤하게 처리
         //random() : 0~1미만사이의 랜덤한 소수
         //floor() : 내림처리해서 정수로 변경
         var num = Math.floor(Math.random() * 45) + 1;
      
         //현재 상태는 같은 숫자가 나올수 있음
         //lotto라는 배열에 담긴 숫자와 같이 같으면 안됨
         for(var j in lotto){
            while(num == lotto[j]){ //현재 새로나온 숫자가 기존 숫자와 같으면
               num = Math.floor(Math.random() * 45) + 1;
            }
         }
         //push() - 배열에 마지막에 값추가메서드
         lotto.push(num);
         
         if(k==1 && i==5){
            let ltFir = document.getElementById('btnA1');
            let ltSec = document.getElementById('btnA2');
            let ltThr = document.getElementById('btnA3');
            let ltFour = document.getElementById('btnA4');
            let ltFive = document.getElementById('btnA5');
            let ltSix = document.getElementById('btnA6');
            ltFir.value = lotto[0];
            ltSec.value = lotto[1];
            ltThr.value = lotto[2];
            ltFour.value = lotto[3];
            ltFive.value = lotto[4];
            ltSix.value = lotto[5];
         } else if(k==2 && i==5){
            let ltFir = document.getElementById('btnB1');
            let ltSec = document.getElementById('btnB2');
            let ltThr = document.getElementById('btnB3');
            let ltFour = document.getElementById('btnB4');
            let ltFive = document.getElementById('btnB5');
            let ltSix = document.getElementById('btnB6');
            ltFir.value = lotto[0];
            ltSec.value = lotto[1];
            ltThr.value = lotto[2];
            ltFour.value = lotto[3];
            ltFive.value = lotto[4];
            ltSix.value = lotto[5];
         } else if(k==3 && i==5){
            let ltFir = document.getElementById('btnC1');
            let ltSec = document.getElementById('btnC2');
            let ltThr = document.getElementById('btnC3');
            let ltFour = document.getElementById('btnC4');
            let ltFive = document.getElementById('btnC5');
            let ltSix = document.getElementById('btnC6');
            ltFir.value = lotto[0];
            ltSec.value = lotto[1];
            ltThr.value = lotto[2];
            ltFour.value = lotto[3];
            ltFive.value = lotto[4];
            ltSix.value = lotto[5];
         } else if(k==4 && i==5){
            let ltFir = document.getElementById('btnD1');
            let ltSec = document.getElementById('btnD2');
            let ltThr = document.getElementById('btnD3');
            let ltFour = document.getElementById('btnD4');
            let ltFive = document.getElementById('btnD5');
            let ltSix = document.getElementById('btnD6');
            ltFir.value = lotto[0];
            ltSec.value = lotto[1];
            ltThr.value = lotto[2];
            ltFour.value = lotto[3];
            ltFive.value = lotto[4];
            ltSix.value = lotto[5];
         } else if(k==5 && i==5){
            let ltFir = document.getElementById('btnE1');
            let ltSec = document.getElementById('btnE2');
            let ltThr = document.getElementById('btnE3');
            let ltFour = document.getElementById('btnE4');
            let ltFive = document.getElementById('btnE5');
            let ltSix = document.getElementById('btnE6');
            ltFir.value = lotto[0];
            ltSec.value = lotto[1];
            ltThr.value = lotto[2];
            ltFour.value = lotto[3];
            ltFive.value = lotto[4];
            ltSix.value = lotto[5];
         } else if(count == 1){
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
            ltFir = document.getElementById('btnC1');
            ltSec = document.getElementById('btnC2');
            ltThr = document.getElementById('btnC3');
            ltFour = document.getElementById('btnC4');
            ltFive = document.getElementById('btnC5');
            ltSix = document.getElementById('btnC6');
            ltFir.value = "";
            ltSec.value = "";
            ltThr.value = "";
            ltFour.value = "";
            ltFive.value = "";
            ltSix.value = "";
            ltFir = document.getElementById('btnD1');
            ltSec = document.getElementById('btnD2');
            ltThr = document.getElementById('btnD3');
            ltFour = document.getElementById('btnD4');
            ltFive = document.getElementById('btnD5');
            ltSix = document.getElementById('btnD6');
            ltFir.value = "";
            ltSec.value = "";
            ltThr.value = "";
            ltFour.value = "";
            ltFive.value = "";
            ltSix.value = "";
            ltFir = document.getElementById('btnE1');
            ltSec = document.getElementById('btnE2');
            ltThr = document.getElementById('btnE3');
            ltFour = document.getElementById('btnE4');
            ltFive = document.getElementById('btnE5');
            ltSix = document.getElementById('btnE6');
            ltFir.value = "";
            ltSec.value = "";
            ltThr.value = "";
            ltFour.value = "";
            ltFive.value = "";
            ltSix.value = "";
         } else if(count == 2){
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
            ltFir = document.getElementById('btnD1');
            ltSec = document.getElementById('btnD2');
            ltThr = document.getElementById('btnD3');
            ltFour = document.getElementById('btnD4');
            ltFive = document.getElementById('btnD5');
            ltSix = document.getElementById('btnD6');
            ltFir.value = "";
            ltSec.value = "";
            ltThr.value = "";
            ltFour.value = "";
            ltFive.value = "";
            ltSix.value = "";
            ltFir = document.getElementById('btnE1');
            ltSec = document.getElementById('btnE2');
            ltThr = document.getElementById('btnE3');
            ltFour = document.getElementById('btnE4');
            ltFive = document.getElementById('btnE5');
            ltSix = document.getElementById('btnE6');
            ltFir.value = "";
            ltSec.value = "";
            ltThr.value = "";
            ltFour.value = "";
            ltFive.value = "";
            ltSix.value = "";
         } else if(count == 3){
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
            ltFir = document.getElementById('btnE1');
            ltSec = document.getElementById('btnE2');
            ltThr = document.getElementById('btnE3');
            ltFour = document.getElementById('btnE4');
            ltFive = document.getElementById('btnE5');
            ltSix = document.getElementById('btnE6');
            ltFir.value = "";
            ltSec.value = "";
            ltThr.value = "";
            ltFour.value = "";
            ltFive.value = "";
            ltSix.value = "";
         } else if(count == 4){
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
         
      if(i == 5){
        while(lotto.length > 0) {
             lotto.pop();
         }

      }
         //오름차순으로 숫자 정렬
         lotto.sort(function(a,b){
            return a - b;      
         });
      }
   }
   
   
   
}

function deleteData1() {
      let ltFir = document.getElementById('btnA1');
      let lottoprice = document.getElementById('lottoprice');
      let price = lottoprice.children[0].value;
      let calculatedValue = 0;
      if (ltFir.value !== "") {
        calculatedValue = parseInt(price.replace(/,/g, "")) - 1000;
        if (calculatedValue < 0) {
          calculatedValue = 0;
        }
      }else{
       calculatedValue = parseInt(price.replace(/,/g, ""));
      }
      document.getElementById("lottoprice").children[0].value = calculatedValue ? calculatedValue.toFixed().replace(/\B(?<!\.\d*)(?=(\d{3})+(?!\d))/g, ",") + "원" : "";
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
   let lottoprice = document.getElementById('lottoprice');
   let price = lottoprice.children[0].value;
   let calculatedValue = 0;
   if (ltFir.value !== "") {
     calculatedValue = parseInt(price.replace(/,/g, "")) - 1000;
     if (calculatedValue < 0) {
       calculatedValue = 0;
     }
   }else{
    calculatedValue = parseInt(price.replace(/,/g, ""));
   }
   document.getElementById("lottoprice").children[0].value = calculatedValue ? calculatedValue.toFixed().replace(/\B(?<!\.\d*)(?=(\d{3})+(?!\d))/g, ",") + "원" : "";
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
   let lottoprice = document.getElementById('lottoprice');
   let price = lottoprice.children[0].value;
   let calculatedValue = 0;
   if (ltFir.value !== "") {
     calculatedValue = parseInt(price.replace(/,/g, "")) - 1000;
     if (calculatedValue < 0) {
       calculatedValue = 0;
     }
   }else{
    calculatedValue = parseInt(price.replace(/,/g, ""));
   }
   document.getElementById("lottoprice").children[0].value = calculatedValue ? calculatedValue.toFixed().replace(/\B(?<!\.\d*)(?=(\d{3})+(?!\d))/g, ",") + "원" : "";
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
   let lottoprice = document.getElementById('lottoprice');
   let price = lottoprice.children[0].value;
   let calculatedValue = 0;
   if (ltFir.value !== "") {
     calculatedValue = parseInt(price.replace(/,/g, "")) - 1000;
     if (calculatedValue < 0) {
       calculatedValue = 0;
     }
   }else{
    calculatedValue = parseInt(price.replace(/,/g, ""));
   }
   document.getElementById("lottoprice").children[0].value = calculatedValue ? calculatedValue.toFixed().replace(/\B(?<!\.\d*)(?=(\d{3})+(?!\d))/g, ",") + "원" : "";
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
   let lottoprice = document.getElementById('lottoprice');
   let price = lottoprice.children[0].value;
   let calculatedValue = 0;
   if (ltFir.value !== "") {
     calculatedValue = parseInt(price.replace(/,/g, "")) - 1000;
     if (calculatedValue < 0) {
       calculatedValue = 0;
     }
   }else{
    calculatedValue = parseInt(price.replace(/,/g, ""));
   }
   document.getElementById("lottoprice").children[0].value = calculatedValue ? calculatedValue.toFixed().replace(/\B(?<!\.\d*)(?=(\d{3})+(?!\d))/g, ",") + "원" : "";
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

	function change(){
		document.getElementById('formcount').value=document.querySelector('input[type=number]').value;
	}
	

</script>
</html>