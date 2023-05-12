<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<script src="js/jquery.js"></script>
<script src="js/vue.js"></script>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<link rel="stylesheet" href="/css/Base_rgbPepero.css">
	<link rel="stylesheet" href="/css/Registry.css">
	<link rel="stylesheet" href="/css/myInfo_img.css">
	<title>회원 레지스트리</title>
</head>
<body>
    <div id="app">  		
	    <div class="regist_img_main"> 
                <header id="regist_popup_header">
                    <div class="regist_img_title">이미지 등록 페이지</div>                                   
                </header>              
                <main class="regist_img_mainbox">
                    <div class="regist_img_searchbox">
                        <input class="regist_img_uploadname" value="첨부파일" placeholder="첨부파일">
                        <label for="regist_file">파일찾기</label>
                        <input type="file" id="regist_file">                  
                    </div>
                    <div class="regist_img_buttonbox">
                        <button id="regist_button" @click="fnRegistImg">등록</button>
                    </div>
                </main>
                <!-- wrap END -->
                
                <footer id="regist_popup_footer">
                    <div class="regist_popup_footer_main">
                        <img src="/image/logo_Marrimo.png" id="regist_popup_logo">              
                        <span>도움이 필요하신가요?</span>
                        <a href="#" @click="fnServiceCenter">고객센터</a>
                    </div>
                </footer>
         </div>
    </div>
</body>
</html>
<script type="text/javascript">
	$("#regist_file").on("change",function(){
		  var fileName = $("#regist_file").val();
		  $(".regist_img_uploadname").val(fileName);
		});
			
	var app = new Vue({ 
	    el: '#app',
	    data: {
			
	    }   
	    , methods: {
	    	
	    	
	    	fnServiceCenter : function(){
	        	location.href = "/boardMain.do";    		
	    	}
		,	fnRegistImg : function(){
				alert("저장되었습니다.");
	    		window.close();
		}
	    }   
	    , created: function () {
	    	
	
		}
	});
</script>