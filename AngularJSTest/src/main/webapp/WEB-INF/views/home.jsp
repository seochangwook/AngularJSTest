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
	<script src="https://ajax.googleapis.com/ajax/libs/angularjs/1.6.4/angular-route.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/angular-ui-router/0.3.1/angular-ui-router.js"></script>
	<!-- AngularJS File upload CDN -->
	<script src="https://cdnjs.cloudflare.com/ajax/libs/danialfarid-angular-file-upload/12.2.13/ng-file-upload-shim.min.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/danialfarid-angular-file-upload/12.2.13/ng-file-upload.min.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/danialfarid-angular-file-upload/12.2.13/ng-file-upload-all.min.js"></script>
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
				<td><button  ng-click="printItem(person)">보기</button></td>
	        </tr>
	    </tbody>
	</table>
</div>
<br>
<label>* Angular Array test2(server array data, $http service - POST)</label><br>
<div ng-controller="clickCtrl4">
	<label>검색:</label> <input type="text" ng-model="searchKeyword"/><br>
	<label>정렬:</label>
	<select ng-model="orderProperty">
		<option value="" selected>선택하세요</option>
		<option value="name" selected>이름</option>
		<option value="age">나이</option>
	</select>
	<table border="1">
		<thead>
			<tr>
				<th>구분</th>
				<th>이름</th>
				<th>나이</th>
				<th>사진</th>
				<th>정보</th>
				<th>제거</th>
			</tr>
		</thead>
		<tbody>
		<!-- 복잡하게 forEach를 사용하지 않아도 된다 -->
		<!-- ng-repeat -> for each item in a collection, used on an array of objects -->
		<!-- Filter와 Order by를 이용해서 검색과 정렬을 쉽게 한다. -->
			<tr ng-repeat="person in developers | filter:searchKeyword | orderBy:orderProperty">
				<td>{{$index + 1}}</td>
				<td>{{person.name}}</td>
				<td>{{person.age}}</td>
				<td><img ng-src="./resources/images/{{person.photo}}" width="100" height="100"></td>
				<td><button ng-click="printItem(person)">보기</button></td>
				<td><button ng-click="deleteItem(person)">제거</button></td>
	        </tr>
	    </tbody>
	</table>
</div>
<br>
<label>* Angular Array test3(server array data, $http service - GET)</label><br>
<div ng-controller="clickCtrl5">
	<table class="table table-striped">
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
				<td><img class="img-circle" ng-src="./resources/images/{{person.photo}}" width="100" height="100"></td>
				<td><button ng-click="printItem(person)">보기</button></td>
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
<br>
<label>* Angular Forms(checkbox, radiobutton, seslect) Test1</label><br>
<div ng-controller="formdatainfo">
	<label>1. checkbox</label><br>
	<p>{{printMsg}}</p>
	<form>
		<p>Dog: <input type="checkbox" ng-model="checkoption1"></p>
		<p>Cat: <input type="checkbox" ng-model="checkoption2"></p><br>
	</form>
	<h1 ng-show="checkoption1">Dog Select</h1><br>
	<h1 ng-show="checkoption2">Cat Select</h1><br>
	<label>2. radiobutton</label><br>
	<form>
		Pick a topic:
		<input type="radio" ng-model="myVar2" value="dogs">Dogs
		<input type="radio" ng-model="myVar2" value="tuts">Tutorials
		<input type="radio" ng-model="myVar2" value="cars">Cars
	</form>
	<div ng-switch="myVar2">
		<div ng-switch-when="dogs">
			<h1>Dogs</h1>
			<p>Welcome to a world of dogs</p>
		</div>
		<div ng-switch-when="tuts">
			<h1>Tutorials</h1>
			<p>Learn from examples</p>
		</div>
		<div ng-switch-when="cars">
			<h1>Cars</h1>
			<p>Read about cars</p>
		</div>
	</div>
	<br> 
	<label>3. select</label><br>
	<form>
		Select a topic:
		<select ng-model="myVar3">
			<option value="">
			<option value="dogs">Dogs
			<option value="tuts">Tutorials
			<option value="cars">Cars
		</select>
	</form>
	<div ng-switch="myVar3">
		<div ng-switch-when="dogs">
			<div class="alert alert-info">
  				<strong>Info!</strong>Dogs Select
			</div>
		</div>
		<div ng-switch-when="tuts">
			<div class="alert alert-info">
  				<strong>Info!</strong>Tutorial Select
			</div>
		</div>
		<div ng-switch-when="cars">
			<div class="alert alert-info">
  				<strong>Info!</strong>Cars Select
			</div>
		</div>
	</div>
	<br>
	<label>4. 선택 결과보기</label><br>
	<input type="button" value="click" ng-click="formdataclick()">
