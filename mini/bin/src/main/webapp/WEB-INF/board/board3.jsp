<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<jsp:include page="/layout/header.jsp"></jsp:include>
	<link rel="stylesheet" href="/css/Base_rgbPepero.css">
	<link rel="stylesheet" href="/css/board/board3.css">
	<title>작성 페이지</title>
</head>
<body> 
    <div id="app">
        <!-- wrap START -->
        <div id="wrapper">
            <div id="boardhead">
                <div id="boName">{{boardName}}</div>
                <div>{{boardName}} :: 새 글 작성하기</div>
            </div>
            <div id="newtextbox">
                <input type="text" id="title" placeholder="제목을 입력해 주세요.">
                <select id="board_cat">
                    <option hidden>카테고리를 선택해주세요.</option>
                    <option>ㅁㄴㅇㄹ</option>
                    <option>ㅁㄴㅇㄹ</option>
                    <option>ㅁㄴㅇㄹ</option>
                    <option>ㅁㄴㅇㄹ</option>
                </select>
                <textarea name="text" id="editor"></textarea>
                <button id="btn_add">작성 완료</button>
            </div>
        </div>
        <!-- wrap END -->
    </div>
</body>
<jsp:include page="/layout/footer.jsp"></jsp:include>
<script src="https://cdn.ckeditor.com/ckeditor5/34.0.0/classic/ckeditor.js"></script>
<script src="https://cdn.ckeditor.com/ckeditor5/34.0.0/classic/translations/ko.js"></script>
<script>
  ClassicEditor.create( document.getElementById( 'editor' ),{
    removePlugins: [ 'Heading' ],
    removePlugins: [ 'Table' ],
    language: "ko"
  } );
</script>
<script type="text/javascript">
    var app = new Vue({ 
        el: '#app',
        data: {
            list : [],
			checkList : {},
			title : "",
            name : ""
            , title : ""
            , board_category : ""
            , cdatetime : ""
            , cnt: ""
            , content : ""
        }   
        , methods: {
            fnAddBoard : function(){
                var self = this;
                var nparmap = {title : self.title, content : self.content};
                $.ajax({
                    url:"/mypage.dox",
                    dataType:"json",	
                    type : "POST", 
                    data : nparmap,
                    success : function(data) {
                        
                    }
                }); 
            }
        }   
        , created: function () {
            var self = this;
        }
    });
    </script>
</html>