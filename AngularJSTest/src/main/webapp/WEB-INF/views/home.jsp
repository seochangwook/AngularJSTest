<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>  
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<html ng-app="myApp">
<!-- ng-app directive을 설정 시 <html>~</html>의 모든 것을 Angular 어플리케이션에 포함(관리)되어 있다고 알려주는 것  -->
<!-- directive : HTML에게 새로운 동작을 알려주는 방법 -->
<head>
	<title>Home</title>
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<!-- jQuery, bootstrap CDN -->
	<script src="http://code.jquery.com/jquery-latest.min.js"></script>
	<script src="http://code.jquery.com/jquery-migrate-1.2.1.js"></script> <!-- msie 문제 해결 -->
	<script src="http://code.jquery.com/ui/1.11.4/jquery-ui.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/latest/js/bootstrap.min.js"></script>
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/latest/css/bootstrap.min.css">
	<link rel="stylesheet" href="http://code.jquery.com/ui/1.11.4/themes/smoothness/jquery-ui.css">
	<!-- AngularJS CDN -->
	<script src="https://ajax.googleapis.com/ajax/libs/angularjs/1.6.4/angular.min.js"></script>
	<!-- Zebra-Dialog CDN -->
	<script src="resources/js/dialog/zebra_dialog.src.js"></script>
	<link rel="stylesheet" href="resources/css/dialog/zebra_dialog.css" type="text/css"/>
</head>
<body>
<h1>AngularJS Test</h1><br>
<label>* ng-model, ng-bind의 관계</label>
<div>
	<p>Name: <input type="text" ng-model="name"></p>
	<p ng-bind="name"></p>
</div>
<br>
<label>* ng-init, ng-bind의 관계</label>
<div ng-init="firstName='${testvalue}'">
	<p>The name is <span ng-bind="firstName"></span></p>
</div>
<br>
<label>* data-ng-init, data-ng-bind의 관계</label><br>
<div id="testdiv" data-ng-init="value2='${testvalue2}'">
	<p>The name is <span data-ng-bind="value2"></span></p>
</div>
<br>
<label>* expression 사용</label><br>
<div id="testdiv2">
	<p>My First expression: {{5+5}}</p>
	<p>My Second expression: {{${onevalue}+${twovalue}}}</p>
</div>
<br>
<label>* expression, ng-model의 관계</label><br>
<div id="testdiv2">
	<p>Name: <input type="text" ng-model="value"></p>
	<input type="button" id="btn_test1", value='{{value}}'>
</div>
<br>
<label>* Angular Module, controllers 특징 1(controller directive)</label><br>
<div ng-controller="myCtrl">
<!-- ng-controller설정 시 해당 요소의 스코프를 컨트롤러에 할당 -->
<p>First Name: <input type="text" ng-model="firstname"></p>
<p>Last Name: <input type="text" ng-model="lastname"></p>
<p>Full Name: {{firstname + " " + lastname}}</p>
</div>
<br>
<label>* Angular Module, controllers 특징 2(click directive)</label><br>
<div ng-controller="clickCtrl">
<p>value1 : <input type="text" ng-model="value_1"></p>
<p>value2 : <input type="text" ng-model="value_2"></p>
<input type="button" value='click here' ng-click="operator()"><br>
<p>plus 결과: {{answer}}</p>
</div>
<br>
<label>* Angular Module, controllers 특징 3(click directive, JSON model)</label><br>
<div ng-controller="clickCtrl2">
<p>value1 : <input type="text" ng-model="value_1"></p>
<p>value2 : <input type="text" ng-model="value_2"></p>
<input type="button" value='click here' ng-click="operator()"><br>
<p>plus 결과: {{res.answer}}</p>
<p>plus 메세지: {{res.message}}</p>
</div>
<br>
<label>* Angular Array test1(local array data)</label><br>
<div ng-controller="clickCtrl3">
	<table border="1">
		<thead>
			<tr>
				<th>구분</th>
				<th>이름</th>
				<th>나이</th>
				<th>사진</th>
				<th>정보</th>
			</tr>
		</thead>
		<tbody>
		<!-- 복잡하게 forEach를 사용하지 않아도 된다 -->
		<!-- ng-repeat -> for each item in a collection, used on an array of objects -->
			<tr ng-repeat="person in developers | orderBy:'age'">
				<td>{{$index + 1}}</td>
				<td>{{person.name | uppercase}}</td>
				<td>{{person.age}}</td>
				<td><img src="./resources/images/{{person.photo}}" width="100" height="100"></td>
				<td><button data-pid='{{person.name}}'>보기</button></td>
	        </tr>
	    </tbody>
	</table>
