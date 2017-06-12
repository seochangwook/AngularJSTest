/*
 * Module : myApp
 * Source : home.jsp
 */
var app = angular.module('myApp', [
	'ngFileUpload', 
	'ngRoute', 
	'ui.router'
]); //사용할 모듈을 불러온다.//
//모듈의 []의 정의는 사용가능한 의존성 모듈들을 정의. 만약 []가 없다면 새로운 모듈을 만들 수 없다.//
//AngularJS에서의 데이터 바인딩 표기법은 {{}}이다.//
//ngFileUpload는 파일업로드 모듈이다.//

//필요한 변수 선언//
var files = []; //파일이 저장될 배열//
var filecount = 0;
////////////////////////
app.controller('btnCtrl1', function($scope){
	$scope.btn_click = function(value){
		var infodialog = new $.Zebra_Dialog('<strong>Message:</strong><br><br><p>['+value+']</p>',{
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
	}
});
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
	
	$scope.printItem = function(person){
		var infodialog = new $.Zebra_Dialog('<strong>Message:</strong><br><br><p>'+person.name+'</p>',{
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
	}
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
			message:'<strong>Message: $http call result</strong><br><br><p>POST '+response.data.result+'</p>',
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
	
	$scope.printItem = function(person){
		var infodialog = new $.Zebra_Dialog('<strong>Message:</strong><br><br><p>'+person.name+'</p>',{
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
	}
	
	$scope.deleteItem = function(person){
		var infodialog = new $.Zebra_Dialog('<strong>Message:</strong><br><br><p>['+person.name+'] remove?</p>',{
			title: 'AngularJS Test',
			type: 'information',
			print: false,
			width: 760,
			position: ['right - 20', 'top + 20'],
			buttons: ['제거', '취소'],
			onClose: function(caption){
				if(caption == '제거'){
					console.log('remove' + person.name);
					
					$http({
						method: 'POST', //방식
						url: 'http://localhost:8080/ontroller/deletelistajax',
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
							message:'<strong>Message: $http call result</strong><br><br><p>POST '+response.data.result+'</p>',
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
				}
				
				else if(caption == '취소'){
					console.log('remove cancel');
				}
			}
		});
	}
});
//////////////////////////
app.controller("clickCtrl5", function($scope, $http){
	var page = '2';
	var number = '10';
	
	$http({
		method: 'GET', //방식
		url: 'http://localhost:8080/ontroller/angularajaxget/'+page+'/'+number,
	}).then(function(response){
        //First function handles success
		var infodialog = new $.Zebra_Dialog({
			title: 'AngularJS Test',
			type: 'confirmation',
			print: false,
			width: 760,
			position: ['right - 20', 'top + 20'],
			message:'<strong>Message: $http call result</strong><br><br><p>GET '+response.data.result+'</p>',
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
	
	$scope.printItem = function(person){
		var infodialog = new $.Zebra_Dialog('<strong>Message:</strong><br><br><p>'+person.name+'</p>',{
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
	}
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
////////////////////////////
app.controller('formdatainfo', function($scope){
	$scope.printMsg = 'select animal:';
	$scope.formdataclick = function(){
		//일반적으로 scope를 참조하게 되면 value값을 가져온다.//
		//Checkbox//
		var checkboxbuttondata1 = $scope.checkoption1;
		var checkboxbuttondata2 = $scope.checkoption2;
		if(checkboxbuttondata1 == true){
			checkboxbuttondata1 = 'Dog';
		}if(checkboxbuttondata2 == true){
			checkboxbuttondata2 = 'Cat';
		}
		//radiobutton//
		var radiobuttondata = $scope.myVar2;
		//selectbutton//
		var selectbuttondata = $scope.myVar3;
		
		var infodialog = new $.Zebra_Dialog({
			title: 'AngularJS Test',
			type: 'information',
			print: false,
			width: 760,
			position: ['right - 20', 'top + 20'],
			message:'<strong>Message: $http call result</strong><br><br><p>'+checkboxbuttondata1 +'/' + checkboxbuttondata2 + '/' + radiobuttondata + '/' + selectbuttondata +'</p>',
			buttons: ['닫기'],
			onClose: function(caption){
				if(caption == '닫기'){
					
				}
			}
		});
	}
});
//////////////////////////////
app.controller('myForm', function($scope){
	$scope.master = {}; //기존 source//
	$scope.topics = ["dogs", "tuts", "cars"]; //dropdown data//
	
	$scope.reset = function(){
		$scope.user = angular.copy($scope.master);
	}
	
	$scope.update = function(user){
		var checkboxbuttondata1 = user.favorite1;
		var checkboxbuttondata2 = user.favorite2;
		if(checkboxbuttondata1 == true){
			checkboxbuttondata1 = 'Car';
		}else if(checkboxbuttondata1 == false){
			checkboxbuttondata1 = 'not select1';
		}
		
		if(checkboxbuttondata2 == true){
			checkboxbuttondata2 = "Bus";
		}else if(checkboxbuttondata2 == false){
			checkboxbuttondata2 = 'not select2';
		}
		
		console.log('input info: ' + user.name + '/' + user.age + '/' + user.gender + '/' + checkboxbuttondata1 + '/' + checkboxbuttondata2 + '/' + user.topic);
		angular.copy(user, $scope.master);
	}
	
	$scope.reset();
});
////////////////////////////////
app.controller('fileform', function($scope, $http){
	$scope.onFileSelect = function($files) {
		files[filecount] = $files[0];

		filecount++;
    };
    $scope.send = function (){
    	var emailaddress = $scope.email;
    	
    	var formData = new FormData();
    	
    	var id = 0;
    	for(var i=0; i<filecount; i++){
    		if(files[i] == undefined){
    			
    		}else{
    			console.log("uploadfile["+(id++)+"]", files[i]);
    			formData.append("uploadfile["+(id++)+"]", files[i]);
    		}
    	}
    	
    	console.log('email address: ' + emailaddress);
    	
    	formData.append("email", emailaddress);
    	
    	$http({
    		method: 'POST',
            url: 'http://localhost:8080/ontroller/enrollajax',
            data: formData,
            headers: {
                'Content-Type': undefined
            }
    	}).then(function(response){
            //First function handles success
    		console.log('success...');
    		
    		var infodialog = new $.Zebra_Dialog({
    			title: 'AngularJS Test',
    			type: 'confirmation',
    			print: false,
    			width: 760,
    			position: ['right - 20', 'top + 20'],
    			message:'<strong>Message: $http call result</strong><br><br><p>'+response.data.retVal+'</p>',
    			buttons: ['닫기'],
    			onClose: function(caption){
    				if(caption == '닫기'){
    					
    				}
    			}
    		});
        },	function(response){
            //Second function handles error
        	console.log('fail...');
        	
        	var infodialog = new $.Zebra_Dialog({
    			title: 'AngularJS Test',
    			type: 'error',
    			print: false,
    			width: 760,
    			position: ['right - 20', 'top + 20'],
    			message:'<strong>Message: $http call result</strong><br><br><p>file upload fail...</p>',
    			buttons: ['닫기'],
    			onClose: function(caption){
    				if(caption == '닫기'){
    					
    				}
    			}
    		});
        });
    }
});
/////////////////////////////////////
app.controller('validateCtrl', function($scope){
	$scope.user = "John Doe";
	$scope.email = "john.doe@gmail.com";
	
	$scope.save = function(user, email){
		console.log('user: ' + user + '/ email: ' + email);
	}
});
/////////////////////////////////////
//라우터로 여러 jsp를 관리하므로 SPA(Single Page Application) 가능//
app.config(function($routeProvider){
	$routeProvider
	.when("/london", {
		templateUrl : "onepage",
		controller : "londonCtrl"
	})
	.when("/paris", {
		templateUrl : "twopage",
		controller : "parisCtrl"
	});
});
/* Router Controller */
app.controller("londonCtrl", function($scope){
	console.log('controller london');
	$scope.msg = "one page view!!";
	
	$scope.testclick = function(){
		console.log('click one page button');
	}
});
app.controller("parisCtrl", function($scope){
	console.log('controller paris');
	$scope.msg = "two page view!!"
});
////////////////////////////////////////
//라우터로 여러 jsp를 관리하므로 SPA(Single Page Application) 가능 - 향상//
app.config(['$stateProvider', function($stateProvider){
	$stateProvider
	.state('header',{
		url: '/header',
		templateUrl: 'header',
		controller: 'headerCtrl'
	})
	.state('body', {
		url: '/body',
		templateUrl: 'body',
		controller: 'bodyCtrl'
	})
	.state('footer', {
		url: '/footer',
		templateUrl: 'footer',
		controller: 'footerCtrl'
	})
}]);
/* Router Controller */
app.controller('headerCtrl', function($scope){
	$scope.testclick = function(){
		console.log('click header page button');
	}
});
app.controller('bodyCtrl', function($scope){
	$scope.testclick = function(){
		console.log('click body page button');
	}
});
app.controller('footerCtrl', function($scope){
	$scope.testclick = function(){
		console.log('click footer page button');
	}
});