<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<jsp:include page="/layout/header.jsp"></jsp:include>
	<link rel="stylesheet" href="/css/Base_rgbPepero.css">
	<link rel="stylesheet" href="/css/board/board4.css">
	<title>작성 페이지</title>
</head>
<body>
    <div id="app">
        <!-- wrap START -->
        <div id="wrapper">
            <div id="boardhead">
                <div id="boName">{{boardName}}</div>
                <div>{{boardName}} :: 기존 글 수정하기</div>
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
                <textarea name="content" id="editor" v-model="content"></textarea>
                <button id="btn_edit" onclick="test()">작성 완료</button>
            </div>
        </div>
        <!-- wrap END -->
    </div>
</body>
<jsp:include page="/layout/footer.jsp"></jsp:include>
<script src="https://cdn.ckeditor.com/ckeditor5/34.0.0/classic/ckeditor.js"></script>
<script src="https://cdn.ckeditor.com/ckeditor5/34.0.0/classic/translations/ko.js"></script>
<script>
    ClassicEditor.create( document.querySelector( '#editor' ),{
    removePlugins: [ 'Heading' ],
    removePlugins: [ 'Table' ],
    language: "ko"
  } )
  .then( newEditor => {
     editor = newEditor;
    console.log( 'Editor was initialized', editor );
  } )
  .catch( error => {
    console.error( error );
  } )
  ;
  function test(){
    var test1 = editor.getData();
    console.log(test1);
    alert(test1);
  }
</script>
<script type="text/javascript">
    import CKEditor from '@ckeditor/ckeditor5-vue';
	import ClassicEditor from '@ckeditor/ckeditor5-build-classic';
    var app = new Vue({ 
        el: '#app',
        data: {
            info : {},
			list : [],
			boardNo : "${map.boardNo}"
            , name : ""
            , boardName : ""
            , title : ""
            , board_category : ""
            , cdatetime : ""
            , cnt: ""
            , content : ""
        }   
        , methods: {
            fnGetInfo : function(){
                var self = this;
                var nparmap = {};
                $.ajax({
                    url:"/read.dox",
                    dataType:"json",	
                    type : "POST", 
                    data : nparmap,
                    success : function(data) {
                        location.href = "boardlist.do";
                    }
                }); 
            },
            fnBoardEdit : function(){
                var self = this;
                var nparmap = {boardNo : self.boardNo ,content : self.content};
                $.ajax({
                    url:"/edit.dox",
                    dataType:"json",	
                    type : "POST", 
                    data : nparmap,
                    success : function(data) {
                        console.log(data)
		                self.info = data.info;
	                	console.log(self.info);
                    }
                }); 
            },
            fnEdit : function(){
                var self = this;
                content = self.content;
                console.log(content);
                
            }
        }   
        , created: function () {
            CKEDITOR.replace('content');
            var self = this;
            self.fnGetInfo();
        }
    });
    </script>
</html>