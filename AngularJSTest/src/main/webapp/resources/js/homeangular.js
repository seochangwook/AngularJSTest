/*
 * Module : myApp
 */
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
///////////////////////////
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
///////////////////////////
app.controller('clickCtrl3', function($scope){
	//배열정의(json구조)//
	$scope.developers = [
		{name: "Jesus", age: "20", photo:"question.png"},
  		{name: "Dave", age: "18", photo:"error.png"},
  		{name: "Wesley", age: "25", photo:"confirmation.png"},
  		{name: "Krzysztof", age: "6", photo:"information.png"}
	];
});
///////////////////////////
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
		url: 'http://localhost:8080/ontroller/angularajax',
		data: trans_json, 
		headers: {'Content-Type': 'application/json; charset=utf-8'} //헤더
	}).then(function(response){
        //First function handles success
		var infodialog = new $.Zebra_Dialog({
			title: 'AngularJS Test',
			type: 'confirmation',
			print: false,
			width: 760,
			position: ['right - 20', 'top + 20'],
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
    	var infodialg = new $.Zebra_Dialog({
			title: 'AngularJS Test',
			type: 'error',
			print: false,
			width: 760,
			position: ['right - 20', 'top + 20'],
			message:'<strong>Message: $http call result</strong><br><br><p>'+response.data+'</p>',
			buttons: ['닫기'],
			onClose: function(caption){
				if(caption == '닫기'){
					
				}
			}
		});
    });
});
//////////////////////////
app.controller("clickCtrl5", function($scope, $http){
	var page = '2';
	var number = '10';
	
	$http({
		method: 'GET', //방식
		url: 'http://localhost:8080/ontroller/angularajaxget/'+page+'/'+number
	}).then(function(response){
        //First function handles success
		var infodialog = new $.Zebra_Dialog({
			title: 'AngularJS Test',
			type: 'confirmation',
			print: false,
			width: 760,
			position: ['right - 20', 'top + 20'],
			message:'<strong>Message: $http call result</strong><br><br><p>'+response.data.value+'</p>',
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
			type: 'error',
			print: false,
			width: 760,
			position: ['right - 20', 'top + 20'],
			message:'<strong>Message: $http call result</strong><br><br><p>'+response.data+'</p>',
			buttons: ['닫기'],
			onClose: function(caption){
				if(caption == '닫기'){
					
				}
			}
		});
    });
});
/////////////////////////////
app.controller('servicecontroller', function($scope, $interval){
	$scope.theTime = new Date().toLocaleTimeString();
	
	//1000초마다 반복//
	$interval(function () {
	      $scope.theTime = new Date().toLocaleTimeString();
	}, 1000);
});
////////////////////////////
app.controller('extfileCtrl', function($scope){
	$scope.names = [
	                {name:'Jani',country:'Norway'},
	                {name:'Hege',country:'Sweden'},
	                {name:'Kai',country:'Denmark'}
	];
});