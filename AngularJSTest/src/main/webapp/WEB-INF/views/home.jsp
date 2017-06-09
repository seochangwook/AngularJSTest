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
	<!-- AngularJS External File -->
	<script src="resources/js/homeangular.js"></script>
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
<label>* Angular Array test1(local array data, $http service)</label><br>
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
				<td><img ng-src="./resources/images/{{person.photo}}" width="100" height="100"></td>
				<td><button data-pid='{{person.name}}'>보기</button></td>
	        </tr>
	    </tbody>
	</table>
</div>
<br>
<label>* Angular Array test2(server array data, $http service - POST)</label><br>
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
				<td><img ng-src="./resources/images/{{person.photo}}" width="100" height="100"></td>
				<td><button data-pid='{{person.name}}'>보기</button></td>
	        </tr>
	    </tbody>
	</table>
</div>
<br>
<label>* Angular Array test3(server array data, $http service - GET)</label><br>
<div ng-controller="clickCtrl5">
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
				<td><img ng-src="./resources/images/{{person.photo}}" width="100" height="100"></td>
				<td><button data-pid='{{person.name}}'>보기</button></td>
	        </tr>
	    </tbody>
	</table>
</div>
<br>
<label>* Angular Service test($interval service)</label><br>
<div ng-controller="servicecontroller">
<p>The time is:</p>
<h1>{{theTime}}</h1>
</div>
<br>
<label>* Angular External File test</label><br>
<div ng-controller="extfileCtrl">
<ul>
	<li ng-repeat="x in names">
		{{x.name + ',' + x.country}}
	</li>
</ul>
</div>
</body>
<script type="text/javascript" id="jqueryscript">
$(function(){
	$("[data-pid]").on("click", function(){    
		var selUserName = $(this).data("pid");
		
		var infodialog = new $.Zebra_Dialog('<strong>Message:</strong><br><br><p>'+selUserName+'</p>',{
			title: 'AngularJS Test',
			type: 'information',
			print: false,
			width: 760,
			position: ['right - 20', 'top + 20'],
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
			position: ['right - 20', 'top + 20'],
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
