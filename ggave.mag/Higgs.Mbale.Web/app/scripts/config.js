function configState($stateProvider, $urlRouterProvider, $compileProvider) {

    // Optimize load start with remove binding information inside the DOM element
    $compileProvider.debugInfoEnabled(false);
    
    // Set default state
    $urlRouterProvider

        .otherwise("/dashboard");  

    $stateProvider
          // Dashboard - Main page
        .state('dashboard', {
            url: "/dashboard",
            templateUrl: "/app/views/dashboard.html",
            data: {
                pageTitle: 'Dashboard',
               
            }
        })
   
         .state('login', {
             url: "/login",
             templateUrl: "/app/views/adminAccount/login/login.html",
             data: {
                 //pageTitle: 'Profile'
             }
         })
              // User Profile page
    .state('profile', {
        url: "/profile",
        templateUrl: "/app/views/_common/profile.html",
        data: {
            pageTitle: 'Profile'
        }
    })
     

    
    // Modules section 

         //suppliers
     .state('suppliers', {
         abstract: true,
         url: "/suppliers",
         templateUrl: "/app/views/_common/content_empty.html",
         data: {
             pageTitle: 'Suppliers'
         }
     })

    .state('suppliers.list', {
        url: "/suppliers",
        templateUrl: "/app/views/supplier/list.html",
        data: {
            pageTitle: 'Suppliers',
        },
        controller: function ($scope, $stateParams) {

        }
    })

        .state('suppliersbranch-list', {
            url: "/suppliers/branch/:branchId",
            templateUrl: "/app/views/supplier/branch-supplier.html",
            data: {
                pageTitle: 'Suppliers',
            },
            controller: function ($scope, $stateParams) {
                $scope.branchId = $stateParams.branchId;
            }
        })
        .state('admin-supplier-list', {
            url: "/suppliers",
            templateUrl: "/app/views/supplier/admin-view.html",
            data: {
                pageTitle: 'Suppliers',
            },
            controller: function ($scope, $stateParams) {

            }
        })

        //outsourcers
        .state('outSourcers', {
            abstract: true,
            url: "/outsourcers",
            templateUrl: "/app/views/_common/content_empty.html",
            data: {
                pageTitle: 'Out Sourcers'
            }
        })

        .state('outSourcers.list', {
            url: "/outsourcers",
            templateUrl: "/app/views/outsourcer/list.html",
            data: {
                pageTitle: 'Out Sourcers',
            },
            controller: function ($scope, $stateParams) {

            }
        })
        //mechanics
        .state('mechanics', {
            abstract: true,
            url: "/mechanics",
            templateUrl: "/app/views/_common/content_empty.html",
            data: {
                pageTitle: 'mechanics'
            }
        })

        .state('mechanics.list', {
            url: "/mechanics",
            templateUrl: "/app/views/mechanic/list.html",
            data: {
                pageTitle: 'Mechanics',
            },
            controller: function ($scope, $stateParams) {

            }
        })
             //branchManagers
     .state('branchmanagers', {
         abstract: true,
         url: "/branchmanagers",
         templateUrl: "/app/views/_common/content_empty.html",
         data: {
             pageTitle: 'Branch Managers'
         }
     })

    .state('branchmanagers.list', {
        url: "/branchmanagers",
        templateUrl: "/app/views/branchmanager/list.html",
        data: {
            pageTitle: 'Branch Managers',
        },
        controller: function ($scope, $stateParams) {

        }
    })
          .state('branch-user-edit', {
              url: "/branchmanagers/:userId",
              templateUrl: "/app/views/branchmanager/attachbranch.html",
              data: {
                  pageTitle: 'Attach Branch',
              },
              controller: function ($scope, $stateParams) {
                  $scope.action = $stateParams.action;
                  $scope.userId = $stateParams.userId;
                  $scope.defaultTab = 'edit'

              }
          })
        // creditors
     .state('creditors', {
         abstract: true,
         url: "/creditors",
         templateUrl: "/app/views/_common/content_empty.html",
         data: {
             pageTitle: 'Creditors'
         }
     })

    .state('creditors.list', {
        url: "/creditors",
        templateUrl: "/app/views/creditor/list.html",
        data: {
            pageTitle: 'Creditors',
        },
        controller: function ($scope, $stateParams) {

        }
    })
         .state('branch-creditors-list', {
             url: "/creditors/branch/:branchId",
             templateUrl: "/app/views/creditor/branch-creditor-list.html",
             data: {
                 pageTitle: 'Branch Creditors',
             },
             controller: function ($scope, $stateParams) {
                 $scope.branchId = $stateParams.branchId;

             }
         })

          // debtors
     .state('debtors', {
         abstract: true,
         url: "/debtors",
         templateUrl: "/app/views/_common/content_empty.html",
         data: {
             pageTitle: 'Debtors'
         }
     })

    .state('debtors.list', {
        url: "/debtors",
        templateUrl: "/app/views/debtor/list.html",
        data: {
            pageTitle: 'Debtors',
        },
        controller: function ($scope, $stateParams) {

        }
    })

         .state('branch-debtors-list', {
             url: "/debtors/branch/:branchId",
             templateUrl: "/app/views/debtor/branch-debtor-list.html",
             data: {
                 pageTitle: 'Branch Debtors',
             },
             controller: function ($scope, $stateParams) {
                 $scope.branchId = $stateParams.branchId;

             }
         })
           //customers
     .state('customers', {
         abstract: true,
         url: "/customers",
         templateUrl: "/app/views/_common/content_empty.html",
         data: {
             pageTitle: 'Customers'
         }
     })
          .state('district-list', {
              url: "/customers",
              templateUrl: "/app/views/customer/index.html",
              data: {
                  pageTitle: 'Districts',
              },
              controller: function ($scope, $stateParams) {

              }
          })

            .state('customerregion-list', {
             url:"/region/customers/:regionId",
                templateUrl: "/app/views/customer/regionlist.html",
                data: {
                    pageTitle: 'Customers',
                },
                controller: function ($scope, $stateParams) {
                    
                    $scope.regionId = $stateParams.regionId;
                
                }
            })

    .state('customers.list', {
        url: "/customers",
        templateUrl: "/app/views/customer/list.html",
        data: {
            pageTitle: 'Customers',
        },
        controller: function ($scope, $stateParams) {

        }
    })
        .state('admin-customer-list', {
            url: "/customer",
            templateUrl: "/app/views/customer/admin-view.html",
            data: {
                pageTitle: 'Customers',
            },
            controller: function ($scope, $stateParams) {

            }
        })
        .state('customersbranch-list', {
            url: "/customers/branch/:branchId",
            templateUrl: "/app/views/customer/branch-customer.html",
            data: {
                pageTitle: 'Customers',
            },
            controller: function ($scope, $stateParams) {
                $scope.branchId = $stateParams.branchId;
            }
        })
   //branches
     .state('branches', {
         abstract: true,
         url: "/branches",
         templateUrl: "/app/views/_common/content_empty.html",
         data: {
             pageTitle: 'Branches'
         }
     })

    .state('branches.list', {
        url: "/branches",
        templateUrl: "/app/views/branch/list.html",
        data: {
            pageTitle: 'Branches',
        },
        controller: function ($scope, $stateParams) {

        }
    })

          .state('branch-details-list', {
              url: "/branches/:branchId",
              templateUrl: "/app/views/branch/dashboard.html",
              data: {
                  pageTitle: 'Branch Details',
              },
              controller: function ($scope, $stateParams) {
                  $scope.branchId = $stateParams.branchId;

              }
          })


    .state('branch-edit', {
        url: "/branches/:action/:branchId",
        templateUrl: "/app/views/branch/edit.html",
        data: {
            pageTitle: 'Branch edit',
            pageDesc: ''
        },
        controller: function ($scope, $stateParams) {
            $scope.action = $stateParams.action;
            $scope.branchId = $stateParams.branchId;
            $scope.defaultTab = 'edit';
        }
    })

        //deposits
        .state('deposits', {
            abstract: true,
            url: "/deposits",
            templateUrl: "/app/views/_common/content_empty.html",
            data: {
                pageTitle: 'Deposits'
            }
        })

        .state('deposits.list', {
            url: "/deposits&reductions",
            templateUrl: "/app/views/transactionactivity/depositlist.html",
            data: {
                pageTitle: 'Deposits & Reductions',
            },
            controller: function ($scope, $stateParams) {

            }
        })
         //banks
     .state('banks', {
         abstract: true,
         url: "/banks",
         templateUrl: "/app/views/_common/content_empty.html",
         data: {
             pageTitle: 'Banks'
         }
     })

    .state('banks.list', {
        url: "/banks",
        templateUrl: "/app/views/bank/list.html",
        data: {
            pageTitle: 'Banks',
        },
        controller: function ($scope, $stateParams) {

        }
    })

    .state('bank-edit', {
        url: "/banks/:action/:bankId",
        templateUrl: "/app/views/bank/edit.html",
        data: {
            pageTitle: 'Bank edit',
            pageDesc: ''
        },
        controller: function ($scope, $stateParams) {
            $scope.action = $stateParams.action;
            $scope.bankId = $stateParams.bankId;
            $scope.defaultTab = 'edit';
        }
    })


        .state('reports.millingChargelist', {
            url: "/reports",
            templateUrl: "/app/views/report/millingcharge.html",
            data: {
                pageTitle: 'Bugugu'
            },
            controller: function ($scope, $stateParams) {

            }
        })

        .state('reports.pettyCashlist', {
            url: "/reports",
            templateUrl: "/app/views/report/pettycash.html",
            data: {
                pageTitle: 'Petty Cash'
            },
            controller: function ($scope, $stateParams) {

            }
        })

        //Financial Accounts
        .state('financialAccounts', {
            abstract: true,
            url: "/financialAccounts",
            templateUrl: "/app/views/_common/content_empty.html",
            data: {
                pageTitle: 'Financial Accounts'
            }
        })

        .state('financialAccounts.list', {
            url: "/financialAccounts",
            templateUrl: "/app/views/financialaccount/list.html",
            data: {
                pageTitle: 'Financial Accounts',
            },
            controller: function ($scope, $stateParams) {

            }
        })

        .state('financialAccount-edit', {
            url: "/financialAccounts/:action/:financialAccountId",
            templateUrl: "/app/views/financialaccount/edit.html",
            data: {
                pageTitle: 'Financial Account edit',
                pageDesc: ''
            },
            controller: function ($scope, $stateParams) {
                $scope.action = $stateParams.action;
                $scope.financialAccountId = $stateParams.financialAccountId;
                $scope.defaultTab = 'edit';
            }
        })
        //assets
        .state('assets', {
            abstract: true,
            url: "/assets",
            templateUrl: "/app/views/_common/content_empty.html",
            data: {
                pageTitle: 'Assets'
            }
        })

        .state('assets.list', {
            url: "/assets",
            templateUrl: "/app/views/asset/index.html",
            data: {
                pageTitle: 'Asset',
            },
            controller: function ($scope, $stateParams) {

            }
        })
        .state('branch-asset-list', {
            url: "/assets/branch/:branchId",
            templateUrl: "/app/views/asset/branch-asset-list.html",
            data: {
                pageTitle: 'Branch Assets',
            },
            controller: function ($scope, $stateParams) {
                $scope.branchId = $stateParams.branchId;
            }
        })
        .state('asset-edit', {
            url: "/assets/:action/:assetId",
            templateUrl: "/app/views/asset/edit.html",
            data: {
                pageTitle: 'Asset edit',
                pageDesc: ''
            },
            controller: function ($scope, $stateParams) {
                $scope.action = $stateParams.action;
                $scope.assetId = $stateParams.assetId;
                $scope.defaultTab = 'edit';
            }
        })

        //asset category
        .state('assetCategories', {
            abstract: true,
            url: "/assetCategories",
            templateUrl: "/app/views/_common/content_empty.html",
            data: {
                pageTitle: 'Asset Categories'
            }
        })

        .state('assetCategories.list', {
            url: "/assetCategories",
            templateUrl: "/app/views/assetCategory/list.html",
            data: {
                pageTitle: 'Asset Categories',
            },
            controller: function ($scope, $stateParams) {

            }
        })

        .state('assetCategory-edit', {
            url: "/assetCategories/:action/:assetCategoryId",
            templateUrl: "/app/views/assetCategory/edit.html",
            data: {
                pageTitle: 'Asset Category edit',
                pageDesc: ''
            },
            controller: function ($scope, $stateParams) {
                $scope.action = $stateParams.action;
                $scope.assetCategoryId = $stateParams.assetCategoryId;
                $scope.defaultTab = 'edit';
            }
        })

        //bank transactions
            
     .state('bankTransactions', {
         abstract: true,
         url: "/bankTransactionss",
         templateUrl: "/app/views/_common/content_empty.html",
         data: {
             pageTitle: 'Bank Transactions'
         }
     })

    .state('bankTransactions.list', {
        url: "/bankTransactions",
        templateUrl: "/app/views/banktransaction/list.html",
        data: {
            pageTitle: 'Bank Transactions',
        },
        controller: function ($scope, $stateParams) {

        }
    })

        .state('admin-bankTransaction-list', {
            url: "/bankTransactions",
            templateUrl: "/app/views/bankTransaction/admin-view.html",
            data: {
                pageTitle: 'Bank Transactions',
            },
            controller: function ($scope, $stateParams) {

            }
        })

         .state('branch-bankTransaction-list', {
             url: "/bankTransactions/branch/:branchId",
             templateUrl: "/app/views/banktransaction/bankindex.html",
             data: {
                 pageTitle: 'Branch Banks',
             },
             controller: function ($scope, $stateParams) {
                 $scope.branchId = $stateParams.branchId;
             }
         })
        .state('bank-bankTransactions-view', {
            url: "/bank/bankTransaction/:branchId/:bankId",
            templateUrl: "/app/views/banktransaction/list.html",
            data: {
                pageTitle: 'Bank Transactions',
            },
            controller: function ($scope, $stateParams) {
                $scope.bankId = $stateParams.bankId;
                $scope.branchId = $stateParams.branchId;
            }
        })
    .state('bankTransaction-edit', {
        url: "/bankTransactions/:action/:bankTransactionId/:branchId/:bankId",
        templateUrl: "/app/views/banktransaction/edit.html",
        data: {
            pageTitle: 'Bank Transaction edit',
            pageDesc: ''
        },
        controller: function ($scope, $stateParams) {
            $scope.action = $stateParams.action;
            $scope.bankTransactionId = $stateParams.bankTransactionId;
            $scope.bankId = $stateParams.bankId;
            $scope.branchId = $stateParams.branchId;
            $scope.defaultTab = 'edit';
        }
        })

        //financialaccount transactions

        .state('financialAccountTransactions', {
            abstract: true,
            url: "/financialAccountTransactionss",
            templateUrl: "/app/views/_common/content_empty.html",
            data: {
                pageTitle: 'Financial Account Transactions'
            }
        })

        .state('index-financialAccountTransactions-list', {
            url: "/financialAccountTransactions",
            templateUrl: "/app/views/financialaccounttransaction/financialAccountIndex.html",
            data: {
                pageTitle: 'Financial Account Transactions',
            },
            controller: function ($scope, $stateParams) {

            }
        })

        

        .state('financialAccountTransaction-list', {
            url: "/financialAccountTransactions/:financialAccountId",
            templateUrl: "/app/views/financialaccounttransaction/list.html",
            data: {
                pageTitle: 'Financial Account Transactions',
            },
            controller: function ($scope, $stateParams) {
                $scope.financialAccountId = $stateParams.financialAccountId;
            }
        })
       
        .state('financialAccountTransaction-edit', {
            url: "/financialAccountTransactions/:action/:financialAccountTransactionId/:financialAccountId",
            templateUrl: "/app/views/financialaccounttransaction/edit.html",
            data: {
                pageTitle: 'FinancialAccount Transaction edit',
                pageDesc: ''
            },
            controller: function ($scope, $stateParams) {
                $scope.action = $stateParams.action;
                $scope.financialAccountTransactionId = $stateParams.financialAccountTransactionId;
                $scope.financialAccountId = $stateParams.financialAccountId;
                
                $scope.defaultTab = 'edit';
            }
        })


        //maizeoffloading
            
     .state('maizeOffloadings', {
         abstract: true,
         url: "/maizeOffloadings",
         templateUrl: "/app/views/_common/content_empty.html",
         data: {
             pageTitle: 'Maize Offloadings'
         }
     })

    .state('maizeOffloadings.list', {
        url: "/maizeOffloadings",
        templateUrl: "/app/views/maizeoffloading/list.html",
        data: {
            pageTitle: 'Maize Offloading',
        },
        controller: function ($scope, $stateParams) {

        }
    })

    .state('maizeOffloading-edit', {
        url: "/maizeOffloadings/:action/:maizeOffloadingId",
        templateUrl: "/app/views/maizeoffloading/edit.html",
        data: {
            pageTitle: 'Maize Offloading edit',
            pageDesc: ''
        },
        controller: function ($scope, $stateParams) {
            $scope.action = $stateParams.action;
            $scope.maizeOffloadingId = $stateParams.maizeOffloadingId;
            $scope.defaultTab = 'edit';
        }
    })

  

        //batchprojection
     .state('batchProjections', {
         abstract: true,
         url: "/batchProjections",
         templateUrl: "/app/views/_common/content_empty.html",
         data: {
             pageTitle: 'BatchProjections'
         }
     })

   

        .state('batchProjection-batch', {
            url: "/batchProjections/:batchId",
            templateUrl: "/app/views/batchprojection/list.html",
            data: {
                pageTitle: 'Batch Projection',
                pageDesc: ''
            },
            controller: function ($scope, $stateParams) {
                $scope.batchId = $stateParams.batchId;
                $scope.defaultTab = 'edit';
            }
        })
   
        .state('batchProjection-batch-edit', {
            url: "/batchProjections/:action/:batchProjectionId/:batchId",
            templateUrl: "/app/views/batchProjection/edit.html",
            data: {
                pageTitle: 'Batch Projection edit',
                pageDesc: ''
            },
            controller: function ($scope, $stateParams) {
                $scope.action = $stateParams.action;
                $scope.batchProjectionId = $stateParams.batchProjectionId;
                $scope.batchId = $stateParams.batchId;
                $scope.defaultTab = 'edit';
            }
        })

        .state('batchProjection-batch-detail', {
            url: "/batchProjections/:batchProjectionId/:batchId",
            templateUrl: "/app/views/batchProjection/details.html",
            data: {
                pageTitle: 'Batch Projection Details',
                pageDesc: ''
            },
            controller: function ($scope, $stateParams) {
                $scope.action = $stateParams.action;
                $scope.batchProjectionId = $stateParams.batchProjectionId;
                $scope.batchId = $stateParams.batchId;
                $scope.defaultTab = 'edit';
            }
        })


   //inventories
     .state('inventories', {
         abstract: true,
         url: "/inventories",
         templateUrl: "/app/views/_common/content_empty.html",
         data: {
             pageTitle: 'Inventories'
         }
     })

    //.state('inventories.list', {
    //    url: "/inventories",
    //    templateUrl: "/app/views/inventory/list.html",
    //    data: {
    //        pageTitle: 'Inventories',
    //    },
    //    controller: function ($scope, $stateParams) {

    //    }
    //})

    .state('inventory-edit', {
        url: "/inventories/:action/:inventoryId",
        templateUrl: "/app/views/inventory/edit.html",
        data: {
            pageTitle: 'Inventory edit',
            pageDesc: ''
        },
        controller: function ($scope, $stateParams) {
            $scope.action = $stateParams.action;
            $scope.inventoryId = $stateParams.inventoryId;
            $scope.defaultTab = 'edit';
        }
    })
         .state('inventory-store', {
             url: "/inventories/:storeId",
             templateUrl: "/app/views/inventory/store-inventory-list.html",
             data: {
                 pageTitle: 'Store Inventory',
                 pageDesc: ''
             },
             controller: function ($scope, $stateParams) {
                 $scope.storeId = $stateParams.storeId;
                 $scope.defaultTab = 'edit';
             }
         })

         .state('inventory-store-edit', {
             url: "/inventories/:action/:inventoryId/:storeId",
             templateUrl: "/app/views/inventory/edit.html",
             data: {
                 pageTitle: 'Store Inventory',
                 pageDesc: ''
             },
             controller: function ($scope, $stateParams) {
                 $scope.action = $stateParams.action;
                 $scope.inventoryId = $stateParams.inventoryId;
                 $scope.storeId = $stateParams.storeId;
                 $scope.defaultTab = 'edit';
             }
         })

         //buvera
     .state('buveras', {
         abstract: true,
         url: "/buveras",
         templateUrl: "/app/views/_common/content_empty.html",
         data: {
             pageTitle: 'buveras'
         }
     })

    .state('buveras.list', {
        url: "/buveras",
        templateUrl: "/app/views/buvera/list.html",
        data: {
            pageTitle: 'Buveras',
        },
        controller: function ($scope, $stateParams) {

        }
    })

    .state('buvera-edit', {
        url: "/buveras/:action/:buveraId",
        templateUrl: "/app/views/buvera/edit.html",
        data: {
            pageTitle: 'Buvera edit',
            pageDesc: ''
        },
        controller: function ($scope, $stateParams) {
            $scope.action = $stateParams.action;
            $scope.buveraId = $stateParams.buveraId;
            $scope.defaultTab = 'edit';
        }
    })
         .state('buvera-store', {
             url: "/buveras/:storeId",
             templateUrl: "/app/views/buvera/store-buvera-list.html",
             data: {
                 pageTitle: 'Store Buvera',
                 pageDesc: ''
             },
             controller: function ($scope, $stateParams) {
                 $scope.storeId = $stateParams.storeId;
                 $scope.defaultTab = 'edit';
             }
         })

         .state('buvera-store-edit', {
             url: "/buveras/:action/:buveraId/:storeId",
             templateUrl: "/app/views/buvera/edit.html",
             data: {
                 pageTitle: 'Store Buvera',
                 pageDesc: ''
             },
             controller: function ($scope, $stateParams) {
                 $scope.action = $stateParams.action;
                 $scope.buveraId = $stateParams.buveraId;
                 $scope.storeId = $stateParams.storeId;
                 $scope.defaultTab = 'edit';
             }
         })

         .state('buvera-store-issue', {
             url: "/buveras/:action/:buveraTransferId/:storeId",
             templateUrl: "/app/views/buvera/issuing.html",
             data: {
                 pageTitle: 'Store Buvera',
                 pageDesc: ''
             },
             controller: function ($scope, $stateParams) {
                 $scope.action = $stateParams.action;
                 $scope.buveraTransferId = $stateParams.buveraTransferId;
                 $scope.storeId = $stateParams.storeId;
                 $scope.defaultTab = 'edit';
             }
         })

       

          .state('buvera-transfer-details', {
              url: "/buvera/:storeId/:buveraTransferId",
              templateUrl: "/app/views/buvera/buveratransferdetails.html",
              data: {
                  pageTitle: 'Store Buvera Details',
                  pageDesc: ''
              },
              controller: function ($scope, $stateParams) {
                  $scope.action = 'view';
                  $scope.storeId = $stateParams.storeId;
                  $scope.buveraTransferId = $stateParams.buveraTransferId;

                  $scope.defaultTab = 'edit';
              }
          })
      .state('buveralist-store-transfer', {
          url: "/buvera/:storeId",
          templateUrl: "/app/views/buvera/storebuveratransfers.html",
          data: {
              pageTitle: 'Store Buvera Transfers',
              pageDesc: ''
          },
          controller: function ($scope, $stateParams) {
              $scope.storeId = $stateParams.storeId;
              $scope.defaultTab = 'edit';
          }
      })
        .state('damagedbuvera-store', {
            url: "/buveras/:action/:role/:buveraId/:storeId",
            templateUrl: "/app/views/buvera/damaged.html",
            data: {
                pageTitle: 'Damaged Buvera',
                pageDesc: ''
            },
            controller: function ($scope, $stateParams) {
                $scope.action = $stateParams.action;
                $scope.buveraId = $stateParams.buveraId;
                $scope.storeId = $stateParams.storeId;
                $scope.defaultTab = 'edit';
            }
        })



        .state('buvera-damaged-details', {
            url: "/buvera/:storeId/:buveraId",
            templateUrl: "/app/views/buvera/damageddetails.html",
            data: {
                pageTitle: 'Damaged Buvera Details',
                pageDesc: ''
            },
            controller: function ($scope, $stateParams) {
                $scope.action = 'view';
                $scope.storeId = $stateParams.storeId;
                $scope.buveraId = $stateParams.buveraId;

                $scope.defaultTab = 'edit';
            }
        })
        .state('damagedbuveralist-store', {
            url: "/buvera/:role/:storeId/:buveraCategoryId",
            templateUrl: "/app/views/buvera/storedamagedbuveras.html",
            data: {
                pageTitle: 'Damaged Buveras ',
                pageDesc: ''
            },
            controller: function ($scope, $stateParams) {
                $scope.storeId = $stateParams.storeId;
                $scope.buveraCategoryId = $stateParams.buveraCategoryId;
                $scope.defaultTab = 'edit';
            }
        })

         //stores
     .state('stores', {
         abstract: true,
         url: "/stores",
         templateUrl: "/app/views/_common/content_empty.html",
         data: {
             pageTitle: 'Stores'
         }
     })

    .state('stores.list', {
        url: "/stores",
        templateUrl: "/app/views/store/list.html",
        data: {
            pageTitle: 'Stores',
        },
        controller: function ($scope, $stateParams) {

        }
    })

        .state('inventories.list', {
            url: "/stores",
            templateUrl: "/app/views/inventory/list.html",
            data: {
                pageTitle: 'Inventories',
            },
            controller: function ($scope, $stateParams) {

            }
        })
        .state('branch-stores-list', {
            url: "/stores/branch/:branchId",
            templateUrl: "/app/views/store/branch-store-list.html",
            data: {
                pageTitle: 'Branch Store',
            },
            controller: function ($scope, $stateParams) {
                $scope.branchId = $stateParams.branchId;
            }
        })

    .state('store-edit', {
        url: "/stores/:action/:storeId",
        templateUrl: "/app/views/store/edit.html",
        data: {
            pageTitle: 'Store edit',
            pageDesc: ''
        },
        controller: function ($scope, $stateParams) {
            $scope.action = $stateParams.action;
            $scope.storeId = $stateParams.storeId;
            $scope.defaultTab = 'edit';
        }
    })

          .state('store-flourStanding', {
              url: "/store/storeStanding/:storeId",
              templateUrl: "/app/views/store/storeStanding.html",
              data: {
                  pageTitle: 'Store Details',
              },
              controller: function ($scope, $stateParams) {
                  $scope.storeId = $stateParams.storeId;
                  $scope.defaultTab = 'Store Standing';

              }
          })

          .state('store-brandStanding', {
              url: "/brand/brandStanding/:branchId",
              templateUrl: "/app/views/brandstore/brand.html",
              data: {
                  pageTitle: 'Brand Balance',
              },
              controller: function ($scope, $stateParams) {
                  $scope.branchId = $stateParams.branchId;
                  $scope.defaultTab = 'Brand Standing';

              }
          })
        
         .state('store-riceStanding', {
             url: "/store/storeRiceStanding/:storeId",
             templateUrl: "/app/views/store/riceStanding.html",
             data: {
                 pageTitle: 'Store Rice Details',
             },
             controller: function ($scope, $stateParams) {
                 $scope.storeId = $stateParams.storeId;
                 $scope.defaultTab = 'Store Rice Standing';

             }
         })

        .state('store-buveraStanding', {
            url: "/store/storeBuveraStanding/:storeId",
            templateUrl: "/app/views/store/storeBuveraStanding.html",
            data: {
                pageTitle: 'Store Buvera Details',
            },
            controller: function ($scope, $stateParams) {
                $scope.storeId = $stateParams.storeId;
                $scope.defaultTab = 'Store Buvera Standing';

            }
        })


        .state('store-maize', {
            url: "/maize/:branchId",
            templateUrl: "/app/views/store/store-maize.html",
            data: {
                pageTitle: 'Maize Stock',
                pageDesc: ''
            },
            controller: function ($scope, $stateParams) {
                $scope.branchId = $stateParams.branchId;
                $scope.defaultTab = 'edit';
            }
        })
           //activities
     .state('activities', {
         abstract: true,
         url: "/activities",
         templateUrl: "/app/views/_common/content_empty.html",
         data: {
             pageTitle: 'Activities'
         }
     })

    .state('activities.list', {
        url: "/activities",
        templateUrl: "/app/views/activity/list.html",
        data: {
            pageTitle: 'Activities',
        },
        controller: function ($scope, $stateParams) {

        }
    })

    .state('activity-edit', {
        url: "/activities/:action/:activityId",
        templateUrl: "/app/views/activity/edit.html",
        data: {
            pageTitle: 'Activity edit',
            pageDesc: ''
        },
        controller: function ($scope, $stateParams) {
            $scope.action = $stateParams.action;
            $scope.activityId = $stateParams.activityId;
            $scope.defaultTab = 'edit';
        }
    })

        //unapproved
        .state('unapprovedsupplies-list', {
            url: "/supplies/unapproved/:branchId",
            templateUrl: "/app/views/supply/unapprovedsupplies.html",
            data: {
                pageTitle: 'Supplies',
            },
            controller: function ($scope, $stateParams) {
                $scope.branchId = $stateParams.branchId;

            }
        })

        .state('unapprovedsupplies-admin', {
            url: "/supplies",
            templateUrl: "/app/views/unapprovedindex/supplyadmin.html",
            data: {
                pageTitle: 'UnApproved Supplies',
            },
            controller: function ($scope, $stateParams) {

            }
        })
        .state('unapproveddeliveries-list', {
            url: "/deliveries/unapproved/:branchId",
            templateUrl: "/app/views/delivery/unapproveddeliveries.html",
            data: {
                pageTitle: 'Deliveries',
            },
            controller: function ($scope, $stateParams) {
                $scope.branchId = $stateParams.branchId;

            }
        })
        .state('unapproveddeliveries-admin', {
            url: "/deliveries",
            templateUrl: "/app/views/unapprovedindex/deliveryadmin.html",
            data: {
                pageTitle: 'UnApproved Deliveries',
            },
            controller: function ($scope, $stateParams) {

            }
        })

        .state('unapprovedtransactions-admin', {
            url: "/transactions",
            templateUrl: "/app/views/unapprovedindex/transactionadmin.html",
            data: {
                pageTitle: 'UnApproved Transactions',
            },
            controller: function ($scope, $stateParams) {

            }
        })

        .state('deposit-list', {
            url: "/depositsandreductions/:branchId",
            templateUrl: "/app/views/transactionactivity/depositlist.html",
            data: {
                pageTitle: 'Deposits & Reductions',
            },
            controller: function ($scope, $stateParams) {
                $scope.branchId = $stateParams.branchId;
            }
        })
         //supplies
     .state('supplies', {
         abstract: true,
         url: "/supplies",
         templateUrl: "/app/views/_common/content_empty.html",
         data: {
             pageTitle: 'Supplies'
         }
     })

    .state('supplies.list', {
        url: "/supplies",
        templateUrl: "/app/views/supply/list.html",
        data: {
            pageTitle: 'Supplies',
        },
        controller: function ($scope, $stateParams) {

        }
        })
       

          .state('supplier-supply-list', {
              url: "/supplies/:supplierId",
              templateUrl: "/app/views/supply/supplier-supply.html",
              data: {
                  pageTitle: 'Supplier Supplies',
              },
              controller: function ($scope, $stateParams) {
                  $scope.supplierId = $stateParams.supplierId;

              }
          })

          .state('supplier-dashboard-supply-list', {
              url: "/supplies/supplier/:supplierId",
              templateUrl: "/app/views/supply/dashboard-supply.html",
              data: {
                  pageTitle: 'Supplier Supplies',
              },
              controller: function ($scope, $stateParams) {
                  $scope.supplierId = $stateParams.supplierId;

              }
          })

         .state('branch-supply-list', {
             url: "/supplies/branch/:branchId",
             templateUrl: "/app/views/supply/branch-supplies.html",
             data: {
                 pageTitle: 'Branch Supplies',
             },
             controller: function ($scope, $stateParams) {
                 $scope.branchId = $stateParams.branchId;

             }
         })
            .state('supplier-supply-detail', {
                url: "/supplies/details/:supplierId/:supplyId",
                templateUrl: "/app/views/supply/details.html",
                data: {
                    pageTitle: 'Supplier Supply Details',
                },
                controller: function ($scope, $stateParams) {
                    
                    $scope.supplierId = $stateParams.supplierId;
                    $scope.supplyId = $stateParams.supplyId;
                    $scope.defaultTab = 'edit'

                }
            })

         .state('supplier-supply-edit', {
             url: "/supplies/:action/:supplierId/:supplyId",
             templateUrl: "/app/views/supply/edit.html",
             data: {
                 pageTitle: 'Supplier Supplies Edit',
             },
             controller: function ($scope, $stateParams) {
                 $scope.action = $stateParams.action;
                 $scope.supplierId = $stateParams.supplierId;
                 $scope.supplyId = $stateParams.supplyId;
                 $scope.defaultTab = 'edit'

             }
         })
    .state('supply-edit', {
        url: "/supplies/:action/:supplyId",
        templateUrl: "/app/views/supply/edit.html",
        data: {
            pageTitle: 'Supply edit',
            pageDesc: ''
        },
        controller: function ($scope, $stateParams) {
            $scope.action = $stateParams.action;
            $scope.supplyId = $stateParams.supplyId;
            $scope.defaultTab = 'edit';
        }
    })


               //transactions
     .state('transactions', {
         abstract: true,
         url: "/transactions",
         templateUrl: "/app/views/_common/content_empty.html",
         data: {
             pageTitle: 'Transactions'
         }
     })

    .state('transactions.list', {
        url: "/transactions",
        templateUrl: "/app/views/transaction/list.html",
        data: {
            pageTitle: 'Transactions',
        },
        controller: function ($scope, $stateParams) {

        }
    })

          .state('branch-transaction-list', {
              url: "/transactions/branch/:branchId",
              templateUrl: "/app/views/transaction/branch-transaction-list.html",
              data: {
                  pageTitle: 'Branch Transactions',
              },
              controller: function ($scope, $stateParams) {
                  $scope.branchId = $stateParams.branchId;
              }
          })

    .state('transaction-edit', {
        url: "/transactions/:action/:transactionId",
        templateUrl: "/app/views/transaction/edit.html",
        data: {
            pageTitle: 'Transaction edit',
            pageDesc: ''
        },
        controller: function ($scope, $stateParams) {
            $scope.action = $stateParams.action;
            $scope.transactionId = $stateParams.transactionId;
            $scope.defaultTab = 'edit';
        }
    })

          .state('transanctionType-transactions', {
              url: "/transactions/:transactionTypeId",
              templateUrl: "/app/views/transaction/transactionType-transactions.html",
              data: {
                  pageTitle: 'Transactions',
                  pageDesc: ''
              },
              controller: function ($scope, $stateParams) {
                  $scope.transactionTypeId = $stateParams.transactionTypeId;
              }
          })
   
        //batches
     .state('batches', {
         abstract: true,
         url: "/batches",
         templateUrl: "/app/views/_common/content_empty.html",
         data: {
             pageTitle: 'Batches'
         }
     })

    .state('batches.list', {
        url: "/batches",
        templateUrl: "/app/views/batch/list.html",
        data: {
            pageTitle: 'Batches',
        },
        controller: function ($scope, $stateParams) {

        }
    })
         .state('admin-batches-list', {
             url: "/batches",
             templateUrl: "/app/views/batch/admin-view.html",
             data: {
                 pageTitle: 'Batches',
             },
             controller: function ($scope, $stateParams) {

             }
         })


    .state('branch-batches-list', {
        url: "/batches/branch/:branchId",
        templateUrl: "/app/views/batch/branch-batch-list.html",
        data: {
            pageTitle: 'Branch Batches',
        },
        controller: function ($scope, $stateParams) {
            $scope.branchId = $stateParams.branchId;
        }
    })

    .state('batch-edit', {
        url: "/batches/:action/:batchId",
        templateUrl: "/app/views/batch/edit.html",
        data: {
            pageTitle: 'Batch edit',
            pageDesc: ''
        },
        controller: function ($scope, $stateParams) {
            $scope.action = $stateParams.action;
            $scope.batchId = $stateParams.batchId;
            $scope.defaultTab = 'edit';
        }
    })


         .state('batch-detail', {
             url: "/batch/detail/:batchId",
             templateUrl: "/app/views/batch/detail.html",
             data: {
                 pageTitle: 'Batch Details',
             },
             controller: function ($scope, $stateParams) {
                 $scope.batchId = $stateParams.batchId;
                 $scope.defaultTab = 'detail';

             }
         })

         .state('batchoutput-batch', {
             url: "/batchoutputs/:batchId",
             templateUrl: "/app/views/batchoutput/batch-batchoutput-list.html",
             data: {
                 pageTitle: 'Batch OutPut',
                 pageDesc: ''
             },
             controller: function ($scope, $stateParams) {
                 $scope.batchId = $stateParams.batchId;
                 $scope.defaultTab = 'edit';
             }
         })

         .state('batchoutput-batch-edit', {
             url: "/batchoutputs/:action/:batchOutPutId/:batchId",
             templateUrl: "/app/views/batchoutput/edit.html",
             data: {
                 pageTitle: 'Batch OutPut',
                 pageDesc: ''
             },
             controller: function ($scope, $stateParams) {
                 $scope.action = $stateParams.action;
                 $scope.batchOutPutId = $stateParams.batchOutPutId;
                 $scope.batchId = $stateParams.batchId;
                 $scope.defaultTab = 'edit';
             }
         })

           .state('casualActivity-batch', {
               url: "/casualActivities/:batchId",
               templateUrl: "/app/views/casualactivity/batch-casualActivity-list.html",
               data: {
                   pageTitle: 'Casual Activity',
                   pageDesc: ''
               },
               controller: function ($scope, $stateParams) {
                   $scope.batchId = $stateParams.batchId;
                   $scope.defaultTab = 'edit';
               }
           })

         .state('casualActivity-batch-edit', {
             url: "/casualactivities/:action/:casualActivityId/:batchId",
             templateUrl: "/app/views/casualactivity/edit.html",
             data: {
                 pageTitle: 'Casual Activity',
                 pageDesc: ''
             },
             controller: function ($scope, $stateParams) {
                 $scope.action = $stateParams.action;
                 $scope.casualActivityId = $stateParams.casualActivityId;
                 $scope.batchId = $stateParams.batchId;
                 $scope.defaultTab = 'edit';
             }
         })




         .state('factoryExpense-batch', {
             url: "/factoryExpenses/:batchId",
             templateUrl: "/app/views/factoryExpense/batch-factoryExpense-list.html",
             data: {
                 pageTitle: 'Batch Factory Expenses',
                 pageDesc: ''
             },
             controller: function ($scope, $stateParams) {
                 $scope.batchId = $stateParams.batchId;
                 $scope.defaultTab = 'edit';
             }
         })

          .state('mulitplefactoryExpenses-batch-edit', {
              url: "/factoryExpenses/:action/:batchId",
              templateUrl: "/app/views/factoryExpense/editFactoryExpenses.html",
              data: {
                  pageTitle: 'Batch Factory Expense',
                  pageDesc: ''
              },
              controller: function ($scope, $stateParams) {
                  $scope.action = $stateParams.action;
                  $scope.batchId = $stateParams.batchId;
                  $scope.defaultTab = 'edit';
              }
          })

         .state('factoryExpense-batch-edit', {
             url: "/factoryExpenses/:action/:factoryExpenseId/:batchId",
             templateUrl: "/app/views/factoryExpense/edit.html",
             data: {
                 pageTitle: 'Batch Factory Expense',
                 pageDesc: ''
             },
             controller: function ($scope, $stateParams) {
                 $scope.action = $stateParams.action;
                 $scope.factoryExpenseId = $stateParams.factoryExpenseId;
                 $scope.batchId = $stateParams.batchId;
                 $scope.defaultTab = 'edit';
             }
         })


       

         .state('otherExpense-batch', {
             url: "/otherExpenses/:batchId",
             templateUrl: "/app/views/otherExpense/batch-otherExpense-list.html",
             data: {
                 pageTitle: 'Batch Other Expenses',
                 pageDesc: ''
             },
             controller: function ($scope, $stateParams) {
                 $scope.batchId = $stateParams.batchId;
                 $scope.defaultTab = 'edit';
             }
         })

         .state('otherExpense-batch-edit', {
             url: "/otherExpenses/:action/:otherExpenseId/:batchId",
             templateUrl: "/app/views/otherExpense/edit.html",
             data: {
                 pageTitle: 'Batch Other Expense',
                 pageDesc: ''
             },
             controller: function ($scope, $stateParams) {
                 $scope.action = $stateParams.action;
                 $scope.otherExpenseId = $stateParams.otherExpenseId;
                 $scope.batchId = $stateParams.batchId;
                 $scope.defaultTab = 'edit';
             }
         })

         .state('utility-batch', {
             url: "/utilities/:batchId",
             templateUrl: "/app/views/utility/batch-utility-list.html",
             data: {
                 pageTitle: 'Batch Utilities',
                 pageDesc: ''
             },
             controller: function ($scope, $stateParams) {
                 $scope.batchId = $stateParams.batchId;
                 $scope.defaultTab = 'edit';
             }
         })

         .state('utility-batch-edit', {
             url: "/utilities/:action/:utilityId/:batchId",
             templateUrl: "/app/views/utility/edit.html",
             data: {
                 pageTitle: 'Batch Utility ',
                 pageDesc: ''
             },
             controller: function ($scope, $stateParams) {
                 $scope.action = $stateParams.action;
                 $scope.utilityId = $stateParams.utilityId;
                 $scope.batchId = $stateParams.batchId;
                 $scope.defaultTab = 'edit';
             }
         })

          .state('machineRepair-batch', {
              url: "/machineRepairs/:batchId",
              templateUrl: "/app/views/machinerepair/batch-machineRepair-list.html",
              data: {
                  pageTitle: 'Batch Factory Expenses',
                  pageDesc: ''
              },
              controller: function ($scope, $stateParams) {
                  $scope.batchId = $stateParams.batchId;
                  $scope.defaultTab = 'edit';
              }
          })

         .state('machineRepair-batch-edit', {
             url: "/machineRepairs/:action/:machinerepairId/:batchId",
             templateUrl: "/app/views/machinerepair/edit.html",
             data: {
                 pageTitle: 'Batch Machine Repair',
                 pageDesc: ''
             },
             controller: function ($scope, $stateParams) {
                 $scope.action = $stateParams.action;
                 $scope.machinerepairId = $stateParams.machinerepairId;
                 $scope.batchId = $stateParams.batchId;
                 $scope.defaultTab = 'edit';
             }
         })

         .state('labourCost-batch', {
             url: "/labourCosts/:batchId",
             templateUrl: "/app/views/labourcost/batch-labourCost-list.html",
             data: {
                 pageTitle: 'Batch Labour Cost',
                 pageDesc: ''
             },
             controller: function ($scope, $stateParams) {
                 $scope.batchId = $stateParams.batchId;
                 $scope.defaultTab = 'edit';
             }
         })

         .state('labourCost-batch-edit', {
             url: "/labourCosts/:action/:labourCostId/:batchId",
             templateUrl: "/app/views/labourcost/edit.html",
             data: {
                 pageTitle: 'Batch Labour Cost',
                 pageDesc: ''
             },
             controller: function ($scope, $stateParams) {
                 $scope.action = $stateParams.action;
                 $scope.labourCostId = $stateParams.labourCostId;
                 $scope.batchId = $stateParams.batchId;
                 $scope.defaultTab = 'edit';
             }
         })

   //sectors
     .state('sectors', {
         abstract: true,
         url: "/sectors",
         templateUrl: "/app/views/_common/content_empty.html",
         data: {
             pageTitle: 'Departments'
         }
     })

    .state('sectors.list', {
        url: "/sectors",
        templateUrl: "/app/views/sector/list.html",
        data: {
            pageTitle: 'Departments',
        },
        controller: function ($scope, $stateParams) {

        }
    })

    .state('sector-edit', {
        url: "/sectors/:action/:sectorId",
        templateUrl: "/app/views/sector/edit.html",
        data: {
            pageTitle: 'Department edit',
            pageDesc: ''
        },
        controller: function ($scope, $stateParams) {
            $scope.action = $stateParams.action;
            $scope.sectorId = $stateParams.sectorId;
            $scope.defaultTab = 'edit';
        }
    })
          //transactionSubtypes
     .state('transactionSubTypes', {
         abstract: true,
         url: "/transactionSubTypes",
         templateUrl: "/app/views/_common/content_empty.html",
         data: {
             pageTitle: 'TransactionSubTypes'
         }
     })

    .state('transactionSubTypes.list', {
        url: "/transactionSubTypes",
        templateUrl: "/app/views/transactionSubType/list.html",
        data: {
            pageTitle: 'TransactionSubTypes',
        },
        controller: function ($scope, $stateParams) {

        }
    })

    .state('transactionSubType-edit', {
        url: "/transactionSubTypes/:action/:transactionSubTypeId",
        templateUrl: "/app/views/transactionSubType/edit.html",
        data: {
            pageTitle: 'TransactionSubType edit',
            pageDesc: ''
        },
        controller: function ($scope, $stateParams) {
            $scope.action = $stateParams.action;
            $scope.transactionSubTypeId = $stateParams.transactionSubTypeId;
            $scope.defaultTab = 'edit';
        }
    })

        //CasualActivity
        .state('casualActivities', {
            abstract: true,
            url: "/casualActivities",
            templateUrl: "/app/views/_common/content_empty.html",
            data: {
                pageTitle: 'CasualActivities'
            }
        })

    //.state('casualActivities-list', {
    //    url: "/casualActivities/:accountId",
    //    templateUrl: "/app/views/casualactivity/casualworker-casualactivity-list.html",
    //    data: {
    //        pageTitle: 'Casual Activities',
    //    },
    //    controller: function ($scope, $stateParams) {
    //        $scope.accountId = $stateParams.accountId;
    //    }
    //})

         .state('casualActivities-list', {
             url: "/casualActivities/",
             templateUrl: "/app/views/casualactivity/casualworker-casualactivity-list.html",
             data: {
                 pageTitle: 'Casual Activities',
             },
             controller: function ($scope, $stateParams) {
                 //$scope.accountId = $stateParams.accountId;
             }
         })
    .state('casualactivity-edit', {
        url: "/casualactivities/:action/:accountId/:casualActivityId",
        templateUrl: "/app/views/casualactivity/edit.html",
        data: {
            pageTitle: 'Casual Activity edit',
            pageDesc: ''
        },
        controller: function ($scope, $stateParams) {
            $scope.action = $stateParams.action;
            $scope.accountId = $stateParams.accountId;
            $scope.casualActivityId = $stateParams.casualActivityId;
            $scope.defaultTab = 'edit';
        }
    })


    //casualworkers
     .state('casualWorkers', {
         abstract: true,
         url: "/casualWorkers",
         templateUrl: "/app/views/_common/content_empty.html",
         data: {
             pageTitle: 'Workers'
         }
     })

    .state('casualWorkers.list', {
        url: "/casualWorkers",
        templateUrl: "/app/views/casualWorker/list.html",
        data: {
            pageTitle: 'Workers',
        },
        controller: function ($scope, $stateParams) {

        }
    })

            .state('branch-casualWorker-list', {
                url: "/casualWorkers/branch/:branchId",
                templateUrl: "/app/views/casualWorker/branchCasualWorkers.html",
                data: {
                    pageTitle: 'Branch  Workers',
                },
                controller: function ($scope, $stateParams) {
                    $scope.branchId = $stateParams.branchId;

                }
            })
    .state('casualWorker-edit', {
        url: "/casualWorkers/:action/:casualWorkerId",
        templateUrl: "/app/views/casualWorker/edit.html",
        data: {
            pageTitle: 'Worker edit',
            pageDesc: ''
        },
        controller: function ($scope, $stateParams) {
            $scope.action = $stateParams.action;
            $scope.casualWorkerId = $stateParams.casualWorkerId;
            $scope.defaultTab = 'edit';
        }
    })

            .state('casualworker-detail', {
                url: "/casualworker/detail/:casualWorkerId",
                templateUrl: "/app/views/casualworker/detail.html",
                data: {
                    pageTitle: 'Worker Details',
                },
                controller: function ($scope, $stateParams) {
                    $scope.casualWorkerId = $stateParams.casualWorkerId;
                    $scope.defaultTab = 'detail';

                }
            })

         .state('admin-casualworkers-list', {
             url: "/casualworkers",
             templateUrl: "/app/views/casualworker/admin-view.html",
             data: {
                 pageTitle: 'Workers',
             },
             controller: function ($scope, $stateParams) {

             }
         })

        //requistions
     .state('requistions', {
         abstract: true,
         url: "/requistions",
         templateUrl: "/app/views/_common/content_empty.html",
         data: {
             pageTitle: 'Requistions'
         }
     })

    .state('requistions.list', {
        url: "/requistions",
        templateUrl: "/app/views/requistion/list.html",
        data: {
            pageTitle: 'Requistions',
        },
        controller: function ($scope, $stateParams) {

        }
    })
         .state('admin-requistions-list', {
             url: "/requistions",
             templateUrl: "/app/views/requistion/admin-view.html",
             data: {
                 pageTitle: 'Requistions',
             },
             controller: function ($scope, $stateParams) {

             }
         })

          .state('branch-requistion-list', {
              url: "/requistions/branch/:branchId",
              templateUrl: "/app/views/requistion/branch-requistion-list.html",
              data: {
                  pageTitle: 'Branch Requistions',
              },
              controller: function ($scope, $stateParams) {
                  $scope.branchId = $stateParams.branchId;
              }
          })

    .state('requistion-edit', {
        url: "/requistions/:action/:requistionId",
        templateUrl: "/app/views/requistion/edit.html",
        data: {
            pageTitle: 'Requistion edit',
            pageDesc: ''
        },
        controller: function ($scope, $stateParams) {
            $scope.action = $stateParams.action;
            $scope.requistionId = $stateParams.requistionId;
            $scope.defaultTab = 'edit';
        }
    })
        .state('requistion-detail', {
            url: "/requistions/:action/details/:requistionId",
            templateUrl: "/app/views/requistion/details.html",
            data: {
                pageTitle: 'Requistion Details',
            },
            controller: function ($scope, $stateParams) {
                $scope.action = $stateParams.action;
                $scope.requistionId = $stateParams.requistionId;
                $scope.defaultTab = 'edit'

            }
        })

    .state('status-requistions', {
        url: "/requistions/:statusId/:action/:branchId",
            templateUrl: "/app/views/requistion/status-requistions.html",
        data: {
            pageTitle: 'Requistions',
            pageDesc: ''
         },
         controller: function ($scope, $stateParams) {
             $scope.statusId = $stateParams.statusId;
             $scope.branchId = $stateParams.branchId;
        }
    })

    //products
     .state('products', {
         abstract: true,
         url: "/products",
         templateUrl: "/app/views/_common/content_empty.html",
         data: {
             pageTitle: 'products'
         }
     })

    .state('products.list', {
        url: "/products",
        templateUrl: "/app/views/product/list.html",
        data: {
            pageTitle: 'products',
        },
        controller: function ($scope, $stateParams) {

        }
    })

    .state('product-edit', {
        url: "/products/:action/:productId",
        templateUrl: "/app/views/product/edit.html",
        data: {
            pageTitle: 'product edit',
            pageDesc: ''
        },
        controller: function ($scope, $stateParams) {
            $scope.action = $stateParams.action;
            $scope.productId = $stateParams.productId;
            $scope.defaultTab = 'edit';
        }
    })
         //stocks
     .state('stocks', {
         abstract: true,
         url: "/stocks",
         templateUrl: "/app/views/_common/content_empty.html",
         data: {
             pageTitle: 'stocks'
         }
     })

    .state('stocks.list', {
        url: "/stocks",
        templateUrl: "/app/views/stock/list.html",
        data: {
            pageTitle: 'stocks',
        },
        controller: function ($scope, $stateParams) {

        }
    })
      

           .state('stock-detail', {
             url: "/stock/detail/:stockId",
             templateUrl: "/app/views/stock/detail.html",
             data: {
                 pageTitle: 'Stock Details',
             },
             controller: function ($scope, $stateParams) {
                 $scope.stockId = $stateParams.stockId;
                 $scope.defaultTab = 'detail';

             }
           })

         .state('stock-store', {
             url: "/stocks/:storeId",
             templateUrl: "/app/views/stock/store-stock-list.html",
             data: {
                 pageTitle: 'Store Stock',
                 pageDesc: ''
             },
             controller: function ($scope, $stateParams) {
                 $scope.storeId = $stateParams.storeId;
                 $scope.defaultTab = 'edit';
             }
         })

    //orders
     .state('orders', {
         abstract: true,
         url: "/orders",
         templateUrl: "/app/views/_common/content_empty.html",
         data: {
             pageTitle: 'orders'
         }
     })

    .state('orders.list', {
        url: "/orders",
        templateUrl: "/app/views/order/list.html",
        data: {
            pageTitle: 'orders',
        },
        controller: function ($scope, $stateParams) {

        }
    })

          .state('branch-order-list', {
              url: "/orders/branch/:branchId",
              templateUrl: "/app/views/order/branch-order-list.html",
              data: {
                  pageTitle: 'Branch Orders',
              },
              controller: function ($scope, $stateParams) {
                  $scope.branchId = $stateParams.branchId;
              }
          })

         .state('customerorders-list', {
             url: "/orders/:customerId",
             templateUrl: "/app/views/order/customer-orders.html",
             data: {
                 pageTitle: 'orders',
             },
             controller: function ($scope, $stateParams) {
                 $scope.customerId = $stateParams.customerId;
             }
         })

          .state('customervieworders-list', {
              url: "/orders/view/:customerId",
              templateUrl: "/app/views/order/customerorderview.html",
              data: {
                  pageTitle: 'orders',
              },
              controller: function ($scope, $stateParams) {
                  $scope.customerId = $stateParams.customerId;
              }
          })

    .state('order-edit', {
        url: "/orders/:action/:customerId/:orderId",
        templateUrl: "/app/views/order/edit.html",
        data: {
            pageTitle: 'order edit',
            pageDesc: ''
        },
        controller: function ($scope, $stateParams) {
            $scope.action = $stateParams.action;
            $scope.customerId = $stateParams.customerId;
            $scope.orderId = $stateParams.orderId;
            $scope.defaultTab = 'edit';
        }
    })

         .state('order-detail', {
             url: "/order/detail/:orderId",
             templateUrl: "/app/views/order/detail.html",
             data: {
                 pageTitle: 'Order Details',
             },
             controller: function ($scope, $stateParams) {
                 $scope.orderId = $stateParams.orderId;
                 $scope.defaultTab = 'detail';

             }
         })

        //weightnote range
        .state('weightnoteranges', {
            abstract: true,
            url: "/weightnoteranges",
            templateUrl: "/app/views/_common/content_empty.html",
            data: {
                pageTitle: 'weightnoteranges'
            }
        })

        .state('weightnoteranges.list', {
            url: "/weightnoteranges",
            templateUrl: "/app/views/weightnoterange/list.html",
            data: {
                pageTitle: 'weight note ranges',
            },
            controller: function ($scope, $stateParams) {

            }
        })

        .state('branch-weightnoterange-list', {
            url: "/weightnoteranges/branch/:branchId",
            templateUrl: "/app/views/weightnoterange/branch-weightnoterange-list.html",
            data: {
                pageTitle: 'Branch weightNote Ranges',
            },
            controller: function ($scope, $stateParams) {
                $scope.branchId = $stateParams.branchId;
            }
        })

     

        .state('weightnoterange-edit', {
            url: "/weightnoteranges/:action/:weightNoteRangeId",
            templateUrl: "/app/views/weightnoterange/edit.html",
            data: {
                pageTitle: 'weightnoterange edit',
                pageDesc: ''
            },
            controller: function ($scope, $stateParams) {
                $scope.action = $stateParams.action;
               
                $scope.weightNoteRangeId = $stateParams.weightNoteRangeId;
                $scope.defaultTab = 'edit';
            }
        })

        .state('weightnoterange-detail-weightnotrange', {
            url: "/weightnoteranges/detail/:branchId/:weightNoteRangeId",
            templateUrl: "/app/views/weightnoterange/details.html",
            data: {
                pageTitle: 'weightNoteRange Details',
            },
            controller: function ($scope, $stateParams) {
                $scope.weightNoteRangeId = $stateParams.weightNoteRangeId;
                $scope.defaultTab = 'detail';

            }
        })

     //deliveries
     .state('deliveries', {
         abstract: true,
         url: "/deliveries",
         templateUrl: "/app/views/_common/content_empty.html",
         data: {
             pageTitle: 'deliveries'
         }
     })
       
    .state('deliveries.list', {
        url: "/deliveries",
        templateUrl: "/app/views/delivery/list.html",
        data: {
            pageTitle: 'deliveries',
        },
        controller: function ($scope, $stateParams) {

        }
    })

          .state('delivery-detail', {
              url: "/deliveries/detail/:deliveryId",
              templateUrl: "/app/views/delivery/detail.html",
              data: {
                  pageTitle: 'Delivery Details',
              },
              controller: function ($scope, $stateParams) {
                  $scope.deliveryId = $stateParams.deliveryId;
                  $scope.defaultTab = 'detail';

              }
          })

        .state('unapproveddelivery-detail', {
            url: "/unapproveddetail/delivery/:deliveryId",
            templateUrl: "/app/views/delivery/unApprovedDelivery.html",
            data: {
                pageTitle: 'Details',
            },
            controller: function ($scope, $stateParams) {
                $scope.deliveryId = $stateParams.deliveryId;
                $scope.defaultTab = 'detail';

            }
        })
    .state('delivery-edit', {
        url: "/deliveries/:action/:customerId/:deliveryId",
        templateUrl: "/app/views/delivery/edit.html",
        data: {
            pageTitle: 'delivery edit',
            pageDesc: ''
        },
        controller: function ($scope, $stateParams) {
            $scope.action = $stateParams.action;
            $scope.deliveryId = $stateParams.deliveryId;
            $scope.customerId = $stateParams.customerId;
           
            $scope.defaultTab = 'edit';
        }
    })
         //.state('delivery-order-list', {
         //    url: "/deliveries/:orderId",
         //    templateUrl: "/app/views/delivery/order-delivery-list.html",
         //    data: {
         //        pageTitle: 'Order Delivery list',
         //        pageDesc: ''
         //    },
         //    controller: function ($scope, $stateParams) {
               
         //        $scope.orderId = $stateParams.orderId;
                
         //    }
         //})
        .state('delivery-customer-list', {
            url: "/deliveries/:customerId",
            templateUrl: "/app/views/delivery/order-delivery-list.html",
            data: {
                pageTitle: 'Customer Delivery list',
                pageDesc: ''
            },
            controller: function ($scope, $stateParams) {

                $scope.customerId = $stateParams.customerId;

            }
        })

      .state('delivery-branch-list', {
          url: "/deliveries/branch/:branchId",
          templateUrl: "/app/views/delivery/branch-delivery-list.html",
          data: {
              pageTitle: 'Branch Delivery list',
              pageDesc: ''
          },
          controller: function ($scope, $stateParams) {

              $scope.branchId = $stateParams.branchId;

          }
      })
    

    //machinerepairs
     .state('machinerepairs', {
         abstract: true,
         url: "/machinerepairs",
         templateUrl: "/app/views/_common/content_empty.html",
         data: {
             pageTitle: 'machinerepairs'
         }
     })

    .state('machinerepairs.list', {
        url: "/machinerepairs",
        templateUrl: "/app/views/machinerepair/list.html",
        data: {
            pageTitle: 'machinerepairs',
        },
        controller: function ($scope, $stateParams) {

        }
    })

    .state('machinerepair-edit', {
        url: "/machinerepairs/:action/:machinerepairId",
        templateUrl: "/app/views/machinerepair/edit.html",
        data: {
            pageTitle: 'machinerepair edit',
            pageDesc: ''
        },
        controller: function ($scope, $stateParams) {
            $scope.action = $stateParams.action;
            $scope.machinerepairId = $stateParams.machinerepairId;
            $scope.defaultTab = 'edit';
        }
    })

               //reports
     .state('reports', {
         abstract: true,
         url: "/reports",
         templateUrl: "/app/views/_common/content_empty.html",
         data: {
             pageTitle: 'Reports'
         }
     })
                //reports
     .state('reports.index', {
     
         url: "/reports",
         templateUrl: "/app/views/report/index.html",
         data: {
             pageTitle: 'Reports'
         }
     })

        //outsourcerrepots
        .state('reports.outSourcerIndex', {

            url: "/reports",
            templateUrl: "/app/views/report/outsourcers/outsourcerindex.html",
            data: {
                pageTitle: 'Reports'
            }
        })
        .state('reports.outSourcerDeliverylist', {

            url: "/reports",
            templateUrl: "/app/views/report/outsourcers/outsourcerstoredelivery.html",
            data: {
                pageTitle: 'Reports'
            }
        })
        .state('reports.outsourcerDeliveryTotals', {

            url: "/reports",
            templateUrl: "/app/views/report/outsourcers/outsourcerstoredeliveryTotals.html",
            data: {
                pageTitle: 'Delivery Totals'
            }
        })
      
        .state('reports.OutSourcerflourTotals', {

            url: "/reports",
            templateUrl: "/app/views/report/outsourcers/outsourcerflourtotals.html",
            data: {
                pageTitle: 'Reports'
            }
        })

        .state('reports.outputlist', {

            url: "/reports",
            templateUrl: "/app/views/report/outsourcers/outsourceroutputs.html",
            data: {
                pageTitle: 'Reports'
            }
        })

        .state('reports.riceInputlist', {

            url: "/reports",
            templateUrl: "/app/views/report/rice/riceinputs.html",
            data: {
                pageTitle: 'Reports'
            }
        })
        .state('reports.outsourcerDeliverylist', {

            url: "/reports",
            templateUrl: "/app/views/report/outsourcers/outsourcerstoredelivery.html",
            data: {
                pageTitle: 'Reports'
            }
        })
        .state('reports.outSourcerTotalindex', {

            url: "/reports",
            templateUrl: "/app/views/report/outsourcers/outSourcerTotalindex.html",
            data: {
                pageTitle: 'Reports'
            }
        })


        .state('reports.outSourcerAccountTransactionlist', {
            url: "/reports",
            templateUrl: "/app/views/report/outsourcers/outsourcertransactions.html",
            data: {
                pageTitle: 'Account Transactions',
            },
            controller: function ($scope, $stateParams) {

            }
        })
        ///Weightloss reports
        .state('reports.weightLosses', {

            url: "/reports",
            templateUrl: "/app/views/report/weightlosses.html",
            data: {
                pageTitle: 'Weight Losses'
            }
        })
 .state('reports.deliveryTotals', {
     
         url: "/reports",
         templateUrl: "/app/views/report/deliveryTotals.html",
         data: {
             pageTitle: 'Delivery Totals'
         }
        })
        .state('reports.cashSaleTotals', {

            url: "/reports",
            templateUrl: "/app/views/report/cashSaleTotals.html",
            data: {
                pageTitle: 'Reports'
            }
        })
        .state('reports.flourTotals', {

            url: "/reports",
            templateUrl: "/app/views/report/flourTotals.html",
            data: {
                pageTitle: 'Reports'
            }
        })
        .state('reports.totalindex', {

            url: "/reports",
            templateUrl: "/app/views/report/totalindex.html",
            data: {
                pageTitle: 'Reports'
            }
        })
     .state('reports.transactionlist', {
         url: "/reports",
         templateUrl: "/app/views/report/transactions.html",
         data: {
             pageTitle: 'Transactions',
         },
         controller: function ($scope, $stateParams) {

         }
     })
         .state('reports.accountTransactionlist', {
             url: "/reports",
             templateUrl: "/app/views/report/accountTransactions.html",
             data: {
                 pageTitle: 'Account Transactions',
             },
             controller: function ($scope, $stateParams) {

             }
         })

         .state('reports.utilityAccountlist', {
             url: "/reports",
             templateUrl: "/app/views/report/utilityAccounts.html",
             data: {
                 pageTitle: 'Utility Account Transactions',
             },
             controller: function ($scope, $stateParams) {

             }
         })

         .state('reports.customerTransactionlist', {
             url: "/reports",
             templateUrl: "/app/views/report/customerTransactions.html",
             data: {
                 pageTitle: 'Customer Transactions',
             },
             controller: function ($scope, $stateParams) {

             }
         })

     .state('reports.supplylist', {
         url: "/reports",
         templateUrl: "/app/views/report/supplies.html",
         data: {
             pageTitle: 'Supplies',
         },
         controller: function ($scope, $stateParams) {

         }
     })


     .state('reports-supplysupplierlist', {
         url: "/reports/supplier/:supplierId",
         templateUrl: "/app/views/report/supplies-dashboard.html",
         data: {
             pageTitle: 'Supplies',
         },
         controller: function ($scope, $stateParams) {
             $scope.supplierId = $stateParams.supplierId;
         }
     })

         .state('reports.batchlist', {
             url: "/reports",
             templateUrl: "/app/views/report/batches.html",
             data: {
                 pageTitle: 'Batches',
             },
             controller: function ($scope, $stateParams) {

             }
         })
         .state('reports.branchBatchlist', {
             url: "/reports",
             templateUrl: "/app/views/report/branch-batch.html",
             data: {
                 pageTitle: 'Branch Batches',
             },
             controller: function ($scope, $stateParams) {

             }
         })

         .state('reports.debtorlist', {
             url: "/reports",
             templateUrl: "/app/views/report/debtors.html",
             data: {
                 pageTitle: 'Debtors',
             },
             controller: function ($scope, $stateParams) {

             }
         })

           .state('reports.advancePaymentlist', {
               url: "/reports",
               templateUrl: "/app/views/report/advancePayment.html",
               data: {
                   pageTitle: 'Advance Payments'
               },
               controller: function ($scope, $stateParams) {

               }
           })
         .state('reports.depositlist', {
             url: "/reports",
             templateUrl: "/app/views/report/deposit.html",
             data: {
                 pageTitle: 'Deposits'
             },
             controller: function ($scope, $stateParams) {

             }
        })
        .state('reports.discountlist', {
            url: "/reports",
            templateUrl: "/app/views/report/discount.html",
            data: {
                pageTitle: 'Discounts'
            },
            controller: function ($scope, $stateParams) {

            }
        })
        .state('reports.recoverylist', {
            url: "/reports",
            templateUrl: "/app/views/report/recovery.html",
            data: {
                pageTitle: 'Recoveries'
            },
            controller: function ($scope, $stateParams) {

            }
        })
          .state('reports.creditorlist', {
              url: "/reports",
              templateUrl: "/app/views/report/creditors.html",
              data: {
                  pageTitle: 'Creditors',
              },
              controller: function ($scope, $stateParams) {

              }
          })
    .state('reports.casualTransactionList', {
        url: "/reports",
        templateUrl: "/app/views/report/casualTransactions.html",
        data: {
            pageTitle: 'Worker Transactions',
        },
        controller: function ($scope, $stateParams) {

        }
    })
   
         .state('reports.deliverylist', {
             url: "/reports",
             templateUrl: "/app/views/report/deliveries.html",
             data: {
                 pageTitle: 'Deliveries',
             },
             controller: function ($scope, $stateParams) {

             }
         })

         .state('reports.otherExpenselist', {
             url: "/reports",
             templateUrl: "/app/views/report/otherExpenses.html",
             data: {
                 pageTitle: 'Other Expenses',
             },
             controller: function ($scope, $stateParams) {

             }
         })
         .state('reports.factoryExpenselist', {
             url: "/reports",
             templateUrl: "/app/views/report/factoryExpenses.html",
             data: {
                 pageTitle: 'Factory Expenses',
             },
             controller: function ($scope, $stateParams) {

             }
         })

          .state('reports.flourTransferTotals', {
              url: "/reports",
              templateUrl: "/app/views/report/flourTransferTotals.html",
              data: {
                  pageTitle: 'Flour Transfer Totals',
              },
              controller: function ($scope, $stateParams) {

              }
          })
         .state('reports.batchOutPutlist', {
             url: "/reports",
             templateUrl: "/app/views/report/batchoutputs.html",
             data: {
                 pageTitle: 'BatchOutPuts',
             },
             controller: function ($scope, $stateParams) {

             }
         })
         .state('reports.flourTransferlist', {
             url: "/reports",
             templateUrl: "/app/views/report/flourTransfer.html",
             data: {
                 pageTitle: 'Flour Transfers',
             },
             controller: function ($scope, $stateParams) {

             }
        })
       
          .state('reports.buveraTransferlist', {
              url: "/reports",
              templateUrl: "/app/views/report/buveraTransfer.html",
              data: {
                  pageTitle: 'Buvera Transfers',
              },
              controller: function ($scope, $stateParams) {

              }
        })
        .state('reports.buveraTransferTotals', {
            url: "/reports",
            templateUrl: "/app/views/report/buveraTransferTotals.html",
            data: {
                pageTitle: 'Buvera Transfers',
            },
            controller: function ($scope, $stateParams) {

            }
        })
         .state('reports.machineRepairlist', {
             url: "/reports",
             templateUrl: "/app/views/report/machinerepairs.html",
             data: {
                 pageTitle: 'Machine Repairs',
             },
             controller: function ($scope, $stateParams) {

             }
         })
          .state('reports.LabourCostlist', {
              url: "/reports",
              templateUrl: "/app/views/report/labourcosts.html",
              data: {
                  pageTitle: 'Labour Costs',
              },
              controller: function ($scope, $stateParams) {

              }
          })
          .state('reports.millingbalancelist', {
              url: "/reports",
              templateUrl: "/app/views/report/millingbalance.html",
              data: {
                  pageTitle: 'Miling Balances',
              },
              controller: function ($scope, $stateParams) {

              }
          })
          .state('reports.utilitylist', {
              url: "/reports",
              templateUrl: "/app/views/report/utilities.html",
              data: {
                  pageTitle: 'Utilities',
              },
              controller: function ($scope, $stateParams) {

              }
          })
         .state('reports.buveralist', {
             url: "/reports",
             templateUrl: "/app/views/report/buveras.html",
             data: {
                 pageTitle: 'Buveras',
             },
             controller: function ($scope, $stateParams) {

             }
        })
      
   
        .state('reports.buveraTotals', {
            url: "/reports",
            templateUrl: "/app/views/report/buveraTotals.html",
            data: {
                pageTitle: 'Buveras',
            },
            controller: function ($scope, $stateParams) {

            }
        })

        .state('reports.buveraindex', {
            url: "/reports",
            templateUrl: "/app/views/report/buveraindex.html",
            data: {
                pageTitle: 'Buveras',
            },
            controller: function ($scope, $stateParams) {

            }
        })

         .state('reports.cashlist', {
             url: "/reports",
             templateUrl: "/app/views/report/cash.html",
             data: {
                 pageTitle: 'Cash',
             },
             controller: function ($scope, $stateParams) {

             }
         })

           .state('reports.expenselist', {
               url: "/reports",
               templateUrl: "/app/views/report/expenses.html",
               data: {
                   pageTitle: 'Expenses',
               },
               controller: function ($scope, $stateParams) {

               }
           })
           .state('reports.incomelist', {
               url: "/reports",
               templateUrl: "/app/views/report/incomes.html",
               data: {
                   pageTitle: 'Incomes',
               },
               controller: function ($scope, $stateParams) {

               }
           })
         .state('reports.cashSalelist', {
             url: "/reports",
             templateUrl: "/app/views/report/cashSale.html",
             data: {
                 pageTitle: 'Cash Sale',
             },
             controller: function ($scope, $stateParams) {

             }
         })

          .state('reports.cashTransferlist', {
              url: "/reports",
              templateUrl: "/app/views/report/cashtransfer.html",
              data: {
                  pageTitle: 'Cash',
              },
              controller: function ($scope, $stateParams) {

              }
          })


         .state('reports.orderlist', {
             url: "/reports",
             templateUrl: "/app/views/report/orders.html",
             data: {
                 pageTitle: 'Orders',
             },
             controller: function ($scope, $stateParams) {

             }
         })
     //Account Transaction Activities
     .state('accounttransactionactivities', {
         abstract: true,
         url: "/accounttransactionactivities",
         templateUrl: "/app/views/_common/content_empty.html",
         data: {
             pageTitle: 'Account Transaction Activities'
         }
     })

    .state('accounttransactionactivities.list', {
        url: "/accounttransactionactivities",
        templateUrl: "/app/views/transactionactivity/list.html",
        data: {
            pageTitle: 'Account Transaction Activities',
        },
        controller: function ($scope, $stateParams) {

        }
    })
          .state('account-accounttransactionactivities-list', {
              url: "/accounttransactionactivities/:accountId",
              templateUrl: "/app/views/transactionactivity/account-accounttransactionactivities.html",
              data: {
                  pageTitle: 'Account Transaction Activities',
              },
              controller: function ($scope, $stateParams) {
                  $scope.accountId = $stateParams.accountId;

              }
          })

         .state('account-dashboard-accounttransactionactivities-list', {
             url: "/accounttransactionactivities/account/:accountId",
             templateUrl: "/app/views/transactionactivity/account-dashboard-accountactivities.html",
             data: {
                 pageTitle: 'Account Transaction Activities',
             },
             controller: function ($scope, $stateParams) {
                 $scope.accountId = $stateParams.accountId;

             }
         })

         .state('account-accounttransactionactivities-edit', {
             url: "/accounttransactionactivities/:action/:accountId/:transactionActivityId",
             templateUrl: "/app/views/transactionactivity/edit.html",
             data: {
                 pageTitle: 'Account Transaction Activity Edit',
             },
             controller: function ($scope, $stateParams) {
                 $scope.action = $stateParams.action;
                 $scope.accountId = $stateParams.accountId;
                 $scope.transactionActivityId = $stateParams.transactionActivityId;
                 $scope.defaultTab = 'edit'

             }
         })
        .state('account-deposit-details', {
            url: "/deposits/:depositId",
            templateUrl: "/app/views/transactionactivity/details.html",
            data: {
                pageTitle: 'Account Deposits Details',
            },
            controller: function ($scope, $stateParams) {
                $scope.depositId = $stateParams.depositId;

            }
        })

         .state('account-advancedpayments-list', {
             url: "/advancedpayments/:accountId",
             templateUrl: "/app/views/transactionactivity/advancedpaymentList.html",
             data: {
                 pageTitle: 'Account Advanced Payments',
             },
             controller: function ($scope, $stateParams) {
                 $scope.accountId = $stateParams.accountId;

             }
         })

        
         .state('account-advancedpayments-edit', {
             url: "/advancedpayments/:action/:accountId/:transactionActivityId",
             templateUrl: "/app/views/transactionactivity/advancedpayment.html",
             data: {
                 pageTitle: 'Advanced Payment Edit',
             },
             controller: function ($scope, $stateParams) {
                 $scope.action = $stateParams.action;
                 $scope.accountId = $stateParams.accountId;
                 $scope.transactionActivityId = $stateParams.transactionActivityId;
                 $scope.defaultTab = 'edit'

             }
         })
    .state('accounttransactionactivities-edit', {
        url: "/accounttransactionactivities/:action/:transactionActivityId",
        templateUrl: "/app/views/transactionactivity/edit.html",
        data: {
            pageTitle: 'Account Transaction Activity Edit',
            pageDesc: ''
        },
        controller: function ($scope, $stateParams) {
            $scope.action = $stateParams.action;
            $scope.transactionActivityId = $stateParams.transactionActivityId;
            $scope.defaultTab = 'edit';
        }
    })


     //Cash
     .state('cash', {
         abstract: true,
         url: "/cash",
         templateUrl: "/app/views/_common/content_empty.html",
         data: {
             pageTitle: 'Cash'
         }
     })

    .state('cash.list', {
        url: "/cash",
        templateUrl: "/app/views/cash/list.html",
        data: {
            pageTitle: 'Cash',
        },
        controller: function ($scope, $stateParams) {

        }
    })
          .state('branch-cash-list', {
              url: "/cash/branch/:branchId",
              templateUrl: "/app/views/cash/branch-cash.html",
              data: {
                  pageTitle: 'Branch Cash',
              },
              controller: function ($scope, $stateParams) {
                  $scope.branchId = $stateParams.branchId;

              }
          })
     .state('cash-edit', {
         url: "/cash/:action/:cashId",
         templateUrl: "/app/views/cash/edit.html",
         data: {
             pageTitle: 'Cash Edit',
         },
         controller: function ($scope, $stateParams) {
             $scope.action = $stateParams.action;
              $scope.cashId = $stateParams.cashId;
             $scope.defaultTab = 'edit'

         }
     })
         .state('admin-cash-list', {
             url: "/cash",
             templateUrl: "/app/views/cash/admin-view.html",
             data: {
                 pageTitle: 'Cash',
             },
             controller: function ($scope, $stateParams) {

             }
         })

        //petty cash
        .state('pettycash', {
            abstract: true,
            url: "/pettycash",
            templateUrl: "/app/views/_common/content_empty.html",
            data: {
                pageTitle: 'Petty Cash'
            }
        })

        .state('pettycash.list', {
            url: "/pettycash",
            templateUrl: "/app/views/pettycash/list.html",
            data: {
                pageTitle: 'Petty Cash',
            },
            controller: function ($scope, $stateParams) {

            }
        })
        .state('branch-pettycash-list', {
            url: "/pettycash/branch/:branchId",
            templateUrl: "/app/views/pettycash/branch-pettycash.html",
            data: {
                pageTitle: 'Branch Petty Cash',
            },
            controller: function ($scope, $stateParams) {
                $scope.branchId = $stateParams.branchId;

            }
        })
        .state('pettycash-edit', {
            url: "/pettycash/:action/:pettycashId",
            templateUrl: "/app/views/pettycash/edit.html",
            data: {
                pageTitle: 'Petty Cash Edit',
            },
            controller: function ($scope, $stateParams) {
                $scope.action = $stateParams.action;
                $scope.pettycashId = $stateParams.pettycashId;
                $scope.defaultTab = 'edit'

            }
        })
        .state('admin-pettycash-list', {
            url: "/pettycash",
            templateUrl: "/app/views/pettycash/admin-view.html",
            data: {
                pageTitle: 'Petty Cash',
            },
            controller: function ($scope, $stateParams) {

            }
        })

        //Milling charge
        .state('millingcharge', {
            abstract: true,
            url: "/millingcharge",
            templateUrl: "/app/views/_common/content_empty.html",
            data: {
                pageTitle: 'Bugugu'
            }
        })

        .state('millingcharge.list', {
            url: "/millingcharge",
            templateUrl: "/app/views/millingcharge/list.html",
            data: {
                pageTitle: 'Bugugu',
            },
            controller: function ($scope, $stateParams) {

            }
        })
        .state('branch-millingcharge-list', {
            url: "/millingcharge/branch/:branchId",
            templateUrl: "/app/views/millingcharge/branch-milling.html",
            data: {
                pageTitle: 'Branch Bugugu',
            },
            controller: function ($scope, $stateParams) {
                $scope.branchId = $stateParams.branchId;

            }
        })
        .state('millingcharge-edit', {
            url: "/millingcharge/:action/:millingChargeId",
            templateUrl: "/app/views/millingcharge/edit.html",
            data: {
                pageTitle: 'Milling Charge Edit',
            },
            controller: function ($scope, $stateParams) {
                $scope.action = $stateParams.action;
                $scope.millingChargeId = $stateParams.millingChargeId;
                $scope.defaultTab = 'edit'

            }
        })
        .state('admin-millingcharge-list', {
            url: "/millingcharge",
            templateUrl: "/app/views/millingcharge/admin-view.html",
            data: {
                pageTitle: 'Milling Charge',
            },
            controller: function ($scope, $stateParams) {

            }
        })

         //Utility accounts
     .state('utilityaccounts', {
         abstract: true,
         url: "/utilityaccounts",
         templateUrl: "/app/views/_common/content_empty.html",
         data: {
             pageTitle: 'Utility Accounts'
         }
     })

    .state('utilityaccounts.list', {
        url: "/utilityaccounts",
        templateUrl: "/app/views/utilityaccount/list.html",
        data: {
            pageTitle: 'Utility Account Transactions',
        },
        controller: function ($scope, $stateParams) {

        }
    })
          .state('utilityaccounts-edit', {
              url: "/utilityaccounts/:action/:utilityAccountId",
              templateUrl: "/app/views/utilityaccount/edit.html",
              data: {
                  pageTitle: 'Utility transactions Edit',
              },
              controller: function ($scope, $stateParams) {
                  $scope.action = $stateParams.action;
                  $scope.utilityAccountId = $stateParams.utilityAccountId;
                  $scope.defaultTab = 'edit'

              }
          })
          .state('admin-utility-list', {
              url: "/utilityaccounts",
              templateUrl: "/app/views/utilityaccount/adminview.html",
              data: {
                  pageTitle: 'Utility Account Transactions',
              },
              controller: function ($scope, $stateParams) {

              }
          })

         .state('category-utility-list', {
             url: "/utilityaccount/branch/:branchId",
             templateUrl: "/app/views/utilityaccount/categoryview.html",
             data: {
                 pageTitle: 'Utility Transactions',
             },
             controller: function ($scope, $stateParams) {
                 $scope.branchId = $stateParams.branchId;
             }
         })
        .state('category-utility-view', {
            url: "/utility/category/:branchId/:categoryId",
            templateUrl: "/app/views/utilityaccount/list.html",
            data: {
                pageTitle: 'Utility Transactions',
            },
            controller: function ($scope, $stateParams) {
                $scope.categoryId = $stateParams.categoryId;
                $scope.branchId = $stateParams.branchId;
            }
        })

        //outsourcer output
        .state('outsoucer-output', {
            url: "/outputs/:action/:outSourcerOutPutId/:storeId",
            templateUrl: "/app/views/outsourceroutput/edit.html",
            data: {
                pageTitle: 'Store Flour OutPut',
                pageDesc: ''
            },
            controller: function ($scope, $stateParams) {
                $scope.action = $stateParams.action;
                $scope.outSourcerOutPutId = $stateParams.outSourcerOutPutId;
                $scope.storeId = $stateParams.storeId;
                $scope.defaultTab = 'edit';
            }
        })
        .state('outsoucer-outputlist', {
            url: "/outputs/:action/:storeId",
            templateUrl: "/app/views/outsourceroutput/list.html",
            data: {
                pageTitle: 'Store Flour OutPut',
                pageDesc: ''
            },
            controller: function ($scope, $stateParams) {
                $scope.action = $stateParams.action;
                
                $scope.storeId = $stateParams.storeId;
                $scope.defaultTab = 'edit';
            }
        })

        .state('unapprovedoutSourcerOutputs-list', {
            url: "/outputs/unapproved",
            templateUrl: "/app/views/outsourceroutput/unapprovedoutputs.html",
            data: {
                pageTitle: 'Un Approved OutPuts',
            },
            controller: function ($scope, $stateParams) {

            }
        })
        .state('outsourceroutput-detail', {
            url: "/output/detail/:outSourcerOutPutId",
            templateUrl: "/app/views/outsourceroutput/detail.html",
            data: {
                pageTitle: ' Details',
            },
            controller: function ($scope, $stateParams) {
                $scope.outSourcerOutPutId = $stateParams.outSourcerOutPutId;
                $scope.defaultTab = 'detail';

            }
        })

        .state('unapproved-detail', {
            url: "/unapproveddetail/output/:outSourcerOutPutId",
            templateUrl: "/app/views/outsourceroutput/unApprovedOutPut.html",
            data: {
                pageTitle: 'Details',
            },
            controller: function ($scope, $stateParams) {
                $scope.outSourcerOutPutId = $stateParams.outSourcerOutPutId;
                $scope.defaultTab = 'detail';

            }
        })

        //Rice input
        
        .state('rice-input', {
            url: "/riceInputs/:action/:riceInPutId",
            templateUrl: "/app/views/rice/edit.html",
            data: {
                pageTitle: ' Rice InPut',
                pageDesc: ''
            },
            controller: function ($scope, $stateParams) {
                $scope.action = $stateParams.action;
                $scope.riceInPutId = $stateParams.riceInPutId;
                //$scope.storeId = $stateParams.storeId;
                $scope.defaultTab = 'edit';
            }
        })
        //.state('rice-inputlist', {
        //    url: "/outputs/:action/:storeId",
        //    templateUrl: "/app/views/rice/list.html",
        //    data: {
        //        pageTitle: 'Store Rice InPut',
        //        pageDesc: ''
        //    },
        //    controller: function ($scope, $stateParams) {
        //        $scope.action = $stateParams.action;

        //        $scope.storeId = $stateParams.storeId;
        //        $scope.defaultTab = 'edit';
        //    }
        //})

        .state('rice-inputlist', {
            url: "/riceInputs",
            templateUrl: "/app/views/rice/list.html",
            data: {
                pageTitle: ' Rice InPut',
                pageDesc: ''
            },
            controller: function ($scope, $stateParams) {
                $scope.action = $stateParams.action;

                //$scope.storeId = $stateParams.storeId;
                $scope.defaultTab = 'edit';
            }
        })

        .state('unapprovedRiceInputs-list', {
            url: "/riceInputs/unapproved",
            templateUrl: "/app/views/rice/unapprovedRiceInputs.html",
            data: {
                pageTitle: 'Un Approved InPuts',
            },
            controller: function ($scope, $stateParams) {

            }
        })
        .state('riceInput-detail', {
            url: "/riceIputs/detail/:riceInPutId",
            templateUrl: "/app/views/rice/detail.html",
            data: {
                pageTitle: ' Details',
            },
            controller: function ($scope, $stateParams) {
                $scope.riceInPutId = $stateParams.riceInPutId;
                $scope.defaultTab = 'detail';

            }
        })

        .state('unapprovedrice-detail', {
            url: "/unapproveddetail/rice/unapproved/:riceInPutId",
            templateUrl: "/app/views/rice/unApprovedRiceInPut.html",
            data: {
                pageTitle: 'Details',
            },
            controller: function ($scope, $stateParams) {
                $scope.riceInPutId = $stateParams.riceInPutId;
                $scope.defaultTab = 'detail';

            }
        })
        //flour transfer
      .state('flour-store-transfer', {
          url: "/flours/:action/:flourTransferId/:storeId",
          templateUrl: "/app/views/flour/flourtransfer.html",
          data: {
              pageTitle: 'Store Flour',
              pageDesc: ''
          },
          controller: function ($scope, $stateParams) {
              $scope.action = $stateParams.action;
              $scope.flourTransferId = $stateParams.flourTransferId;
              $scope.storeId = $stateParams.storeId;
              $scope.defaultTab = 'edit';
          }
      })

          .state('flour-transfer-details', {
              url: "/flours/:storeId/:flourTransferId",
              templateUrl: "/app/views/flour/flourtransferdetails.html",
              data: {
                  pageTitle: 'Store Flour Details',
                  pageDesc: ''
              },
              controller: function ($scope, $stateParams) {
                  $scope.action = 'view';
                  $scope.storeId = $stateParams.storeId;
                  $scope.flourTransferId = $stateParams.flourTransferId;
                  
                  $scope.defaultTab = 'edit';
              }
          })
      .state('flourlist-store-transfer', {
          url: "/flours/:storeId",
          templateUrl: "/app/views/flour/storeflourtransfers.html",
          data: {
              pageTitle: 'Store Flour Transfers',
              pageDesc: ''
          },
          controller: function ($scope, $stateParams) {
               $scope.storeId = $stateParams.storeId;
              $scope.defaultTab = 'edit';
          }
      })

      .state('cash-branch-transfer', {
          url: "/cashs/:action/:cashTransferId/:branchId",
          templateUrl: "/app/views/cashtransfer/cashtransfer.html",
          data: {
              pageTitle: 'Branch Cash Transfers',
              pageDesc: ''
          },
          controller: function ($scope, $stateParams) {
              $scope.action = $stateParams.action;
              $scope.cashTransferId = $stateParams.cashTransferId;
              $scope.branchId = $stateParams.branchId;
              $scope.defaultTab = 'edit';
          }
      })

         
      .state('cashlist-branch-transfer', {
          url: "/cashs/branch/:branchId",
          templateUrl: "/app/views/cashtransfer/branchcashtransfers.html",
          data: {
              pageTitle: 'Branch Cash Transfers',
              pageDesc: ''
          },
          controller: function ($scope, $stateParams) {
              $scope.branchId = $stateParams.branchId;
              $scope.defaultTab = 'edit';
          }
      })
     .state('admin-cashtransfer-list', {
         url: "/cashs",
         templateUrl: "/app/views/cashtransfer/adminview.html",
         data: {
             pageTitle: 'Cash Transfers',
         },
         controller: function ($scope, $stateParams) {

         }
        })

        .state('unapprovedcashtransfers-list', {
            url: "/cashs/unapproved",
            templateUrl: "/app/views/cashtransfer/unapprovedcashtransfers.html",
            data: {
                pageTitle: 'Cash Transfers',
            },
            controller: function ($scope, $stateParams) {

            }
        })
     .state('cash-transfer-details', {
         url: "/cashs/:branchId/:cashTransferId",
         templateUrl: "/app/views/cashtransfer/cashtransferdetails.html",
         data: {
             pageTitle: 'Transfer Cash Details',
             pageDesc: ''
         },
         controller: function ($scope, $stateParams) {
             $scope.action = 'view';
             $scope.branchId = $stateParams.branchId;
             $scope.cashTransferId = $stateParams.cashTransferId;

             $scope.defaultTab = 'edit';
         }
     })

     .state('cashsale-branch-sale', {
         url: "/cashsale/:action/:cashSaleId/:branchId",
         templateUrl: "/app/views/cashsale/cashsale.html",
         data: {
             pageTitle: 'Branch Cash Sale',
             pageDesc: ''
         },
         controller: function ($scope, $stateParams) {
             $scope.action = $stateParams.action;
             $scope.cashSaleId = $stateParams.cashSaleId;
             $scope.branchId = $stateParams.branchId;
             $scope.defaultTab = 'edit';
         }
     })


      .state('cashsalelist-branch-sale', {
          url: "/cashsale/branch/:branchId",
          templateUrl: "/app/views/cashsale/branchcashsales.html",
          data: {
              pageTitle: 'Branch Cash Sale',
              pageDesc: ''
          },
          controller: function ($scope, $stateParams) {
              $scope.branchId = $stateParams.branchId;
              $scope.defaultTab = 'edit';
          }
      })
     .state('admin-cashsale-list', {
         url: "/cashsale",
         templateUrl: "/app/views/cashsale/adminview.html",
         data: {
             pageTitle: 'Cash Sale',
         },
         controller: function ($scope, $stateParams) {

         }
     })
     .state('cashsale-sale-details', {
         url: "/cashsale/:branchId/:cashSaleId",
         templateUrl: "/app/views/cashsale/cashsaledetails.html",
         data: {
             pageTitle: 'Cash Sale Details',
             pageDesc: ''
         },
         controller: function ($scope, $stateParams) {
             $scope.action = 'view';
             $scope.branchId = $stateParams.branchId;
             $scope.cashSaleId = $stateParams.cashSaleId;

             $scope.defaultTab = 'edit';
         }
     })
    //Search
    $stateProvider
    .state('search', {
        url: "/search/:q",
        templateUrl: "/app/views/search/index.html",
        data: {
            pageTitle: 'Search'
        },
        controller: function ($scope, $stateParams) {
            $scope.q = $stateParams.q;
        }
    })

}

angular
    .module('homer')
    .config(configState).run(function ($rootScope, $state) {
        $rootScope.$state = $state;
      
        $rootScope.$on("$locationChangeStart", function (event, next, current) {
            if (next.match("/UsersAdmin/")) {
                var parts = next.split('#');
                if (parts.length > 1) {
                    if (!next.match('#/dashboard')) {
                        window.location = '/#' + parts[1];
                    }
                }
            }
        });

    })
  