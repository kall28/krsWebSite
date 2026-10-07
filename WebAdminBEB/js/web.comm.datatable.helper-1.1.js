var CommonDatatableHelper = function () {
    return {
        init: function (ctrlTable) {
            /* Extend with date sort plugin */
            $.extend($.fn.dataTableExt.oSort, {
                "date-custom-pre": function (a) {
                    var customDate = a.split('/');
                    return (customDate[2] + customDate[1] + customDate[0]) * 1;
                },

                "date-custom-asc": function (a, b) {
                    return ((a < b) ? -1 : ((a > b) ? 1 : 0));
                },

                "date-custom-desc": function (a, b) {
                    return ((a < b) ? 1 : ((a > b) ? -1 : 0));
                }
            });

            /* Initialize Bootstrap Datatables Integration */
            App.datatables();

            /* Initialize Datatables */
            ctrlTable.dataTable({
                columnDefs: [
                    { type: 'date-custom', targets: [] },
                    { orderable: false, targets: [4] }
                ],
                order: [[0, "asc"]],
                pageLength: 10,
                lengthMenu: [[10, 20, 30, -1], [10, 20, 30, 'All']]
            });

            /* Add placeholder attribute to the search input */
            $('.dataTables_filter input').attr('placeholder', 'Search');
        },
        initBasic: function (ctrlTable) {
            /* Extend with date sort plugin */
            $.extend($.fn.dataTableExt.oSort, {
                "date-custom-pre": function (a) {
                    var customDate = a.split('/');
                    return (customDate[2] + customDate[1] + customDate[0]) * 1;
                },

                "date-custom-asc": function (a, b) {
                    return ((a < b) ? -1 : ((a > b) ? 1 : 0));
                },

                "date-custom-desc": function (a, b) {
                    return ((a < b) ? 1 : ((a > b) ? -1 : 0));
                }
            });

            /* Initialize Bootstrap Datatables Integration */
            App.datatables();

            /* Initialize Datatables */
            ctrlTable.dataTable({
                columnDefs: [
                    { type: 'date-custom', targets: [] },
                    { orderable: false, targets: [] }
                ],
                order: [[0, "asc"]],
                pageLength: 10,
                lengthMenu: [[10, 20, 30, -1], [10, 20, 30, 'All']]
            });

            /* Add placeholder attribute to the search input */
            $('.dataTables_filter input').attr('placeholder', 'Search');
        },
        initDefault: function (ctrlTable) {
            
            /* Initialize Bootstrap Datatables Integration */
            App.datatables();

            /* Initialize Datatables */
            ctrlTable.dataTable({
                //columnDefs: [
                //    { type: 'date-custom', targets: [] },
                //    { orderable: false, targets: [] }
                //],
                //order: [[0, "asc"]],
                pageLength: 10,
                lengthMenu: [[10, 20, 30, -1], [10, 20, 30, 'All']],
            });

            //table.buttons().container()
            //    .appendTo('#example_wrapper .col-sm-6:eq(0)');

            ///* Add placeholder attribute to the search input */
            //$('.dataTables_filter input').attr('placeholder', 'Search');
        },
        initDefaultExport: function (ctrlTable) {
            
            ctrlTable.DataTable({
                dom: 'lBftip',
                buttons: ['excel', 'copy'],
            });

            ///* Add placeholder attribute to the search input */
            //$('.dataTables_filter input').attr('placeholder', 'Search');
        }
    };
}();

