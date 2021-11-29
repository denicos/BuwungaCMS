angular
    .module('homer')
    .controller('BankTransactionEditController', ['$scope', '$http', '$filter', '$location', '$log', '$timeout', '$modal', '$state', 'uiGridConstants', '$interval', 'usSpinnerService',
        function ($scope, $http, $filter, $location, $log, $timeout, $modal, $state, uiGridConstants, $interval, usSpinnerService) {
            $scope.tab = {};
            if ($scope.defaultTab == 'dashboard') {
                $scope.tab.dashboard = true;
            }


            var bankTransactionId = $scope.bankTransactionId;
            var bankId = $scope.bankId;
           
            var action = $scope.action;

            $scope.actions = ["+", "-"];

           


            if (action == 'create') {
                bankTransactionId = 0;
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
                var promise = $http.get('/webapi/BankTransactionApi/GetBankTransaction?transactionActivityId=' + BankTransactionId, {});
                promise.then(
                    function (payload) {
                        var b = payload.data;
                        $scope.transactionActivity = {
                            BankTransactionId: b.BankTransactionId,
                            Notes: b.Notes,
                            Balance: b.Balance,
                            BankId :b.BankId,
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

            $scope.Save = function (bankTransaction) {
                $scope.showMessageSave = false;
                if ($scope.form.$valid) {
                    usSpinnerService.spin('global-spinner');
                    var promise = $http.post('/webapi/BankTransactionApi/Save', {

                        BankTransactionId: bankTransactionId,
                        Amount: bankTransaction.Amount,
                        StartAmount: bankTransaction.StartAmount,
                        Balance: bankTransaction.Balance,
                        
                        BankId: bankId,

                        Notes: bankTransaction.Notes,
                        Action: bankTransaction.Action,

                        CreatedOn: bankTransaction.CreatedOn,
                        TimeStamp: bankTransaction.TimeStamp,
                        CreatedBy: bankTransaction.CreatedBy,
                        Deleted: bankTransaction.Deleted,

                    });

                    promise.then(
                        function (payload) {

                            bankTransactionId = payload.data;
                            $scope.showMessageSave = true;
                            usSpinnerService.stop('global-spinner');
                            $timeout(function () {
                                $scope.showMessageSave = false;

                                if (action == "create") {
                                    $state.go('bank-bankTransactions-view', { 'branchId': branchId, 'bankId': bankId });

                                }

                            }, 1500);


                        });
                }

            }



            $scope.Cancel = function () {

                $state.go('bankTransactions.list');
            };

            $scope.Delete = function (bankTransactionId) {
                $scope.showMessageDeleted = false;
                var promise = $http.get('/webapi/BankTransactionApi/Delete?bankTransactionId=' + bankTransactionId, {});
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
    .module('homer').controller('BankTransactionBankController', ['$scope', 'ngTableParams', '$http', '$filter', '$location', 'Utils', 'uiGridConstants',
        function ($scope, ngTableParams, $http, $filter, $location, Utils, uiGridConstants) {
            $scope.loadingSpinner = true;
            $scope.bankId = 0;
            //var branchId = $scope.branchId;


           
            
            var promise = $http.get('/webapi/BankTransactionApi/GetLatestTwentyBankTransactionsForAParticularBranchAndBank', {});
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
                        $scope.bankName = payload.data[firstIndex].BankName;

                    }
                    else {
                        $scope.accountBalance = 0;
                        $scope.bankName = " ";
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
                    name: 'CreatedOn', field: 'CreatedOn',
                    sort: {
                        direction: uiGridConstants.ASC,
                        priority: 1
                    }
                },


                { name: 'Notes', field: 'Notes' },

                { name: 'WithDraw', cellTemplate: '<div ng-if="row.entity.Action ==\'-\'">{{row.entity.Amount}}</div>' },
                { name: 'Deposit', cellTemplate: '<div ng-if="row.entity.Action ==\'+\'">{{row.entity.Amount}}</div>' },


                { name: 'Balance', field: 'Balance' },


            ];





        }]);
