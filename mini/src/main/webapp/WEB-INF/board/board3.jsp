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
							<select class="board_cat">
			                    <option hidden>카테고리 선택</option>
			                    <option>ㅁㄴㅇㄹ</option>
			                    <option>ㅁㄴㅇㄹ</option>
			                    <option>ㅁㄴㅇㄹ</option>
			                    <option>ㅁㄴㅇㄹ</option>
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
						  <vue-editor id="editor" v-model="content">test</vue-editor> <!-- 2. 화면 에디터 추가 -->
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
		boardName : ""
    }   
    // 4. 컴포넌트 추가
    , components: {VueEditor}
    , methods: {
    	fnAddBoard : function(){
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
		fnGetList : function(){
            var self = this;
            var nparmap = {};
            $.ajax({
                url:"/list.dox",
                dataType:"json",	
                type : "POST", 
                data : nparmap,
                success : function(data) {                                       
	                /* self.list = data.list; */
                }
            }); 
        }  	
    }   
    , created: function () {
    	var self = this;
	}
});
</script>