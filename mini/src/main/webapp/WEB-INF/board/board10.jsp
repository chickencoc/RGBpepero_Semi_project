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
                    <tr  v-for="(item, index) in list" >
                        <td>{{index + 1}}</td>
                        <td>아이콘</td>
                        <td>{{item.title}}</td>
                        <td>{{item.name}}</td>
                        <td>{{item.cnt}}</td>
                        <td>{{item.cdatetime}}</td>
                    </tr>
                </tbody>
            </table>
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
                var nparmap = {};
                $.ajax({
                    url:"/board/list.dox",
                    dataType:"json",	
                    type : "POST", 
                    data : nparmap,
                    success : function(data) { 
                    	self.list = data.list;
                        console.log(data);
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