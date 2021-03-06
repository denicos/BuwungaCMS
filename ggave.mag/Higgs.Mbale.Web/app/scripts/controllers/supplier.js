angular
    .module('homer').controller('SupplierController', ['$scope', 'ngTableParams', '$http', '$filter', '$location', 'Utils', 'uiGridConstants',
        function ($scope, ngTableParams, $http, $filter, $location, Utils, uiGridConstants) {
            $scope.loadingSpinner = true;
            var promise = $http.get('/webapi/SupplierApi/GetAllSuppliers');
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
                   
                },

                { name: 'LastName', field: 'LastName', width: '15%', },
                {
                    name: 'Account Number', field: 'UniqueNumber', width: '15%', 
                },

                { name: 'Email', field: 'Email' },
                 { name: 'PhoneNumber', field: 'PhoneNumber', width: '15%', },
                   { name: 'Supplies', field: 'Id', width: '15%', cellTemplate: '<div class="ui-grid-cell-contents"><a href="#/supplies/{{row.entity.Id}}">Manage Supplies</a></div>' },
                   
                     { name: 'Account', field: 'Id', width: '15%', cellTemplate: '<div class="ui-grid-cell-contents"><a href="#/accounttransactionactivities/{{row.entity.Id}}">Manage Account</a></div>' },

            ];




        }]);

angular
    .module('homer').controller('BranchSupplierController', ['$scope', 'ngTableParams', '$http', '$filter', '$location', 'Utils', 'uiGridConstants',
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

            var promise = $http.get('/webapi/SupplierApi/GetAllSuppliersForAparticularBranch?branchId=' + branchId, {});
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

                },

                { name: 'LastName', field: 'LastName', width: '15%', },
                {
                    name: 'Account Number', field: 'UniqueNumber', width: '15%',
                },

                //{ name: 'Email', field: 'Email' },
                { name: 'PhoneNumber', field: 'PhoneNumber', width: '15%', },
                { name: 'Supplies', field: 'Id', width: '15%', cellTemplate: '<div class="ui-grid-cell-contents"><a href="#/supplies/{{row.entity.Id}}">Manage Supplies</a></div>' },

                { name: 'Account', field: 'Id', width: '15%', cellTemplate: '<div class="ui-grid-cell-contents"><a href="#/accounttransactionactivities/{{row.entity.Id}}">Manage Account</a></div>' },

            ];




        }]);