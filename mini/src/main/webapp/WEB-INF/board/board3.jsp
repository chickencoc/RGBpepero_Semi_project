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
	<script src="https://cdnjs.cloudflare.com/ajax/libs/vue/2.5.3/vue.min.js"></script>
	<script src="https://unpkg.com/vue2-editor@2.3.11/dist/index.js"></script>
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
	            <table class="board_detail"style="margin:auto;">
					<colgroup>
						<col width="10%"/>
						<col width="*"/>
					</colgroup>
					<tr>
						<td style="text-align : center;" >제목</td>
						<td><input type="text" id="title" name="title" v-model="title" placeholder="제목을 입력해 주세요."></td>
						<td>
							<select class="board_cat" v-model="selectItem" v-if="boardKind == 3">
			                    <option value="">:: 전체 ::</option>
			                    <option value="P">상품관련</option>
			                    <option value="A">계정관련</option>
			                    <option value="D">배송관련</option>
			                </select>
	                	</td>
					</tr>
					<tr id="file_line">
						<td style="text-align : center;" >첨부파일</td>
						<td>
							<div>
							    <input type="file" id="file1" name="file1" accept="image/*" multiple="multiple"> 
							</div>
						</td>
					</tr>
					<tr>
						<td colspan="3">
						  <vue-editor id="editor" v-model="content"></vue-editor> <!-- 2. 화면 에디터 추가 -->
						</td>
					</tr>
				</table>
				<div id="btn_box">
					<button @click="fnGoList()" class="btn">목록으로</button>
					<button @click="fnAddBoard()" class="btn">저장</button>
				</div>
            </div>
        </div>
        <!-- wrap END -->
    </div>
</body>
<jsp:include page="/layout/footer.jsp"></jsp:include>
<script type="text/javascript">
console.log(Vue);
Vue.use(Vue2Editor);
const VueEditor = Vue2Editor.VueEditor;
var app = new Vue({ 
    el: '#app',
    data: {
		list : [],
		checkList : [],
		title : "",
		content : "",
		boardName : "",
		boardKind :"${map.boardKind}"
    	, userId : "${sessionId}"
        , AccountStatus : "${sessionStatus}"
        , selectItem : ""
		
    }
	,watch : {
		selectItem :function(){
			var self = this;
			self.selectItem = self.selectItem;
		}
	}
    // 4. 컴포넌트 추가
    , components: {VueEditor}
    , methods: {
    	fnAddBoard : function(){
            var self = this;
            var nparmap = { boardKind : self.boardKind ,title : self.title, content : self.content, userId : self.userId, keywordType : self.selectItem };
             $.ajax({
                url:"/board/add.dox",
                dataType:"json",	
                type : "POST", 
                data : nparmap,
                success : function(data) {
                	var form = new FormData();
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
                	} 
                	alert("저장되었습니다.");
                	 self.fnGoList(); 
                }
            });  
        } 
    	// 파일 업로드
	    , upload : function(form){
	    	var self= this; 
	         $.ajax({
	             url : "/board/fileupload.dox"
	           , type : "POST"
	           , processData : false
	           , contentType : false
	           , data : form
	           , success:function(response) { 
	        	   
	           }
	           
	       });
		},
        fnReadBoard: function(){
        	var self = this;
        	
	        if(self.boardKind == '1'){
	        	self.boardName = "공지사항";
	        }else if(self.boardKind == '2'){
	        	self.boardName = "문의하기";
	        }else if(self.boardKind == '3'){
	        	self.boardName = "자주하는 질문";
	        }
	        else{
	        	self.boardName = "Error!";
	        }
        },
        fnGoList(){
        	var self= this;
        	
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
    }   
    , created: function () {
    	var self = this;
    	self.fnReadBoard();
	}
});
</script>