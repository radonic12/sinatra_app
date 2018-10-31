var testApp = angular.module('testApp', []);

testApp.controller('testController' , function ($scope, $http) {
    
    
    //    Our GET request function
    $scope.getRequest = function (id) {
        
	if(id==null){
	id = "";
	}
	else{
	id = "/"+id;
	}
	console.log("ID:"+id);  
        $http.get("http://localhost:4567/reviews"+id)
            .then(function successCallback(response){
		if(id==""){
                $scope.array = response.data;
		}
		else{
		$scope.array = [response.data];
		}
		 console.log($scope.array);
            }, function errorCallback(response){
                console.log("Unable to perform get request");
            });
    };

    
//    Our POST request function
    
    
});