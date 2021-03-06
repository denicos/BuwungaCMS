angular
    .module('homer')
    .controller('DeliveryEditController', ['$scope', '$http', '$filter', '$location', '$log', '$timeout', '$modal', '$state', 'uiGridConstants', '$interval', 'usSpinnerService',
    function ($scope, $http, $filter, $location, $log, $timeout, $modal, $state, uiGridConstants, $interval,usSpinnerService) {
        $scope.tab = {};
        if ($scope.defaultTab == 'dashboard') {
            $scope.tab.dashboard = true;
        }
       
        
        $scope.deliveryPrice = 0;
        $scope.deliveryQuantity = 0;
        $scope.orderDeliveryGrade = [];
        var selectedBranch;
        $scope.selectedGrades = [];
        $scope.selectedNoBatchGrades = [];
        $scope.batches = [];
        var transactionSubTypeId = 50015;
        var deliveryId = $scope.deliveryId;
        var branchId = $scope.branchId;
        var customerId = $scope.customerId;
        var action = $scope.action;
        
        var departmentId = 10002;
        $scope.paymentModes = [{ Name: "Credit", Id: 10006 }, { Name: "AdvancedPayment", Id: 10007 }];
               
        $http.get('webapi/ProductApi/GetAllproducts').success(function (data, status) {
            $scope.products = data;
        });


       

        $http.get('webapi/GradeApi/GetAllGrades').success(function (data, status) {
            $scope.grades = data;
        });
       
      

        $scope.OnProductChange = function (delivery) {
            //var selectedBranchId = delivery.BranchId

            if (delivery.ProductId == 2) {
                $http.get('/webapi/BatchApi/GetAllBatchesForBrandDelivery?branchId=' + branchId
                ).then(function (responses) {
                    $scope.retrievedBatches = responses.data;

                    angular.forEach($scope.retrievedBatches, function (value, key) {
                        if (value.BrandBalance > 0) {
                            $scope.batches = $scope.batches.concat(value);
                        }
                    });



                });
            }
            else {
                $http.get('/webapi/BatchApi/GetAllBatchesForAParticularBranchToTransfer?branchId=' + branchId + '&productId=' + delivery.ProductId
                ).then(function (responses) {
                    $scope.retrievedBatches = responses.data;
                    $scope.batches = $scope.retrievedBatches;

                });
            }

        }

        
       
        if (action == 'create') {
            deliveryId = 0;
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

        if (action == 'edit')
        {
            var promise = $http.get('/webapi/DeliveryApi/GetDelivery?deliveryId=' + deliveryId, {});
            promise.then(
                function (payload) {
                    var b = payload.data;
                    $scope.delivery = {
                        DeliveryId: b.DeliveryId,
                        CustomerName: b.CustomerName,
                        DeliveryCost: b.DeliveryCost,
                        OrderId: b.OrderId,
                        VehicleNumber: b.VehicleNumber,
                        BranchId: b.BranchId,
                        Price: b.Price,
                        DeliveryDate: b.DeliveryDate != null ? moment(b.DeliveryDate).format('YYYY-MM-DD HH:mm:ss') : null,
                        Amount : b.Amount,
                        Location: b.Location,
                        StoreId : b.StoreId,
                        TransactionSubTypeId : b.TransactionSubTypeId,
                        SectorId: b.SectorId,
                        
                        PaymentModeId : b.PaymentModeId,
                        DriverName: b.DriverName,
                        TimeStamp: b.TimeStamp,
                        CreatedOn: b.CreatedOn,
                        CreatedBy: b.CreatedBy,
                        UpdatedBy: b.UpdatedBy,
                        Deleted: b.Deleted,
                        Batches: b.Batches,
                        DeliveryBatches: b.DeliveryBatches,
                    };
                });

          


        }

    
        $scope.Save = function (delivery,productId) {
            $scope.showMessageSave = false;
           
            $scope.TotalAmount = 0;
            $scope.TotalQuantity = 0;
            $scope.DenominationQuantity = 0;
            $scope.DenominationAmount = 0;
            $scope.showMessageSave = false;
            $scope.showMessageCheckGrade = false;

          
            //if (delivery.Grades != null && productId == 1 && delivery.selectedGrades) {
            //    angular.forEach(delivery.selectedGrades, function (value, key) {
            //        var denominations = value.Denominations;
            //        angular.forEach(denominations, function (denominations) {
            //            $scope.DenominationAmount = (denominations.Price * denominations.QuantityToRemove) + $scope.DenominationAmount;
            //            $scope.DenominationQuantity = (denominations.QuantityToRemove * denominations.Value) + $scope.DenominationQuantity;
            //        });
            //        $scope.TotalAmount = $scope.DenominationAmount;
            //        $scope.TotalQuantity = $scope.DenominationQuantity;

            //    });
            //}
            if (delivery.SelectedDeliveryGrades != null && delivery.SelectedDeliveryGrades !== 'undefined') {
                angular.forEach(delivery.SelectedDeliveryGrades, function (value, key) {
                    var denominations = value.Denominations;
                    angular.forEach(denominations, function (denominations) {
                        $scope.DenominationAmount = (denominations.Price * denominations.Quantity) + $scope.DenominationAmount;
                        $scope.DenominationQuantity = (denominations.Quantity * denominations.Value) + $scope.DenominationQuantity;
                    });
                    $scope.TotalAmount = $scope.DenominationAmount;
                    $scope.TotalQuantity = $scope.DenominationQuantity;

                });
            }
            else if(delivery.SelectedDeliveryGrades == null && productId ==2)
            //else if (delivery.SelectedDeliveryGrades == null && productId == 2)
            {
                if (delivery.WeightLoss != null || delivery.WeightLoss != undefined) {
                    $scope.TotalAmount = delivery.Price * delivery.Quantity;
                   // $scope.TotalAmount = delivery.Price * delivery.Quantity;
                    $scope.TotalQuantity = delivery.Quantity;
                    //$scope.TotalQuantity = brandQuantity;
                }
                else {
                    $scope.showMessageNotWeightLoss = true;

                    $timeout(function () {
                        $scope.showMessageNotWeightLoss = false;
                        $state.go('delivery-edit', { 'action': 'edit', 'customerId': 'customerId',  'deliveryId': 0 });

                        return;

                    }, 2000);
                    return;
                }

            }
            //else if (delivery.selectedNoBatchGrades != null && delivery.selectedNoBatchGrades !== 'undefined') {
            //    angular.forEach(delivery.selectedNoBatchGrades, function (value, key) {
            //        var denominations = value.Denominations;
            //        angular.forEach(denominations, function (denominations) {
            //            $scope.DenominationAmount = (denominations.Price * denominations.Quantity) + $scope.DenominationAmount;
            //            $scope.DenominationQuantity = (denominations.Quantity * denominations.Value) + $scope.DenominationQuantity;
            //        });
            //        $scope.TotalAmount = $scope.DenominationAmount;
            //        $scope.TotalQuantity = $scope.DenominationQuantity;

            //    });
            //}
            else {
                $scope.showMessageCheckGrade = true;
                
                $timeout(function () {
                    $scope.showMessageCheckGrade = false;
                    $state.go('delivery-edit', { 'action': 'edit', 'customerId': 'customerId', 'deliveryId': 0 });

                    return;
                }, 2000);
            }

            usSpinnerService.spin('global-spinner');
            if ($scope.form.$valid) {
                var promise = $http.post('/webapi/DeliveryApi/Save', {
                    DeliveryId: deliveryId,
                    CustomerId :customerId,
                    DeliveryCost: delivery.DeliveryCost,
                    
                    Amount : $scope.TotalAmount,
                    Price: delivery.Price,
                    DeliveryDate : delivery.DeliveryDate,
                    Quantity: $scope.TotalQuantity,
                    VehicleNumber :delivery.VehicleNumber,
                    BranchId: delivery.BranchId,
                    PaymentModeId: delivery.PaymentModeId.Id,
                    ProductId :delivery.ProductId,
                    Location : delivery.Location,
                    SectorId: departmentId,
                    StoreId: delivery.StoreId,
                    SelectedBatchesToDeliver: delivery.selectedGrades,
                    SelectedGrades : delivery.selectedGrades,
                    //SelectedGrades: orderDeliveryGrades,
                    TransactionSubTypeId : transactionSubTypeId,
                    DriverName: delivery.DriverName,
                    
                    CreatedBy: delivery.CreatedBy,
                    CreatedOn: delivery.CreatedOn,
                    Deleted: delivery.Deleted,
                    Grades: delivery.Grades,
                    Batches: delivery.Batches,
                    DeliveryBatches: delivery.DeliveryBatches,
                    SelectedDeliveryGrades: delivery.SelectedDeliveryGrades,
                    //SelectedDeliveryGrades: orderDeliveryGrades,
                    WeightLoss: delivery.WeightLoss,
                });

                promise.then(
                    function (payload) {

                        deliveryId = payload.data;
                        if (deliveryId == -1) {
                            usSpinnerService.stop('global-spinner');
                            $scope.showMessageNoBatchSelected = true;

                            $timeout(function () {
                                $scope.showMessageNoBatchSelected = false;

                            }, 3000);
                        }
                        else if (deliveryId == -2) {
                            usSpinnerService.stop('global-spinner');
                            $scope.showMessageNoSuchGrade = true;

                            $timeout(function () {
                                $scope.showMessageNoSuchGrade = false;

                            }, 3000);
                        }
                        else if (deliveryId == -4) {
                            usSpinnerService.stop('global-spinner');
                            $scope.showMessageNotEnoughFlour = true;

                            $timeout(function () {
                                $scope.showMessageNotEnoughFlour = false;

                            }, 3000);
                        }
                        else {
                            $scope.showMessageSave = true;
                            usSpinnerService.stop('global-spinner');
                            $timeout(function () {
                                $scope.showMessageSave = false;

                                
                                $state.go('delivery-customer-list', { 'customerId': customerId });
                                

                            }, 3000);
                        }
                       


                    });
            }

        }



        $scope.Cancel = function () {

            $state.go('delivery-customer-list', { 'customerId': customerId });

        };     

    }
    ]);


angular
    .module('homer').controller('DeliveryController', ['$scope', 'ngTableParams', '$http', '$filter', '$location', 'Utils', 'uiGridConstants',
        function ($scope, ngTableParams, $http, $filter, $location, Utils, uiGridConstants) {
            $scope.loadingSpinner = true;
            var promise = $http.get('/webapi/DeliveryApi/GetAllDeliveries');
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
                    name: 'Destination', cellTemplate: '<div class="ui-grid-cell-contents"> <a href="#/deliveries/edit/{{row.entity.DeliveryId}}">{{row.entity.Location}}</a> </div>',
                    sort: {
                        direction: uiGridConstants.ASC,
                        priority: 1
                    }
                },
               // {name:'OrderNumber',field:'OrderId'},
                { name: 'Customer Name', field: 'CustomerName' },
                { name: 'Driver Name', field: 'DriverName' },
                {name: 'Driver NIN',field: 'DriverNIN'},
                { name: 'Delivery Charge', field: 'DeliveryCost' },
                { name: 'Vehicle Number', field: 'VehicleNumber' },
                {name:'Quantity',field:'Quantity'},
                //{name:'BatchNumber',field:'BatchNumber'},
                { name: 'Branch Name', field: 'BranchName' },
              
            ];




        }]);


