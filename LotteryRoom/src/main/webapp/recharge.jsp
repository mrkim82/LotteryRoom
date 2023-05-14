<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://js.tosspayments.com/v1/payment"></script>
</head>
<body>
<script>
	let payment = prompt('결제금액을 입력하세요');
	payment = Number(payment);
	var clientKey = 'test_ck_YZ1aOwX7K8mRqKkoMaa3yQxzvNPG' // 테스트용 클라이언트 키
    // 2. 결제창 SDK 초기화
    var tossPayments = TossPayments(clientKey)
    
	tossPayments.requestPayment('가상계좌', { // 결제수단 파라미터
	  // 결제 정보 파라미터
	  amount: payment,
	  orderId: 'YDXLHxUEprRxokshgHDj0',
	  orderName: '토스 티셔츠 외 2건',
	  customerName: '박토스',
	  successUrl: 'http://localhost:8081/com.lottery/plusMileage.do?userId=${UserId}&payment='+payment,
	  failUrl: 'http://localhost:8081/fail',
	  validHours: 24,
	  cashReceipt: {
	    type: '소득공제',
	  },
	})
  </script>
</body>
</html>