$(document).ready(function() {

    if ($('#AtendimentoClienteId').val().length != 0) {
        $.getJSON("ajaxLoadPets", {
            clienteId: $('#AtendimentoClienteId').val()
        }, function(pets) {
            if (pets != null)
                popularListaDePets(pets, $('#pet_id').val());
        });
    }

    $('#AtendimentoClienteId').live('change', function() {
        if ($(this).val().length != 0) {
            $.getJSON("ajaxLoadPets", {
                clienteId: $('#AtendimentoClienteId').val()
            }, function(pets) {
                if (pets != null)
                    popularListaDePets(pets);
            });
        } else
            popularListaDePets(null);
    });
});

function popularListaDePets(cidades, petId) {
    var options = '';
    if (cidades != null) {
        $.each(cidades, function(index, cidade) {
            if (petId == index)
                options += '<option selected="selected" value="' + index + '">' + cidade + '</option>';
            else
                options += '<option value="' + index + '">' + cidade + '</option>';
        });
    } else {
        options = '<option value>Cliente não possui Pets cadastrados!</option>';
    }
    $('#AtendimentoPetId').html(options);
}

