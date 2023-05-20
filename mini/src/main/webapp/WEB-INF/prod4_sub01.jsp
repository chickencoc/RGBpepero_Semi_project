<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<jsp:include page="/layout/header.jsp"></jsp:include>
<link rel="stylesheet" href="/css/Base_rgbPepero.css">
<title>상품정보 수정 및 등록 페이지</title>
<style>
.container {
	width: 1200px;
	height: 800px;
}

.container .grid_Area {
	width: 900px;
	height: 300px;
	border: solid black 1px;
	display: grid;
	grid-template-columns: 1fr 1.5fr;
	grid-gap: 20px;
	margin: auto;
	margin-top: 100px;
	margin-bottom: 10px;
}

.grid_Area .imgs {
	display: grid;
	grid-template-rows: 1fr 0.5fr;
}

.grid_Area .main_Img {
	border: 1px solid black;
	width: 340px;
	height: 180px;
	background-color: gray;
	margin: 20px 30px 0px 30px;
	text-align: center;
}

.thumb_Nails .thumb_Nail {
	border: 1px solid black;
	width: 100px;
	height: 70px;
	background-color: gray;
}

.thumb_Nails {
	display: flex;
	justify-content: center;
	align-content: center;
	flex-direction: row;
}

.thumb_Nails .thumb_Nail {
	margin: 10px;
	text-align: center;
}

.inputs .input_Elememt {
	width: 300px;
	margin-bottom: 10px;
	margin-top: 10px;
	text-align: center;
}

.inputs #product_Kind {
	margin-left: 15px;
	margin-right: 10px;
}

.inputs #product_No {
	margin-top: 30px;
	margin-left: 15px;
	margin-right: 10px;
}

.inputs #product_Cnt {
	margin-left: 45px;
	margin-right: 10px;
}

.inputs #product_Price {
	margin-left: 45px;
	margin-right: 10px;
}

.inputs #product_Name {
	margin-left: 30px;
}

.main_Img #main_Plus {
	margin-top: 60px;
}

.thumb_Nail #thumb_Plus {
	width: 30px;
	height: 30px;
	margin-top: 20px;
}

.product_Explane {
	margin-left: 150px;
	width: 900px;
	height: 300px;
	padding: 20px;
	margin-top: 10px;
}

.product_Explane_Title {
	margin-left: 150px;
}

.modify_Btn {
	color: white;
	background-color: black;
	position: relative;
	top: 30px;
	right: 105px;
	width: 100px;
	height: 40px;
}

.submit_Btn {
	color: white;
	background-color: black;
	position: relative;
	top: -10px;
	left: 830px;
	width: 100px;
	height: 40px;
}
</style>
</head>

<body>
	<div id="app">
		<div id="wrapper">
			<div class="container">
				<div class="grid_Area">
					<div class="imgs">
						<div class="main_Img">
							<img src="../image/plus.png" id="main_Plus">
						</div>
					</div>
					<div class="inputs">
						<div>
							상품명<input type="text" class="input_Elememt" id="product_Name" v-model="pName">
						</div>
						<div>
							개수<input type="number" class="input_Elememt" id="product_Cnt"v-model="pStock">개
						</div>
						<div>
							가격<input type="text" class="input_Elememt" id="product_Price" v-model="price">원
						</div>
						<div>
							상품종류<select>
									<option></option>
								 </select>
						</div>
					</div>
				</div>
				<h1 class="product_Explane_Title">상품상세 설명</h1>
				<textarea class="product_Explane" placeholder="상품설명을 입력해주세요."></textarea>
				<button class="modify_Btn">수정완료</button>
				<button class="submit_Btn">등록완료</button>
			</div>
		</div>
	</div>
</body>
</html>
<jsp:include page="/layout/footer.jsp"></jsp:include>
<script type="text/javascript">
	var app = new Vue({
		el : '#app',
		data : {
			productNo : "${map.productNo}"
			, list :[]
			, pName : ""
			, 
			

		},
		methods : {

		},
		created : function() {
			var self = this;

		}
	});
</script>