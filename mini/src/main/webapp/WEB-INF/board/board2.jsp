<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<jsp:include page="/layout/header.jsp"></jsp:include>
	<link rel="stylesheet" href="/css/Base_rgbPepero.css">
	<link rel="stylesheet" href="/css/board/board2.css">
	<title>게시글 페이지</title>
</head>
<body>
    <div id="app">
        <!-- wrap START -->
        <div id="wrapper">
            <div id="boardhead">
                <div id="boName">{{boardName}}</div>
            </div>
            <div id="newboardbox">
            <div id="board_title">{{title}}</div>
            <div id="board_info_line"><span id="board_info_cat">{{board_category}}</span><span>{{cdatetime}}</span></div>
            <div id="board_info_line2"><span>{{name}}</span><span>{{cnt}}</span></div>
            <div id="board_info_content">{{content}}</div>
            </div>
            <div></div>
            <div id="newreplybox" v-if="content != ''">
                <div id="reply_head">질문사항 답변<button class="board_btn" id="btn_del">삭제</button><button class="board_btn" id="btn_edit">수정</button></div>
                <div id="board_info_line">{{name}}</div>
                <div id="board_info_line"><span>{{cdatetime}} 작성됨</span></div>
                
                <div id="board_info_content">{{content}}</div>
            </div>
            <div id="newreplybox" v-if="content == ''">
                <div id="reply_head">질문사항 답변<button class="board_btn" id="btn_del">삭제</button><button class="board_btn" id="btn_edit">수정</button></div>
                <div>아직 답변이 작성되지 않았습니다.</div>
            </div>
        </div>
        <!-- wrap END -->   
    </div>
</body>
</html>
<jsp:include page="/layout/footer.jsp"></jsp:include>
<script type="text/javascript">
    var app = new Vue({ 
        el: '#app',
        data: {
            name : ""
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
            self.fnGetInfo();
        }
    });
    </script>