</div>
<br>
<label>* Angular Forms(checkbox, radiobutton, seslect) Test2 - reset, save</label><br>
<div ng-controller="myForm">
	<form novalidate class="simple-form">
		<label>Name: 
			<input type="text" ng-model="user.name">
		</label><br>
		<label>Age: 
			<input type="number" ng-model="user.age">
		</label><br>
		Gender: 
		<label>
			<input type="radio" ng-model="user.gender" value="male" />male</label>
        <label>
        	<input type="radio" ng-model="user.gender" value="female" />female</label>
        <br>
        <label>Favorite: <br>
        	1.Car: <input type="checkbox" ng-model="user.favorite1"><br>
        	2.Bus: <input type="checkbox" ng-model="user.favorite2">
        	<p ng-show="user.favorite1">Car Select</p>
        	<p ng-show="user.favorite2">Bus Select</p>
        </label><br>
        <label>Topic: <br>
        	<select ng-model="user.topic" ng-options="x for x in topics"></select>
			<div ng-switch="user.topic">
				<div ng-switch-when="dogs">
					<p>Dogs select</p>
				</div>
				<div ng-switch-when="tuts">
					<p>Tutorials select</p>
				</div>
				<div ng-switch-when="cars">
					<p>Cars select</p>
				</div>
			</div>
        </label>
        <br>
		<button ng-click="reset()">RESET</button>
		<button ng-click="update(user)">SAVE</button>
	</form>
	<pre>form={{user | json}}</pre>
	<pre>master={{master | json}}</pre>
</div>
<br>
<label>* Angular Forms(text, file) Test3 - file upload</label><br>
<div ng-controller="fileform">
	<form>
		<label>파일</label>
		<input type="file" ngf-select="onFileSelect($files)" multiple="multiple"><br>
		<label>이메일: </label>
		<input type="email" ng-model="email" placeholder="이메일"><br>
		<button type="button" ng-click="send()">send</button>
	</form>
</div>
<br>
<label>* Angular Forms Test4 - Validation Check</label><br>
<form ng-controller="validateCtrl" name="myForm" novalidate="novalidate">
<p>Username:<br>
<input type="text" name="user" ng-model="user" required="required">
<span style="color:red" ng-show="myForm.user.$dirty && myForm.user.$invalid">
<span ng-show="myForm.user.$error.required">Username is required.</span>
</span>
</p>
<p>Email:<br>
<input type="email" name="email" ng-model="email" required="required">
<span style="color:red" ng-show="myForm.email.$dirty && myForm.email.$invalid">
<span ng-show="myForm.email.$error.required">Email is required.</span>
<span ng-show="myForm.email.$error.email">Invalid email address.</span>
</span>
</p>
<!-- Form에 예외처리를 한다. -->
<p><input type="button" ng-disabled="myForm.user.$dirty && myForm.user.$invalid || myForm.email.$dirty && myForm.email.$invalid" value="click" ng-click="save(user, email)">
</p>
</form>
<br>
<label>* Angular Router Test 1(ngRoute)</label><br>
<a href="#!london">City 1</a>
<a href="#!paris">City 2</a>
<p>Click on the links.</p>
<!-- ng-view는 페이지 주입 위치이다. -->
<div ng-view></div>
<br>
<label>* Angular Router Test 2(UIRoute)</label><br>
<!-- ui-view는 페이지 주입 위치이다. -->
<!-- article.html --> 
<a href="#!header">Header</a>
<a href="#!body">Body</a>
<a href="#!footer">Footer</a>
<p>Click on the links.</p>
<div ui-view></div>
<div>
</body>
<script type="text/javascript" id="jqueryscript">
$(function(){
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
