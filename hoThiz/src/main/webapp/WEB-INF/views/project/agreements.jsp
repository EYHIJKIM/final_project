<%@ page language="java"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>프로젝트 만들기 : 핫디즈</title>

<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script type="text/javascript">
function check(){
   if(document.checkList.ideaChk.checked == false){
      alert("모든 항목에 동의해야 진행 가능합니다.");
      document.checkList.ideaChk.focus();
   }else if(document.checkList.overChk.checked == false){
      alert("모든 항목에 동의해야 진행 가능합니다.");
      document.checkList.overChk.focus();
   }else if(document.checkList.callChk.checked == false){
      alert("모든 항목에 동의해야 진행 가능합니다.");
      document.checkList.callChk.focus();
   }else if(document.checkList.ageChk.checked == false){
      alert("모든 항목에 동의해야 진행 가능합니다.");
      document.checkList.ageChk.focus();
   }else{
      checkList.submit();
   }

}
</script>
</head>
<body>
<%@include file="/WEB-INF/views/member/default/main_header.jsp" %>
<div class="container">


<br>
   <h3>프로젝트를 올리기 전에 확인해 주세요.</h3>
   <hr>
   핫디즈는 공개 검토 절차를 통해 창작자님이 작성한 프로젝트가 핫디즈의 정책을 준수하는지 확인하고 있습니다.<br>
   아래 사항들을 확인한 후 프로젝트를 올려 주세요.
   <hr>
   <h4>프로젝트 공개검토 기준</h4>
   <hr>
   <form action="edit-project/startEdit" name="checkList" id="checkList">
      <input type="checkbox" name="ideaChk"> 새로운 아이디어를 실현하기 위한 프로젝트입니다.<br>
      <input type="checkbox" name="overChk"> 이미 시판된 제품, 현금이나 지분 등 수익 제공, 선물 없는 단순 기부, 성인 인증이 필요한
         콘텐츠 등 기준에 맞지 않는 선물을 제공하지 않습니다.<br>
      <input type="checkbox" name="callChk"> 창작자의 신분증 혹은 사업자등록증, 국내 은행 계좌, 연락 가능한 본인 휴대폰 번호가 있습니다.<br>
      <input type="checkbox" name="ageChk"> 창작자 대표자는 19세 이상 성인입니다.<hr>
      <button type="button" onclick="check()" class="btn btn-danger">계속하기</button>
      
   </form>
</div>

  <!-- Bootstrap core JavaScript -->
  <script src="/fund/resources/myjsFunction/projectFunction.js"></script>
  <script src="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/js/bootstrap.min.js"></script>
  <script src="/fund/resources/vendor/jquery/jquery5/jquery.min.js"></script>
  <script src="/fund/resources/vendor/bootstrap5/js/bootstrap.bundle.min.js"></script>
</body>
</html>