</div>
<br>
<label>* Angular Array test2(server array data)</label><br>
<div ng-controller="clickCtrl4">
	<table border="1">
		<thead>
			<tr>
				<th>구분</th>
				<th>이름</th>
				<th>나이</th>
				<th>사진</th>
				<th>정보</th>
			</tr>
		</thead>
		<tbody>
		<!-- 복잡하게 forEach를 사용하지 않아도 된다 -->
		<!-- ng-repeat -> for each item in a collection, used on an array of objects -->
			<tr ng-repeat="person in developers">
				<td>{{$index + 1}}</td>
				<td>{{person.name}}</td>
				<td>{{person.age}}</td>
				<td><img src="./resources/images/{{person.photo}}" width="100" height="100"></td>
				<td><button data-pid='{{person.name}}'>보기</button></td>
	        </tr>
	    </tbody>
	</table>
</div>
</body>
<script type="text/javascript" id="angularjsscript">
var app = angular.module('myApp', []); //사용할 모듈을 불러온다.//
//모듈의 []의 정의는 사용가능한 의존성 모듈들을 정의. 만약 []가 없다면 새로운 모듈을 만들 수 없다.//
//AngularJS에서의 데이터 바인딩 표기법은 {{}}이다.//
////////////////////////
app.controller('myCtrl', function($scope){
	//컨트롤러를 정의하여 해당 컨트롤러가 포함하고 있는(<div~</div>)영역에 의존을 설정한다.(scope)//
	//View영역(HTML)에서는 {{}}로 scope에 접근//
	//$scope를 이용하여 뷰와 컨트롤러간 상호작용이 가능(양방향 바인딩)//
	$scope.firstname = "John";
	$scope.lastname = "Doe";
});
//복잡한 jquery처리 없이(id를 가져오고 click하게 만들고 등등) controller와 scope로 작업가능//
app.controller('clickCtrl', function($scope){
	//클릭이벤트 바인딩//
	$scope.operator = function(){
		$scope.answer = Number($scope.value_1) + Number($scope.value_2);
	}
});
app.controller('clickCtrl2', function($scope){
	//클릭이벤트 바인딩//
	$scope.operator = function(){
		var answer = Number($scope.value_1) + Number($scope.value_2);
		var message = 'success...';
		
		var trans_objeect = 
    	{
        	'answer':answer,
        	'message':message
	    }
		
		$scope.res = trans_objeect;
	}
});
app.controller('clickCtrl3', function($scope){
	//배열정의(json구조)//
	$scope.developers = [
		{name: "Jesus", age: "20", photo:"question.png"},
  		{name: "Dave", age: "18", photo:"error.png"},
  		{name: "Wesley", age: "25", photo:"confirmation.png"},
  		{name: "Krzysztof", age: "6", photo:"information.png"}
	];
});
app.controller('clickCtrl4', function($scope, $http){
	//AngularJS는 $http서비스로 Ajax 구현//
	var page = '1';
	
	var trans_objeect = 
    {
        'page': page
	}
	var trans_json = JSON.stringify(trans_objeect); //json으로 반환//
	
	$http({
		method: 'POST', //방식
		url: 'http://localhost:8080/ontroller/angularajax', /* 통신할 URL */
		data: trans_json, 
		headers: {'Content-Type': 'application/json; charset=utf-8'} //헤더
	}).then(function(response){
        //First function handles success
		var infodialog = new $.Zebra_Dialog({
			title: 'AngularJS Test',
			type: 'confirmation',
			print: false,
			width: 760,
			message:'<strong>Message: $http call result</strong><br><br><p>'+response.data.result+'</p>',
			buttons: ['닫기'],
			onClose: function(caption){
				if(caption == '닫기'){
					
				}
			}
		});
		$scope.developers = response.data.value; //결과를 나타낼 배열모델에 저장//
    },	function(response){
        //Second function handles error
    	var infodialog = new $.Zebra_Dialog({
			title: 'AngularJS Test',
			type: 'confirmation',
			print: false,
			width: 760,
			message:'<strong>Message: $http call result</strong><br><br><p>'+response.data+'</p>',
			buttons: ['닫기'],
			onClose: function(caption){
				if(caption == '닫기'){
					
				}
			}
		});
    });
});
</script>
<script type="text/javascript" id="jqueryscript">
$(function(){
	$("[data-pid]").on("click", function(){    
		var selUserName = $(this).data("pid");
		
		var infodialog = new $.Zebra_Dialog('<strong>Message:</strong><br><br><p>'+selUserName+'</p>',{
			title: 'AngularJS Test',
			type: 'information',
			print: false,
			width: 760,
			buttons: ['닫기'],
			onClose: function(caption){
				if(caption == '닫기'){
					//alert('yes click');
				}
			}
		});
	});
	$('#btn_test1').click(function(){
		var value = $('#btn_test1').val();
		
		var infodialog = new $.Zebra_Dialog('<strong>Message:</strong><br><br><p>'+value+'</p>',{
			title: 'AngularJS Test',
			type: 'information',
			print: false,
			width: 760,
			buttons: ['닫기'],
			onClose: function(caption){
				if(caption == '닫기'){
					//alert('yes click');
				}
			}
		});
	});
});
</script>
</html>
