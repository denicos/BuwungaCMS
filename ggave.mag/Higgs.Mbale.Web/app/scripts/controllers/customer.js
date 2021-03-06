angular
    .module('homer').controller('CustomerController', ['$scope', 'ngTableParams', '$http', '$filter', '$location', 'Utils', 'uiGridConstants',
        function ($scope, ngTableParams, $http, $filter, $location, Utils, uiGridConstants) {
            $scope.loadingSpinner = true;
            var promise = $http.get('/webapi/CustomerApi/GetAllCustomers');
            promise.then(
                function (payload) {
                    $scope.gridData.data = payload.data;
                    $scope.loadingSpinner = false;
                }
            );

            $scope.gridData = {
                enableFiltering: true,
                columnDefs: $scope.columns,
                enableRowSelection: false
            };

            $scope.gridData.multiSelect = false;

            $scope.gridData.columnDefs = [


                {
                    name: 'First Name', field: 'FirstName',
                    sort: {
                        direction: uiGridConstants.ASC,
                        priority: 1
                    }
                },

                { name: 'LastName', field: 'LastName', width: '15%', },

                { name: 'Location', field: 'Location',width:'15%' },
                 { name: 'PhoneNumber', field: 'PhoneNumber', width: '15%', },
                   { name: 'Deliveries', field: 'Id', width: '15%', cellTemplate: '<div class="ui-grid-cell-contents"><a href="#/deliveries/{{row.entity.Id}}">Manage Deliveries</a></div>' },
                      { name: 'Account', field: 'Id', width: '15%', cellTemplate: '<div class="ui-grid-cell-contents"><a href="#/accounttransactionactivities/{{row.entity.Id}}">Manage Account</a></div>' },
                // { name: 'Advances', field: 'Id', width: '15%', cellTemplate: '<div class="ui-grid-cell-contents"><a href="#/advancedpayments/{{row.entity.Id}}">Advanced Payments</a></div>' },


            ];




        }]);


angular
.module('homer').controller('CustomerRegionController', ['$scope', 'ngTableParams', '$http', '$filter', '$location', 'Utils', 'uiGridConstants',
    function ($scope, ngTableParams, $http, $filter, $location, Utils, uiGridConstants) {
        $scope.loadingSpinner = true;
        var regionId = $scope.regionId;
        $scope.regionName = "";
        var promise = $http.get('/webapi/CustomerApi/GetAllCustomersForAParticularRegion?regionId=' + regionId, {});
        promise.then(
            function (payload) {
                $scope.gridData.data = payload.data;
                $scope.loadingSpinner = false;
                $scope.Length = payload.data.length;
                if ($scope.Length > 0) {
                   
                    var firstIndex = 0;
                    $scope.regionName = payload.data[firstIndex].RegionName;


                }
                else {
                    $scope.regionName = "";
                }
            }
        );

        $scope.gridData = {
            enableFiltering: true,
            columnDefs: $scope.columns,
            enableRowSelection: false
        };

        $scope.gridData.multiSelect = false;

        $scope.gridData.columnDefs = [


            {
                name: 'First Name', field: 'FirstName',
                sort: {
                    direction: uiGridConstants.ASC,
                    priority: 1
                }
            },

            { name: 'LastName', field: 'LastName', width: '15%', },

            { name: 'Email', field: 'Email' },
             { name: 'PhoneNumber', field: 'PhoneNumber', width: '15%', },
               { name: 'Action', field: 'Id', width: '15%', cellTemplate: '<div class="ui-grid-cell-contents"><a href="#/orders/{{row.entity.Id}}">Manage Orders</a></div>' },
                  { name: 'Account', field: 'Id', width: '15%', cellTemplate: '<div class="ui-grid-cell-contents"><a href="#/accounttransactionactivities/{{row.entity.Id}}">Manage Account</a></div>' },
             { name: 'Advances', field: 'Id', width: '15%', cellTemplate: '<div class="ui-grid-cell-contents"><a href="#/advancedpayments/{{row.entity.Id}}">Advanced Payments</a></div>' },


        ];




    }]);

angular
    .module('homer').controller('BranchCustomerController', ['$scope', 'ngTableParams', '$http', '$filter', '$location', 'Utils', 'uiGridConstants',
        function ($scope, ngTableParams, $http, $filter, $location, Utils, uiGridConstants) {
            $scope.loadingSpinner = true;
            var branchId = $scope.branchId;
            var promisebranch = $http.get('/webapi/BranchApi/GetBranch?branchId=' + branchId, {});
            promisebranch.then(
                function (payload) {
                    var b = payload.data;

                    $scope.branch = {
                        BranchId: b.BranchId,
                        Name: b.Name,

                    };

                });

            var promise = $http.get('/webapi/CustomerApi/GetAllCustomersForAparticularBranch?branchId=' + branchId, {});
            promise.then(
                function (payload) {
                    $scope.gridData.data = payload.data;
                    $scope.loadingSpinner = false;
                }
            );


            $scope.gridData = {
                enableFiltering: true,
                columnDefs: $scope.columns,
                enableRowSelection: false
            };

            $scope.gridData.multiSelect = false;

            $scope.gridData.columnDefs = [


                {
                    name: 'First Name', field: 'FirstName',
                    sort: {
                        direction: uiGridConstants.ASC,
                        priority: 1
                    }
                },

                { name: 'LastName', field: 'LastName', width: '15%', },

                { name: 'Location', field: 'Location', width: '15%' },
                { name: 'PhoneNumber', field: 'PhoneNumber', width: '15%', },
                { name: 'Deliveries', field: 'Id', width: '15%', cellTemplate: '<div class="ui-grid-cell-contents"><a href="#/deliveries/{{row.entity.Id}}">Manage Deliveries</a></div>' },
                { name: 'Account', field: 'Id', width: '15%', cellTemplate: '<div class="ui-grid-cell-contents"><a href="#/accounttransactionactivities/{{row.entity.Id}}">Manage Account</a></div>' },
                // { name: 'Advances', field: 'Id', width: '15%', cellTemplate: '<div class="ui-grid-cell-contents"><a href="#/advancedpayments/{{row.entity.Id}}">Advanced Payments</a></div>' },


            ];




        }]);