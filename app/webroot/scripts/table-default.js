var TableDefault = function() {
    return {
        //função principal para iniciar o módulo
        init: function() {
            if (!jQuery().dataTable) {
                return;
            }

            //inicio de dataTable
            $('#tableDefault').dataTable({           
                "aoColumnDefs": [{
                        "bSortable": false,
                        "aTargets": [0, -1]
                    }],
                "aLengthMenu": [[10, 20, 30, 50, -1], [10, 20, 30, 50, "Todos"]],
                "iDisplayLength": 20, //aLengthMenu padrao, sempre sera listado como padrao 20 registros
                "oLanguage": {
                    "sLengthMenu": "_MENU_ Registros por página",
                    "sZeroRecords": "Não existem registros",
                    "sInfo": "Mostrando _START_ a _END_ de _TOTAL_ registros",
                    "sInfoEmpty": "Mostrando 0 to 0 de 0 registros",
                    "sSearch": "Pesquisar:",
                    "sInfoFiltered": "(total de _MAX_ registros encontrados)",
                    "oPaginate": {
                        "sPrevious": "Anterior",
                        "sNext": "Próximo"
                    }
                }
                //,"bProcessing": true,
                //"bServerSide": true,
                //"sAjaxSource": "/scripts/server_side/server_processing.php"
            });


            jQuery('#tableDefault .group-checkable').change(function() {
                var set = jQuery(this).attr("data-set");
                var checked = jQuery(this).is(":checked");
                jQuery(set).each(function() {
                    if (checked) {
                        $(this).attr("checked", true);
                    } else {
                        $(this).attr("checked", false);
                    }
                    $(this).parents('tr').toggleClass("active");
                });
                jQuery.uniform.update(set);

            });

            jQuery('#tableDefault tbody tr .checkboxes').change(function() {
                $(this).parents('tr').toggleClass("active");
            });

            jQuery('#tableDefault_wrapper .dataTables_filter input').addClass("form-control input-medium"); // modify table search input
            jQuery('#tableDefault_wrapper .dataTables_length select').addClass("form-control input-small"); // modify table per page dropdown
            //jQuery('#tableDefault_wrapper .dataTables_length select').select2(); // initialize select2 dropdown

        }

    };

}();