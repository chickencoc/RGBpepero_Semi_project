<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<jsp:include page="/layout/header.jsp"></jsp:include>
	<script src="https://unpkg.com/vue2-editor@2.3.11/dist/index.js"></script>
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
            <div id="board_title">{{info.title}}</div>
            <div id="board_info_line"><span id="board_info_cat">{{boardName}}</span><span>{{info.name}}</span><span>조회수 : {{info.viewCnt}}</span></div>
            <div id="board_info_line2"><span>{{info.cdatetime}} 작성됨</span><span v-if="info.udatetime!=null">{{info.udatetime}} 수정됨</span></div>
            <div id="board_info_content" v-html="content"></div>
            </div>
            <div></div>
            <template>
            <div id="newreplybox" v-if="info.replyYn == 'Y'">
                <div id="reply_head">질문사항 답변<button class="board_btn" id="btn_del">삭제</button><button class="board_btn" id="btn_edit">수정</button><button v-if="AccountStatus == 'S' && info.replyYn == 'Y'" class="board_btn" id="btn_reply">답변 수정</button></div>
                <div id="board_info_line">{{reply.name}}</div>
                <div id="board_info_line"><span>{{reply.cdatetime}} 작성됨</span></div>
                <div id="board_info_content">{{reply.content}}</div>
            </div>
            <div id="newreplybox" v-if="info.replyYn == 'N' && info.boardKind == '2'">
                <div id="reply_head">질문사항 답변<button class="board_btn" id="btn_del">삭제</button><button class="board_btn" id="btn_edit">수정</button><button v-if="AccountStatus == 'S'" class="board_btn" id="btn_reply">답변</button></div>
                <div v-if="AccountStatus != 'S'">아직 답변이 작성되지 않았습니다.</div>
            </div>
            <div id="newreplybox" v-if="info.replyYn == 'N' && info.boardKind == '2' && AccountStatus == 'S'">
            	<input type="text" id="title" name="title" v-model="replyTitle" placeholder="제목을 입력해 주세요.">
            	<vue-editor id="editor" v-model="replyContent">test</vue-editor>
            </div>
            </template>
        </div>
        <!-- wrap END -->   
    </div>
</body>
</html>
<jsp:include page="/layout/footer.jsp"></jsp:include>
<script type="text/javascript">
Vue.use(Vue2Editor);
const VueEditor = Vue2Editor.VueEditor;
    var app = new Vue({ 
        el: '#app',
        data: {
        	info : {},
        	reply : {}
           , boardName : ""
           , boardNo : "${map.boardNo}"
     	   , sessionId : "${sessionId}"
     	   , AccountStatus : "${sessionStatus}"
     	   , replyTitle : ""
     	   , replyContent : ""
     	   , content : ""
        }
    	, components: {VueEditor}
        , methods: {
            fnGetInfo : function(){
                var self = this;
                var nparmap = {boardNo : self.boardNo};
                $.ajax({
                    url:"board/read.dox",
                    dataType:"json",	
                    type : "POST", 
                    data : nparmap,
                    success : function(data) {
                        self.info = data.info;
						console.log(self.info);
                    	console.log(self.info.boardKind);
                        if(self.info.boardKind == '1'){
                        	self.boardName = "공지사항";
                        }else if(self.info.boardKind == '2'){
                        	self.boardName = "문의하기";
                        }else if(self.info.boardKind == '3'){
                        	self.boardName = "자주하는 질문";
                        }
                        else{
                        	self.boardName = "Error!";
                        }
                        self.content = self.info.content;
                        
                    }
                }); 
            }
        
        , fnAddBoard : function(){
            var self = this;
            var nparmap = {title : self.title, content : self.content};
            console.log( self.content );
            /* $.ajax({
                url:"/board/add.dox",
                dataType:"json",	
                type : "POST", 
                data : nparmap,
                success : function(data) { 
                	alert("저장되었습니다.");
                	location.href="bbs.do";
                }
            });  */
        } 
    	// 파일 업로드
	    , upload : function(){
			var form = new FormData();
	        form.append( "file1", $("#file1")[0].files[0] );
	        
	         $.ajax({
	             url : "/upload.do"
	           , type : "POST"
	           , processData : false
	           , contentType : false
	           , data : form
	           , success:function(response) { 
	        	   
	           }
	           
	       });
		},
        
        }   
        , created: function () {
            var self = this;
            self.fnGetInfo();
        }
    });
    </script>