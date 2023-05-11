<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<jsp:include page="/layout/header.jsp"></jsp:include>
	<link rel="stylesheet" href="/css/Base_rgbPepero.css">
	<link rel="stylesheet" href="/css/prod4_sub0.css">
	<title>상품 정보</title>
</head>
<body> 
    <!-- wrap START -->
 <div id="app"> 
    <div id="wrapper">
        <div class="list">
            <a href="">침실</a>
            <a href="">거실</a>
            <a href="">드레스룸</a>
            <a href=""><strong>주방</strong></a>
            <a href="">다용도실</a>
            <a href="">욕실</a>
            <a href="">취미</a>
        </div>
        <div id="contentbox">
            <div id="prodboxtop">
                <div id="imgbox">
                    <img id="mainimg" src="/dd">
                    <div id="subimgbox">
                        <img class="subimg" src="/dd">
                        <img class="subimg" src="/dd">
                        <img class="subimg" src="/dd">
                    </div>
                </div>
                <div id="explainbox">
                    <div>상품명 : <span>{{productname}}</span></div>
                    <div>좋아요 : {{ddabong}}</div>
                    <div>재고 : {{cnt}}</div>
                    <div>상품 가격 : {{price}}</div>
                    <hr id="inner_line" class="div_line">
                    <div class="buttonbox">
                        <button>레지스트리 등록</button>
                        <button>상품정보수정</button>
                    </div>
                </div>
                
            </div>
            <div id="prodboxbottom">
                Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.
            </div>
            <hr class="div_line"></hr>
            <h3>후기</h3>
            <div id="reviewbox">
                <div id="re_tb">
                    <table id="review_table">
                        <!-- <template> -->
                        <tr>
                            <td>{{id}}</td>
                            <td>{{cdatetime}}</td>
                            <td></td>
                            <td></td>
                            <td><button>후기 수정</button></td>
                        </tr>
                        <tr>
                            <!-- 사진 -->
                            <td><img src="dd"></td>
                            <td><img src="dd"></td>
                            <td><img src="dd"></td>
                            <td><img src="dd"></td>
                            <td><img src="dd"></td>
                        </tr>
                        <tr>
                            <!-- 내용 -->
                            <td colspan="5"><div class="review_detail">
                                Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.
                            </div></td>
                        </tr>
                        <tr>
                            <td colspan="5"><hr class="div_line"></hr></td>
                        </tr>
                        <!-- </template> -->
                    </table>
            </div>
        </div>
    </div>
  </div>  
 </div> 
    <!-- wrap END -->
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
            fnGetList : function(){
                var self = this;
                var nparmap = {};
                $.ajax({
                    url:"/bbs/list.dox",
                    dataType:"json",	
                    type : "POST", 
                    data : nparmap,
                    success : function(data) { 
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