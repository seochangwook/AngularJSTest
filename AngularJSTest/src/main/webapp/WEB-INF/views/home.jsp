<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>  
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<html>
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
<body  ng-app="" >
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

</body>
<script type="text/javascript">
$(function(){
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
