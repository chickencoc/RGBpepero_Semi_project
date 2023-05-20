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
							    <input type="file" id="file1" name="file1" > 
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
					<button @click="fnBoardEdit()" class="btn">저장</button>
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
            info : {}
			, list : []
			, boardNo : "${map.boardNo}"
		    , sessionId : "${sessionId}"
		    , AccountStatus : "${sessionStatus}"
            , name : ""
            , boardName : ""
            , boardKind : ""
            , title : ""
            , selectItem : ""
            , cdatetime : ""
            , cnt: ""
            , content : ""
        }
		, watch : {
			selectItem :function(){
				var self = this;
				self.selectItem = self.selectItem;
			}
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
                        console.log(self.info);
                        self.content = self.info.content;
                        self.title = self.info.title;
                        self.selectItem = self.info.keywordType;
                        
                    }
                }); 
            },
            fnBoardEdit : function(){
                var self = this;
                var nparmap = { boardNo : self.boardNo ,title : self.title, content : self.content, userId : self.userId, keywordType : self.selectItem };
                $.ajax({
                    url:"board/edit.dox",
                    dataType:"json",	
                    type : "POST", 
                    data : nparmap,
                    success : function(data) {
                        console.log(data)
		                self.info = data.info;
	                	console.log(self.info);
	                	self.pageChange("./readBoard.do", {boardNo : self.boardNo});
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
            fnEdit : function(){
                var self = this;
                content = self.content;
                console.log(content);
                
            }
            , fnGoList(){
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
            self.fnGetInfo();
        }
    });
    </script>
</html>