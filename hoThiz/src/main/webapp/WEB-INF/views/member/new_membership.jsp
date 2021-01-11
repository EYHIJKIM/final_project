<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <meta name="description" content="">
  <meta name="author" content="">
  
<title>핫디즈 :: hoThiz</title>
<!-- Bootstrap core CSS -->
  <link href="<%=request.getContextPath()%>/resources/login/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>

<script src="https://code.jquery.com/jquery-3.4.1.min.js" ></script>

<script src="<%=request.getContextPath()%>/resources/member_js/daumpost.js"></script>

<script type="text/javascript">
   function member_email_check(){
      var email_check = $("#email").val()+$("#email_type").val();
      var email_type = $("#email_type").val();
      var form = {member_email:email_check};
      $.ajax({
         url : "member_email_check",
         type : "GET",
         data : form,
         success : function(result) {
            if(email_type == null){
               alert("이메일을 선택 해주세요.");
            }else if(email_check == ""){
               alert("이메일을 입력해주세요.");
            }else{
               if(result == 0){
                  alert("사용가능한 이메일 입니다.");
                  document.getElementById('member_email').readOnly = true;
                  $("#email_check_btn").text('중복확인 완료');
                  document.getElementById('email_check_btn').disabled = true;
                  document.getElementById('check_msg').style.color = "green";
                  document.getElementById('check_msg').innerHTML = "사용 가능한 이메일 입니다.";
                  member_email();
               } else if(result == 1){               
                  alert("중복된 이메일 입니다.");
               } else{
                  alert("이메일을 정확히 입력해 주세요.");
                  document.getElementById("member_email").value="";
                  
               }
            }
         },
         error : function(){
            alert("문제가 발생했습니다.");
         }
      });
   }
   function member_email(){
      var member_email = $("#email").val()+$("#email_type").val();
      document.getElementById("member_email").value=member_email;
      console.log($("#member_email").val());
   }
   function register(){
      if(document.getElementById('member_pwd').value == "" || document.getElementById('pwdCh').value == "" 
            || document.getElementById('member_name').value == ""
            || document.getElementById('addr1').value == "" || document.getElementById('addr2').value == "" || document.getElementById('addr3').value == ""
            || document.getElementById('member_phnum').value == ""){
         console.log($("#member_email").val());
         console.log($("#member_pwd").val());
         console.log($("#pwdCh").val());
         console.log($("#member_name").val());
         console.log($("#member_phnum").val());
         alert('모두 입력되었는지 확인해 주세요.');
      }else{
         fo.submit();
      }
   }
   function pwdchk(){
      pw1 = document.getElementById("member_pwd").value;
      pw2 = document.getElementById("pwdCh").value;
      if(pw1.length < 10){
         alert("비밀번호가 너무 짧습니다.");
         document.getElementById("member_pwd").value="";
         document.getElementById("pwdCh").value="";
         document.getElementById('member_pwd').focus();
      }else if(pw1.length > 30){
         alert("비밀번호가 너무 깊니다.");
         document.getElementById("member_pwd").value="";
         document.getElementById("pwdCh").value="";
         document.getElementById('member_pwd').focus();         
      }else{         
         if(pw1 == pw2){
            document.getElementById('member_pwd').readOnly = true;
            document.getElementById('pwdCh').readOnly = true;
            document.getElementById('pwd_msg').style.color = "green";
            document.getElementById('pwd_msg').innerHTML = "비밀번호가 일치합니다.";
         }else{
            alert('비밀번호를 확인해주세요.');
            document.getElementById("member_pwd").value="";
            document.getElementById("pwdCh").value="";
         }
      }
   }
   
   function member_phnum_chk(){
      var phnum = $("#member_phnum").val();
      var form = {member_phnum:phnum};
      if(phnum.length != 11){
         alert("휴대폰 번호를 확인해 주세요.");
         document.getElementById("member_phnum").value="";
      }else if(!phnum.indexOf('-')){
         alert("'-'는 빼고 입력해 주세요.");
         document.getElementById("member_phnum").value="";
      } else{
         
         $.ajax({
            url : "member_phnum_chk",
            type : "GET",
            data : form,
            success : function(result) {               
               if(result == 1){
                  document.getElementById('phnum_msg').style.color = "green";
                  document.getElementById('phnum_msg').innerHTML = "완료";
               } else {               
                  alert("핸드폰 번호를 다시 확인해 주세요");
                  document.getElementById("member_phnum").value="";
                  document.getElementById('member_phnum').focus();
               }
            },
            error : function(){
               alert("문제가 발생했습니다.");
            }
         });         
      }
   }
   
   function addrSave(){
      var addr1 = $("#addr1").val();
      var addr2 = $("#addr2").val();
      var addr3 = $("#addr3").val();
      var member_addr = addr1+"/"+addr2+"/"+addr3
      $("#member_addr").val(member_addr);
      document.getElementById('addr1').readOnly = true;
      document.getElementById('addr2').readOnly = true;
      document.getElementById('addr3').readOnly = true;
   }
   
   function addrModify(){
      document.getElementById('addr1').readOnly = false;
      document.getElementById('addr2').readOnly = false;
      document.getElementById('addr3').readOnly = false;
   }

   