angular
    .module('homer').controller('CustomerDeliveryController', ['$scope', 'ngTableParams', '$http', '$filter', '$location', 'Utils', 'uiGridConstants',
        function ($scope, ngTableParams, $http, $filter, $location, Utils, uiGridConstants) {
            $scope.loadingSpinner = true;
            var customerId = $scope.customerId;
            //var branchId = 0;

            var promiseBranch = $http.get('/webapi/DeliveryApi/GetBranchId');
            promiseBranch.then(
                function (payload) {
                    
                    var b = payload.data;

                   $scope.foundBranchId = b;
                }
            );
           
            $scope.retrievedCustomerId = $scope.customerId;
            

            var promise = $http.get('/webapi/DeliveryApi/GetAllDeliveriesForAParticularCustomer?customerId=' + customerId, {});
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
                    name: 'Destination', field:'Location',
                    sort: {
                        direction: uiGridConstants.ASC,
                        priority: 1
                    }
                },
               // {name:'OrderNumber',field:'OrderId'},
                { name: 'Customer Name', field: 'CustomerName' },
                { name: 'Driver Name', field: 'DriverName' },
                {name:'Amount',field:'Amount'},
                { name: 'Quantity',field:'Quantity'},
                { name: 'Vehicle Number', field: 'VehicleNumber' },
               // {name:'BatchNumber',field:'BatchNumber'},
                { name: 'Branch Name', field: 'BranchName' },
                 { name: 'Delivery Details', cellTemplate: '<div class="ui-grid-cell-contents"> <a href="#/deliveries/detail/{{row.entity.DeliveryId}}"> Delivery Detail</a> </div>' },
                 {
                        name: 'Print', cellTemplate: '<div class="ui-grid-cell-contents" ><a  href="/Excel/Document?documentId={{row.entity.DocumentId}}">Print</a></div>'
                 },
            ];




        }]);



