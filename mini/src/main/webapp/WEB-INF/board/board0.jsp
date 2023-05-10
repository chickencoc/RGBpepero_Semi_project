<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<jsp:include page="/layout/header.jsp"></jsp:include>
	<link rel="stylesheet" href="/css/Base_rgbPepero.css">
	<link rel="stylesheet" href="/css/board/board0.css">
	<title>게시판 기본 페이지</title>
</head>

<body>
    <div id="app">
		<div id="wrapper">
        <div class="bannerbox">
            <div class="banner">
                <div class="textbox">
                    <p class="txt">Frequently Asked Questions</p>
                </div>
            </div>
        </div>
        <div class="boardbox">
            <div class="boardcat">
                <div class="board_category_items" id="inquery">
                    <div class="innerbox">
                        <div class="detailtxt">
                            <div class="fakeLink"><span data-tooltip="문의 게시판으로 이동합니다!">문의하기</span></div>
                        </div>
                    </div>
                </div>
                <div class="board_category_items" id="anounce">
                    <div class="innerbox">
                        <div class="detailtxt">
                            <div class="fakeLink"><span data-tooltip="공지 게시판으로 이동합니다!">공지사항</span></div>
                        </div>
                    </div>
                </div>
                <div class="board_category_items" id="faq">
                    <div class="innerbox">
                        <div class="detailtxt">
                            <div class="fakeLink"><span data-tooltip="자주 묻는 질문 게시판으로 이동합니다!">FAQ</span></div>
                        </div>
                    </div>
                </div>
                
                
                
            </div>
        </div>

    </div>
    </div>
</body>
</html>
<jsp:include page="/layout/footer.jsp"></jsp:include>
<script type="text/javascript">
var app = new Vue({ 
    el: '#app',
    data: {

    }   
    , methods: {

    }   
    , created: function () {
    	var self = this;

	}
});
</script>
        
        
