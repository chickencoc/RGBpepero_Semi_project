<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<jsp:include page="/layout/header.jsp"></jsp:include>
	<link rel="stylesheet" href="/css/Base_rgbPepero.css">
	<link rel="stylesheet" href="/css/board/board10.css">
	<link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200" />
	<title>공지사항</title>
</head>
<body>
<div id="app">
   
    <!-- wrap START -->
    <div id="wrapper">
        <div id="menu">
            <span id="faq" class="boardmenu" @click="fnFaq">자주하는 질문</span>
            <span id="inquery" class="boardmenu" @click="fnInquery">문의하기</span>
            <div class="line"></div>
        </div>
        <div class="boardbox">
            <div id="boardname">공지사항</div>
        </div>
        <div class="table_list">
            <table class="board_list">
                <thead>
                    <tr>
                        <th scope="col">번호</th>
                        <th scope="col"></th>
                        <th scope="col">글 제목</th>
                        <th scope="col">작성자</th>
                        <th scope="col">조회</th>
                        <th scope="col">시간</th>
                    </tr>
                </thead>
                <tbody>
                    <tr  v-for="(item, index) in list"  @click="fnView(item.boardNo)">
                        <td>{{index + 1}}</td>
                        <template>
	                        <td v-if="item.replyYn == 'Y'"><span><img src="/image/qa_icon2.gif"></span></td>
	                        <td v-else><span><img src="/image/qa_icon1.gif"></span></td>
                        </template>
                        <td>{{item.title}}</td>
                        <td>{{item.name}}</td>
                        <td>{{item.viewCnt}}</td>
                        <td>{{item.cdatetime}}</td>
                    </tr>
                </tbody>
            </table>
            <div id="btn_box" v-if="">
				<button @click="fnAdd()" class="btn" style="float:right;" v-if="AccountStatus == 'S'">새 글 작성</button>
			</div>
        </div>
        </div>
        <div class="pagecontroll">
            < 1 2 3 >
        </div>
    </div>
    <!-- wrap END -->
</div>
</body>
<jsp:include page="/layout/footer.jsp"></jsp:include>
<script type="text/javascript">
    var app = new Vue({ 
        el: '#app',
        data: {
            list : [],
            checkList : []
    		, boardKind : "1"
        	, userId : "${sessionId}"
            , AccountStatus : "${sessionStatus}"
        }   
        , methods: {
        	fnInquery : function(){
        		location.href = "/inquery.do";
        	}, 
        	fnFaq : function(){
        		location.href = "/board30.do";
        	},
            fnGetList : function(){
                var self = this;
                var nparmap = {boardKind : self.boardKind};
                $.ajax({
                    url:"/board/list.dox",
                    dataType:"json",	
                    type : "POST", 
                    data : nparmap,
                    success : function(data) { 
                    	self.list = data.board;
                        console.log(data);
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
	    	}
			, fnView : function(boardNo){
	    		var self = this;
	    		self.pageChange("./readBoard.do", {boardNo : boardNo});
	    	}
        	, fnAdd : function(boardKind){
	    		var self = this;
	    		self.pageChange("./board3.do", {boardKind : self.boardKind});
	    	}
        }   
        , created: function () {
            var self = this;
     		self.fnGetList();
    
        }
    });
    </script>
</html>