angular
    .module('homer').controller('BranchDeliveryController', ['$scope', 'ngTableParams', '$http', '$filter', '$location', 'Utils', 'uiGridConstants',
        function ($scope, ngTableParams, $http, $filter, $location, Utils, uiGridConstants) {
            $scope.loadingSpinner = true;
            var branchId = $scope.branchId;
            var promise = $http.get('/webapi/DeliveryApi/GetAllBranchDeliveries?branchId=' + branchId, {});
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
                    name: 'Destination', cellTemplate: '<div class="ui-grid-cell-contents"> <a href="#/deliveries/edit/{{row.entity.DeliveryId}}">{{row.entity.Location}}</a> </div>',
                    sort: {
                        direction: uiGridConstants.ASC,
                        priority: 1
                    }
                },
                //{name: 'OrderNumber',field:'OrderId'},
                { name: 'Customer Name', field: 'CustomerName' },
                { name: 'Driver Name', field: 'DriverName' },
                { name: 'Driver NIN', field: 'DriverNIN' },
                { name: 'Delivery Charge', field: 'DeliveryCost' },
                { name: 'Vehicle Number', field: 'VehicleNumber' },
                {name:'BatchNumber',field:'BatchNumber'},
                { name: 'Branch Name', field: 'BranchName' },
                { name: 'Quantity', field: 'Quantity' },

            ];




        }]);


