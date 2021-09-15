angular
    .module('homer')
    .controller('PettyCashEditController', ['$scope', '$http', '$filter', '$location', '$log', '$timeout', '$modal', '$state', 'uiGridConstants', '$interval', 'usSpinnerService',
        function ($scope, $http, $filter, $location, $log, $timeout, $modal, $state, uiGridConstants, $interval, usSpinnerService) {
            $scope.tab = {};
            if ($scope.defaultTab == 'dashboard') {
                $scope.tab.dashboard = true;
            }
            var branchId = $scope.branchId;
            var pettyCashId = $scope.pettyCashId;
            var action = $scope.action;

            $scope.actions = ["+", "-"];

         

            $http.get('/webapi/BranchApi/GetAllBranches').success(function (data, status) {
                $scope.branches = data;
            });
           

           

            if (action == 'create') {
                cashId = 0;
                var promise = $http.get('/webapi/UserApi/GetLoggedInUser', {});
                promise.then(
                    function (payload) {
                        var c = payload.data;
                        $scope.user = {
                            UserName: c.UserName,
                            Id: c.Id,
                            FirstName: c.FirstName,
                            LastName: c.LastName,
                            UserRoles: c.UserRoles,
                        };
                    }

                );
            }

            if (action == 'edit') {
                var promise = $http.get('/webapi/PettyCashApi/GetCash?pettyCashId=' + cashId, {});
                promise.then(
                    function (payload) {
                        var b = payload.data;
                        $scope.cash = {
                            PettyCashId: b.PettyCashId,
                            Notes: b.Notes,
                            Balance: b.Balance,
                           
                            BranchId: b.BranchId,
                           
                            Amount: b.Amount,
                            StartAmount: b.StartAmount,
                            Action: b.Action,
                            CreatedOn: b.CreatedOn,
                            TimeStamp: b.TimeStamp,
                            CreatedBy: b.CreatedBy,
                            Deleted: b.Deleted,
                            UpdatedBy: b.UpdatedBy,

                        };
                    });


            }

            $scope.Save = function (pettyCash) {
                $scope.showMessageSave = false;
                if ($scope.form.$valid) {
                    usSpinnerService.spin('global-spinner');
                    var promise = $http.post('/webapi/PettyCashApi/Save', {

                        PettyCashId: pettyCashId,
                        Amount: pettyCash.Amount,
                        StartAmount: pettyCash.StartAmount,
                        Balance: pettyCash.Balance,
                        BranchId: pettyCash.BranchId,
                       
                        Notes: pettyCash.Notes,
                        Action: pettyCash.Action,
                        
                        CreatedOn: pettyCash.CreatedOn,
                        TimeStamp: pettyCash.TimeStamp,
                        CreatedBy: pettyCash.CreatedBy,
                        Deleted: pettyCash.Deleted,

                    });

                    promise.then(
                        function (payload) {

                            pettyCashId = payload.data;

                            if (pettyCashId == -1) {
                                $scope.showMessageCashNotEnough = true;
                                usSpinnerService.stop('global-spinner');

                                $timeout(function () {
                                    $scope.showMessageCashNotEnough = false;

                                }, 4000);
                            }
                            else {
                                $scope.showMessageSave = true;
                                usSpinnerService.stop('global-spinner');
                                $timeout(function () {
                                    $scope.showMessageSave = false;

                                    if (action == "create") {
                                        $state.go('pettycash.list');
                                    }

                                }, 1500);

                            }


                        });
                }

            }



            $scope.Cancel = function () {

                $state.go('pettycash.list');
            };

            $scope.Delete = function (pettyCashId) {
                $scope.showMessageDeleted = false;
                var promise = $http.get('/webapi/PettyCashApi/Delete?pettyCashId=' + pettyCashId, {});
                promise.then(
                    function (payload) {
                        $scope.showMessageDeleted = true;
                        $timeout(function () {
                            $scope.showMessageDeleted = false;
                            $scope.Cancel();
                        }, 2500);
                        $scope.showMessageDeleteFailed = false;
                    },
                    function (errorPayload) {
                        $scope.showMessageDeleteFailed = true;
                        $timeout(function () {
                            $scope.showMessageDeleteFailed = false;
                            $scope.Cancel();
                        }, 1500);
                    });
            }


        }
    ]);


angular
    .module('homer').controller('PettyCashController', ['$scope', 'ngTableParams', '$http', '$filter', '$location', 'Utils', 'uiGridConstants',
        function ($scope, ngTableParams, $http, $filter, $location, Utils, uiGridConstants) {
            $scope.loadingSpinner = true;
            var promise = $http.get('/webapi/PettyCashApi/GetAllPettyCash');
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
                    name: 'CreatedOn', field: 'CreatedOn',
                    sort: {
                        direction: uiGridConstants.ASC,
                        priority: 1
                    }
                },


                { name: 'Notes', field: 'Notes', width: '30%' },
                { name: 'Received', cellTemplate: '<div ng-if="row.entity.Action ==\'+\'">{{row.entity.Amount}}</div>', cellFilter: 'number' },

                { name: 'Expensed', cellTemplate: '<div ng-if="row.entity.Action ==\'-\'">{{row.entity.Amount}}</div>', cellFilter: 'number' },


                { name: 'Balance', field: 'Balance', cellFilter: 'number' },



            ];




        }]);



angular
    .module('homer').controller('BranchPettyCashController', ['$scope', 'ngTableParams', '$http', '$filter', '$location', 'Utils', 'uiGridConstants',
        function ($scope, ngTableParams, $http, $filter, $location, Utils, uiGridConstants) {

            $scope.accountBalance = 0;
            var branchId = $scope.branchId;
            $scope.loadingSpinner = true;
            var promise = $http.get('/webapi/CashApi/GetAllPettyCashForAParticularBranch?branchId=' + branchId, {});
            promise.then(
                function (payload) {
                    $scope.gridData.data = payload.data;
                    $scope.loadingSpinner = false;
                    $scope.Length = payload.data.length;
                    if ($scope.Length > 0) {

                        //var lastIndex = $scope.Length - 1;
                        //$scope.accountBalance = payload.data[lastIndex].Balance;
                        var firstIndex = 0;
                        $scope.accountBalance = payload.data[firstIndex].Balance;
                    }
                    else {
                        $scope.accountBalance = 0;
                    }
                }
            );
            $scope.retrievedBranchId = $scope.branchId;
            $scope.gridData = {
                enableFiltering: true,
                columnDefs: $scope.columns,
                enableRowSelection: false
            };

            $scope.gridData.multiSelect = false;

            $scope.gridData.columnDefs = [

                {
                    name: 'CreatedOn', field: 'CreatedOn',
                    sort: {
                        direction: uiGridConstants.ASC,
                        priority: 1
                    }
                },


                { name: 'Notes', field: 'Notes', width: '35%' },
                { name: 'Received', cellTemplate: '<div ng-if="row.entity.Action ==\'+\'">{{row.entity.Amount}}</div>', cellFilter: 'number' },

                { name: 'Expensed', cellTemplate: '<div ng-if="row.entity.Action ==\'-\'">{{row.entity.Amount}}</div>', cellFilter: 'number' },


                { name: 'Balance', field: 'Balance', cellFilter: 'number' },




            ];




        }]);

