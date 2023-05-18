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
            <div id="board_img_list">
       			<div v-for="(item, index) in list">
       				<img :src="item.imgsrc">
       			</div>     	
            </div>
            <div id="board_info_content" v-html="content"></div>
            </div>
            <div></div>
            <template>
            <div id="newreplybox" v-if="info.boardKind != '2' && AccountStatus == 'S' ">
            <button class="board_btn" id="btn_del" @click="fnBoardDel">삭제</button><button class="board_btn" id="btn_edit" @click="fnBoardEdit">수정</button>
            </div>
            <div id="newreplybox" v-if="info.replyYn == 'Y'">
                <div id="reply_head">질문사항 답변<button class="board_btn" id="btn_del" @click="fnBoardDel">삭제</button><button class="board_btn" id="btn_edit" @click="fnBoardEdit">수정</button><button v-if="AccountStatus == 'S' && info.replyYn == 'Y'" class="board_btn" id="btn_reply">답변 수정</button></div>
                <div id="board_info_line">{{reply.name}}</div>
                <div id="board_info_line"><span>{{reply.cdatetime}} 작성됨</span></div>
                <div id="board_info_content">{{reply.content}}</div>
            </div>
            <div id="newreplybox" v-if="info.replyYn == 'N' && info.boardKind == '2'">
                <div id="reply_head">질문사항 답변<button class="board_btn" id="btn_del" @click="fnBoardDel">삭제</button><button class="board_btn" id="btn_edit" @click="fnBoardEdit">수정</button><button v-if="AccountStatus == 'S'" class="board_btn" id="btn_reply">답변</button></div>
                <div v-if="AccountStatus != 'S'">아직 답변이 작성되지 않았습니다.</div>
            </div>
            <div id="newreplybox" v-if="info.replyYn == 'N' && info.boardKind == '2' && AccountStatus == 'S'">
            	<input type="text" id="title" name="title" v-model="replyTitle" placeholder="제목을 입력해 주세요.">
            	<vue-editor id="editor" v-model="replyContent"></vue-editor>
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
        	, list : []
           , boardName : ""
           , boardNo : "${map.boardNo}"
     	   , sessionId : "${sessionId}"
     	   , AccountStatus : "${sessionStatus}"
     	   , replyTitle : ""
     	   , replyContent : ""
     	   , content : ""
     	   , boardKind : ""
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
                        	self.boardKind = '1';
                        }else if(self.info.boardKind == '2'){
                        	self.boardName = "문의하기";
                        	self.boardKind = '2';
                        }else if(self.info.boardKind == '3'){
                        	self.boardName = "자주하는 질문";
                        	self.boardKind = '3';
                        }
                        else{
                        	self.boardName = "Error!";
                        	self.boardKind = '0';
                        }
                        self.content = self.info.content;
                        
                    }
                }); 
            }
        , pageChange : function(url, param) {
    		var target = "_self";
    		if(param == undefined){
    		//	this.linkCall(url);
    			return;
    		}
    		var form = document.createElement("form"); 
    		form.name = "dataform";
    		form.action = url;
    		form.method = "post";
    		form.target = target;
    		for(var name in param){
				var item = name;
				var val = "";
				if(param[name] instanceof Object){
					val = JSON.stringify(param[name]);
				} else {
					val = param[name];
				}
				var input = document.createElement("input");
	    		input.type = "hidden";
	    		input.name = item;
	    		input.value = val;
	    		form.insertBefore(input, null);
			}
    		document.body.appendChild(form);
    		form.submit();
    		document.body.removeChild(form);
    	},
        
        fnAddReply : function(){
            var self = this;
            var nparmap = { boardNo : self.boardNo ,title : self.replyTitle, content : self.replyContent, userId : self.userId };
             $.ajax({
                url:"/board/addReply.dox",
                dataType:"json",	
                type : "POST", 
                data : nparmap,
                success : function(data) {
                	/* var form = new FormData();
                	console.log( $("#file1")[0].files.length);
                	for(var i=0;i < $("#file1")[0].files.length;i++){
                		console.log($("#file1")[0].files);
                		console.log($("#file1")[0].files[i]);
                		 form.append( "file1",  $("#file1")[0].files[i] );
    	       	     	 form.append( "boardNo",  data.boardNo); // pk
    	       	     	 console.log(form);
    	           		 self.upload(form);
    	           		 form.delete("file1");
    	           		 form.delete("boardNo");
                	}  */
                	alert("저장되었습니다.");
                	 self.fnGoList(); 
                }
            });  
        } 
        , fnBoardEdit : function(){
        	var self = this;
        	alert(self.boardNo);
    		self.pageChange("./boardEdit.do", {boardNo : self.boardNo});
        }
        , fnBoardDel : function(){
            var self = this;
            var nparmap = {boardNo : self.boardNo};
			if(!confirm("정말 삭제하시겠습니까?")){
				
				return;
			};
             $.ajax({
                url:"/board/delete.dox",
                dataType:"json",	
                type : "POST", 
                data : nparmap,
                success : function(data) { 
                	alert("삭제되었습니다.");
                	if(self.boardKind == '1'){
                		location.href = "/notice.do";
        	        }else if(self.boardKind == '2'){
        	        	location.href = "/inquery.do";
        	        }else if(self.boardKind == '3'){
        	        	location.href = "/board30.do";
        	        }
        	        else{
        	        	location.href = "/main.do";
        	        }
                }
            });  
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
        fnGetImgList : function(){
            var self = this;
            var nparmap = {boardNo : self.boardNo};
            $.ajax({
                url:"/board/readImg.dox",
                dataType:"json",	
                type : "POST", 
                data : nparmap,
                success : function(data) { 
                	self.list = data.brdImg;
                    console.log(data);
                    console.log(self.list);
                	}
           		}); 
        	}
        }   
        , created: function () {
            var self = this;
            self.fnGetInfo();
            self.fnGetImgList();
        }
    });
    </script>