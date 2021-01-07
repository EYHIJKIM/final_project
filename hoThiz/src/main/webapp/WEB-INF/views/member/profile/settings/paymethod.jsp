<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<% 
   request.setCharacterEncoding("utf-8");
   response.setCharacterEncoding("utf-8");
%>
<html>
<head>

<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<script type="text/javascript">

var pid = '${list.project_id}';
var ptitle = '${list.project_title}';
var email = '${list.member_email}';





function pay(){
var IMP = window.IMP;
IMP.init('imp04055516');
IMP.request_pay({
    pg : 'kakaopay', 
    pay_method : 'card',
    merchant_uid : 'merchant_' + new Date().getTime(),
    name : '${list.project_title}',
    amount : '${list.paid_amount}',
    buyer_email : '${list.member_email}',
   // buyer_name : '구매자이름',
   // buyer_tel : '010-1234-5678',
   // buyer_addr : '서울특별시 강남구 삼성동',
   // buyer_postcode : '123-456',
  //  m_redirect_url : 'https://www.yourdomain.com/payments/complete'
}, function(rsp) {
    if ( rsp.success ) {
        var msg = '결제가 완료되었습니다.';
        msg += '고유ID : ' + rsp.imp_uid;
        msg += '상점 거래ID : ' + rsp.merchant_uid;
        msg += '결제 금액 : ' + rsp.paid_amount;
        msg += '카드 승인번호 : ' + rsp.apply_num;
  		
  		var imp_uid = rsp.imp_uid;
  		var merchant_uid = rsp.merchant_uid;
  		var paid_amount = rsp.paid_amount;
  		var apply_num = rsp.apply_num;
        
        $.ajax({ url: "paid/"+pid+"/"+email+"/"+imp_uid+"/"+merchant_uid+"/"+paid_amount+"/"+apply_num , type:"GET",
        	
        success : function(){ 
        	alert(msg);
        	location.href="index";
        },
        error : function(){ alert("addr문제 발생") }
     });
        
        
        
       // location.href= "my_donate"
    } else {
        var msg = '결제에 실패하였습니다.';
        msg += '에러내용 : ' + rsp.error_msg;
      //  location.href="그프로젝트창"
       // location.href='index';
    }
    alert(msg);
    location.href='index';
});
}//dd


</script>
</head>
<body onload="pay()">

<!-- <button onclick="pay()">결제창</button> -->

</body>
</html>