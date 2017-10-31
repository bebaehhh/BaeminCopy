<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <link rel="stylesheet" href="<c:url value="/css/newSign.css"/>"/>
  <script src="<c:url value="/js/jquery-3.2.1.min.js" />" charset="utf-8"></script>
  <script type="text/javascript">
  $().ready(function(){
	  
	  var checkOne;
	  var checkTwo;
	  var checkThree;
	  
	  	$("#checkBtn").click(function() {
	  		if($.trim($("#id1").val()).indexOf("@") < 0 ) {
		    	  alert("이메일을 입력해주세요");
		    	  $("#id1").val("");
		    	  return;
	  		}
	  		
	  		if(($.trim($("#password1").val())).length <=7 &&  ($.trim($("#password2").val())).length <=7 ) {
	  			alert("비밀번호를 8자리 이상 입력해주세요.");
		    	  $("#password1").val("");
		    	  $("#password2").val("");
		    	  return;
	  		}
	  		
	  		if($.trim($("#password1").val()) != $.trim($("#password2").val())) {
	  			alert("입력한 비밀번호가 일치하지 않습니다. 확인해주세요.");
		    	  $("#password1").val("");
		    	  $("#password2").val("");
		    	  return;
	  		}
	  		
	  		$.post("<c:url value='/oauthmember/checkMemberId' />", {memberId : $("#id1").val() }, function(response) {
	  			if(response) {
	  				alert("이미사용중인 아이디 입니다. 이메일을 다시 입력해주세요.");
	  				$("#id1").val("");
	  			}
	  			else {
	  				$("#nextpage").attr({
	  	  				method: "post",
	  	  				action: "<c:url value='/oauthmember/signup_step2'/>"
	  	  			}).submit();
	  			}
	  		});
	  	});
	  
	    $("#id1").keyup(function () {
	      if($.trim($(this).val()).length > 0) {
	        $("#idBtn1").css("display", "block");
	      	checkOne = true;
	      }
			
	      if($.trim($(this).val()).length == 0) {
	        $("#idBtn1").css("display", "none");
	       	checkOne = false;
	      }
	      
	      if ( checkOne == true && checkTwo == true && checkThree == true ) {
		    	$("#checkBtn").css("background-color", "#2ac1bc");
		    }
	      else {
	    	  $("#checkBtn").css("background-color", "#e3e3d3");
	      }
	    });
	    $("#idBtn1").click(function () {
	      $("#id1").val("");
	    });
	    $("#password1").keyup(function () {
	      if($.trim($(this).val()).length > 0) {
	        $("#passwordBtn1").css("display", "block");
	        checkTwo = true;
	      }
	      if($.trim($(this).val()).length == 0) {
	        $("#passwordBtn1").css("display", "none");
	        checkTwo = false;
	      }
	      
	      if ( checkOne == true && checkTwo == true && checkThree == true ) {
		    	$("#checkBtn").css("background-color", "#2ac1bc");
		    }
	      else {
	    	  $("#checkBtn").css("background-color", "#e3e3d3");
	      }
	    });
	    $("#passwordBtn1").click(function () {
	      $("#password1").val("");
	    });
	    $("#password2").keyup(function () {
	      if($.trim($(this).val()).length > 0) {
	        $("#passwordBtn2").css("display", "block");
	        checkThree = true;
	      }
	      if($.trim($(this).val()).length == 0) {
	        $("#passwordBtn2").css("display", "none");
	        checkThree = false;
	      }
	      
	      if ( checkOne == true && checkTwo == true && checkThree == true ) {
		    	$("#checkBtn").css("background-color", "#2ac1bc");
		    }
	      else {
	    	  $("#checkBtn").css("background-color", "#e3e3d3");
	      }
	      
	    });
	    $("#passwordBtn2").click(function () {
	      $("#password2").val("");
	    });
	    
	    $("#nextBtn").click(function(){
	    	if ( checkOne == true && checkTwo == true && checkThree == true ) {
		    	$("#checkBtn").css("background-color", "#2ac1bc");
		    }
	    });
	    //배민ID버튼
    	 $(".sign1 a").click(function() {
  			window.open("<c:url value='/oauthmember/baeminId' />", "배민ID 버튼");
  	  	});
	    //이미 배민id가 있으세요?
    		
    		$("#join .text").click(function() {
    			location.href = "<c:url value='/oauthmember/login' />"; 
    	});
    	
	   
	});
	</script>
	  <title>Document</title>
	</head>
	<body>
	  <div id="signWapper">
	    <div id="content-a">
	      <!--STEP 1.2 -->
	      <div id="step">
	          <img alt="step로고" src='<c:url value="/img/step.png" />' />
	      </div>
	      <!--배달의민족은 배민ID로 로그인하실수 있습니다-->
	    <div id="sign">
	    	<ul>
	        <li class='sign1'>*배달의 민족은
	                          <a href="<c:url value="/oauthmember/baeminId" />">배민ID</a>로 로그인 하실수 있습니다.</li>
	        <li class='sign1'>*배민ID는 이메일가입 또는 페이스북 가입이 가능합니다.</li>
	        <li class='sign1'>*기존 배달의민족 앱을 이용하신 회원은
	                          <br/><em>[이미 배민ID가 있으세요?] 버튼</em>을 눌러주세요</li>
	        <li class='sign1'>*사용하고 있는 이메일을 입력해야
	                          <br/>아이디/비밀번호 분실 시 찾을 수 있습니다.</li>
	                          </ul>

	      </div>
	      <!--배민ID 가입하기 이미배민ID가 있으세요?-->
	      <div id="join">
	        <a href="#" class="text">이미 배민 ID가 있으세요?</a>
	        <ul>
	            <li class="dext">배민ID 가입하기</li>
	          </ul>

	      </div>
	   <form id="nextpage">
	      <!--아이디-->
	      <div id='login_id1'>
	        <div id="login_id2">
	          <input type="text" id='id1' placeholder="배민ID(이메일)" name="memberId" />
	          <input type="button" id="idBtn1" value="X" />
	      	</div>
	    </div>
	      <!--비밀번호(8~20자) 비밀번호 재입력 -->
	      <div>
	        <div id="login_pw1">
	          <div id="login_pw2">
	            <input type='password' id='password1' placeholder="비밀번호 (8~20자)" name="password"/>
	            <input type="button" id="passwordBtn1" value="X" />
	          </div>
	          <div id="login_pw2">
	            <input type='password' id='password2' placeholder="비밀번호 재입력 (8~20자)" />
	            <input type="button" id="passwordBtn2" value="X" />
	          </div>
	      </div>
	    </div>
	    </form>
	      <!--다음 -->
	      <div id="nextBtn">
	        <button id="checkBtn">다음</button>
	      </div>
	      <!--간편하게 가입하기 -->
	      <div id="join2">
	      <ul>
	        <li class="join3">간편하게 가입하기</li>
	        </ul>
	      </div>
	      <!--페이스북으로 시작하기 -->
	        <div id='facebookBtn1'>
	          <button>페이스북으로 시작하기</button>
	        </div>
	    </div>
	  </div>



	</body>
	</html>
