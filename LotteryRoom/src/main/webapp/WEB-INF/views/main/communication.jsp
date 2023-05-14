<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<script src="https://t1.kakaocdn.net/kakao_js_sdk/2.1.0/kakao.min.js"
  integrity="sha384-dpu02ieKC6NUeKFoGMOKz6102CLEWi9+5RQjWSV0ikYSFFd8M3Wp2reIcquJOemx" crossorigin="anonymous"></script>
<script>
  Kakao.init('e2c2c7baf351005289e1b04b186f5015'); // 사용하려는 앱의 JavaScript 키 입력
</script>

<a id="chat-channel-button" href="javascript:chatChannel()">
  <img src="./images/kakaotalk.png" style="width:100px; height:100px;"
    alt="카카오톡 채널 채팅하기 버튼" />
</a>

<script>
  function chatChannel() {
    Kakao.Channel.chat({
      channelPublicId: '_xhTxnYxj',
    });
  }
</script>