</script>
<style type="text/css">
span{
   font-size: x-large;
   font-weight: bold;
}


input{

 border : 2px solid grey;
    border-radius : 5px;
}
@import url('https://fonts.googleapis.com/css2?family=Gugi&display=swap');
h1{
font-size:xx-large;
color:#000000;
font-weight: bolder;
}
button{
  background:#DB9700;
  color:#fff;
  border:none;
  position:relative;
  height:30px;
  font-size:1.6em;
  padding:0 2em;
  cursor:pointer;
  transition:800ms ease all;
  outline:none;
}
button:hover{
  background:#000000;
  color:#DB9700;
}
button:before,button:after{
  content:'';
  position:absolute;
  top:0;
  right:0;
  height:2px;
  width:0;
  background: #DB9700;
  transition:400ms ease all;
}
button:after{
  right:inherit;
  top:inherit;
  left:0;
  bottom:0;
}
button:hover:before,button:hover:after{
  width:100%;
  transition:800ms ease all;
}
</style>
</head>
<body>
<% 
   request.setCharacterEncoding("utf-8");
   response.setCharacterEncoding("utf-8");
%>
<%@ include file="/WEB-INF/views/member/default/header.jsp" %>

<c:set var="contextPath" value="${pageContext.request.contextPath }"/>
<div align="center">
   <form id="fo" action="register" method="post" enctype="multipart/form-data">
   <div class="default">

      
         <!-- Page Content -->
  <div class="container">
    <div class="row">
      <div class="col-lg-12 text-center">
        <h1 class="mt-5">회원가입</h1>
 <div class="login">
           <div class="new_membership_email">
              <span>이메일</span><br>              
              <input type="text" id="email" placeholder="아이디를 입력해주세요" style="width: 200px;">
              <input type="hidden" name="member_email" id="member_email">
              <select id="email_type" style="width: 160px;">
               <option value="" selected disabled>선택</option>
               <option value="@naver.com">네이버</option>
               <option value="@gmail.com">구글</option>
               <option value="@daum.net">다음</option>
               <option value="">직접입력</option>
            </select><br>
              <button type="button" id="email_check_btn" onclick="member_email_check()">중복확인</button><br>
              <div><span id="check_msg" style="font-size: 2px; color: #980000;">이메일은 중복확인을 해주세요</span></div>
           </div>
           <hr style="border: dotted 5px #363636;">
           
           <div class="new_membership_pwd">
              <span>비밀번호</span><br>
              <input type="password" name="member_pwd" id="member_pwd" placeholder="비밀번호를 입력해주세요" style="width: 360px;"><br>
              <input type="password" id="pwdCh" onchange="pwdchk()" placeholder="비밀번호를 확인합니다" style="width: 360px;"><br>
              <div><span id="pwd_msg" style="font-size: 2px; color: #980000;">비밀번호는 10~30자리 길이로 만들어주세요</span></div>
           </div>
           <hr style="border: dotted 5px #363636;">
           <div class="new_membership_name">
              <span>이름</span><br>
              <input type="text" name="member_name" id="member_name" placeholder="사용하실 이름을 입력해주세요" style="width: 360px;"><br>
           </div>
           <hr style="border: dotted 5px #363636;">
           <div class="new_membership_profPic">              
            <span>프로필 사진</span>
            <br>
            <div class="select_img"><img id ="profileImg" src="${contextPath }/resources/profileImage/main_profPic.png" style = "border-radius:0%; padding-top : 10px; height:100px; width:100px;"></div>
            <br>
            <input type="file" name="uploadFile" id="uploadFile" value="프로필 사진 바꾸기" style="width: 360px;">
            <script type="text/javascript">
               $("#uploadFile").change(function(){
                  if(this.files && this.files[0]){
                     var reader = new FileReader;
                     reader.onload = function(data){
                        $(".select_img img").attr("src", data.target.result);
                     }
                     reader.readAsDataURL(this.files[0]);
                  }
               });
            </script>
            <br>            
           </div>
           <hr style="border: dotted 5px #363636;">
           <div class="new_membership_phnum">
              <span>연락처</span><br>
              <input type="text" pattern="[0-9]+" name="member_phnum" id="member_phnum" onchange="member_phnum_chk()" placeholder="전화번호를 입력해주세요" autocomplete="off" style="width: 360px;"><br>
              <div><span id="phnum_msg" style="font-size: 2px; color: #980000;">('-'는 빼고 입력해 주세요.)</span></div>
           </div>
           <hr style="border: dotted 5px #363636;">
           <div class="new_membership_phnum" align="center">
              <span>주소</span><br>
              <input type="hidden" id="member_addr" name="member_addr">
              <table>
              <tr>                 
                 <td><input type="text" id="addr1" placeholder="우편번호"></td>
               <td><button type="button" onclick="daumPost()">우편번호 찾기</button></td>
            </tr>
            <tr>
               <td colspan="2" style="width: 100px;"><input type="text" id="addr2" placeholder="주   소" style="width: 100%;"></td>
            </tr>
            <tr>
               <td colspan="2"><input type="text" id="addr3" placeholder="상세주소" onchange="addrSave()" style="width: 100%;"></td>
            </tr>
            <tr>
               <td colspan="2">               
               <button type="button" onclick="addrModify()" style="width: 360px;">주소 수정</button>
               </td>
               
            </tr>
            </table>
           </div>
           <div class="new_membershipe_span2">
              <hr style="border: dotted 5px #363636;">
           </div>
           <div class>
           <button type="button" onclick="register()" style="width: 178px;">회원가입</button>
           <button type="button" onclick="location.href='index'" style="width: 177px;">취소</button>
           </div>
        </div>
      </div>
    </div>
  </div>

        
   </div>
   </form>
</div>
<div>
  <!-- Bootstrap core JavaScript -->
  <script src="<%=request.getContextPath()%>/resources/login/vendor/jquery/jquery.min.js"></script>
  <script src="<%=request.getContextPath()%>/resources/login/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
  
    <!-- Plugin JavaScript -->
  <script src="<%=request.getContextPath()%>/resources/login/vendor/jquery-easing/jquery.easing.min.js"></script>

  <!-- Custom JavaScript for this theme -->
  <script src="<%=request.getContextPath()%>/resources/login/js/scrolling-nav.js"></script>
</div>
<br><br>
<%@ include file="default/footer.jsp" %>
</body>
</html>