angular
    .module('homer')
    .controller('DeliveryDetailController', ['$scope', '$http', '$filter', '$location', '$log', '$timeout', '$state',
    function ($scope, $http, $filter, $location, $log, $timeout, $state) {
        $scope.tab = {};
        if ($scope.defaultTab == 'dashboard') {
            $scope.tab.dashboard = true;
        }

        var deliveryId = $scope.deliveryId;

        var promise = $http.get('/webapi/DeliveryApi/GetDelivery?deliveryId=' + deliveryId, {});
        promise.then(
                function (payload) {
                    var b = payload.data;
                    $scope.delivery = {
                        DeliveryId: b.DeliveryId,
                        CustomerName: b.CustomerName,
                        DeliveryCost: b.DeliveryCost,
                        OrderId: b.OrderId,
                        VehicleNumber: b.VehicleNumber,
                        BranchName: b.BranchName,
                        Price: b.Price,
                        Quantity : b.Quantity,
                        Amount: b.Amount,
                        DeliveryDate : b.DeliveryDate,
                        Location: b.Location,
                        StoreName: b.StoreName,
                        ProductName : b.ProductName,
                       // DriverNIN: b.DriverNIN,
                        PaymentModeName: b.PaymentModeName,
                        DriverName: b.DriverName,
                        TimeStamp: b.TimeStamp,
                        Grades: b.Grades,
                        DeliveryBatches: b.DeliveryBatches,
                    };
                });
        }]);


angular
    .module('homer').controller('UnApprovedDeliveryController', ['$scope', 'ngTableParams', '$http', '$filter', '$location', 'Utils', 'uiGridConstants',
        function ($scope, ngTableParams, $http, $filter, $location, Utils, uiGridConstants) {
            $scope.loadingSpinner = true;
            var promise = $http.get('/webapi/DeliveryApi/GetAllBranchUnApprovedDeliveries');
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
                    name: 'Destination', field:'Location'
                  
                },

                { name: 'Customer Name', field: 'CustomerName' },
                { name: 'Driver Name', field: 'DriverName' },

                { name: 'Product', field: 'ProductName' },
                { name: 'Vehicle Number', field: 'VehicleNumber' },
                { name: 'Quantity', field: 'Quantity' },
                { name: 'Amount', field: 'Amount' },
                { name: 'Branch ', field: 'BranchName' },
                { name: 'Delivery Details', cellTemplate: '<div class="ui-grid-cell-contents"> <a href="#/unapproveddetail/delivery/{{row.entity.DeliveryId}}">Details</a> </div>' },

            ];




        }]);


